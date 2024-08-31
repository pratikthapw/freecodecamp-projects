--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

--
-- Name: trigger_games_user_id(); Type: FUNCTION; Schema: public; Owner: freecodecamp
--

CREATE FUNCTION public.trigger_games_user_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO games (user_id) VALUES (NEW.user_id);
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.trigger_games_user_id() OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_guess integer DEFAULT 0 NOT NULL,
    random_number integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
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
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (27, 1, 778, 81);
INSERT INTO public.games VALUES (26, 2, 108, 107);
INSERT INTO public.games VALUES (53, 2, 568, 567);
INSERT INTO public.games VALUES (39, 2, 646, 645);
INSERT INTO public.games VALUES (29, 1, 524, 730);
INSERT INTO public.games VALUES (38, 5, 19, 211);
INSERT INTO public.games VALUES (28, 2, 223, 713);
INSERT INTO public.games VALUES (52, 5, 510, 529);
INSERT INTO public.games VALUES (31, 1, 509, 976);
INSERT INTO public.games VALUES (21, 1, 4, 76);
INSERT INTO public.games VALUES (30, 3, 316, 435);
INSERT INTO public.games VALUES (41, 2, 738, 936);
INSERT INTO public.games VALUES (23, 2, 909, 908);
INSERT INTO public.games VALUES (22, 2, 163, 162);
INSERT INTO public.games VALUES (55, 2, 452, 451);
INSERT INTO public.games VALUES (40, 5, 14, 13);
INSERT INTO public.games VALUES (25, 0, 0, 914);
INSERT INTO public.games VALUES (25, 0, 0, 914);
INSERT INTO public.games VALUES (33, 2, 0, 60);
INSERT INTO public.games VALUES (33, 2, 0, 60);
INSERT INTO public.games VALUES (24, 0, 0, 445);
INSERT INTO public.games VALUES (24, 0, 0, 445);
INSERT INTO public.games VALUES (54, 5, 290, 786);
INSERT INTO public.games VALUES (32, 5, 120, 940);
INSERT INTO public.games VALUES (43, 2, 16, 15);
INSERT INTO public.games VALUES (35, 2, 733, 732);
INSERT INTO public.games VALUES (42, 5, 101, 100);
INSERT INTO public.games VALUES (34, 5, 224, 720);
INSERT INTO public.games VALUES (45, 2, 371, 636);
INSERT INTO public.games VALUES (37, 2, 193, 194);
INSERT INTO public.games VALUES (44, 5, 103, 853);
INSERT INTO public.games VALUES (36, 5, 162, 161);
INSERT INTO public.games VALUES (47, 2, 143, 345);
INSERT INTO public.games VALUES (46, 5, 373, 536);
INSERT INTO public.games VALUES (49, 2, 183, 511);
INSERT INTO public.games VALUES (48, 5, 153, 292);
INSERT INTO public.games VALUES (51, 2, 250, 799);
INSERT INTO public.games VALUES (50, 5, 391, 830);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (21, 'pratik');
INSERT INTO public.users VALUES (22, 'user_1725081077452');
INSERT INTO public.users VALUES (23, 'user_1725081077451');
INSERT INTO public.users VALUES (24, 'user_1725081491874');
INSERT INTO public.users VALUES (25, 'user_1725081491873');
INSERT INTO public.users VALUES (26, 'user_1725081516313');
INSERT INTO public.users VALUES (27, 'user_1725081516312');
INSERT INTO public.users VALUES (28, 'user_1725081541921');
INSERT INTO public.users VALUES (29, 'user_1725081541920');
INSERT INTO public.users VALUES (30, 'user_1725081656707');
INSERT INTO public.users VALUES (31, 'user_1725081656706');
INSERT INTO public.users VALUES (32, 'user_1725081736416');
INSERT INTO public.users VALUES (33, 'user_1725081736415');
INSERT INTO public.users VALUES (34, 'user_1725082028061');
INSERT INTO public.users VALUES (35, 'user_1725082028060');
INSERT INTO public.users VALUES (36, 'user_1725082048534');
INSERT INTO public.users VALUES (37, 'user_1725082048533');
INSERT INTO public.users VALUES (38, 'user_1725082091276');
INSERT INTO public.users VALUES (39, 'user_1725082091275');
INSERT INTO public.users VALUES (40, 'user_1725082224572');
INSERT INTO public.users VALUES (41, 'user_1725082224571');
INSERT INTO public.users VALUES (42, 'user_1725082229148');
INSERT INTO public.users VALUES (43, 'user_1725082229147');
INSERT INTO public.users VALUES (44, 'user_1725082236295');
INSERT INTO public.users VALUES (45, 'user_1725082236294');
INSERT INTO public.users VALUES (46, 'user_1725082255164');
INSERT INTO public.users VALUES (47, 'user_1725082255163');
INSERT INTO public.users VALUES (48, 'user_1725082280666');
INSERT INTO public.users VALUES (49, 'user_1725082280665');
INSERT INTO public.users VALUES (50, 'user_1725082285143');
INSERT INTO public.users VALUES (51, 'user_1725082285142');
INSERT INTO public.users VALUES (52, 'user_1725082291752');
INSERT INTO public.users VALUES (53, 'user_1725082291751');
INSERT INTO public.users VALUES (54, 'user_1725082356865');
INSERT INTO public.users VALUES (55, 'user_1725082356864');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 55, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: users after_insert_user; Type: TRIGGER; Schema: public; Owner: freecodecamp
--

CREATE TRIGGER after_insert_user AFTER INSERT ON public.users FOR EACH ROW EXECUTE FUNCTION public.trigger_games_user_id();


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

