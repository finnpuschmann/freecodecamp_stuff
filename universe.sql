--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: fun_facts; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.fun_facts (
    name character varying(100) NOT NULL,
    fun_facts_id integer NOT NULL,
    planet_id integer NOT NULL,
    description text
);


ALTER TABLE public.fun_facts OWNER TO freecodecamp;

--
-- Name: fun_facts_fun_facts_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.fun_facts_fun_facts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fun_facts_fun_facts_id_seq OWNER TO freecodecamp;

--
-- Name: fun_facts_fun_facts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.fun_facts_fun_facts_id_seq OWNED BY public.fun_facts.fun_facts_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_yrs integer,
    distance_in_light_yrs numeric,
    radius_in_km integer
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
    name character varying(100) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_yrs integer,
    distance_to_planet_in_km numeric,
    radius_in_km integer,
    planet_id integer NOT NULL
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
    name character varying(100) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_yrs integer,
    distance_to_star_in_million_km numeric,
    radius_in_km integer,
    star_id integer NOT NULL
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
    name character varying(100) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_yrs integer,
    distance_in_light_yrs numeric,
    distance_to_galaxy_center_in_light_yrs numeric,
    radius_in_km integer,
    galaxy_id integer NOT NULL
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
-- Name: fun_facts fun_facts_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fun_facts ALTER COLUMN fun_facts_id SET DEFAULT nextval('public.fun_facts_fun_facts_id_seq'::regclass);


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
-- Data for Name: fun_facts; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.fun_facts VALUES ('Not so fun facts 1', 1, 3, 'Only known planet with life');
INSERT INTO public.fun_facts VALUES ('Not so fun facts 2', 2, 3, 'Only known planet with work');
INSERT INTO public.fun_facts VALUES ('Not so fun facts 3', 3, 3, 'Only known planet with us');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, true, NULL, 0, NULL);
INSERT INTO public.galaxy VALUES (2, 'LMC', NULL, false, NULL, 158000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', NULL, false, NULL, 2500000, NULL);
INSERT INTO public.galaxy VALUES (4, 'Cigar', NULL, false, NULL, 11500000, NULL);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', NULL, false, NULL, 20870000, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', NULL, true, NULL, 29350000, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ganymede', NULL, NULL, NULL, 1070400, 2634, 5);
INSERT INTO public.moon VALUES (2, 'Titan', NULL, NULL, NULL, 1221870, 2575, 6);
INSERT INTO public.moon VALUES (3, 'Callisto', NULL, NULL, NULL, 1882700, 2410, 5);
INSERT INTO public.moon VALUES (4, 'Io', NULL, NULL, NULL, 421700, 1821, 5);
INSERT INTO public.moon VALUES (5, 'Earth Moon', NULL, NULL, NULL, 384400, 1737, 3);
INSERT INTO public.moon VALUES (6, 'Europa', NULL, NULL, NULL, 670900, 1561, 5);
INSERT INTO public.moon VALUES (7, 'Triton', NULL, NULL, NULL, 354759, 1353, 8);
INSERT INTO public.moon VALUES (8, 'Titania', NULL, NULL, NULL, 435910, 788, 7);
INSERT INTO public.moon VALUES (9, 'Rhea', NULL, NULL, NULL, 527108, 764, 6);
INSERT INTO public.moon VALUES (10, 'Oberon', NULL, NULL, NULL, 583520, 761, 7);
INSERT INTO public.moon VALUES (11, 'Iapetus', NULL, NULL, NULL, 3560820, 734, 6);
INSERT INTO public.moon VALUES (12, 'Umbriel', NULL, NULL, NULL, 265970, 585, 7);
INSERT INTO public.moon VALUES (13, 'Ariel', NULL, NULL, NULL, 191240, 579, 7);
INSERT INTO public.moon VALUES (14, 'Dione', NULL, NULL, NULL, 377396, 561, 6);
INSERT INTO public.moon VALUES (15, 'Tethys', NULL, NULL, NULL, 294619, 531, 6);
INSERT INTO public.moon VALUES (16, 'Enceladus', NULL, NULL, NULL, 237950, 252, 6);
INSERT INTO public.moon VALUES (17, 'Miranda', NULL, NULL, NULL, 129390, 236, 7);
INSERT INTO public.moon VALUES (18, 'Proteus', NULL, NULL, NULL, 117647, 210, 8);
INSERT INTO public.moon VALUES (19, 'Mimas', NULL, NULL, NULL, 185539, 198, 6);
INSERT INTO public.moon VALUES (20, 'Nereid', NULL, NULL, NULL, 5513810, 170, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, NULL, NULL, 58, 2440, 1);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, NULL, NULL, 108, 6052, 1);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, NULL, NULL, 149, 6378, 1);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, NULL, 228, 3390, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, NULL, 778, 69911, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, NULL, 1427, 58232, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, NULL, NULL, 2871, 25632, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, NULL, NULL, 4498, 24622, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri d', NULL, NULL, NULL, 4, 5166, 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', NULL, NULL, NULL, 7, 6378, 2);
INSERT INTO public.planet VALUES (11, 'Bernhards d', NULL, NULL, NULL, 3, NULL, 3);
INSERT INTO public.planet VALUES (12, 'Bernhards b', NULL, NULL, NULL, 4, NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, NULL, NULL, 0, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', NULL, NULL, NULL, 4, NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'Barnhards', NULL, NULL, NULL, 6, NULL, NULL, 1);
INSERT INTO public.star VALUES (4, 'Luhman 16', NULL, NULL, NULL, 7, NULL, NULL, 1);
INSERT INTO public.star VALUES (5, 'Wolf 359', NULL, NULL, NULL, 8, NULL, NULL, 1);
INSERT INTO public.star VALUES (6, 'Sirius', NULL, NULL, NULL, 9, NULL, NULL, 1);


--
-- Name: fun_facts_fun_facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.fun_facts_fun_facts_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: fun_facts fun_facts_fun_facts_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fun_facts
    ADD CONSTRAINT fun_facts_fun_facts_id_key UNIQUE (fun_facts_id);


--
-- Name: fun_facts fun_facts_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fun_facts
    ADD CONSTRAINT fun_facts_pkey PRIMARY KEY (fun_facts_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unq_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unq_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unq_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unq_moon_id UNIQUE (moon_id);


--
-- Name: planet unq_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unq_planet_id UNIQUE (planet_id);


--
-- Name: star unq_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unq_star_id UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

