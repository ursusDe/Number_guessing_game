#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#generate random number between 1 and 1000
NUMBER=$(( $RANDOM % 1000 + 1 ))
#GET USER ID FROM USERNAME
echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$USERNAME'")
#check if username already exists
if [[ -z $USER_ID ]]
then 
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  #add user to database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users (user_name) VALUES ('$USERNAME')")
else
  #get all other variables for welcome input
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN (number_of_guesses) from games WHERE user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
echo Guess the secret number between 1 and 1000:
read USER_GUESS
TRYES=1
while [[ $USER_GUESS -ne $NUMBER ]]
do
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then 
    echo "That is not an integer, guess again:"
    read USER_GUESS
  else
    if [[ $USER_GUESS -gt $NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      read USER_GUESS
    else 
      echo "It's higher than that, guess again:"
      read USER_GUESS
    fi
    TRYES=$(( TRYES+1 ))
  fi
done
echo "You guessed it in $TRYES tries. The secret number was $NUMBER. Nice job!"
USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$USERNAME'")
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (user_id, number_of_guesses) VALUES ($USER_ID, $TRYES)")
