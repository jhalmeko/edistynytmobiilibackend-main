--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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
-- Name: auth_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_role (
    auth_role_id integer NOT NULL,
    role_name character varying(45) NOT NULL
);


ALTER TABLE public.auth_role OWNER TO postgres;

--
-- Name: auth_role_auth_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_role_auth_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_role_auth_role_id_seq OWNER TO postgres;

--
-- Name: auth_role_auth_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_role_auth_role_id_seq OWNED BY public.auth_role.auth_role_id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    auth_user_id integer NOT NULL,
    username character varying(45) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    auth_role_auth_role_id integer NOT NULL,
    deleted_at timestamp without time zone,
    access_jti character varying(255)
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_auth_user_id_seq OWNED BY public.auth_user.auth_user_id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    category_name character varying(45) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- Name: rental_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental_item (
    rental_item_id integer NOT NULL,
    rental_item_name character varying(45) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by_user_id integer NOT NULL,
    rental_item_state_rental_item_state_id integer NOT NULL,
    category_category_id integer NOT NULL,
    rental_item_description text,
    deleted_at timestamp without time zone,
    serial_number character varying(45)
);


ALTER TABLE public.rental_item OWNER TO postgres;

--
-- Name: rental_item_feature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental_item_feature (
    rental_item_feature_id integer NOT NULL,
    rental_item_feature_name character varying(45) NOT NULL
);


ALTER TABLE public.rental_item_feature OWNER TO postgres;

--
-- Name: rental_item_feature_rental_item_feature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_item_feature_rental_item_feature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rental_item_feature_rental_item_feature_id_seq OWNER TO postgres;

--
-- Name: rental_item_feature_rental_item_feature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rental_item_feature_rental_item_feature_id_seq OWNED BY public.rental_item_feature.rental_item_feature_id;


--
-- Name: rental_item_has_rental_item_feature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental_item_has_rental_item_feature (
    rental_item_rental_item_id integer NOT NULL,
    rental_item_feature_rental_item_feature_id integer NOT NULL,
    value character varying(45) NOT NULL
);


ALTER TABLE public.rental_item_has_rental_item_feature OWNER TO postgres;

--
-- Name: rental_item_rental_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_item_rental_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rental_item_rental_item_id_seq OWNER TO postgres;

--
-- Name: rental_item_rental_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rental_item_rental_item_id_seq OWNED BY public.rental_item.rental_item_id;


--
-- Name: rental_item_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental_item_state (
    rental_item_state_id integer NOT NULL,
    rental_item_state character varying(45) NOT NULL
);


ALTER TABLE public.rental_item_state OWNER TO postgres;

--
-- Name: rental_item_state_rental_item_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_item_state_rental_item_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rental_item_state_rental_item_state_id_seq OWNER TO postgres;

--
-- Name: rental_item_state_rental_item_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rental_item_state_rental_item_state_id_seq OWNED BY public.rental_item_state.rental_item_state_id;


--
-- Name: rental_transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental_transaction (
    rental_transaction_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    rental_item_rental_item_id integer NOT NULL,
    auth_user_auth_user_id integer NOT NULL,
    rental_transaction_state_rental_transaction_state_id integer NOT NULL
);


ALTER TABLE public.rental_transaction OWNER TO postgres;

--
-- Name: rental_transaction_rental_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_transaction_rental_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rental_transaction_rental_transaction_id_seq OWNER TO postgres;

--
-- Name: rental_transaction_rental_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rental_transaction_rental_transaction_id_seq OWNED BY public.rental_transaction.rental_transaction_id;


--
-- Name: rental_transaction_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental_transaction_state (
    rental_transaction_state_id integer NOT NULL,
    rental_transaction_state character varying(45) NOT NULL
);


ALTER TABLE public.rental_transaction_state OWNER TO postgres;

--
-- Name: rental_transaction_state_rental_transaction_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_transaction_state_rental_transaction_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rental_transaction_state_rental_transaction_state_id_seq OWNER TO postgres;

--
-- Name: rental_transaction_state_rental_transaction_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rental_transaction_state_rental_transaction_state_id_seq OWNED BY public.rental_transaction_state.rental_transaction_state_id;


--
-- Name: auth_role auth_role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_role ALTER COLUMN auth_role_id SET DEFAULT nextval('public.auth_role_auth_role_id_seq'::regclass);


--
-- Name: auth_user auth_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN auth_user_id SET DEFAULT nextval('public.auth_user_auth_user_id_seq'::regclass);


--
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- Name: rental_item rental_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_item ALTER COLUMN rental_item_id SET DEFAULT nextval('public.rental_item_rental_item_id_seq'::regclass);


--
-- Name: rental_item_feature rental_item_feature_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_item_feature ALTER COLUMN rental_item_feature_id SET DEFAULT nextval('public.rental_item_feature_rental_item_feature_id_seq'::regclass);


--
-- Name: rental_item_state rental_item_state_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_item_state ALTER COLUMN rental_item_state_id SET DEFAULT nextval('public.rental_item_state_rental_item_state_id_seq'::regclass);


--
-- Name: rental_transaction rental_transaction_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_transaction ALTER COLUMN rental_transaction_id SET DEFAULT nextval('public.rental_transaction_rental_transaction_id_seq'::regclass);


--
-- Name: rental_transaction_state rental_transaction_state_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_transaction_state ALTER COLUMN rental_transaction_state_id SET DEFAULT nextval('public.rental_transaction_state_rental_transaction_state_id_seq'::regclass);


--
-- Data for Name: auth_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_role (auth_role_id, role_name) FROM stdin;
1	user
2	admin
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (auth_user_id, username, password, created_at, auth_role_auth_role_id, deleted_at, access_jti) FROM stdin;
3	admin	$2b$12$HExv/kJRWRwyDcSlvkyOAerCoezBV.WbapRVp6N78oLK2o6c/C6Be	2024-01-16 17:05:06.457571	2	\N	d9615dcb-84fc-430c-8695-792ab1fb5d93
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (category_id, category_name) FROM stdin;
1	Displays
\.


--
-- Data for Name: rental_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rental_item (rental_item_id, rental_item_name, created_at, created_by_user_id, rental_item_state_rental_item_state_id, category_category_id, rental_item_description, deleted_at, serial_number) FROM stdin;
4	Asus B	2024-01-18 14:11:00.388671	3	1	1	Huono näyttö2	\N	3f22e402-3de6-4034-8edb-a6c53ac58832
3	Asus A	2024-01-18 14:08:07.309879	3	1	1	Huono näyttö	\N	46bce1f6-0f72-4c36-90b8-05815eaa03f5
\.


--
-- Data for Name: rental_item_feature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rental_item_feature (rental_item_feature_id, rental_item_feature_name) FROM stdin;
5	color
\.


--
-- Data for Name: rental_item_has_rental_item_feature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rental_item_has_rental_item_feature (rental_item_rental_item_id, rental_item_feature_rental_item_feature_id, value) FROM stdin;
3	5	black
\.


--
-- Data for Name: rental_item_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rental_item_state (rental_item_state_id, rental_item_state) FROM stdin;
1	free
\.


--
-- Data for Name: rental_transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rental_transaction (rental_transaction_id, created_at, rental_item_rental_item_id, auth_user_auth_user_id, rental_transaction_state_rental_transaction_state_id) FROM stdin;
\.


--
-- Data for Name: rental_transaction_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rental_transaction_state (rental_transaction_state_id, rental_transaction_state) FROM stdin;
\.


--
-- Name: auth_role_auth_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_role_auth_role_id_seq', 2, true);


--
-- Name: auth_user_auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_auth_user_id_seq', 3, true);


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 2, true);


--
-- Name: rental_item_feature_rental_item_feature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_item_feature_rental_item_feature_id_seq', 5, true);


--
-- Name: rental_item_rental_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_item_rental_item_id_seq', 4, true);


--
-- Name: rental_item_state_rental_item_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_item_state_rental_item_state_id_seq', 1, true);


--
-- Name: rental_transaction_rental_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_transaction_rental_transaction_id_seq', 1, false);


--
-- Name: rental_transaction_state_rental_transaction_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_transaction_state_rental_transaction_state_id_seq', 1, false);


--
-- Name: auth_role auth_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_role
    ADD CONSTRAINT auth_role_pkey PRIMARY KEY (auth_role_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (auth_user_id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- Name: rental_item_feature rental_item_feature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_item_feature
    ADD CONSTRAINT rental_item_feature_pkey PRIMARY KEY (rental_item_feature_id);


--
-- Name: rental_item_has_rental_item_feature rental_item_has_rental_item_feature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_item_has_rental_item_feature
    ADD CONSTRAINT rental_item_has_rental_item_feature_pkey PRIMARY KEY (rental_item_rental_item_id, rental_item_feature_rental_item_feature_id);


--
-- Name: rental_item rental_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_item
    ADD CONSTRAINT rental_item_pkey PRIMARY KEY (rental_item_id);


--
-- Name: rental_item_state rental_item_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_item_state
    ADD CONSTRAINT rental_item_state_pkey PRIMARY KEY (rental_item_state_id);


--
-- Name: rental_transaction rental_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_transaction
    ADD CONSTRAINT rental_transaction_pkey PRIMARY KEY (rental_transaction_id);


--
-- Name: rental_transaction_state rental_transaction_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_transaction_state
    ADD CONSTRAINT rental_transaction_state_pkey PRIMARY KEY (rental_transaction_state_id);


--
-- Name: category_name_UNIQUE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "category_name_UNIQUE" ON public.category USING btree (category_name);


--
-- Name: fk_auth_user_auth_role_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_auth_user_auth_role_idx ON public.auth_user USING btree (auth_role_auth_role_id);


--
-- Name: fk_rental_item_auth_user1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_rental_item_auth_user1_idx ON public.rental_item USING btree (created_by_user_id);


--
-- Name: fk_rental_item_category1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_rental_item_category1_idx ON public.rental_item USING btree (category_category_id);


--
-- Name: fk_rental_item_has_rental_item_feature_rental_item1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_rental_item_has_rental_item_feature_rental_item1_idx ON public.rental_item_has_rental_item_feature USING btree (rental_item_rental_item_id);


--
-- Name: fk_rental_item_has_rental_item_feature_rental_item_feature1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_rental_item_has_rental_item_feature_rental_item_feature1_idx ON public.rental_item_has_rental_item_feature USING btree (rental_item_feature_rental_item_feature_id);


--
-- Name: fk_rental_item_rental_item_state1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_rental_item_rental_item_state1_idx ON public.rental_item USING btree (rental_item_state_rental_item_state_id);


--
-- Name: fk_rental_transaction_auth_user1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_rental_transaction_auth_user1_idx ON public.rental_transaction USING btree (auth_user_auth_user_id);


--
-- Name: fk_rental_transaction_rental_item1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_rental_transaction_rental_item1_idx ON public.rental_transaction USING btree (rental_item_rental_item_id);


--
-- Name: fk_rental_transaction_rental_transaction_state1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_rental_transaction_rental_transaction_state1_idx ON public.rental_transaction USING btree (rental_transaction_state_rental_transaction_state_id);


--
-- Name: rental_item_state_UNIQUE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "rental_item_state_UNIQUE" ON public.rental_item_state USING btree (rental_item_state);


--
-- Name: rental_transaction_state_UNIQUE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "rental_transaction_state_UNIQUE" ON public.rental_transaction_state USING btree (rental_transaction_state);


--
-- Name: role_name_UNIQUE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "role_name_UNIQUE" ON public.auth_role USING btree (role_name);


--
-- Name: serial_number_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX serial_number_unique ON public.rental_item USING btree (serial_number);


--
-- Name: username_UNIQUE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "username_UNIQUE" ON public.auth_user USING btree (username);


--
-- Name: auth_user fk_auth_user_auth_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT fk_auth_user_auth_role FOREIGN KEY (auth_role_auth_role_id) REFERENCES public.auth_role(auth_role_id);


--
-- Name: rental_item fk_rental_item_auth_user1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_item
    ADD CONSTRAINT fk_rental_item_auth_user1 FOREIGN KEY (created_by_user_id) REFERENCES public.auth_user(auth_user_id);


--
-- Name: rental_item fk_rental_item_category1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_item
    ADD CONSTRAINT fk_rental_item_category1 FOREIGN KEY (category_category_id) REFERENCES public.category(category_id);


--
-- Name: rental_item_has_rental_item_feature fk_rental_item_has_rental_item_feature_rental_item1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_item_has_rental_item_feature
    ADD CONSTRAINT fk_rental_item_has_rental_item_feature_rental_item1 FOREIGN KEY (rental_item_rental_item_id) REFERENCES public.rental_item(rental_item_id);


--
-- Name: rental_item_has_rental_item_feature fk_rental_item_has_rental_item_feature_rental_item_feature1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_item_has_rental_item_feature
    ADD CONSTRAINT fk_rental_item_has_rental_item_feature_rental_item_feature1 FOREIGN KEY (rental_item_feature_rental_item_feature_id) REFERENCES public.rental_item_feature(rental_item_feature_id);


--
-- Name: rental_item fk_rental_item_rental_item_state1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_item
    ADD CONSTRAINT fk_rental_item_rental_item_state1 FOREIGN KEY (rental_item_state_rental_item_state_id) REFERENCES public.rental_item_state(rental_item_state_id);


--
-- Name: rental_transaction fk_rental_transaction_auth_user1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_transaction
    ADD CONSTRAINT fk_rental_transaction_auth_user1 FOREIGN KEY (auth_user_auth_user_id) REFERENCES public.auth_user(auth_user_id);


--
-- Name: rental_transaction fk_rental_transaction_rental_item1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_transaction
    ADD CONSTRAINT fk_rental_transaction_rental_item1 FOREIGN KEY (rental_item_rental_item_id) REFERENCES public.rental_item(rental_item_id);


--
-- Name: rental_transaction fk_rental_transaction_rental_transaction_state1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental_transaction
    ADD CONSTRAINT fk_rental_transaction_rental_transaction_state1 FOREIGN KEY (rental_transaction_state_rental_transaction_state_id) REFERENCES public.rental_transaction_state(rental_transaction_state_id);


--
-- PostgreSQL database dump complete
--

