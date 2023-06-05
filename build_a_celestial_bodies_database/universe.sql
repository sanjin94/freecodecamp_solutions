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
    num_stars integer NOT NULL,
    num_planets integer NOT NULL,
    num_moons integer NOT NULL,
    has_black_hole boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    star_id integer,
    is_satelite boolean NOT NULL,
    has_water boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    galaxy_id integer,
    num_moons integer NOT NULL,
    has_atmosphere boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    color character varying(255) NOT NULL,
    temperature integer NOT NULL,
    is_supernova boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: universe_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe_info (
    universe_info_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age numeric,
    description text,
    is_expanding boolean NOT NULL
);


ALTER TABLE public.universe_info OWNER TO freecodecamp;

--
-- Name: universe_info_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_info_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_info_info_id_seq OWNER TO freecodecamp;

--
-- Name: universe_info_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_info_info_id_seq OWNED BY public.universe_info.universe_info_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: universe_info universe_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_info ALTER COLUMN universe_info_id SET DEFAULT nextval('public.universe_info_info_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100, 10, 5, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 150, 12, 8, false);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 80, 8, 4, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 60, 5, 3, false);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 70, 6, 3, true);
INSERT INTO public.galaxy VALUES (6, 'Cigar', 90, 7, 5, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1, true, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 1, true, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 1, true, false);
INSERT INTO public.moon VALUES (4, 'Europa', 3, 2, true, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 2, true, false);
INSERT INTO public.moon VALUES (6, 'Callisto', 3, 2, true, false);
INSERT INTO public.moon VALUES (7, 'Titan', 4, 2, true, true);
INSERT INTO public.moon VALUES (8, 'Enceladus', 4, 2, true, true);
INSERT INTO public.moon VALUES (9, 'Triton', 5, 3, true, true);
INSERT INTO public.moon VALUES (10, 'Nereid', 5, 3, true, false);
INSERT INTO public.moon VALUES (11, 'Larissa', 5, 3, true, false);
INSERT INTO public.moon VALUES (12, 'Oberon', 6, 3, true, false);
INSERT INTO public.moon VALUES (13, 'Miranda', 6, 3, true, true);
INSERT INTO public.moon VALUES (14, 'Ariel', 6, 3, true, false);
INSERT INTO public.moon VALUES (15, 'Charon', 9, 5, true, false);
INSERT INTO public.moon VALUES (16, 'Styx', 9, 5, true, false);
INSERT INTO public.moon VALUES (17, 'Nix', 9, 5, true, false);
INSERT INTO public.moon VALUES (18, 'Kerberos', 9, 5, true, false);
INSERT INTO public.moon VALUES (19, 'Hydra', 9, 5, true, false);
INSERT INTO public.moon VALUES (20, 'Zeta Reticuli Bb', 11, 6, true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, 1, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 1, 2, true);
INSERT INTO public.planet VALUES (3, 'Jupiter', 2, 1, 4, true);
INSERT INTO public.planet VALUES (4, 'Saturn', 2, 1, 6, true);
INSERT INTO public.planet VALUES (5, 'Neptune', 3, 2, 8, true);
INSERT INTO public.planet VALUES (6, 'Uranus', 3, 2, 3, true);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, 1, 0, false);
INSERT INTO public.planet VALUES (8, 'Venus', 1, 1, 0, true);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 2, 1, false);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 5, 4, 2, true);
INSERT INTO public.planet VALUES (11, 'Nibiru', 6, 4, 3, true);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 4, 3, 4, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Yellow', 5778, false);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'White', 9940, false);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 2, 'Red', 3600, false);
INSERT INTO public.star VALUES (4, 'Rigel', 2, 'Blue', 12100, false);
INSERT INTO public.star VALUES (5, 'Antares', 1, 'Red', 3500, false);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'Blue', 9602, false);


--
-- Data for Name: universe_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe_info VALUES (1, 'Observable Universe', 13.8, 'The observable universe is a sphere with a radius of about 46.5 billion light-years. It contains billions of galaxies.', true);
INSERT INTO public.universe_info VALUES (2, 'Cosmic Microwave Background', 13.8, 'The cosmic microwave background is the radiation leftover from the early universe. It provides important insights into the Big Bang theory.', true);
INSERT INTO public.universe_info VALUES (3, 'Dark Matter', NULL, 'Dark matter is a mysterious substance that does not interact with light but exerts gravitational effects on galaxies and other matter.', false);
INSERT INTO public.universe_info VALUES (4, 'Dark Energy', NULL, 'Dark energy is an unknown form of energy that is causing the expansion of the universe to accelerate.', true);
INSERT INTO public.universe_info VALUES (5, 'Hubble Space Telescope', NULL, 'The Hubble Space Telescope is a space telescope that has provided stunning images and valuable data about the universe.', true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 2, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: universe_info_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_info_info_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: universe_info universe_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_info
    ADD CONSTRAINT universe_info_name_key UNIQUE (name);


--
-- Name: universe_info universe_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_info
    ADD CONSTRAINT universe_info_pkey PRIMARY KEY (universe_info_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

