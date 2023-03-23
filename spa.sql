--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: bay; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.bay (
    bid bigint NOT NULL,
    bname character varying(2) NOT NULL,
    x_coordinate double precision NOT NULL,
    y_coordinate double precision NOT NULL,
    occupy boolean DEFAULT false,
    plid bigint NOT NULL,
    created_at date DEFAULT CURRENT_DATE,
    updated_at date DEFAULT CURRENT_DATE
);


ALTER TABLE public.bay OWNER TO me;

--
-- Name: bay_bid_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.bay_bid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bay_bid_seq OWNER TO me;

--
-- Name: bay_bid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.bay_bid_seq OWNED BY public.bay.bid;


--
-- Name: gateway; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.gateway (
    gid bigint NOT NULL,
    plid bigint NOT NULL,
    created_at date DEFAULT CURRENT_DATE,
    updated_at date DEFAULT CURRENT_DATE
);


ALTER TABLE public.gateway OWNER TO me;

--
-- Name: gateway_gid_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.gateway_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gateway_gid_seq OWNER TO me;

--
-- Name: gateway_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.gateway_gid_seq OWNED BY public.gateway.gid;


--
-- Name: parking_lots; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.parking_lots (
    plid bigint NOT NULL,
    plname character varying(2) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    created_at date DEFAULT CURRENT_DATE,
    updated_at date DEFAULT CURRENT_DATE
);


ALTER TABLE public.parking_lots OWNER TO me;

--
-- Name: parking_lots_plid_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.parking_lots_plid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parking_lots_plid_seq OWNER TO me;

--
-- Name: parking_lots_plid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.parking_lots_plid_seq OWNED BY public.parking_lots.plid;


--
-- Name: records; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.records (
    rid bigint NOT NULL,
    sid bigint NOT NULL,
    bid bigint NOT NULL,
    status boolean,
    "time" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at date DEFAULT CURRENT_DATE,
    updated_at date DEFAULT CURRENT_DATE
);


ALTER TABLE public.records OWNER TO me;

--
-- Name: records_rid_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.records_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.records_rid_seq OWNER TO me;

--
-- Name: records_rid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.records_rid_seq OWNED BY public.records.rid;


--
-- Name: sensor; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.sensor (
    sid bigint NOT NULL,
    bid bigint NOT NULL,
    created_at date DEFAULT CURRENT_DATE,
    updated_at date DEFAULT CURRENT_DATE
);


ALTER TABLE public.sensor OWNER TO me;

--
-- Name: sensor_sid_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.sensor_sid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sensor_sid_seq OWNER TO me;

--
-- Name: sensor_sid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.sensor_sid_seq OWNED BY public.sensor.sid;


--
-- Name: bay bid; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.bay ALTER COLUMN bid SET DEFAULT nextval('public.bay_bid_seq'::regclass);


--
-- Name: gateway gid; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.gateway ALTER COLUMN gid SET DEFAULT nextval('public.gateway_gid_seq'::regclass);


--
-- Name: parking_lots plid; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.parking_lots ALTER COLUMN plid SET DEFAULT nextval('public.parking_lots_plid_seq'::regclass);


--
-- Name: records rid; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.records ALTER COLUMN rid SET DEFAULT nextval('public.records_rid_seq'::regclass);


--
-- Name: sensor sid; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.sensor ALTER COLUMN sid SET DEFAULT nextval('public.sensor_sid_seq'::regclass);


--
-- Data for Name: bay; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.bay (bid, bname, x_coordinate, y_coordinate, occupy, plid, created_at, updated_at) FROM stdin;
2	B2	17.89	19.23	f	1	2023-03-22	2023-03-22
3	B3	10.89	11.23	f	1	2023-03-22	2023-03-22
4	B4	13.9	14.93	f	3	2023-03-22	2023-03-22
1	B1	16.67	17	t	2	2023-03-22	2023-03-22
\.


--
-- Data for Name: gateway; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.gateway (gid, plid, created_at, updated_at) FROM stdin;
4	2	2023-03-22	2023-03-22
5	3	2023-03-22	2023-03-22
6	1	2023-03-22	2023-03-22
\.


--
-- Data for Name: parking_lots; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.parking_lots (plid, plname, latitude, longitude, created_at, updated_at) FROM stdin;
1	P1	76.345	75.348	2023-03-22	2023-03-22
2	P2	77.345	78.888	2023-03-22	2023-03-22
3	P3	75.999	74.222	2023-03-22	2023-03-22
\.


--
-- Data for Name: records; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.records (rid, sid, bid, status, "time", created_at, updated_at) FROM stdin;
1	1	1	t	2023-03-22 18:23:44.5555	2023-03-22	2023-03-22
\.


--
-- Data for Name: sensor; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.sensor (sid, bid, created_at, updated_at) FROM stdin;
1	1	2023-03-22	2023-03-22
2	3	2023-03-22	2023-03-22
3	2	2023-03-22	2023-03-22
4	4	2023-03-22	2023-03-22
\.


--
-- Name: bay_bid_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.bay_bid_seq', 4, true);


--
-- Name: gateway_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.gateway_gid_seq', 6, true);


--
-- Name: parking_lots_plid_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.parking_lots_plid_seq', 3, true);


--
-- Name: records_rid_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.records_rid_seq', 1, true);


--
-- Name: sensor_sid_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.sensor_sid_seq', 4, true);


--
-- Name: bay bay_bname_key; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.bay
    ADD CONSTRAINT bay_bname_key UNIQUE (bname);


--
-- Name: bay bay_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.bay
    ADD CONSTRAINT bay_pkey PRIMARY KEY (bid);


--
-- Name: gateway gateway_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.gateway
    ADD CONSTRAINT gateway_pkey PRIMARY KEY (gid);


--
-- Name: parking_lots parking_lots_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.parking_lots
    ADD CONSTRAINT parking_lots_pkey PRIMARY KEY (plid);


--
-- Name: parking_lots parking_lots_plname_key; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.parking_lots
    ADD CONSTRAINT parking_lots_plname_key UNIQUE (plname);


--
-- Name: records records_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_pkey PRIMARY KEY (rid);


--
-- Name: sensor sensor_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.sensor
    ADD CONSTRAINT sensor_pkey PRIMARY KEY (sid);


--
-- Name: bay bay_plid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.bay
    ADD CONSTRAINT bay_plid_fkey FOREIGN KEY (plid) REFERENCES public.parking_lots(plid);


--
-- Name: sensor bid; Type: FK CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.sensor
    ADD CONSTRAINT bid FOREIGN KEY (bid) REFERENCES public.bay(bid);


--
-- Name: gateway gateway_plid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.gateway
    ADD CONSTRAINT gateway_plid_fkey FOREIGN KEY (plid) REFERENCES public.parking_lots(plid);


--
-- PostgreSQL database dump complete
--

