--
-- hotelitbfQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-06-28 14:14:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET statement_timeout  = 0;
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
-- TOC entry 224 (class 1259 OID 16496)
-- Name: acomodacions; Type: TABLE; Schema: public; Owner: hotelitbf
--

CREATE TABLE public.acomodacions (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.acomodacions OWNER TO hotelitbf;

--
-- TOC entry 223 (class 1259 OID 16495)
-- Name: acomodacions_id_seq; Type: SEQUENCE; Schema: public; Owner: hotelitbf
--

CREATE SEQUENCE public.acomodacions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.acomodacions_id_seq OWNER TO hotelitbf;

--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 223
-- Name: acomodacions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hotelitbf
--

ALTER SEQUENCE public.acomodacions_id_seq OWNED BY public.acomodacions.id;


--
-- TOC entry 228 (class 1259 OID 16524)
-- Name: habitacions; Type: TABLE; Schema: public; Owner: hotelitbf
--

CREATE TABLE public.habitacions (
    id bigint NOT NULL,
    hotel_id bigint NOT NULL,
    tipo_habitacion_id bigint NOT NULL,
    acomodacion_id bigint NOT NULL,
    cantidad integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.habitacions OWNER TO hotelitbf;

--
-- TOC entry 227 (class 1259 OID 16523)
-- Name: habitacions_id_seq; Type: SEQUENCE; Schema: public; Owner: hotelitbf
--

CREATE SEQUENCE public.habitacions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.habitacions_id_seq OWNER TO hotelitbf;

--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 227
-- Name: habitacions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hotelitbf
--

ALTER SEQUENCE public.habitacions_id_seq OWNED BY public.habitacions.id;


--
-- TOC entry 220 (class 1259 OID 16474)
-- Name: hotels; Type: TABLE; Schema: public; Owner: hotelitbf
--

CREATE TABLE public.hotels (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL,
    ciudad character varying(255) NOT NULL,
    nit character varying(255) NOT NULL,
    numero_habitaciones integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.hotels OWNER TO hotelitbf;

--
-- TOC entry 219 (class 1259 OID 16473)
-- Name: hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: hotelitbf
--

CREATE SEQUENCE public.hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hotels_id_seq OWNER TO hotelitbf;

--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 219
-- Name: hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hotelitbf
--

ALTER SEQUENCE public.hotels_id_seq OWNED BY public.hotels.id;


--
-- TOC entry 218 (class 1259 OID 16467)
-- Name: migrations; Type: TABLE; Schema: public; Owner: hotelitbf
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO hotelitbf;

--
-- TOC entry 217 (class 1259 OID 16466)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: hotelitbf
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO hotelitbf;

--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 217
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hotelitbf
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 229 (class 1259 OID 16548)
-- Name: sessions; Type: TABLE; Schema: public; Owner: hotelitbf
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO hotelitbf;

--
-- TOC entry 226 (class 1259 OID 16505)
-- Name: tipo_habitacion_acomodacion; Type: TABLE; Schema: public; Owner: hotelitbf
--

CREATE TABLE public.tipo_habitacion_acomodacion (
    id bigint NOT NULL,
    tipo_habitacion_id bigint NOT NULL,
    acomodacion_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.tipo_habitacion_acomodacion OWNER TO hotelitbf;

--
-- TOC entry 225 (class 1259 OID 16504)
-- Name: tipo_habitacion_acomodacion_id_seq; Type: SEQUENCE; Schema: public; Owner: hotelitbf
--

CREATE SEQUENCE public.tipo_habitacion_acomodacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_habitacion_acomodacion_id_seq OWNER TO hotelitbf;

--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 225
-- Name: tipo_habitacion_acomodacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hotelitbf
--

ALTER SEQUENCE public.tipo_habitacion_acomodacion_id_seq OWNED BY public.tipo_habitacion_acomodacion.id;


--
-- TOC entry 222 (class 1259 OID 16487)
-- Name: tipo_habitacions; Type: TABLE; Schema: public; Owner: hotelitbf
--

CREATE TABLE public.tipo_habitacions (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.tipo_habitacions OWNER TO hotelitbf;

--
-- TOC entry 221 (class 1259 OID 16486)
-- Name: tipo_habitacions_id_seq; Type: SEQUENCE; Schema: public; Owner: hotelitbf
--

CREATE SEQUENCE public.tipo_habitacions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_habitacions_id_seq OWNER TO hotelitbf;

--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 221
-- Name: tipo_habitacions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hotelitbf
--

ALTER SEQUENCE public.tipo_habitacions_id_seq OWNED BY public.tipo_habitacions.id;


--
-- TOC entry 4673 (class 2604 OID 16499)
-- Name: acomodacions id; Type: DEFAULT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.acomodacions ALTER COLUMN id SET DEFAULT nextval('public.acomodacions_id_seq'::regclass);


--
-- TOC entry 4675 (class 2604 OID 16527)
-- Name: habitacions id; Type: DEFAULT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.habitacions ALTER COLUMN id SET DEFAULT nextval('public.habitacions_id_seq'::regclass);


--
-- TOC entry 4671 (class 2604 OID 16477)
-- Name: hotels id; Type: DEFAULT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.hotels ALTER COLUMN id SET DEFAULT nextval('public.hotels_id_seq'::regclass);


--
-- TOC entry 4670 (class 2604 OID 16470)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 4674 (class 2604 OID 16508)
-- Name: tipo_habitacion_acomodacion id; Type: DEFAULT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.tipo_habitacion_acomodacion ALTER COLUMN id SET DEFAULT nextval('public.tipo_habitacion_acomodacion_id_seq'::regclass);


--
-- TOC entry 4672 (class 2604 OID 16490)
-- Name: tipo_habitacions id; Type: DEFAULT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.tipo_habitacions ALTER COLUMN id SET DEFAULT nextval('public.tipo_habitacions_id_seq'::regclass);


--
-- TOC entry 4861 (class 0 OID 16496)
-- Dependencies: 224
-- Data for Name: acomodacions; Type: TABLE DATA; Schema: public; Owner: hotelitbf
--

INSERT INTO public.acomodacions (id, nombre, created_at, updated_at) VALUES (1, 'Sencilla', NULL, NULL);
INSERT INTO public.acomodacions (id, nombre, created_at, updated_at) VALUES (2, 'Doble', NULL, NULL);
INSERT INTO public.acomodacions (id, nombre, created_at, updated_at) VALUES (3, 'Triple', NULL, NULL);
INSERT INTO public.acomodacions (id, nombre, created_at, updated_at) VALUES (4, 'Cuádruple', NULL, NULL);


--
-- TOC entry 4865 (class 0 OID 16524)
-- Dependencies: 228
-- Data for Name: habitacions; Type: TABLE DATA; Schema: public; Owner: hotelitbf
--



--
-- TOC entry 4857 (class 0 OID 16474)
-- Dependencies: 220
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: hotelitbf
--



--
-- TOC entry 4855 (class 0 OID 16467)
-- Dependencies: 218
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: hotelitbf
--

INSERT INTO public.migrations (id, migration, batch) VALUES (1, '2025_06_26_225556_create_hotels_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (2, '2025_06_26_225819_create_tipo_habitacions_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (3, '2025_06_26_232621_create_acomodacions_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (4, '2025_06_26_232827_create_tipo_habitacion_acomodacion_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (5, '2025_06_27_002822_create_habitacions_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (6, '2025_06_27_012712_create_sessions_table', 2);


--
-- TOC entry 4866 (class 0 OID 16548)
-- Dependencies: 229
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: hotelitbf
--

INSERT INTO public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) VALUES ('aG92pU4gnEx5WxiGHCDvmdVbicvGFwLc3NkiZuB1', NULL, '127.0.0.1', 'insomnia/11.0.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEdzQkNaeGluVnl6Z01Xb0w0SWJlRTl3VndDVEE4cFBaRHNhVGx2ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750990168);


--
-- TOC entry 4863 (class 0 OID 16505)
-- Dependencies: 226
-- Data for Name: tipo_habitacion_acomodacion; Type: TABLE DATA; Schema: public; Owner: hotelitbf
--

INSERT INTO public.tipo_habitacion_acomodacion (id, tipo_habitacion_id, acomodacion_id, created_at, updated_at) VALUES (1, 1, 1, NULL, NULL);
INSERT INTO public.tipo_habitacion_acomodacion (id, tipo_habitacion_id, acomodacion_id, created_at, updated_at) VALUES (2, 1, 2, NULL, NULL);
INSERT INTO public.tipo_habitacion_acomodacion (id, tipo_habitacion_id, acomodacion_id, created_at, updated_at) VALUES (3, 2, 3, NULL, NULL);
INSERT INTO public.tipo_habitacion_acomodacion (id, tipo_habitacion_id, acomodacion_id, created_at, updated_at) VALUES (4, 2, 4, NULL, NULL);
INSERT INTO public.tipo_habitacion_acomodacion (id, tipo_habitacion_id, acomodacion_id, created_at, updated_at) VALUES (5, 3, 1, NULL, NULL);
INSERT INTO public.tipo_habitacion_acomodacion (id, tipo_habitacion_id, acomodacion_id, created_at, updated_at) VALUES (6, 3, 2, NULL, NULL);
INSERT INTO public.tipo_habitacion_acomodacion (id, tipo_habitacion_id, acomodacion_id, created_at, updated_at) VALUES (7, 3, 3, NULL, NULL);


--
-- TOC entry 4859 (class 0 OID 16487)
-- Dependencies: 222
-- Data for Name: tipo_habitacions; Type: TABLE DATA; Schema: public; Owner: hotelitbf
--

INSERT INTO public.tipo_habitacions (id, nombre, created_at, updated_at) VALUES (1, 'Estándar', NULL, NULL);
INSERT INTO public.tipo_habitacions (id, nombre, created_at, updated_at) VALUES (2, 'Junior', NULL, NULL);
INSERT INTO public.tipo_habitacions (id, nombre, created_at, updated_at) VALUES (3, 'Suite', NULL, NULL);


--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 223
-- Name: acomodacions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hotelitbf
--

SELECT pg_catalog.setval('public.acomodacions_id_seq', 4, true);


--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 227
-- Name: habitacions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hotelitbf
--

SELECT pg_catalog.setval('public.habitacions_id_seq', 15, true);


--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 219
-- Name: hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hotelitbf
--

SELECT pg_catalog.setval('public.hotels_id_seq', 5, true);


--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 217
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hotelitbf
--

SELECT pg_catalog.setval('public.migrations_id_seq', 6, true);


--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 225
-- Name: tipo_habitacion_acomodacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hotelitbf
--

SELECT pg_catalog.setval('public.tipo_habitacion_acomodacion_id_seq', 7, true);


--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 221
-- Name: tipo_habitacions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hotelitbf
--

SELECT pg_catalog.setval('public.tipo_habitacions_id_seq', 3, true);


--
-- TOC entry 4689 (class 2606 OID 16503)
-- Name: acomodacions acomodacions_nombre_unique; Type: CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.acomodacions
    ADD CONSTRAINT acomodacions_nombre_unique UNIQUE (nombre);


--
-- TOC entry 4691 (class 2606 OID 16501)
-- Name: acomodacions acomodacions_pkey; Type: CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.acomodacions
    ADD CONSTRAINT acomodacions_pkey PRIMARY KEY (id);


--
-- TOC entry 4697 (class 2606 OID 16546)
-- Name: habitacions habitacions_hotel_id_tipo_habitacion_id_acomodacion_id_unique; Type: CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.habitacions
    ADD CONSTRAINT habitacions_hotel_id_tipo_habitacion_id_acomodacion_id_unique UNIQUE (hotel_id, tipo_habitacion_id, acomodacion_id);


--
-- TOC entry 4699 (class 2606 OID 16529)
-- Name: habitacions habitacions_pkey; Type: CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.habitacions
    ADD CONSTRAINT habitacions_pkey PRIMARY KEY (id);


--
-- TOC entry 4679 (class 2606 OID 16485)
-- Name: hotels hotels_nit_unique; Type: CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_nit_unique UNIQUE (nit);


--
-- TOC entry 4681 (class 2606 OID 16483)
-- Name: hotels hotels_nombre_unique; Type: CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_nombre_unique UNIQUE (nombre);


--
-- TOC entry 4683 (class 2606 OID 16481)
-- Name: hotels hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);


--
-- TOC entry 4677 (class 2606 OID 16472)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4702 (class 2606 OID 16554)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 4693 (class 2606 OID 16510)
-- Name: tipo_habitacion_acomodacion tipo_habitacion_acomodacion_pkey; Type: CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.tipo_habitacion_acomodacion
    ADD CONSTRAINT tipo_habitacion_acomodacion_pkey PRIMARY KEY (id);


--
-- TOC entry 4695 (class 2606 OID 16522)
-- Name: tipo_habitacion_acomodacion tipo_habitacion_acomodacion_tipo_habitacion_id_acomodacion_id_u; Type: CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.tipo_habitacion_acomodacion
    ADD CONSTRAINT tipo_habitacion_acomodacion_tipo_habitacion_id_acomodacion_id_u UNIQUE (tipo_habitacion_id, acomodacion_id);


--
-- TOC entry 4685 (class 2606 OID 16494)
-- Name: tipo_habitacions tipo_habitacions_nombre_unique; Type: CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.tipo_habitacions
    ADD CONSTRAINT tipo_habitacions_nombre_unique UNIQUE (nombre);


--
-- TOC entry 4687 (class 2606 OID 16492)
-- Name: tipo_habitacions tipo_habitacions_pkey; Type: CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.tipo_habitacions
    ADD CONSTRAINT tipo_habitacions_pkey PRIMARY KEY (id);


--
-- TOC entry 4700 (class 1259 OID 16556)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: hotelitbf
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 4703 (class 1259 OID 16555)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: hotelitbf
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 4706 (class 2606 OID 16540)
-- Name: habitacions habitacions_acomodacion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.habitacions
    ADD CONSTRAINT habitacions_acomodacion_id_foreign FOREIGN KEY (acomodacion_id) REFERENCES public.acomodacions(id) ON DELETE CASCADE;


--
-- TOC entry 4707 (class 2606 OID 16530)
-- Name: habitacions habitacions_hotel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.habitacions
    ADD CONSTRAINT habitacions_hotel_id_foreign FOREIGN KEY (hotel_id) REFERENCES public.hotels(id) ON DELETE CASCADE;


--
-- TOC entry 4708 (class 2606 OID 16535)
-- Name: habitacions habitacions_tipo_habitacion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.habitacions
    ADD CONSTRAINT habitacions_tipo_habitacion_id_foreign FOREIGN KEY (tipo_habitacion_id) REFERENCES public.tipo_habitacions(id) ON DELETE CASCADE;


--
-- TOC entry 4704 (class 2606 OID 16516)
-- Name: tipo_habitacion_acomodacion tipo_habitacion_acomodacion_acomodacion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.tipo_habitacion_acomodacion
    ADD CONSTRAINT tipo_habitacion_acomodacion_acomodacion_id_foreign FOREIGN KEY (acomodacion_id) REFERENCES public.acomodacions(id) ON DELETE CASCADE;


--
-- TOC entry 4705 (class 2606 OID 16511)
-- Name: tipo_habitacion_acomodacion tipo_habitacion_acomodacion_tipo_habitacion_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: hotelitbf
--

ALTER TABLE ONLY public.tipo_habitacion_acomodacion
    ADD CONSTRAINT tipo_habitacion_acomodacion_tipo_habitacion_id_foreign FOREIGN KEY (tipo_habitacion_id) REFERENCES public.tipo_habitacions(id) ON DELETE CASCADE;


-- Completed on 2025-06-28 14:14:46

--
-- hotelitbfQL database dump complete
--

