--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    number_of_guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (12, 75, 979);
INSERT INTO public.games VALUES (13, 76, 523);
INSERT INTO public.games VALUES (14, 75, 266);
INSERT INTO public.games VALUES (15, 75, 129);
INSERT INTO public.games VALUES (16, 75, 697);
INSERT INTO public.games VALUES (17, 77, 775);
INSERT INTO public.games VALUES (18, 78, 562);
INSERT INTO public.games VALUES (19, 77, 378);
INSERT INTO public.games VALUES (20, 77, 803);
INSERT INTO public.games VALUES (21, 77, 254);
INSERT INTO public.games VALUES (22, 79, 362);
INSERT INTO public.games VALUES (23, 79, 631);
INSERT INTO public.games VALUES (24, 80, 633);
INSERT INTO public.games VALUES (25, 80, 925);
INSERT INTO public.games VALUES (26, 79, 417);
INSERT INTO public.games VALUES (27, 79, 461);
INSERT INTO public.games VALUES (28, 79, 566);
INSERT INTO public.games VALUES (29, 81, 498);
INSERT INTO public.games VALUES (30, 81, 110);
INSERT INTO public.games VALUES (31, 82, 168);
INSERT INTO public.games VALUES (32, 82, 427);
INSERT INTO public.games VALUES (33, 81, 877);
INSERT INTO public.games VALUES (34, 81, 394);
INSERT INTO public.games VALUES (35, 81, 729);
INSERT INTO public.games VALUES (36, 83, 38);
INSERT INTO public.games VALUES (37, 83, 219);
INSERT INTO public.games VALUES (38, 84, 508);
INSERT INTO public.games VALUES (39, 84, 889);
INSERT INTO public.games VALUES (40, 83, 255);
INSERT INTO public.games VALUES (41, 83, 572);
INSERT INTO public.games VALUES (42, 83, 165);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (75, 'user_1675595947494');
INSERT INTO public.users VALUES (76, 'user_1675595947493');
INSERT INTO public.users VALUES (77, 'user_1675595978803');
INSERT INTO public.users VALUES (78, 'user_1675595978802');
INSERT INTO public.users VALUES (79, 'user_1675596043962');
INSERT INTO public.users VALUES (80, 'user_1675596043961');
INSERT INTO public.users VALUES (81, 'user_1675596210725');
INSERT INTO public.users VALUES (82, 'user_1675596210724');
INSERT INTO public.users VALUES (83, 'user_1675596493549');
INSERT INTO public.users VALUES (84, 'user_1675596493548');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 42, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 84, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_user_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_name_key UNIQUE (user_name);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

