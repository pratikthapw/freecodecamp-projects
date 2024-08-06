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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    weight numeric(5,0),
    has_life boolean,
    age_in_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_earth integer,
    age_in_years integer,
    weight numeric(5,0),
    has_life boolean,
    is_round boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: multiverse; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.multiverse (
    multiverse_id integer NOT NULL,
    name character varying(255) NOT NULL,
    weight numeric(5,0),
    has_life boolean,
    other text
);


ALTER TABLE public.multiverse OWNER TO freecodecamp;

--
-- Name: multiverse_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.multiverse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.multiverse_id_seq OWNER TO freecodecamp;

--
-- Name: multiverse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.multiverse_id_seq OWNED BY public.multiverse.multiverse_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    weight numeric(5,0),
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    weight numeric(5,0),
    has_life boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: multiverse multiverse_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.multiverse ALTER COLUMN multiverse_id SET DEFAULT nextval('public.multiverse_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milkyway', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Titan', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (3, 'Ganymede', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (4, 'Europa', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (5, 'Callisto', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (6, 'Io', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (7, 'Enceladus', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (8, 'Triton', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (9, 'Phobos', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (10, 'Deimos', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (11, 'Charon', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (12, 'Oberon', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (13, 'Miranda', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (14, 'Rhea', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (15, 'Dione', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (16, 'Hyperion', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (17, 'Iapetus', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (18, 'Ariel', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (19, 'Umbriel', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (20, 'Tethys', NULL, NULL, NULL, NULL, NULL, 1);


--
-- Data for Name: multiverse; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.multiverse VALUES (1, 'abc', NULL, NULL, NULL);
INSERT INTO public.multiverse VALUES (2, 'def', NULL, NULL, NULL);
INSERT INTO public.multiverse VALUES (3, 'xyz', NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Earth', 2, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Mars', 2, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Venus', 2, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 2, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 2, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 2, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 2, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Mercury', 2, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Pluto', 2, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 2, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 2, NULL, NULL);
INSERT INTO public.planet VALUES (1, 'earth', 2, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'fiveeight', 1, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Sirius', 1, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Antares', 3, NULL, NULL);
INSERT INTO public.star VALUES (7, 'Vega', 2, NULL, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: multiverse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.multiverse_id_seq', 3, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: multiverse multiverse_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.multiverse
    ADD CONSTRAINT multiverse_name UNIQUE (name);


--
-- Name: multiverse multiverse_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.multiverse
    ADD CONSTRAINT multiverse_pkey PRIMARY KEY (multiverse_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star gal_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT gal_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

