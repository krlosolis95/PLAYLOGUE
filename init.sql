--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.5 (Debian 17.5-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: game_genre; Type: TABLE; Schema: public; Owner: alejandro
--

CREATE TABLE public.game_genre (
    gameid integer NOT NULL,
    genreid integer NOT NULL
);


ALTER TABLE public.game_genre OWNER TO alejandro;

--
-- Name: game_platform; Type: TABLE; Schema: public; Owner: alejandro
--

CREATE TABLE public.game_platform (
    gameid integer NOT NULL,
    platformid integer NOT NULL
);


ALTER TABLE public.game_platform OWNER TO alejandro;

--
-- Name: games; Type: TABLE; Schema: public; Owner: alejandro
--

CREATE TABLE public.games (
    gameid integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    release_date date,
    cover text
);


ALTER TABLE public.games OWNER TO alejandro;

--
-- Name: games_gameid_seq; Type: SEQUENCE; Schema: public; Owner: alejandro
--

CREATE SEQUENCE public.games_gameid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.games_gameid_seq OWNER TO alejandro;

--
-- Name: games_gameid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandro
--

ALTER SEQUENCE public.games_gameid_seq OWNED BY public.games.gameid;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: alejandro
--

CREATE TABLE public.genres (
    genreid integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.genres OWNER TO alejandro;

--
-- Name: genres_genreid_seq; Type: SEQUENCE; Schema: public; Owner: alejandro
--

CREATE SEQUENCE public.genres_genreid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genres_genreid_seq OWNER TO alejandro;

--
-- Name: genres_genreid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandro
--

ALTER SEQUENCE public.genres_genreid_seq OWNED BY public.genres.genreid;


--
-- Name: platform; Type: TABLE; Schema: public; Owner: alejandro
--

CREATE TABLE public.platform (
    platformid integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.platform OWNER TO alejandro;

--
-- Name: platform_platformid_seq; Type: SEQUENCE; Schema: public; Owner: alejandro
--

CREATE SEQUENCE public.platform_platformid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.platform_platformid_seq OWNER TO alejandro;

--
-- Name: platform_platformid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandro
--

ALTER SEQUENCE public.platform_platformid_seq OWNED BY public.platform.platformid;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: alejandro
--

CREATE TABLE public.reviews (
    reviewid integer NOT NULL,
    userid integer,
    gameid integer,
    content text,
    rating smallint,
    date_posted timestamp without time zone DEFAULT now(),
    CONSTRAINT reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.reviews OWNER TO alejandro;

--
-- Name: reviews_reviewid_seq; Type: SEQUENCE; Schema: public; Owner: alejandro
--

CREATE SEQUENCE public.reviews_reviewid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_reviewid_seq OWNER TO alejandro;

--
-- Name: reviews_reviewid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandro
--

ALTER SEQUENCE public.reviews_reviewid_seq OWNED BY public.reviews.reviewid;


--
-- Name: user_favorites; Type: TABLE; Schema: public; Owner: alejandro
--

CREATE TABLE public.user_favorites (
    userid integer NOT NULL,
    gameid integer NOT NULL
);


ALTER TABLE public.user_favorites OWNER TO alejandro;

--
-- Name: users; Type: TABLE; Schema: public; Owner: alejandro
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO alejandro;

--
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: alejandro
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_userid_seq OWNER TO alejandro;

--
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alejandro
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- Name: games gameid; Type: DEFAULT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.games ALTER COLUMN gameid SET DEFAULT nextval('public.games_gameid_seq'::regclass);


--
-- Name: genres genreid; Type: DEFAULT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.genres ALTER COLUMN genreid SET DEFAULT nextval('public.genres_genreid_seq'::regclass);


--
-- Name: platform platformid; Type: DEFAULT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.platform ALTER COLUMN platformid SET DEFAULT nextval('public.platform_platformid_seq'::regclass);


--
-- Name: reviews reviewid; Type: DEFAULT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.reviews ALTER COLUMN reviewid SET DEFAULT nextval('public.reviews_reviewid_seq'::regclass);


--
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- Name: game_genre game_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.game_genre
    ADD CONSTRAINT game_genre_pkey PRIMARY KEY (gameid, genreid);


--
-- Name: game_platform game_platform_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.game_platform
    ADD CONSTRAINT game_platform_pkey PRIMARY KEY (gameid, platformid);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (gameid);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genreid);


--
-- Name: platform platform_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.platform
    ADD CONSTRAINT platform_pkey PRIMARY KEY (platformid);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (reviewid);


--
-- Name: user_favorites user_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT user_favorites_pkey PRIMARY KEY (userid, gameid);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: game_genre game_genre_gameid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.game_genre
    ADD CONSTRAINT game_genre_gameid_fkey FOREIGN KEY (gameid) REFERENCES public.games(gameid);


--
-- Name: game_genre game_genre_genreid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.game_genre
    ADD CONSTRAINT game_genre_genreid_fkey FOREIGN KEY (genreid) REFERENCES public.genres(genreid);


--
-- Name: game_platform game_platform_gameid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.game_platform
    ADD CONSTRAINT game_platform_gameid_fkey FOREIGN KEY (gameid) REFERENCES public.games(gameid);


--
-- Name: game_platform game_platform_platformid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.game_platform
    ADD CONSTRAINT game_platform_platformid_fkey FOREIGN KEY (platformid) REFERENCES public.platform(platformid);


--
-- Name: reviews reviews_gameid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_gameid_fkey FOREIGN KEY (gameid) REFERENCES public.games(gameid);


--
-- Name: reviews reviews_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: user_favorites user_favorites_gameid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT user_favorites_gameid_fkey FOREIGN KEY (gameid) REFERENCES public.games(gameid);


--
-- Name: user_favorites user_favorites_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alejandro
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT user_favorites_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- PostgreSQL database dump complete
--

