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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    orbit_radius numeric(15,2) NOT NULL,
    mass numeric(50,10) NOT NULL,
    is_comet boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size numeric(10,2) NOT NULL,
    number_of_stars bigint NOT NULL,
    is_spiral boolean NOT NULL,
    description text
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
    planet_id integer NOT NULL,
    diameter integer NOT NULL,
    mass numeric(50,10) NOT NULL,
    has_atmosphere boolean NOT NULL
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
    star_id integer NOT NULL,
    radius integer NOT NULL,
    mass numeric(50,10) NOT NULL,
    has_life boolean NOT NULL
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
    galaxy_id integer NOT NULL,
    luminosity numeric(15,2) NOT NULL,
    mass numeric(18,2) NOT NULL,
    is_main_sequence boolean NOT NULL,
    age numeric(10,2)
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 2.77, 910000000000000000000.0000000000, false);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 2.36, 260000000000000000000.0000000000, false);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 2.77, 220000000000000000000.0000000000, false);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 3.14, 87000000000000000000.0000000000, false);
INSERT INTO public.asteroid VALUES (5, 'Halley', 0.10, 220000000000000.0000000000, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000.00, 100000000000, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000.00, 1000000000000, true, 'Nearest major galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000.00, 40000000, true, 'Third largest in the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 76000.00, 100000000000, true, 'Famous for its spiral structure');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 50000.00, 80000000, false, 'A galaxy that looks like a sombrero');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 150000.00, 50000000, false, 'A ring galaxy with a distinctive shape');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, 73480000000000000000000.0000000000, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, 10659000000000000.0000000000, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, 1476200000000000.0000000000, false);
INSERT INTO public.moon VALUES (4, 'Europa', 3, 3121, 47998000000000000000000.0000000000, false);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 5268, 148190000000000000000000.0000000000, false);
INSERT INTO public.moon VALUES (6, 'Io', 3, 3643, 89319000000000000000000.0000000000, false);
INSERT INTO public.moon VALUES (7, 'Titan', 4, 5150, 134520000000000000000000.0000000000, true);
INSERT INTO public.moon VALUES (8, 'Rhea', 4, 1527, 52630000000000000000.0000000000, false);
INSERT INTO public.moon VALUES (9, 'Iapetus', 4, 1469, 45600000000000000000.0000000000, false);
INSERT INTO public.moon VALUES (10, 'Tethys', 4, 1062, 61700000000000000000.0000000000, false);
INSERT INTO public.moon VALUES (11, 'Mimas', 4, 396, 375000000000000000.0000000000, false);
INSERT INTO public.moon VALUES (12, 'Enceladus', 4, 504, 108000000000000000000.0000000000, true);
INSERT INTO public.moon VALUES (13, 'Miranda', 5, 472, 65900000000000000000.0000000000, true);
INSERT INTO public.moon VALUES (14, 'Ariel', 5, 1159, 1350000000000000000000.0000000000, true);
INSERT INTO public.moon VALUES (15, 'Umbriel', 5, 1169, 1170000000000000000000.0000000000, false);
INSERT INTO public.moon VALUES (16, 'Titania', 5, 1578, 3500000000000000000000.0000000000, true);
INSERT INTO public.moon VALUES (17, 'Oberon', 5, 1523, 3010000000000000000000.0000000000, true);
INSERT INTO public.moon VALUES (18, 'Triton', 6, 2706, 21400000000000000000000.0000000000, true);
INSERT INTO public.moon VALUES (19, 'Nereid', 6, 340, 170000000000000000000.0000000000, false);
INSERT INTO public.moon VALUES (27, 'AnotherUniqueMoon', 1, 5000, 25000000000000000000.0000000000, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, 5972000000000000000000000.0000000000, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3389, 641700000000000000000000.0000000000, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 69911, 1898000000000000000000000000.0000000000, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 58232, 568300000000000000000000000.0000000000, false);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 25362, 86810000000000000000000000.0000000000, false);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 24622, 102400000000000000000000000.0000000000, false);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, 2439, 330100000000000000000000.0000000000, false);
INSERT INTO public.planet VALUES (8, 'Venus', 1, 6052, 4867000000000000000000000.0000000000, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 1188, 13030000000000000000000.0000000000, false);
INSERT INTO public.planet VALUES (10, 'Titan', 4, 2575, 134520000000000000000000.0000000000, false);
INSERT INTO public.planet VALUES (11, 'Callisto', 3, 2410, 1075900000000000000000000.0000000000, false);
INSERT INTO public.planet VALUES (12, 'Io', 3, 1821, 41990000000000000000000.0000000000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.00, 1989000000000.00, true, 4.60);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 25.40, 4080000000000.00, true, 0.20);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 1.52, 2300000000000.00, true, 5.30);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 126000.00, 170000000000.00, false, 8.00);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 120000.00, 210000000000.00, false, 8.00);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 0.00, 129000000000.00, true, 4.80);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

