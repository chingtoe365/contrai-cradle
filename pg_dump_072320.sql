--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-2.pgdg16.04+1)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-2.pgdg16.04+1)

-- Started on 2020-07-23 12:45:17 UTC

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
-- TOC entry 207 (class 1259 OID 24704)
-- Name: evaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluation (
    model_type character varying,
    parameters character varying,
    k integer,
    train_sample_size integer,
    test_sample_size integer,
    training_precision real,
    training_recall real,
    training_f_measure real,
    training_start timestamp without time zone,
    training_end timestamp without time zone,
    testing_start timestamp without time zone,
    testing_end timestamp without time zone,
    training_accuracy real,
    id integer NOT NULL,
    parametric character varying,
    model_filepath character varying,
    preprocessing_id bigint,
    training_confusion_matrix_path character varying,
    topic character varying,
    testing_precision real,
    testing_recall real,
    testing_f_measure real,
    testing_accuracy real,
    testing_confusion_matrix_path character varying,
    train_true_positives_num integer,
    test_true_positives_num integer,
    note text
);


ALTER TABLE public.evaluation OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24702)
-- Name: evaluation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evaluation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evaluation_id_seq OWNER TO postgres;

--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 206
-- Name: evaluation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evaluation_id_seq OWNED BY public.evaluation.id;


--
-- TOC entry 202 (class 1259 OID 16385)
-- Name: preprocessing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.preprocessing (
    preprocessing_start timestamp without time zone,
    sample_file_path character varying,
    preprocessing_end timestamp without time zone,
    id bigint NOT NULL,
    stop_word_removed character varying,
    stemming character varying,
    embedding_method character varying,
    strigent_topic character varying,
    exclude_contracts character varying,
    input_format text,
    ngram integer,
    sample_count integer,
    multiple_paragraphs character varying,
    ngram_mixed character varying,
    pos character varying,
    ngram_literated character varying,
    semantic_analysis character varying,
    ngram_list character varying
);


ALTER TABLE public.preprocessing OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16400)
-- Name: results_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.results_id_seq OWNER TO postgres;

--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 205
-- Name: results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.results_id_seq OWNED BY public.preprocessing.id;


--
-- TOC entry 204 (class 1259 OID 16393)
-- Name: test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test (
    id integer NOT NULL,
    comment character varying
);


ALTER TABLE public.test OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16391)
-- Name: test_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_id_seq OWNER TO postgres;

--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 203
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.test_id_seq OWNED BY public.test.id;


--
-- TOC entry 2745 (class 2604 OID 24707)
-- Name: evaluation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation ALTER COLUMN id SET DEFAULT nextval('public.evaluation_id_seq'::regclass);


--
-- TOC entry 2743 (class 2604 OID 24817)
-- Name: preprocessing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preprocessing ALTER COLUMN id SET DEFAULT nextval('public.results_id_seq'::regclass);


--
-- TOC entry 2744 (class 2604 OID 16396)
-- Name: test id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test ALTER COLUMN id SET DEFAULT nextval('public.test_id_seq'::regclass);


--
-- TOC entry 2882 (class 0 OID 24704)
-- Dependencies: 207
-- Data for Name: evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evaluation (model_type, parameters, k, train_sample_size, test_sample_size, training_precision, training_recall, training_f_measure, training_start, training_end, testing_start, testing_end, training_accuracy, id, parametric, model_filepath, preprocessing_id, training_confusion_matrix_path, topic, testing_precision, testing_recall, testing_f_measure, testing_accuracy, testing_confusion_matrix_path, train_true_positives_num, test_true_positives_num, note) FROM stdin;
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	20200102194102.sav	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	34	8	0.25	0.2	0.22222222	2020-02-01 19:41:30	2020-02-01 19:41:30	2020-02-01 19:41:30	2020-02-01 19:41:30	0.25	2	\N	20200102194130.sav	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	34	8	0.75	0.5	0.6	2020-02-01 19:41:49	2020-02-01 19:41:49	2020-02-01 19:41:49	2020-02-01 19:41:49	0.25	3	\N	20200102194149.sav	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	34	8	0.4	0.4	0.4	2020-02-01 19:42:03	2020-02-01 19:42:03	2020-02-01 19:42:03	2020-02-01 19:42:03	0.125	4	\N	20200102194203.sav	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	27068	6766	0.984127	1	0.992	2020-03-01 18:55:24	2020-03-01 18:55:39	2020-03-01 18:55:46	2020-03-01 18:56:21	0.34776825	5	\N	20200103185539.sav	128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	27068	6766	1	1	1	2020-06-01 10:29:58	2020-06-01 10:30:12	2020-06-01 10:30:18	2020-06-01 10:30:49	0.30845404	6	\N	20200106103012.sav	128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	27068	6766	1	0.984127	0.992	2020-06-01 11:31:57	2020-06-01 11:32:11	2020-06-01 11:32:17	2020-06-01 11:54:50	0.29456103	7	\N	20200106113211.sav	128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	27068	6766	1	1	1	2020-06-01 13:54:00	2020-06-01 13:54:15	2020-06-01 13:54:22	2020-06-01 14:02:11	0.325303	8	\N	20200106135415.sav	130	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	\N	20200106183713.sav	131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	\N	20200106183932.sav	131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	\N	20200106184202.sav	131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	27026	6755	0.983871	1	0.9918699	2020-06-01 18:45:23	2020-06-01 18:45:44	2020-06-01 18:45:53	2020-06-01 18:46:35	0.30555144	12	\N	20200106184544.sav	131	131.txt	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	26790	6697	1	1	1	2020-06-01 19:13:22	2020-06-01 19:13:40	2020-06-01 19:13:47	2020-06-01 19:14:27	0.4343736	13	\N	20200106191340.sav	132	132.txt	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	26790	6697	1	1	1	2020-06-01 19:39:52	2020-06-01 19:40:09	2020-06-01 19:40:15	2020-06-01 19:40:54	0.4539346	14	\N	20200106194009.sav	133	133.txt	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	2557	638	0.82758623	0.9230769	0.8727273	2020-07-01 12:11:56	2020-07-01 12:11:59	2020-07-01 12:12:00	2020-07-01 12:12:02	0.23667711	15	\N	20200107121159.sav	136	136.txt	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	3517	878	0.85294116	0.82857144	0.8405797	2020-07-01 17:59:00	2020-07-01 17:59:04	2020-07-01 17:59:06	2020-07-01 17:59:10	0.19362187	16	\N	20200107175904.sav	137	137.txt	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	3517	878	0.82857144	0.8787879	0.85294116	2020-08-01 16:19:04	2020-08-01 16:19:09	2020-08-01 16:19:12	2020-08-01 16:19:18	0.16742598	17	\N	20200108161909.sav	137	137.txt	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	3142	784	0.8055556	0.8787879	0.8405797	2020-08-01 17:37:42	2020-08-01 17:37:45	2020-08-01 17:37:47	2020-08-01 17:37:51	0.22193877	18	\N	20200108173745.sav	138	138.txt	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	3142	784	0.8611111	0.8611111	0.8611111	2020-08-01 18:15:35	2020-08-01 18:15:38	2020-08-01 18:15:40	2020-08-01 18:15:43	0.24362245	19	\N	20200108181538.sav	139	139.txt	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	26641	6659	1	1	1	2020-08-01 18:37:47	2020-08-01 18:38:04	2020-08-01 18:38:10	2020-08-01 18:38:48	0.38414177	20	\N	20200108183804.sav	140	140.txt	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	26641	6659	1	1	1	2020-08-01 18:50:49	2020-08-01 18:51:08	2020-08-01 18:51:15	2020-08-01 18:53:57	0.39893398	21	\N	20200108185108.sav	140	140.txt	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	\N	20200109154702.sav	141	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	26641	6659	1	1	1	2020-09-01 15:48:07	2020-09-01 15:48:24	2020-09-01 15:48:30	2020-09-01 15:51:51	0.4445212	23	\N	20200109154824.sav	141	141.txt	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	3142	784	1	0.9302326	0.96385545	2020-09-01 16:09:05	2020-09-01 16:09:09	2020-09-01 16:09:11	2020-09-01 16:09:29	0.1522791	24	\N	20200109160909.sav	142	142.txt	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	3142	784	1	0.9302326	0.96385545	2020-09-01 16:19:00	2020-09-01 16:19:04	2020-09-01 16:19:05	2020-09-01 16:19:21	0.14947797	25	\N	20200109161904.sav	143	143.txt	\N	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:20:14	2020-01-13 18:20:14	2020-01-13 18:20:14	2020-01-13 18:20:15	0.8430936	179	\N	20200113182014.sav	143	143_train_cm__topic_customer obligations.txt	customer obligations	1	1	1	0.8252551	143_test_cm__topic_customer obligations.txt	309	86	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:20:38	2020-01-13 18:20:38	2020-01-13 18:20:38	2020-01-13 18:20:40	0.08784214	184	\N	20200113182038.sav	143	143_train_cm__topic_price reviews cpi rpi annual.txt	price reviews cpi rpi annual	0.5	1	0.6666667	0.094387755	143_test_cm__topic_price reviews cpi rpi annual.txt	1	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:01	2020-01-13 18:21:01	2020-01-13 18:21:02	2020-01-13 18:21:02	0.962126	189	\N	20200113182101.sav	143	143_train_cm__topic_limitation liability.txt	limitation liability	1	1	1	0.96428573	143_test_cm__topic_limitation liability.txt	173	38	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:19	2020-01-13 18:21:20	2020-01-13 18:21:20	2020-01-13 18:21:21	0.24156588	194	\N	20200113182120.sav	143	143_train_cm__topic_assignment.txt	assignment	1	1	1	0.25510204	143_test_cm__topic_assignment.txt	7	1	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:38	2020-01-13 18:21:38	2020-01-13 18:21:38	2020-01-13 18:21:39	0.09070656	199	\N	20200113182138.sav	143	143_train_cm__topic_severance.txt	severance	1	1	1	0.1122449	143_test_cm__topic_severance.txt	1	1	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:56	2020-01-13 18:21:57	2020-01-13 18:21:57	2020-01-13 18:21:57	1	204	\N	20200113182157.sav	143	143_train_cm__topic_several liability.txt	several liability	1	1	1	1	143_test_cm__topic_several liability.txt	0	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:12	2020-01-13 18:22:13	2020-01-13 18:22:13	2020-01-13 18:22:14	0.82399744	209	\N	20200113182213.sav	143	143_train_cm__topic_warranties.txt	warranties	1	1	1	0.8596939	143_test_cm__topic_warranties.txt	55	8	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:30	2020-01-13 18:22:31	2020-01-13 18:22:31	2020-01-13 18:22:32	0.9481222	214	\N	20200113182231.sav	143	143_train_cm__topic_services.txt	services	1	1	1	0.9285714	143_test_cm__topic_services.txt	457	120	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:47	2020-01-13 18:22:47	2020-01-13 18:22:48	2020-01-13 18:22:49	0.0973902	219	\N	20200113182247.sav	143	143_train_cm__topic_rights transfer reproduction adaptation.txt	rights transfer reproduction adaptation	1	1	1	0.09821428	143_test_cm__topic_rights transfer reproduction adaptation.txt	1	1	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:23:05	2020-01-13 18:23:06	2020-01-13 18:23:06	2020-01-13 18:23:06	0.58497775	224	\N	20200113182306.sav	143	143_train_cm__topic_anti-bribery.txt	anti-bribery	0.5	1	0.6666667	0.58035713	143_test_cm__topic_anti-bribery.txt	11	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:23:24	2020-01-13 18:23:24	2020-01-13 18:23:24	2020-01-13 18:23:24	1	229	\N	20200113182324.sav	143	143_train_cm__topic_forecasts.txt	forecasts	1	1	1	1	143_test_cm__topic_forecasts.txt	0	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:23:41	2020-01-13 18:23:42	2020-01-13 18:23:42	2020-01-13 18:23:42	1	234	\N	20200113182342.sav	143	143_train_cm__topic_faulty.txt	faulty	1	1	1	1	143_test_cm__topic_faulty.txt	0	0	\N
Multinomial NB	\N	5	3142	784	1	1	1	2020-01-14 18:38:34	2020-01-14 18:38:35	2020-01-14 18:38:35	2020-01-14 18:38:36	0.9401655	239	\N	20200114183835.sav	143	143_Multinomial NB_train_cm__topic_services.txt	services	1	1	1	0.92091835	143_test_cm__topic_services.txt	465	112	\N
Logistic Regression	\N	5	3142	784	1	1	1	2020-01-14 18:48:01	2020-01-14 18:48:02	2020-01-14 18:48:02	2020-01-14 18:48:03	0.9497136	244	\N	20200114184802.sav	144	144_Logistic Regression_train_cm_.txt	None	1	0.74285716	0.852459	0.7397959	144_test_cm_.txt	3142	784	\N
SVC	\N	5	3142	784	1	0.023809524	0.046511628	2020-01-14 18:59:40	2020-01-14 18:59:44	2020-01-14 18:59:44	2020-01-14 18:59:51	0.14863144	249	\N	20200114185944.sav	143	143_SVC_train_cm_.txt	None	1	0.027777778	0.054054055	0.14030612	143_SVC_test_cm_.txt	3142	784	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254	\N	20200304123312.sav	144	\N	None	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259	\N	20200304125120.sav	144	\N	None	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:20:18	2020-01-13 18:20:18	2020-01-13 18:20:19	2020-01-13 18:20:20	0.089433484	180	\N	20200113182018.sav	143	143_train_cm__topic_non-solicitation.txt	non-solicitation	0.5	1	0.6666667	0.091836736	143_test_cm__topic_non-solicitation.txt	1	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:20:42	2020-01-13 18:20:42	2020-01-13 18:20:42	2020-01-13 18:20:43	0.13876511	185	\N	20200113182042.sav	143	143_train_cm__topic_expenses.txt	expenses	1	1	1	0.14668368	143_test_cm__topic_expenses.txt	3	1	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:04	2020-01-13 18:21:05	2020-01-13 18:21:05	2020-01-13 18:21:05	0.94207513	190	\N	20200113182105.sav	143	143_train_cm__topic_termination.txt	termination	1	1	1	0.94132656	143_test_cm__topic_termination.txt	181	48	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:23	2020-01-13 18:21:23	2020-01-13 18:21:23	2020-01-13 18:21:24	0.38064927	195	\N	20200113182123.sav	143	143_train_cm__topic_variation.txt	variation	0.5	1	0.6666667	0.39795917	143_test_cm__topic_variation.txt	11	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:42	2020-01-13 18:21:42	2020-01-13 18:21:42	2020-01-13 18:21:43	0.9013367	200	\N	20200113182142.sav	143	143_train_cm__topic_entire agreement.txt	entire agreement	1	1	1	0.8864796	143_test_cm__topic_entire agreement.txt	189	39	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:59	2020-01-13 18:22:00	2020-01-13 18:22:00	2020-01-13 18:22:01	0.6247613	205	\N	20200113182200.sav	143	143_train_cm__topic_notices notice.txt	notices notice	1	1	1	0.6530612	143_test_cm__topic_notices notice.txt	17	7	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:17	2020-01-13 18:22:17	2020-01-13 18:22:17	2020-01-13 18:22:18	0.5372374	210	\N	20200113182217.sav	143	143_train_cm__topic_indemnities.txt	indemnities	1	1	1	0.5369898	143_test_cm__topic_indemnities.txt	21	3	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:35	2020-01-13 18:22:35	2020-01-13 18:22:35	2020-01-13 18:22:36	1	215	\N	20200113182235.sav	143	143_train_cm__topic_deliverables.txt	deliverables	1	1	1	1	143_test_cm__topic_deliverables.txt	0	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:52	2020-01-13 18:22:52	2020-01-13 18:22:52	2020-01-13 18:22:53	1	220	\N	20200113182252.sav	143	143_train_cm__topic_escrow source code.txt	escrow source code	1	1	1	1	143_test_cm__topic_escrow source code.txt	0	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:23:09	2020-01-13 18:23:09	2020-01-13 18:23:09	2020-01-13 18:23:10	1	225	\N	20200113182309.sav	143	143_train_cm__topic_export control.txt	export control	1	1	1	1	143_test_cm__topic_export control.txt	0	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:23:26	2020-01-13 18:23:26	2020-01-13 18:23:26	2020-01-13 18:23:27	0.7463399	230	\N	20200113182326.sav	143	143_train_cm__topic_orders.txt	orders	1	1	1	0.75765306	143_test_cm__topic_orders.txt	41	8	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:23:44	2020-01-13 18:23:44	2020-01-13 18:23:44	2020-01-13 18:23:45	0.3539147	235	\N	20200113182344.sav	143	143_train_cm__topic_return procedure.txt	return procedure	1	1	1	0.3265306	143_test_cm__topic_return procedure.txt	12	4	\N
Bernoulli NB	\N	5	3142	784	1	1	1	2020-01-14 18:41:30	2020-01-14 18:41:30	2020-01-14 18:41:30	2020-01-14 18:41:36	0.93029916	240	\N	20200114184130.sav	143	143_Bernoulli NB_train_cm__topic_services.txt	services	1	1	1	0.90816325	143_test_cm__topic_services.txt	458	119	\N
Logistic Regression	\N	5	3142	784	1	0.95348835	0.97619045	2020-01-14 18:50:34	2020-01-14 18:50:35	2020-01-14 18:50:35	2020-01-14 18:50:36	0.9487588	245	\N	20200114185035.sav	143	143_Logistic Regression_train_cm_.txt	None	1	0.75	0.85714287	0.73596936	143_test_cm_.txt	3142	784	\N
Linear SVC	\N	5	3142	784	1	1	1	2020-01-14 19:00:55	2020-01-14 19:00:57	2020-01-14 19:00:57	2020-01-14 19:00:58	0.98313177	250	\N	20200114190057.sav	144	144_Linear SVC_train_cm_.txt	None	0.9705882	0.8918919	0.92957747	0.74872446	144_Linear SVC_test_cm_.txt	3142	784	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255	\N	20200304123657.sav	144	\N	None	\N	\N	\N	\N	\N	\N	\N	\N
Google W2V Clustering	\N	5	3142	784	1	1	1	2020-03-04 12:52:42	2020-03-04 12:52:48	2020-03-04 12:52:48	2020-03-04 12:53:04	0.4433482	260	\N	20200304125248.sav	144	144_Google W2V Clustering_train_cm_.txt	None	0.8095238	0.9714286	0.8831169	0.39540815	144_Google W2V Clustering_test_cm_.txt	3142	784	Using GoogleWord2Vec SLIM model
Google W2V Clustering	\N	5	3377	843	1	1	1	2020-03-10 13:11:50	2020-03-10 13:11:51	2020-03-10 13:11:51	2020-03-10 13:12:01	0.37311223	265	\N	20200310131151.sav	158	158_Google W2V Clustering_train_cm_.txt	None	0.81395346	0.9722222	0.886076	0.37247923	158_Google W2V Clustering_test_cm_.txt	3377	843	\N
Logistic Regression	\N	5	18748	4686	1	0.6727273	0.8043478	2020-03-12 22:45:55	2020-03-12 22:47:19	2020-03-12 22:47:19	2020-03-12 22:47:45	0.7048752	269	\N	20200312224719.sav	172	172_Logistic Regression_train_cm_.txt	None	1	0.6666667	0.8	0.6419121	172_Logistic Regression_test_cm_.txt	18748	4686	\N
SGDC	\N	5	1452	362	1	1	1	2020-03-17 15:42:54	2020-03-17 15:42:55	2020-03-17 15:42:55	2020-03-17 15:42:59	0.99793386	276	\N	20200317154255.sav	213	213_SGDC_train_cm_.txt	None	0.925	0.8604651	0.8915663	0.7486188	213_SGDC_test_cm_.txt	1452	362	\N
SGDC	\N	5	1452	362	1	1	1	2020-03-18 14:35:31	2020-03-18 14:35:34	2020-03-18 14:35:34	2020-03-18 14:35:53	0.9972452	280	\N	20200318143534.sav	214	214_SGDC_train_cm_.txt	None	0.8974359	0.8333333	0.86419755	0.79281765	214_SGDC_test_cm_.txt	1452	362	\N
Logistic Regression	\N	5	1452	362	1	1	1	2020-03-18 15:04:43	2020-03-18 15:05:25	2020-03-18 15:05:26	2020-03-18 15:05:29	1	284	\N	20200318150525.sav	216	216_Logistic Regression_train_cm_.txt	None	1	0.85	0.9189189	0.8176796	216_Logistic Regression_test_cm_.txt	1452	362	\N
Linear SVC	\N	5	1452	362	1	1	1	2020-03-18 15:23:14	2020-03-18 15:23:31	2020-03-18 15:23:33	2020-03-18 15:23:36	0.99931127	288	\N	20200318152331.sav	217	217_Linear SVC_train_cm_.txt	None	1	0.75609756	0.8611111	0.7513812	217_Linear SVC_test_cm_.txt	1452	362	\N
SGDC	\N	5	1452	362	1	1	1	2020-03-18 15:51:48	2020-03-18 15:51:57	2020-03-18 15:52:00	2020-03-18 15:54:23	0.99931127	292	\N	20200318155157.sav	218	218_SGDC_train_cm_.txt	None	0.8947368	0.7906977	0.83950615	0.7679558	218_SGDC_test_cm_.txt	1452	362	\N
Logistic Regression	\N	5	1452	362	1	1	1	2020-03-18 16:28:20	2020-03-18 16:28:36	2020-03-18 16:28:36	2020-03-18 16:28:39	0.99931127	296	\N	20200318162836.sav	220	220_Logistic Regression_train_cm_.txt	None	0.9444444	0.85	0.8947368	0.7955801	220_Logistic Regression_test_cm_.txt	1452	362	\N
Logistic Regression	\N	5	1452	362	1	1	1	2020-03-18 16:55:20	2020-03-18 16:55:50	2020-03-18 16:55:51	2020-03-18 16:55:54	0.99931127	300	\N	20200318165550.sav	221	221_Logistic Regression_train_cm_.txt	None	1	0.8604651	0.925	0.8093923	221_Logistic Regression_test_cm_.txt	1452	362	\N
SGDC	\N	5	1452	362	1	1	1	2020-03-18 17:15:57	2020-03-18 17:16:07	2020-03-18 17:16:08	2020-03-18 17:17:41	0.9986226	304	\N	20200318171607.sav	222	222_SGDC_train_cm_.txt	None	0.94285715	0.80487806	0.8684211	0.78729284	222_SGDC_test_cm_.txt	1452	362	\N
Linear SVC	\N	5	1452	362	1	1	1	2020-03-18 18:09:18	2020-03-18 18:10:03	2020-03-18 18:10:07	2020-03-18 18:10:14	0.99931127	308	\N	20200318181003.sav	224	224_Linear SVC_train_cm_.txt	None	1	0.82051283	0.90140843	0.7845304	224_Linear SVC_test_cm_.txt	1452	362	\N
Linear SVC	\N	5	1444	360	1	1	1	2020-03-24 12:56:40	2020-03-24 12:56:43	2020-03-24 12:56:44	2020-03-24 12:56:45	1	313	\N	20200324125643.sav	227	227_Linear SVC_train_cm_.txt	None	1	0.77272725	0.8717949	0.78333336	227_Linear SVC_test_cm_.txt	1444	360	\N
SGDC	\N	5	1454	362	1	1	1	2020-03-24 13:09:05	2020-03-24 13:09:07	2020-03-24 13:09:07	2020-03-24 13:09:32	1	316	\N	20200324130907.sav	228	228_SGDC_train_cm_.txt	None	0.88095236	0.925	0.902439	0.7320442	228_SGDC_test_cm_.txt	1454	362	\N
Linear SVC	\N	5	1450	361	1	1	1	2020-03-24 13:19:58	2020-03-24 13:20:14	2020-03-24 13:20:15	2020-03-24 13:20:16	1	319	\N	20200324132014.sav	229	229_Linear SVC_train_cm_.txt	None	0.96875	0.7209302	0.82666665	0.76454294	229_Linear SVC_test_cm_.txt	1450	361	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	332	\N	20200501114105.sav	216	\N	None	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	334	\N	20200522125141.sav	233	\N	None	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:20:23	2020-01-13 18:20:23	2020-01-13 18:20:23	2020-01-13 18:20:24	0.16263527	181	\N	20200113182023.sav	143	143_train_cm__topic_change control .txt	change control 	0.5	1	0.6666667	0.16836734	143_test_cm__topic_change control .txt	5	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:20:45	2020-01-13 18:20:46	2020-01-13 18:20:46	2020-01-13 18:20:46	1	186	\N	20200113182046.sav	143	143_train_cm__topic_ipr.txt	ipr	1	1	1	1	143_test_cm__topic_ipr.txt	0	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:07	2020-01-13 18:21:07	2020-01-13 18:21:08	2020-01-13 18:21:08	0.10757479	191	\N	20200113182107.sav	143	143_train_cm__topic_consequences termination.txt	consequences termination	1	1	1	0.11096939	143_test_cm__topic_consequences termination.txt	2	1	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:26	2020-01-13 18:21:26	2020-01-13 18:21:26	2020-01-13 18:21:27	0.32304266	196	\N	20200113182126.sav	143	143_train_cm__topic_waiver.txt	waiver	0.5	1	0.6666667	0.33418366	143_test_cm__topic_waiver.txt	9	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:45	2020-01-13 18:21:45	2020-01-13 18:21:45	2020-01-13 18:21:45	1	201	\N	20200113182145.sav	143	143_train_cm__topic_conflict.txt	conflict	1	0.5	0.6666667	0.99872446	143_test_cm__topic_conflict.txt	0	1	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:03	2020-01-13 18:22:03	2020-01-13 18:22:03	2020-01-13 18:22:04	0.21419477	206	\N	20200113182203.sav	143	143_train_cm__topic_counterparts.txt	counterparts	1	1	1	0.22831632	143_test_cm__topic_counterparts.txt	5	2	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:21	2020-01-13 18:22:21	2020-01-13 18:22:21	2020-01-13 18:22:22	0.13717377	211	\N	20200113182221.sav	143	143_train_cm__topic_insurance.txt	insurance	0.5	1	0.6666667	0.1632653	143_test_cm__topic_insurance.txt	3	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:38	2020-01-13 18:22:38	2020-01-13 18:22:38	2020-01-13 18:22:39	1	216	\N	20200113182238.sav	143	143_train_cm__topic_testing pre-delivery.txt	testing pre-delivery	1	1	1	1	143_test_cm__topic_testing pre-delivery.txt	0	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:56	2020-01-13 18:22:56	2020-01-13 18:22:56	2020-01-13 18:22:57	0.5884787	221	\N	20200113182256.sav	143	143_train_cm__topic_support.txt	support	1	1	1	0.622449	143_test_cm__topic_support.txt	46	6	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:23:13	2020-01-13 18:23:14	2020-01-13 18:23:14	2020-01-13 18:23:15	0.11521324	226	\N	20200113182314.sav	143	143_train_cm__topic_insurance.txt	insurance	1	1	1	0.12244898	143_test_cm__topic_insurance.txt	2	1	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:23:30	2020-01-13 18:23:31	2020-01-13 18:23:31	2020-01-13 18:23:32	1	231	\N	20200113182331.sav	143	143_train_cm__topic_quality packing.txt	quality packing	1	1	1	1	143_test_cm__topic_quality packing.txt	0	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:23:47	2020-01-13 18:23:47	2020-01-13 18:23:47	2020-01-13 18:23:48	1	236	\N	20200113182347.sav	143	143_train_cm__topic_title risk.txt	title risk	1	1	1	1	143_test_cm__topic_title risk.txt	0	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-14 18:43:11	2020-01-14 18:43:11	2020-01-14 18:43:11	2020-01-14 18:43:12	0.9487588	241	\N	20200114184311.sav	143	143_Simple Naive Bayes_train_cm__topic_services.txt	services	1	1	1	0.9132653	143_test_cm__topic_services.txt	447	130	\N
Logistic Regression	\N	5	3142	784	1	0.9767442	0.9882353	2020-01-14 18:54:13	2020-01-14 18:54:14	2020-01-14 18:54:14	2020-01-14 18:54:15	0.949077	246	\N	20200114185414.sav	143	143_Logistic Regression_train_cm_.txt	None	1	0.6944444	0.8196721	0.71938777	143_Logistic Regression_test_cm_.txt	3142	784	\N
Linear SVC	\N	5	3142	784	1	1	1	2020-01-14 19:01:26	2020-01-14 19:01:27	2020-01-14 19:01:27	2020-01-14 19:01:29	0.9856779	251	\N	20200114190127.sav	143	143_Linear SVC_train_cm_.txt	None	0.9375	0.9375	0.9375	0.7270408	143_Linear SVC_test_cm_.txt	3142	784	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256	\N	20200304123849.sav	144	\N	None	\N	\N	\N	\N	\N	\N	\N	\N
Google W2V Clustering	\N	5	3254	813	1	1	1	2020-03-04 13:42:24	2020-03-04 13:42:29	2020-03-04 13:42:29	2020-03-04 13:42:47	0.41641057	261	\N	20200304134229.sav	145	145_Google W2V Clustering_train_cm_.txt	None	0.7619048	1	0.8648649	0.37884378	145_Google W2V Clustering_test_cm_.txt	3254	813	Using GoogleWord2Vec SLIM model
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	266	\N	20200312222321.sav	171	\N	None	\N	\N	\N	\N	\N	\N	\N	\N
Logistic Regression	\N	5	18748	4686	1	1	1	2020-03-13 11:05:47	2020-03-13 11:07:02	2020-03-13 11:07:03	2020-03-13 11:07:11	0.9591423	270	\N	20200313110702.sav	183	183_Logistic Regression_train_cm_.txt	None	1	0.9056604	0.95049506	0.73132735	183_Logistic Regression_test_cm_.txt	18748	4686	\N
Logistic Regression	\N	5	10	1	1	1	1	2020-03-17 14:46:42	2020-03-17 14:46:42	2020-03-17 14:46:42	2020-03-17 14:46:42	1	273	\N	20200317144642.sav	211	211_Logistic Regression_train_cm_.txt	None	0	0	0	0	211_Logistic Regression_test_cm_.txt	10	1	\N
SVC	\N	5	1452	362	1	0.33333334	0.5	2020-03-17 15:44:22	2020-03-17 15:44:25	2020-03-17 15:44:26	2020-03-17 15:44:31	0.50068873	277	\N	20200317154425.sav	213	213_SVC_train_cm_.txt	None	1	0.35	0.5185185	0.4088398	213_SVC_test_cm_.txt	1452	362	\N
Logistic Regression	\N	5	1452	362	1	1	1	2020-03-18 14:52:09	2020-03-18 14:52:33	2020-03-18 14:52:34	2020-03-18 14:52:36	1	281	\N	20200318145233.sav	215	215_Logistic Regression_train_cm_.txt	None	1	0.8333333	0.90909094	0.8093923	215_Logistic Regression_test_cm_.txt	1452	362	\N
Linear SVC	\N	5	1452	362	1	1	1	2020-03-18 15:06:21	2020-03-18 15:06:30	2020-03-18 15:06:31	2020-03-18 15:06:34	1	285	\N	20200318150630.sav	216	216_Linear SVC_train_cm_.txt	None	1	0.84210527	0.9142857	0.80662984	216_Linear SVC_test_cm_.txt	1452	362	\N
SGDC	\N	5	1452	362	1	1	1	2020-03-18 15:29:55	2020-03-18 15:30:03	2020-03-18 15:30:05	2020-03-18 15:32:14	1	289	\N	20200318153003.sav	217	217_SGDC_train_cm_.txt	None	0.9230769	0.8780488	0.9	0.7596685	217_SGDC_test_cm_.txt	1452	362	\N
Logistic Regression	\N	5	1452	362	1	1	1	2020-03-18 16:16:00	2020-03-18 16:16:02	2020-03-18 16:16:02	2020-03-18 16:16:03	0.99931127	293	\N	20200318161602.sav	219	219_Logistic Regression_train_cm_.txt	None	1	0.74418604	0.85333335	0.7955801	219_Logistic Regression_test_cm_.txt	1452	362	\N
SGDC	\N	5	1452	362	1	1	1	2020-03-18 16:30:00	2020-03-18 16:30:02	2020-03-18 16:30:03	2020-03-18 16:30:20	0.9986226	297	\N	20200318163002.sav	220	220_SGDC_train_cm_.txt	None	0.94285715	0.78571427	0.85714287	0.75414366	220_SGDC_test_cm_.txt	1452	362	\N
SGDC	\N	5	1452	362	1	1	1	2020-03-18 16:56:22	2020-03-18 16:56:28	2020-03-18 16:56:29	2020-03-18 16:57:20	0.99931127	301	\N	20200318165628.sav	221	221_SGDC_train_cm_.txt	None	0.9677419	0.71428573	0.82191783	0.7486188	221_SGDC_test_cm_.txt	1452	362	\N
SGDC	\N	5	1452	362	1	1	1	2020-03-18 17:42:36	2020-03-18 17:42:49	2020-03-18 17:42:53	2020-03-18 17:46:04	0.99931127	305	\N	20200318174249.sav	223	223_SGDC_train_cm_.txt	None	0.9714286	0.7906977	0.8717949	0.79281765	223_SGDC_test_cm_.txt	1452	362	\N
Logistic Regression	\N	5	1452	362	1	1	1	2020-03-18 18:11:35	2020-03-18 18:13:41	2020-03-18 18:13:45	2020-03-18 18:13:51	0.99931127	309	\N	20200318181341.sav	224	224_Logistic Regression_train_cm_.txt	None	1	0.7804878	0.8767123	0.80662984	224_Logistic Regression_test_cm_.txt	1452	362	\N
Linear SVC	\N	5	18748	4686	1	1	1	2020-03-24 12:34:20	2020-03-24 12:34:29	2020-03-24 12:34:29	2020-03-24 12:34:35	0.9482078	311	\N	20200324123429.sav	225	225_Linear SVC_train_cm_.txt	None	0.9807692	0.9622642	0.9714286	0.70358515	225_Linear SVC_test_cm_.txt	18748	4686	\N
Logistic Regression	\N	5	1444	360	1	1	1	2020-03-24 12:58:18	2020-03-24 12:58:24	2020-03-24 12:58:24	2020-03-24 12:58:25	0.99930745	314	\N	20200324125824.sav	227	227_Logistic Regression_train_cm_.txt	None	1	0.7804878	0.8767123	0.7888889	227_Logistic Regression_test_cm_.txt	1444	360	\N
Logistic Regression	\N	5	1454	362	1	1	1	2020-03-24 13:10:00	2020-03-24 13:10:08	2020-03-24 13:10:09	2020-03-24 13:10:10	1	317	\N	20200324131008.sav	228	228_Logistic Regression_train_cm_.txt	None	1	0.80487806	0.8918919	0.7569061	228_Logistic Regression_test_cm_.txt	1454	362	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	354	\N		255	\N	None	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:20:27	2020-01-13 18:20:28	2020-01-13 18:20:28	2020-01-13 18:20:29	0.87905794	182	\N	20200113182028.sav	143	143_train_cm__topic_charges payments payment.txt	charges payments payment	1	1	1	0.87372446	143_test_cm__topic_charges payments payment.txt	277	68	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:20:49	2020-01-13 18:20:50	2020-01-13 18:20:50	2020-01-13 18:20:51	0.95416933	187	\N	20200113182050.sav	143	143_train_cm__topic_compliance laws policies law policy.txt	compliance laws policies law policy	1	1	1	0.97066325	143_test_cm__topic_compliance laws policies law policy.txt	68	24	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:11	2020-01-13 18:21:11	2020-01-13 18:21:11	2020-01-13 18:21:13	0.0932527	192	\N	20200113182111.sav	143	143_train_cm__topic_force majeure.txt	force majeure	0.5	1	0.6666667	0.10714286	143_test_cm__topic_force majeure.txt	2	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:29	2020-01-13 18:21:30	2020-01-13 18:21:30	2020-01-13 18:21:31	0.8640993	197	\N	20200113182130.sav	143	143_train_cm__topic_rights remedies.txt	rights remedies	1	1	1	0.8647959	143_test_cm__topic_rights remedies.txt	185	53	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:47	2020-01-13 18:21:48	2020-01-13 18:21:48	2020-01-13 18:21:49	0.14290261	202	\N	20200113182148.sav	143	143_train_cm__topic_no partnership agency.txt	no partnership agency	1	1	1	0.1619898	143_test_cm__topic_no partnership agency.txt	5	1	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:06	2020-01-13 18:22:06	2020-01-13 18:22:06	2020-01-13 18:22:07	1	207	\N	20200113182206.sav	143	143_train_cm__topic_adr.txt	adr	1	1	1	1	143_test_cm__topic_adr.txt	0	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:24	2020-01-13 18:22:24	2020-01-13 18:22:24	2020-01-13 18:22:25	0.7969446	212	\N	20200113182224.sav	143	143_train_cm__topic_licence grant images.txt	licence grant images	1	1	1	0.815051	143_test_cm__topic_licence grant images.txt	117	18	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:41	2020-01-13 18:22:42	2020-01-13 18:22:42	2020-01-13 18:22:42	1	217	\N	20200113182242.sav	143	143_train_cm__topic_acceptance.txt	acceptance	1	1	1	1	143_test_cm__topic_acceptance.txt	0	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:59	2020-01-13 18:23:00	2020-01-13 18:23:00	2020-01-13 18:23:01	0.13112667	222	\N	20200113182300.sav	143	143_train_cm__topic_training.txt	training	0.5	1	0.6666667	0.12372449	143_test_cm__topic_training.txt	3	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:23:17	2020-01-13 18:23:17	2020-01-13 18:23:18	2020-01-13 18:23:19	0.4299809	227	\N	20200113182317.sav	143	143_train_cm__topic_subscriptions.txt	subscriptions	1	1	1	0.42857143	143_test_cm__topic_subscriptions.txt	21	5	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:23:35	2020-01-13 18:23:35	2020-01-13 18:23:35	2020-01-13 18:23:36	0.43284532	232	\N	20200113182335.sav	143	143_train_cm__topic_delivery.txt	delivery	1	1	1	0.45408162	143_test_cm__topic_delivery.txt	15	6	\N
Multinomial NB	\N	5	3142	784	1	1	1	2020-01-14 18:36:27	2020-01-14 18:36:27	2020-01-14 18:36:27	2020-01-14 18:36:29	0.9363463	237	\N	20200114183627.sav	143	143_train_cm__topic_services.txt	services	1	1	1	0.9375	143_test_cm__topic_services.txt	474	103	\N
Logistic Regression	\N	5	3142	784	1	1	1	2020-01-14 18:45:32	2020-01-14 18:45:33	2020-01-14 18:45:33	2020-01-14 18:45:34	0.98122215	242	\N	20200114184533.sav	143	143_Logistic Regression_train_cm__topic_services.txt	services	1	1	1	0.95535713	143_test_cm__topic_services.txt	458	119	\N
SGDC	\N	5	3142	784	1	1	1	2020-01-14 18:57:35	2020-01-14 18:57:36	2020-01-14 18:57:36	2020-01-14 18:57:38	0.9726289	247	\N	20200114185736.sav	144	144_SGDC_train_cm_.txt	None	0.84210527	0.969697	0.90140843	0.7346939	144_SGDC_test_cm_.txt	3142	784	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257	\N	20200304124238.sav	144	\N	None	\N	\N	\N	\N	\N	\N	\N	\N
Google W2V Clustering	\N	5	3254	813	1	1	1	2020-03-04 13:52:24	2020-03-04 13:52:28	2020-03-04 13:52:28	2020-03-04 13:52:43	0.46588814	262	\N	20200304135228.sav	145	145_Google W2V Clustering_train_cm_.txt	None	0.8333333	1	0.90909094	0.4095941	145_Google W2V Clustering_test_cm_.txt	3254	813	Using GoogleW2V Full model
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	267	\N	20200312222623.sav	170	\N	None	\N	\N	\N	\N	\N	\N	\N	\N
SVC	\N	5	18748	4686	1	0.036363635	0.07017544	2020-03-13 11:08:33	2020-03-13 11:10:52	2020-03-13 11:10:53	2020-03-13 11:17:10	0.092649885	271	\N	20200313111052.sav	183	183_SVC_train_cm_.txt	None	1	0.036363635	0.07017544	0.097951345	183_SVC_test_cm_.txt	18748	4686	\N
Logistic Regression	\N	5	1452	362	1	1	1	2020-03-17 15:37:45	2020-03-17 15:37:49	2020-03-17 15:37:49	2020-03-17 15:37:51	1	274	\N	20200317153749.sav	213	213_Logistic Regression_train_cm_.txt	None	1	0.73913044	0.85	0.73480666	213_Logistic Regression_test_cm_.txt	1452	362	\N
Linear SVC	\N	5	1452	362	1	1	1	2020-03-18 14:30:15	2020-03-18 14:30:19	2020-03-18 14:30:19	2020-03-18 14:30:21	1	278	\N	20200318143019.sav	214	214_Linear SVC_train_cm_.txt	None	0.972973	0.8	0.8780488	0.7900553	214_Linear SVC_test_cm_.txt	1452	362	\N
Linear SVC	\N	5	1452	362	1	1	1	2020-03-18 14:53:33	2020-03-18 14:53:41	2020-03-18 14:53:42	2020-03-18 14:53:45	0.99931127	282	\N	20200318145341.sav	215	215_Linear SVC_train_cm_.txt	None	1	0.82051283	0.90140843	0.77348065	215_Linear SVC_test_cm_.txt	1452	362	\N
SGDC	\N	5	1452	362	1	1	1	2020-03-18 15:08:01	2020-03-18 15:08:07	2020-03-18 15:08:08	2020-03-18 15:09:30	0.9986226	286	\N	20200318150807.sav	216	216_SGDC_train_cm_.txt	None	0.974359	0.95	0.96202534	0.7430939	216_SGDC_test_cm_.txt	1452	362	\N
Logistic Regression	\N	5	1452	362	1	1	1	2020-03-18 15:47:39	2020-03-18 15:48:55	2020-03-18 15:48:57	2020-03-18 15:49:01	1	290	\N	20200318154855.sav	218	218_Logistic Regression_train_cm_.txt	None	0.96875	0.7380952	0.8378378	0.7762431	218_Logistic Regression_test_cm_.txt	1452	362	\N
Linear SVC	\N	5	1452	362	1	1	1	2020-03-18 16:17:19	2020-03-18 16:17:20	2020-03-18 16:17:20	2020-03-18 16:17:21	0.99931127	294	\N	20200318161720.sav	219	219_Linear SVC_train_cm_.txt	None	0.9722222	0.8333333	0.8974359	0.73480666	219_Linear SVC_test_cm_.txt	1452	362	\N
Linear SVC	\N	5	1452	362	1	1	1	2020-03-18 16:31:33	2020-03-18 16:31:38	2020-03-18 16:31:38	2020-03-18 16:31:40	1	298	\N	20200318163138.sav	220	220_Linear SVC_train_cm_.txt	None	0.9714286	0.8947368	0.9315069	0.79281765	220_Linear SVC_test_cm_.txt	1452	362	\N
Logistic Regression	\N	5	1452	362	1	1	1	2020-03-18 17:13:27	2020-03-18 17:14:29	2020-03-18 17:14:31	2020-03-18 17:14:35	0.99931127	302	\N	20200318171429.sav	222	222_Logistic Regression_train_cm_.txt	None	1	0.78571427	0.88	0.80110496	222_Logistic Regression_test_cm_.txt	1452	362	\N
Logistic Regression	\N	5	1452	362	1	1	1	2020-03-18 17:47:05	2020-03-18 17:49:08	2020-03-18 17:49:11	2020-03-18 17:49:18	0.99931127	306	\N	20200318174908.sav	223	223_Logistic Regression_train_cm_.txt	None	1	0.8095238	0.8947368	0.78176796	223_Logistic Regression_test_cm_.txt	1452	362	\N
SGDC	\N	5	1452	362	1	1	1	2020-03-18 18:14:56	2020-03-18 18:15:13	2020-03-18 18:15:16	2020-03-18 18:18:05	1	310	\N	20200318181513.sav	224	224_SGDC_train_cm_.txt	None	0.9444444	0.8292683	0.8831169	0.77348065	224_SGDC_test_cm_.txt	1452	362	\N
Logistic Regression	\N	5	18748	4686	1	0.9818182	0.9908257	2020-03-24 12:35:45	2020-03-24 12:35:59	2020-03-24 12:36:00	2020-03-24 12:36:06	0.8893215	312	\N	20200324123559.sav	225	225_Logistic Regression_train_cm_.txt	None	1	0.8727273	0.93203884	0.70209134	225_Logistic Regression_test_cm_.txt	18748	4686	\N
SGDC	\N	5	1444	360	1	1	1	2020-03-24 12:59:36	2020-03-24 12:59:38	2020-03-24 12:59:38	2020-03-24 12:59:50	0.99861497	315	\N	20200324125938.sav	227	227_SGDC_train_cm_.txt	None	0.8604651	0.88095236	0.87058824	0.7361111	227_SGDC_test_cm_.txt	1444	360	\N
Linear SVC	\N	5	1454	362	1	1	1	2020-03-24 13:10:54	2020-03-24 13:11:01	2020-03-24 13:11:02	2020-03-24 13:11:03	1	318	\N	20200324131101.sav	228	228_Linear SVC_train_cm_.txt	None	0.9714286	0.8095238	0.8831169	0.7569061	228_Linear SVC_test_cm_.txt	1454	362	\N
SGDC	\N	5	1450	361	1	1	1	2020-03-24 13:20:59	2020-03-24 13:21:02	2020-03-24 13:21:02	2020-03-24 13:21:35	1	320	\N	20200324132102.sav	229	229_SGDC_train_cm_.txt	None	0.9318182	0.8913044	0.9111111	0.7174515	229_SGDC_test_cm_.txt	1450	361	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:20:33	2020-01-13 18:20:33	2020-01-13 18:20:34	2020-01-13 18:20:35	0.337683	183	\N	20200113182033.sav	143	143_train_cm__topic_prices.txt	prices	1	1	1	0.32780612	143_test_cm__topic_prices.txt	8	2	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:20:55	2020-01-13 18:20:56	2020-01-13 18:20:56	2020-01-13 18:20:57	0.6954169	188	\N	20200113182056.sav	143	143_train_cm__topic_data protection.txt	data protection	1	1	1	0.68622446	143_test_cm__topic_data protection.txt	32	9	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:16	2020-01-13 18:21:16	2020-01-13 18:21:16	2020-01-13 18:21:17	1	193	\N	20200113182116.sav	143	143_train_cm__topic_costs.txt	costs	1	1	1	1	143_test_cm__topic_costs.txt	0	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:34	2020-01-13 18:21:35	2020-01-13 18:21:35	2020-01-13 18:21:36	1	198	\N	20200113182135.sav	143	143_train_cm__topic_further assurance.txt	further assurance	1	1	1	1	143_test_cm__topic_further assurance.txt	0	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:21:51	2020-01-13 18:21:52	2020-01-13 18:21:52	2020-01-13 18:21:54	0.86632717	203	\N	20200113182152.sav	143	143_train_cm__topic_third party rights.txt	third party rights	1	1	1	0.89158165	143_test_cm__topic_third party rights.txt	78	16	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:08	2020-01-13 18:22:09	2020-01-13 18:22:09	2020-01-13 18:22:09	1	208	\N	20200113182209.sav	143	143_train_cm__topic_expert determination.txt	expert determination	1	1	1	1	143_test_cm__topic_expert determination.txt	0	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:27	2020-01-13 18:22:27	2020-01-13 18:22:27	2020-01-13 18:22:28	0.1085296	213	\N	20200113182227.sav	143	143_train_cm__topic_scope.txt	scope	0.5	1	0.6666667	0.096938774	143_test_cm__topic_scope.txt	4	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:22:44	2020-01-13 18:22:44	2020-01-13 18:22:44	2020-01-13 18:22:45	0.8227244	218	\N	20200113182244.sav	143	143_train_cm__topic_ownership.txt	ownership	1	1	1	0.87372446	143_test_cm__topic_ownership.txt	62	11	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:23:03	2020-01-13 18:23:03	2020-01-13 18:23:03	2020-01-13 18:23:04	1	223	\N	20200113182303.sav	143	143_train_cm__topic_personnel.txt	personnel	1	1	1	1	143_test_cm__topic_personnel.txt	0	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:23:21	2020-01-13 18:23:21	2020-01-13 18:23:21	2020-01-13 18:23:22	0.96403563	228	\N	20200113182321.sav	143	143_train_cm__topic_supply.txt	supply	1	1	1	0.95790815	143_test_cm__topic_supply.txt	288	64	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:23:38	2020-01-13 18:23:39	2020-01-13 18:23:39	2020-01-13 18:23:39	1	233	\N	20200113182339.sav	143	143_train_cm__topic_acceptance.txt	acceptance	1	1	1	1	143_test_cm__topic_acceptance.txt	0	0	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	238	\N	20200114183824.sav	143	\N	services	\N	\N	\N	\N	\N	\N	\N	\N
Logistic Regression	\N	5	3142	784	1	1	1	2020-01-14 18:46:34	2020-01-14 18:46:34	2020-01-14 18:46:34	2020-01-14 18:46:35	0.9840866	243	\N	20200114184634.sav	144	144_Logistic Regression_train_cm__topic_services.txt	services	1	1	1	0.94515306	144_test_cm__topic_services.txt	460	117	\N
SVC	\N	5	3142	784	1	0.24390244	0.39215687	2020-01-14 18:59:01	2020-01-14 18:59:04	2020-01-14 18:59:05	2020-01-14 18:59:12	0.20623806	248	\N	20200114185904.sav	144	144_SVC_train_cm_.txt	None	1	0.24324325	0.39130434	0.17984694	144_SVC_test_cm_.txt	3142	784	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-02-19 11:59:04	2020-02-19 11:59:07	2020-02-19 11:59:08	2020-02-19 11:59:23	0.2778485	252	\N	20200219115907.sav	144	144_Simple Naive Bayes_train_cm_.txt	None	0.82857144	0.82857144	0.82857144	0.2257653	144_Simple Naive Bayes_test_cm_.txt	3142	784	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	253	\N	20200304122830.sav	144	\N	None	\N	\N	\N	\N	\N	\N	\N	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:20:00	2020-01-13 18:20:01	2020-01-13 18:20:01	2020-01-13 18:20:02	0.8596435	176	\N	20200113182001.sav	143	143_train_cm__topic_commencement duration.txt	commencement duration	1	1	1	0.87882656	143_test_cm__topic_commencement duration.txt	105	29	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:20:04	2020-01-13 18:20:04	2020-01-13 18:20:04	2020-01-13 18:20:05	1	177	\N	20200113182004.sav	143	143_train_cm__topic_tupe.txt	tupe	1	1	1	1	143_test_cm__topic_tupe.txt	0	0	\N
Simple Naive Bayes	\N	5	3142	784	1	1	1	2020-01-13 18:20:08	2020-01-13 18:20:08	2020-01-13 18:20:08	2020-01-13 18:20:10	0.7422024	178	\N	20200113182008.sav	143	143_train_cm__topic_supplier responsibilities.txt	supplier responsibilities	1	1	1	0.78188777	143_test_cm__topic_supplier responsibilities.txt	84	17	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258	\N	20200304124916.sav	144	\N	None	\N	\N	\N	\N	\N	\N	\N	\N
Google W2V Clustering	\N	5	3142	784	1	1	1	2020-03-04 14:05:21	2020-03-04 14:05:25	2020-03-04 14:05:25	2020-03-04 14:05:39	0.46626353	263	\N	20200304140525.sav	144	144_Google W2V Clustering_train_cm_.txt	None	0.85714287	1	0.9230769	0.42729592	144_Google W2V Clustering_test_cm_.txt	3142	784	\N
Google W2V Clustering	\N	5	3142	784	1	1	1	2020-03-10 13:04:24	2020-03-10 13:04:29	2020-03-10 13:04:29	2020-03-10 13:04:44	0.28866965	264	\N	20200310130429.sav	144	144_Google W2V Clustering_train_cm_.txt	None	0.775	0.9117647	0.8378378	0.23214285	144_Google W2V Clustering_test_cm_.txt	3142	784	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	268	\N	20200312222740.sav	170	\N	None	\N	\N	\N	\N	\N	\N	\N	\N
Linear SVC	\N	5	18748	4686	1	1	1	2020-03-13 11:18:48	2020-03-13 11:19:25	2020-03-13 11:19:26	2020-03-13 11:19:34	0.9702902	272	\N	20200313111925.sav	183	183_Linear SVC_train_cm_.txt	None	1	0.962963	0.9811321	0.7140418	183_Linear SVC_test_cm_.txt	18748	4686	\N
Linear SVC	\N	5	1452	362	1	1	1	2020-03-17 15:40:33	2020-03-17 15:40:35	2020-03-17 15:40:35	2020-03-17 15:40:37	0.99931127	275	\N	20200317154035.sav	213	213_Linear SVC_train_cm_.txt	None	1	0.7619048	0.8648649	0.77348065	213_Linear SVC_test_cm_.txt	1452	362	\N
Logistic Regression	\N	5	1452	362	1	1	1	2020-03-18 14:33:52	2020-03-18 14:34:05	2020-03-18 14:34:06	2020-03-18 14:34:07	1	279	\N	20200318143405.sav	214	214_Logistic Regression_train_cm_.txt	None	1	0.82051283	0.90140843	0.76519334	214_Logistic Regression_test_cm_.txt	1452	362	\N
SGDC	\N	5	1452	362	1	1	1	2020-03-18 14:54:25	2020-03-18 14:54:30	2020-03-18 14:54:31	2020-03-18 14:55:30	0.99931127	283	\N	20200318145430.sav	215	215_SGDC_train_cm_.txt	None	0.8918919	0.84615386	0.8684211	0.77348065	215_SGDC_test_cm_.txt	1452	362	\N
Logistic Regression	\N	5	1452	362	1	1	1	2020-03-18 15:20:36	2020-03-18 15:21:28	2020-03-18 15:21:30	2020-03-18 15:21:33	1	287	\N	20200318152128.sav	217	217_Logistic Regression_train_cm_.txt	None	0.9677419	0.8108108	0.88235295	0.7900553	217_Logistic Regression_test_cm_.txt	1452	362	\N
Linear SVC	\N	5	1452	362	1	1	1	2020-03-18 15:49:32	2020-03-18 15:49:48	2020-03-18 15:49:51	2020-03-18 15:49:54	0.99931127	291	\N	20200318154948.sav	218	218_Linear SVC_train_cm_.txt	None	0.9714286	0.8292683	0.8947368	0.73756903	218_Linear SVC_test_cm_.txt	1452	362	\N
SGDC	\N	5	1452	362	1	0.98039216	0.990099	2020-03-18 16:17:51	2020-03-18 16:17:51	2020-03-18 16:17:51	2020-03-18 16:17:54	0.9511019	295	\N	20200318161751.sav	219	219_SGDC_train_cm_.txt	None	0.90625	0.7837838	0.8405797	0.7154696	219_SGDC_test_cm_.txt	1452	362	\N
Linear SVC	\N	5	1452	362	1	1	1	2020-03-18 16:54:27	2020-03-18 16:54:37	2020-03-18 16:54:38	2020-03-18 16:54:41	1	299	\N	20200318165437.sav	221	221_Linear SVC_train_cm_.txt	None	0.9722222	0.8333333	0.8974359	0.78176796	221_Linear SVC_test_cm_.txt	1452	362	\N
Linear SVC	\N	5	1452	362	1	1	1	2020-03-18 17:15:08	2020-03-18 17:15:24	2020-03-18 17:15:26	2020-03-18 17:15:29	1	303	\N	20200318171524.sav	222	222_Linear SVC_train_cm_.txt	None	1	0.9268293	0.96202534	0.78729284	222_Linear SVC_test_cm_.txt	1452	362	\N
Linear SVC	\N	5	1452	362	1	1	1	2020-03-18 17:54:31	2020-03-18 17:55:06	2020-03-18 17:55:09	2020-03-18 17:55:16	0.99931127	307	\N	20200318175506.sav	223	223_Linear SVC_train_cm_.txt	None	1	0.7906977	0.8831169	0.77348065	223_Linear SVC_test_cm_.txt	1452	362	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	333	\N	20200501120011.sav	216	\N	None	\N	\N	\N	\N	\N	\N	\N	\N
Logistic Regression	\N	5	1450	361	1	1	1	2020-03-24 13:27:53	2020-03-24 13:28:02	2020-03-24 13:28:03	2020-03-24 13:28:04	1	321	\N	20200324132802.sav	229	229_Logistic Regression_train_cm_.txt	None	1	0.775	0.87323946	0.7922438	229_Logistic Regression_test_cm_.txt	1450	361	\N
Logistic Regression	\N	5	1450	361	1	1	1	2020-03-24 13:36:22	2020-03-24 13:36:34	2020-03-24 13:36:35	2020-03-24 13:36:36	1	322	\N	20200324133634.sav	230	230_Logistic Regression_train_cm_.txt	None	0.9722222	0.76086956	0.85365856	0.75069255	230_Logistic Regression_test_cm_.txt	1450	361	\N
Linear SVC	\N	5	1450	361	1	1	1	2020-03-24 13:37:25	2020-03-24 13:37:53	2020-03-24 13:37:54	2020-03-24 13:37:55	1	323	\N	20200324133753.sav	230	230_Linear SVC_train_cm_.txt	None	1	0.76744187	0.8684211	0.73130196	230_Linear SVC_test_cm_.txt	1450	361	\N
SGDC	\N	5	1450	361	1	1	1	2020-03-24 13:38:26	2020-03-24 13:38:28	2020-03-24 13:38:29	2020-03-24 13:39:06	1	324	\N	20200324133828.sav	230	230_SGDC_train_cm_.txt	None	0.8604651	0.8604651	0.8604651	0.66759	230_SGDC_test_cm_.txt	1450	361	\N
SGDC	\N	5	1447	361	1	1	1	2020-03-24 13:46:44	2020-03-24 13:46:47	2020-03-24 13:46:48	2020-03-24 13:47:32	1	325	\N	20200324134647.sav	231	231_SGDC_train_cm_.txt	None	0.82051283	0.8	0.8101266	0.6980609	231_SGDC_test_cm_.txt	1447	361	\N
Linear SVC	\N	5	1447	361	1	1	1	2020-03-24 13:48:00	2020-03-24 13:48:42	2020-03-24 13:48:43	2020-03-24 13:48:44	1	326	\N	20200324134842.sav	231	231_Linear SVC_train_cm_.txt	None	0.9411765	0.8648649	0.90140843	0.700831	231_Linear SVC_test_cm_.txt	1447	361	\N
Logistic Regression	\N	5	1447	361	1	1	1	2020-03-24 13:55:38	2020-03-24 13:55:49	2020-03-24 13:55:50	2020-03-24 13:55:52	1	327	\N	20200324135549.sav	231	231_Logistic Regression_train_cm_.txt	None	1	0.85	0.9189189	0.66759	231_Logistic Regression_test_cm_.txt	1447	361	\N
Logistic Regression	\N	5	18748	4686	1	1	1	2020-03-24 13:59:13	2020-03-24 13:59:37	2020-03-24 13:59:37	2020-03-24 13:59:44	0.89012164	328	\N	20200324135937.sav	225	225_Logistic Regression_train_cm_.txt	None	1	0.9245283	0.9607843	0.7078532	225_Logistic Regression_test_cm_.txt	18748	4686	\N
Logistic Regression	\N	5	18768	4691	1	1	1	2020-03-24 14:46:26	2020-03-24 14:50:01	2020-03-24 14:50:05	2020-03-24 14:50:16	0.96717817	329	\N	20200324145001.sav	232	232_Logistic Regression_train_cm_.txt	None	1	0.8545455	0.92156863	0.73609036	232_Logistic Regression_test_cm_.txt	18768	4691	\N
Linear SVC	\N	5	18768	4691	1	1	1	2020-03-24 15:14:42	2020-03-24 15:18:15	2020-03-24 15:18:19	2020-03-24 15:18:34	0.97437125	330	\N	20200324151815.sav	232	232_Linear SVC_train_cm_.txt	None	1	0.962963	0.9811321	0.7154125	232_Linear SVC_test_cm_.txt	18768	4691	\N
SGDC	\N	5	18768	4691	1	1	1	2020-03-24 16:45:47	2020-03-24 16:46:07	2020-03-24 16:46:09	2020-03-24 17:12:16	0.95550936	331	\N	20200324164607.sav	232	232_SGDC_train_cm_.txt	None	1	1	1	0.70496696	232_SGDC_test_cm_.txt	18768	4691	\N
Logistic Regression	\N	5	16382	4095	1	0.92727274	0.9622642	2020-05-22 12:54:33	2020-05-22 12:54:38	2020-05-22 12:54:38	2020-05-22 12:54:42	0.62440485	335	\N	20200522125438.sav	233	233_Logistic Regression_train_cm_.txt	None	1	0.7777778	0.875	0.5443224	233_Logistic Regression_test_cm_.txt	16382	4095	\N
Logistic Regression	\N	5	1434	357	1	0.96	0.97959185	2020-05-26 09:39:26	2020-05-26 09:39:26	2020-05-26 09:39:26	2020-05-26 09:39:27	0.9776848	336	\N	20200526093926.sav	234	234_Logistic Regression_train_cm_.txt	None	1	0.7380952	0.84931505	0.70308125	234_Logistic Regression_test_cm_.txt	1434	357	\N
Logistic Regression	\N	5	1462	365	1	1	1	2020-05-26 10:43:36	2020-05-26 10:43:38	2020-05-26 10:43:38	2020-05-26 10:43:39	0.99658	337	\N	20200526104338.sav	235	235_Logistic Regression_train_cm_.txt	None	0.974359	0.9047619	0.9382716	0.7506849	235_Logistic Regression_test_cm_.txt	1462	365	\N
Logistic Regression	\N	5	1306	325	1	0.9574468	0.9782609	2020-05-26 11:19:21	2020-05-26 11:19:21	2020-05-26 11:19:21	2020-05-26 11:19:22	0.9525268	338	\N	20200526111921.sav	236	236_Logistic Regression_train_cm_.txt	None	1	0.8378378	0.9117647	0.6830769	236_Logistic Regression_test_cm_.txt	1306	325	\N
Logistic Regression	\N	5	890	222	1	0.62222224	0.7671233	2020-05-26 11:48:48	2020-05-26 11:48:48	2020-05-26 11:48:48	2020-05-26 11:48:49	0.74269664	339	\N	20200526114848.sav	238	238_Logistic Regression_train_cm_.txt	None	0.95	0.4871795	0.6440678	0.5315315	238_Logistic Regression_test_cm_.txt	890	222	\N
Logistic Regression	\N	5	1435	358	1	1	1	2020-05-26 12:26:19	2020-05-26 12:27:00	2020-05-26 12:27:02	2020-05-26 12:27:05	0.99930316	340	\N	20200526122700.sav	240	240_Logistic Regression_train_cm_.txt	None	0.969697	0.84210527	0.90140843	0.82402235	240_Logistic Regression_test_cm_.txt	1435	358	\N
Logistic Regression	\N	5	1452	362	1	1	1	2020-05-29 11:41:49	2020-05-29 11:41:51	2020-05-29 11:41:51	2020-05-29 11:41:52	0.99793386	341	\N	20200529114151.sav	241	241_Logistic Regression_train_cm_.txt	None	0.9722222	0.8333333	0.8974359	0.73756903	241_Logistic Regression_test_cm_.txt	1452	362	\N
Logistic Regression	\N	5	1463	365	1	1	1	2020-05-29 12:00:30	2020-05-29 12:00:31	2020-05-29 12:00:32	2020-05-29 12:00:33	0.9972659	342	\N	20200529120031.sav	242	242_Logistic Regression_train_cm_.txt	None	0.94285715	0.8684211	0.9041096	0.7890411	242_Logistic Regression_test_cm_.txt	1463	365	\N
Logistic Regression	\N	5	1452	362	1	1	1	2020-05-29 12:19:57	2020-05-29 12:19:59	2020-05-29 12:19:59	2020-05-29 12:20:00	0.99655646	343	\N	20200529121959.sav	243	243_Logistic Regression_train_cm_.txt	None	0.969697	0.7804878	0.8648649	0.78729284	243_Logistic Regression_test_cm_.txt	1452	362	\N
Logistic Regression	\N	5	1446	361	1	1	1	2020-05-29 12:35:46	2020-05-29 12:35:47	2020-05-29 12:35:47	2020-05-29 12:35:48	0.9930844	344	\N	20200529123547.sav	244	244_Logistic Regression_train_cm_.txt	None	0.9714286	0.8095238	0.8831169	0.76454294	244_Logistic Regression_test_cm_.txt	1446	361	\N
Logistic Regression	\N	5	1434	357	1	1	1	2020-05-29 12:51:53	2020-05-29 12:51:54	2020-05-29 12:51:54	2020-05-29 12:51:54	0.9839609	345	\N	20200529125154.sav	245	245_Logistic Regression_train_cm_.txt	None	0.96875	0.775	0.8611111	0.74509805	245_Logistic Regression_test_cm_.txt	1434	357	\N
Logistic Regression	\N	5	14930	3731	1	0.962963	0.9811321	2020-06-16 12:37:26	2020-06-16 12:40:58	2020-06-16 12:40:58	2020-06-16 12:41:07	0.53523105	346	\N	20200616124058.sav	248	248_Logistic Regression_train_cm_.txt	None	0.9791667	0.8867925	0.9306931	0.456714	248_Logistic Regression_test_cm_.txt	14930	3731	\N
Logistic Regression	\N	5	1452	362	1	1	1	2020-06-23 13:03:18	2020-06-23 13:04:37	2020-06-23 13:04:40	2020-06-23 13:04:46	1	353	\N	20200623130437.sav	222	222_Logistic Regression_train_cm_.txt	None	1	0.725	0.8405797	0.7955801	222_Logistic Regression_test_cm_.txt	1452	362	None
Logistic Regression	\N	5	1420	354	1	1	1	2020-06-16 13:42:32	2020-06-16 13:42:45	2020-06-16 13:42:45	2020-06-16 13:42:46	0.94859153	347	\N	20200616134245.sav	249	249_Logistic Regression_train_cm_.txt	None	0.92105263	0.85365856	0.886076	0.519774	249_Logistic Regression_test_cm_.txt	1420	354	unigram, tune important word to 1000
Logistic Regression	\N	5	1420	354	1	1	1	2020-06-19 10:26:30	2020-06-19 10:26:32	2020-06-19 10:26:32	2020-06-19 10:26:33	0.99859154	348	\N	20200619102632.sav	250	250_Logistic Regression_train_cm_.txt	None	0.969697	0.82051283	0.8888889	0.78531075	250_Logistic Regression_test_cm_.txt	1420	354	unigram, without important word weight emphasis
Logistic Regression	\N	5	1420	354	1	1	1	2020-06-19 11:35:52	2020-06-19 11:35:55	2020-06-19 11:35:55	2020-06-19 11:35:56	0.9992958	349	\N	20200619113555.sav	251	251_Logistic Regression_train_cm_.txt	None	1	0.8333333	0.90909094	0.79096043	251_Logistic Regression_test_cm_.txt	1420	354	unigram, tune important word weight coef to 3
Logistic Regression	\N	5	1452	362	1	1	1	2020-06-23 12:58:27	2020-06-23 12:59:12	2020-06-23 12:59:14	2020-06-23 12:59:18	1	352	\N	20200623125912.sav	222	222_Logistic Regression_train_cm_.txt	None	0.9705882	0.80487806	0.88	0.78729284	222_Logistic Regression_test_cm_.txt	1452	362	None
Logistic Regression	\N	5	491	122	1	1	1	2020-06-19 12:23:45	2020-06-19 12:23:46	2020-06-19 12:23:46	2020-06-19 12:23:47	1	350	\N	20200619122346.sav	254	254_Logistic Regression_train_cm_.txt	None	0.90909094	0.8695652	0.8888889	0.77868855	254_Logistic Regression_test_cm_.txt	491	122	4-gram mixed, tuned important word weigth to 3
Logistic Regression	\N	5	3150	787	1	1	1	2020-06-23 12:49:03	2020-06-23 12:49:52	2020-06-23 12:49:54	2020-06-23 12:49:57	0.9987302	351	\N	20200623124952.sav	255	255_Logistic Regression_train_cm_.txt	None	0.97619045	0.8541667	0.9111111	0.85641676	255_Logistic Regression_test_cm_.txt	3150	787	error corrected 4-gram mixed, tuned important word weigth to 3
Logistic Regression	\N	5	3150	788	1	1	1	2020-06-26 11:20:04	2020-06-26 11:20:04	2020-06-26 11:20:04	2020-06-26 11:20:04	0.9984112	355	\N		255	\N	None	0.9767442	0.85714287	0.9130435	0.8462516	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	1	1	2020-06-30 18:59:10	2020-06-30 18:59:10	2020-06-30 18:59:10	2020-06-30 18:59:10	0.66507787	356	\N		258	\N	None	0.9183673	0.9	0.90909094	0.55908513	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-06-30 18:59:34	2020-06-30 18:59:34	2020-06-30 18:59:34	2020-06-30 18:59:34	0.99682236	357	\N		258	\N	None	0.95555556	0.9347826	0.94505495	0.794155	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-06-30 19:00:12	2020-06-30 19:00:12	2020-06-30 19:00:12	2020-06-30 19:00:12	0.99872893	358	\N		258	\N	None	0.97619045	0.8367347	0.9010989	0.8132147	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9622642	0.9807692	2020-06-30 19:00:42	2020-06-30 19:00:42	2020-06-30 19:00:42	2020-06-30 19:00:42	0.96663487	359	\N		258	\N	None	0.93877554	0.9019608	0.92	0.7827192	\N	3147	787	None
SVC	\N	5	3150	788	1	0.6666667	0.8	2020-06-30 19:01:34	2020-06-30 19:01:34	2020-06-30 19:01:34	2020-06-30 19:01:34	0.7553225	360	\N		258	\N	None	1	0.62	0.7654321	0.703939	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	1	1	2020-06-30 19:32:02	2020-06-30 19:32:02	2020-06-30 19:32:02	2020-06-30 19:32:02	0.35462344	361	\N		259	\N	None	0.95555556	0.86	0.9052632	0.33163914	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-06-30 19:32:29	2020-06-30 19:32:29	2020-06-30 19:32:29	2020-06-30 19:32:29	0.9980934	362	\N		259	\N	None	0.9318182	0.87234044	0.9010989	0.84498096	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-06-30 19:33:15	2020-06-30 19:33:15	2020-06-30 19:33:15	2020-06-30 19:33:15	0.99872893	363	\N		259	\N	None	0.97727275	0.86	0.9148936	0.85387546	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9814815	0.99065423	2020-06-30 19:34:11	2020-06-30 19:34:11	2020-06-30 19:34:11	2020-06-30 19:34:11	0.9901493	364	\N		259	\N	None	0.9787234	0.92	0.9484536	0.8017789	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2037037	0.33846155	2020-06-30 19:35:09	2020-06-30 19:35:09	2020-06-30 19:35:09	2020-06-30 19:35:09	0.28693995	365	\N		259	\N	None	1	0.22916667	0.37288135	0.27191868	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	1	1	2020-06-30 20:05:29	2020-06-30 20:05:29	2020-06-30 20:05:29	2020-06-30 20:05:29	0.36383858	366	\N		260	\N	None	0.8627451	0.9361702	0.8979592	0.32401526	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-06-30 20:05:52	2020-06-30 20:05:52	2020-06-30 20:05:52	2020-06-30 20:05:52	0.9984112	367	\N		260	\N	None	0.9591837	0.94	0.94949496	0.81194407	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-06-30 20:06:36	2020-06-30 20:06:36	2020-06-30 20:06:36	2020-06-30 20:06:36	0.9993645	368	\N		260	\N	None	0.9347826	0.8958333	0.9148936	0.8068615	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-06-30 20:07:45	2020-06-30 20:07:45	2020-06-30 20:07:45	2020-06-30 20:07:45	0.98856056	369	\N		260	\N	None	0.9111111	0.8913044	0.9010989	0.80304956	\N	3147	787	None
SVC	\N	5	3150	788	1	0.18518518	0.3125	2020-06-30 20:08:38	2020-06-30 20:08:38	2020-06-30 20:08:38	2020-06-30 20:08:38	0.23514459	370	\N		260	\N	None	1	0.1875	0.31578946	0.23506989	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	1	1	2020-06-30 20:36:04	2020-06-30 20:36:04	2020-06-30 20:36:04	2020-06-30 20:36:04	0.3463616	371	\N		261	\N	None	0.9375	0.9183673	0.92783505	0.36721727	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-06-30 20:36:28	2020-06-30 20:36:28	2020-06-30 20:36:28	2020-06-30 20:36:28	0.99872893	372	\N		261	\N	None	0.9361702	0.9166667	0.9263158	0.8106734	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-06-30 20:37:06	2020-06-30 20:37:06	2020-06-30 20:37:06	2020-06-30 20:37:06	0.99872893	373	\N		261	\N	None	1	0.87234044	0.9318182	0.8170267	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-06-30 20:38:13	2020-06-30 20:38:13	2020-06-30 20:38:13	2020-06-30 20:38:13	0.9936447	374	\N		261	\N	None	0.9375	0.9183673	0.92783505	0.79542565	\N	3147	787	None
SVC	\N	5	3150	788	1	0.18518518	0.3125	2020-06-30 20:39:01	2020-06-30 20:39:01	2020-06-30 20:39:01	2020-06-30 20:39:01	0.23991102	375	\N		261	\N	None	1	0.2173913	0.35714287	0.2566709	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	1	1	2020-06-30 21:04:42	2020-06-30 21:04:42	2020-06-30 21:04:42	2020-06-30 21:04:42	0.36320305	376	\N		262	\N	None	0.9591837	0.92156863	0.94	0.3468869	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-06-30 21:05:02	2020-06-30 21:05:02	2020-06-30 21:05:02	2020-06-30 21:05:02	0.99872893	377	\N		262	\N	None	0.9591837	0.94	0.94949496	0.8170267	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-06-30 21:05:46	2020-06-30 21:05:46	2020-06-30 21:05:46	2020-06-30 21:05:46	0.9984112	378	\N		262	\N	None	1	0.84313726	0.9148936	0.8144854	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-06-30 21:06:32	2020-06-30 21:06:32	2020-06-30 21:06:32	2020-06-30 21:06:32	0.9863362	379	\N		262	\N	None	0.92	0.93877554	0.9292929	0.78653115	\N	3147	787	None
SVC	\N	5	3150	788	1	0.35185185	0.5205479	2020-06-30 21:07:15	2020-06-30 21:07:15	2020-06-30 21:07:15	2020-06-30 21:07:15	0.45440102	380	\N		262	\N	None	1	0.35416666	0.52307695	0.44853875	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	1	1	2020-06-30 23:36:21	2020-06-30 23:36:21	2020-06-30 23:36:21	2020-06-30 23:36:21	0.34858596	381	\N		263	\N	None	0.9361702	0.8979592	0.9166667	0.3494282	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-06-30 23:36:45	2020-06-30 23:36:45	2020-06-30 23:36:45	2020-06-30 23:36:45	0.9977757	382	\N		263	\N	None	0.9787234	0.9019608	0.93877554	0.8144854	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-06-30 23:37:27	2020-06-30 23:37:27	2020-06-30 23:37:27	2020-06-30 23:37:27	0.9984112	383	\N		263	\N	None	0.9375	0.9183673	0.92783505	0.8043202	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-06-30 23:38:35	2020-06-30 23:38:35	2020-06-30 23:38:35	2020-06-30 23:38:35	0.9949158	384	\N		263	\N	None	0.9183673	0.9574468	0.9375	0.82592124	\N	3147	787	None
SVC	\N	5	3150	788	1	0.35185185	0.5205479	2020-06-30 23:39:19	2020-06-30 23:39:19	2020-06-30 23:39:19	2020-06-30 23:39:19	0.41404513	385	\N		263	\N	None	1	0.33333334	0.5	0.37102923	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	1	1	2020-07-01 00:05:19	2020-07-01 00:05:19	2020-07-01 00:05:19	2020-07-01 00:05:19	0.38703528	386	\N		264	\N	None	0.9375	0.9	0.9183673	0.3761118	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 00:05:42	2020-07-01 00:05:42	2020-07-01 00:05:42	2020-07-01 00:05:42	0.9977757	387	\N		264	\N	None	0.9574468	0.9183673	0.9375	0.80050826	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 00:06:20	2020-07-01 00:06:20	2020-07-01 00:06:20	2020-07-01 00:06:20	0.99872893	388	\N		264	\N	None	0.9782609	0.9	0.9375	0.8144854	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 00:07:23	2020-07-01 00:07:23	2020-07-01 00:07:23	2020-07-01 00:07:23	0.9780744	389	\N		264	\N	None	0.9148936	0.95555556	0.9347826	0.82846254	\N	3147	787	None
SVC	\N	5	3150	788	1	0.35185185	0.5205479	2020-07-01 00:08:10	2020-07-01 00:08:10	2020-07-01 00:08:10	2020-07-01 00:08:10	0.40864316	390	\N		264	\N	None	1	0.33333334	0.5	0.39771283	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	1	1	2020-07-01 00:37:14	2020-07-01 00:37:14	2020-07-01 00:37:14	2020-07-01 00:37:14	0.33809978	391	\N		265	\N	None	0.9148936	0.86	0.88659793	0.31003812	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 00:37:46	2020-07-01 00:37:46	2020-07-01 00:37:46	2020-07-01 00:37:46	0.99872893	392	\N		265	\N	None	0.9574468	0.88235295	0.9183673	0.8017789	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 00:38:35	2020-07-01 00:38:35	2020-07-01 00:38:35	2020-07-01 00:38:35	0.9990467	393	\N		265	\N	None	0.9777778	0.88	0.9263158	0.82337993	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 00:40:20	2020-07-01 00:40:20	2020-07-01 00:40:20	2020-07-01 00:40:20	0.9958691	394	\N		265	\N	None	0.9347826	0.8958333	0.9148936	0.79288435	\N	3147	787	None
SVC	\N	5	3150	788	1	0.16666667	0.2857143	2020-07-01 00:41:16	2020-07-01 00:41:16	2020-07-01 00:41:16	2020-07-01 00:41:16	0.171592	395	\N		265	\N	None	1	0.1875	0.31578946	0.16010165	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	0.9814815	0.99065423	2020-07-01 01:09:51	2020-07-01 01:09:51	2020-07-01 01:09:51	2020-07-01 01:09:51	0.264061	396	\N		266	\N	None	0.95348835	0.82	0.8817204	0.2515883	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 01:10:17	2020-07-01 01:10:17	2020-07-01 01:10:17	2020-07-01 01:10:17	0.9990467	397	\N		266	\N	None	0.9183673	0.9183673	0.9183673	0.82846254	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 01:11:04	2020-07-01 01:11:04	2020-07-01 01:11:04	2020-07-01 01:11:04	0.9980934	398	\N		266	\N	None	0.95555556	0.877551	0.9148936	0.8246506	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 01:12:32	2020-07-01 01:12:32	2020-07-01 01:12:32	2020-07-01 01:12:32	0.98919606	399	\N		266	\N	None	0.97727275	0.8269231	0.8958333	0.83227444	\N	3147	787	None
SVC	\N	5	3150	788	1	0.16666667	0.2857143	2020-07-01 01:13:27	2020-07-01 01:13:27	2020-07-01 01:13:27	2020-07-01 01:13:27	0.18875119	400	\N		266	\N	None	1	0.17307693	0.29508197	0.17026684	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	0.962963	0.9811321	2020-07-01 01:42:50	2020-07-01 01:42:50	2020-07-01 01:42:50	2020-07-01 01:42:50	0.26120114	401	\N		267	\N	None	0.8913044	0.8541667	0.87234044	0.24015248	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 01:43:16	2020-07-01 01:43:16	2020-07-01 01:43:16	2020-07-01 01:43:16	0.9990467	402	\N		267	\N	None	0.9787234	0.92	0.9484536	0.83227444	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 01:44:04	2020-07-01 01:44:04	2020-07-01 01:44:04	2020-07-01 01:44:04	0.9984112	403	\N		267	\N	None	1	0.82	0.9010989	0.8182973	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9814815	0.99065423	2020-07-01 01:45:45	2020-07-01 01:45:45	2020-07-01 01:45:45	2020-07-01 01:45:45	0.98856056	404	\N		267	\N	None	0.9756098	0.8333333	0.8988764	0.8094028	\N	3147	787	None
SVC	\N	5	3150	788	1	0.16666667	0.2857143	2020-07-01 01:46:38	2020-07-01 01:46:38	2020-07-01 01:46:38	2020-07-01 01:46:38	0.17794725	405	\N		267	\N	None	1	0.18	0.30508474	0.14612453	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	0.962963	0.9811321	2020-07-01 02:15:46	2020-07-01 02:15:46	2020-07-01 02:15:46	2020-07-01 02:15:46	0.25516364	406	\N		268	\N	None	0.9777778	0.88	0.9263158	0.26556543	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 02:16:12	2020-07-01 02:16:12	2020-07-01 02:16:12	2020-07-01 02:16:12	0.99872893	407	\N		268	\N	None	0.9574468	0.9183673	0.9375	0.8246506	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 02:17:09	2020-07-01 02:17:09	2020-07-01 02:17:09	2020-07-01 02:17:09	0.9980934	408	\N		268	\N	None	0.97619045	0.9111111	0.9425287	0.82846254	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 02:18:41	2020-07-01 02:18:41	2020-07-01 02:18:41	2020-07-01 02:18:41	0.99555135	409	\N		268	\N	None	0.8979592	0.9166667	0.9072165	0.82846254	\N	3147	787	None
SVC	\N	5	3150	788	1	0.3018868	0.46376812	2020-07-01 02:19:36	2020-07-01 02:19:36	2020-07-01 02:19:36	2020-07-01 02:19:36	0.3438195	410	\N		268	\N	None	1	0.25531915	0.40677965	0.3202033	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	0.962963	0.9811321	2020-07-01 02:48:09	2020-07-01 02:48:09	2020-07-01 02:48:09	2020-07-01 02:48:09	0.27073404	411	\N		269	\N	None	0.9	0.75	0.8181818	0.25031766	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 02:48:35	2020-07-01 02:48:35	2020-07-01 02:48:35	2020-07-01 02:48:35	0.9984112	412	\N		269	\N	None	0.95652175	0.88	0.9166667	0.8271919	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 02:49:27	2020-07-01 02:49:27	2020-07-01 02:49:27	2020-07-01 02:49:27	0.9990467	413	\N		269	\N	None	0.9767442	0.85714287	0.9130435	0.8068615	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 02:50:52	2020-07-01 02:50:52	2020-07-01 02:50:52	2020-07-01 02:50:52	0.99110264	414	\N		269	\N	None	0.9347826	0.8958333	0.9148936	0.8132147	\N	3147	787	None
SVC	\N	5	3150	788	1	0.25925925	0.4117647	2020-07-01 02:51:44	2020-07-01 02:51:44	2020-07-01 02:51:44	2020-07-01 02:51:44	0.33778203	415	\N		269	\N	None	1	0.25	0.4	0.3329098	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	0.962963	0.9811321	2020-07-01 03:20:50	2020-07-01 03:20:50	2020-07-01 03:20:50	2020-07-01 03:20:50	0.2570702	416	\N		270	\N	None	0.9166667	0.9166667	0.9166667	0.26048285	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 03:21:16	2020-07-01 03:21:16	2020-07-01 03:21:16	2020-07-01 03:21:16	0.99872893	417	\N		270	\N	None	0.9787234	0.9583333	0.96842104	0.8246506	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 03:22:44	2020-07-01 03:22:44	2020-07-01 03:22:44	2020-07-01 03:22:44	0.9993645	418	\N		270	\N	None	0.9361702	0.8979592	0.9166667	0.8271919	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 03:24:27	2020-07-01 03:24:27	2020-07-01 03:24:27	2020-07-01 03:24:27	0.99523354	419	\N		270	\N	None	0.95555556	0.9148936	0.9347826	0.8271919	\N	3147	787	None
SVC	\N	5	3150	788	1	0.24074075	0.3880597	2020-07-01 03:25:18	2020-07-01 03:25:18	2020-07-01 03:25:18	2020-07-01 03:25:18	0.33428663	420	\N		270	\N	None	1	0.22916667	0.37288135	0.28716645	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 03:52:49	2020-07-01 03:52:49	2020-07-01 03:52:49	2020-07-01 03:52:49	0.9990467	421	\N		271	\N	None	0.9574468	0.9	0.92783505	0.82337993	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 03:53:47	2020-07-01 03:53:47	2020-07-01 03:53:47	2020-07-01 03:53:47	0.99872893	422	\N		271	\N	None	1	0.8541667	0.92134833	0.84498096	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 03:55:58	2020-07-01 03:55:58	2020-07-01 03:55:58	2020-07-01 03:55:58	0.98983157	423	\N		271	\N	None	0.95454544	0.875	0.9130435	0.8068615	\N	3147	787	None
SVC	\N	5	3150	788	1	0.16981132	0.29032257	2020-07-01 03:57:01	2020-07-01 03:57:01	2020-07-01 03:57:01	2020-07-01 03:57:01	0.13822688	424	\N		271	\N	None	1	0.15686275	0.27118644	0.111817025	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 06:37:15	2020-07-01 06:37:15	2020-07-01 06:37:15	2020-07-01 06:37:15	0.9993645	425	\N		272	\N	None	0.9767442	0.85714287	0.9130435	0.8170267	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 06:38:23	2020-07-01 06:38:23	2020-07-01 06:38:23	2020-07-01 06:38:23	0.9993645	426	\N		272	\N	None	0.97619045	0.8541667	0.9111111	0.8437103	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 06:40:36	2020-07-01 06:40:36	2020-07-01 06:40:36	2020-07-01 06:40:36	0.99523354	427	\N		272	\N	None	1	0.86538464	0.92783505	0.82083863	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2037037	0.33846155	2020-07-01 06:41:40	2020-07-01 06:41:40	2020-07-01 06:41:40	2020-07-01 06:41:40	0.28948206	428	\N		272	\N	None	1	0.21568628	0.3548387	0.29224905	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	1	1	2020-07-01 07:03:16	2020-07-01 07:03:16	2020-07-01 07:03:16	2020-07-01 07:03:16	0.60946935	429	\N		273	\N	None	0.88	0.9166667	0.8979592	0.5069886	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 07:03:33	2020-07-01 07:03:33	2020-07-01 07:03:33	2020-07-01 07:03:33	0.9971401	430	\N		273	\N	None	0.9148936	0.9148936	0.9148936	0.78144854	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 07:03:59	2020-07-01 07:03:59	2020-07-01 07:03:59	2020-07-01 07:03:59	0.9984112	431	\N		273	\N	None	0.9574468	0.9183673	0.9375	0.8068615	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9814815	0.99065423	2020-07-01 07:04:19	2020-07-01 07:04:19	2020-07-01 07:04:19	2020-07-01 07:04:19	0.9761678	432	\N		273	\N	None	0.9583333	0.92	0.93877554	0.7662008	\N	3147	787	None
SVC	\N	5	3150	788	1	0.7222222	0.83870965	2020-07-01 07:04:51	2020-07-01 07:04:51	2020-07-01 07:04:51	2020-07-01 07:04:51	0.75754684	433	\N		273	\N	None	1	0.63265306	0.775	0.6632783	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	1	1	2020-07-01 07:29:58	2020-07-01 07:29:58	2020-07-01 07:29:58	2020-07-01 07:29:58	0.37813792	434	\N		274	\N	None	0.9318182	0.8541667	0.8913044	0.34180433	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 07:30:23	2020-07-01 07:30:23	2020-07-01 07:30:23	2020-07-01 07:30:23	0.9990467	435	\N		274	\N	None	1	0.92156863	0.9591837	0.82337993	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 07:31:02	2020-07-01 07:31:02	2020-07-01 07:31:02	2020-07-01 07:31:02	0.9984112	436	\N		274	\N	None	0.95238096	0.81632656	0.8791209	0.8271919	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 07:32:05	2020-07-01 07:32:05	2020-07-01 07:32:05	2020-07-01 07:32:05	0.9901493	437	\N		274	\N	None	1	0.8958333	0.94505495	0.8271919	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2037037	0.33846155	2020-07-01 07:32:56	2020-07-01 07:32:56	2020-07-01 07:32:56	2020-07-01 07:32:56	0.2599301	438	\N		274	\N	None	1	0.20408164	0.33898306	0.24396442	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	1	1	2020-07-01 07:59:10	2020-07-01 07:59:10	2020-07-01 07:59:10	2020-07-01 07:59:10	0.31871623	439	\N		275	\N	None	0.9347826	0.9148936	0.9247312	0.3329098	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 07:59:37	2020-07-01 07:59:37	2020-07-01 07:59:37	2020-07-01 07:59:37	0.9993645	440	\N		275	\N	None	0.9767442	0.89361703	0.93333334	0.82337993	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 08:00:23	2020-07-01 08:00:23	2020-07-01 08:00:23	2020-07-01 08:00:23	0.9993645	441	\N		275	\N	None	1	0.8039216	0.8913044	0.82083863	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 08:01:54	2020-07-01 08:01:54	2020-07-01 08:01:54	2020-07-01 08:01:54	0.99046713	442	\N		275	\N	None	1	0.8958333	0.94505495	0.8182973	\N	3147	787	None
SVC	\N	5	3150	788	1	0.16666667	0.2857143	2020-07-01 08:02:50	2020-07-01 08:02:50	2020-07-01 08:02:50	2020-07-01 08:02:50	0.17731172	443	\N		275	\N	None	1	0.16	0.27586207	0.16010165	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	1	1	2020-07-01 08:29:58	2020-07-01 08:29:58	2020-07-01 08:29:58	2020-07-01 08:29:58	0.30473468	444	\N		276	\N	None	0.94	0.94	0.94	0.28462517	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 08:30:31	2020-07-01 08:30:31	2020-07-01 08:30:31	2020-07-01 08:30:31	0.9990467	445	\N		276	\N	None	0.9777778	0.88	0.9263158	0.83481574	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 08:31:19	2020-07-01 08:31:19	2020-07-01 08:31:19	2020-07-01 08:31:19	0.99872893	446	\N		276	\N	None	1	0.9183673	0.9574468	0.84498096	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.962963	0.9811321	2020-07-01 08:32:59	2020-07-01 08:32:59	2020-07-01 08:32:59	2020-07-01 08:32:59	0.9748967	447	\N		276	\N	None	0.95555556	0.877551	0.9148936	0.8106734	\N	3147	787	None
SVC	\N	5	3150	788	1	0.16666667	0.2857143	2020-07-01 08:34:05	2020-07-01 08:34:05	2020-07-01 08:34:05	2020-07-01 08:34:05	0.15125516	448	\N		276	\N	None	1	0.16666667	0.2857143	0.124523506	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	1	1	2020-07-01 08:59:05	2020-07-01 08:59:05	2020-07-01 08:59:05	2020-07-01 08:59:05	0.33333334	449	\N		277	\N	None	0.97727275	0.86	0.9148936	0.29224905	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 08:59:38	2020-07-01 08:59:38	2020-07-01 08:59:38	2020-07-01 08:59:38	0.9984112	450	\N		277	\N	None	1	0.88	0.9361702	0.8221093	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 09:00:26	2020-07-01 09:00:26	2020-07-01 09:00:26	2020-07-01 09:00:26	0.9984112	451	\N		277	\N	None	0.95652175	0.9361702	0.94623655	0.8271919	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9814815	0.99065423	2020-07-01 09:01:27	2020-07-01 09:01:27	2020-07-01 09:01:27	2020-07-01 09:01:27	0.98474735	452	\N		277	\N	None	0.9782609	0.9574468	0.9677419	0.80050826	\N	3147	787	None
SVC	\N	5	3150	788	1	0.35185185	0.5205479	2020-07-01 09:02:21	2020-07-01 09:02:21	2020-07-01 09:02:21	2020-07-01 09:02:21	0.42739117	453	\N		277	\N	None	1	0.30612245	0.46875	0.4155019	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	0.9444444	0.9714286	2020-07-01 09:29:02	2020-07-01 09:29:02	2020-07-01 09:29:02	2020-07-01 09:29:02	0.25675246	454	\N		278	\N	None	0.95652175	0.8627451	0.9072165	0.27318934	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 09:29:33	2020-07-01 09:29:33	2020-07-01 09:29:33	2020-07-01 09:29:33	0.9984112	455	\N		278	\N	None	0.97727275	0.95555556	0.96629214	0.82337993	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 09:30:30	2020-07-01 09:30:30	2020-07-01 09:30:30	2020-07-01 09:30:30	0.9984112	456	\N		278	\N	None	0.95652175	0.8979592	0.9263158	0.8271919	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 09:32:05	2020-07-01 09:32:05	2020-07-01 09:32:05	2020-07-01 09:32:05	0.9907849	457	\N		278	\N	None	0.9375	0.9183673	0.92783505	0.78144854	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2777778	0.4347826	2020-07-01 09:32:57	2020-07-01 09:32:57	2020-07-01 09:32:57	2020-07-01 09:32:57	0.3403241	458	\N		278	\N	None	1	0.23913044	0.3859649	0.31257942	\N	3147	787	None
Simple Naive Bayes	\N	5	3150	788	1	0.962963	0.9811321	2020-07-01 10:00:12	2020-07-01 10:00:12	2020-07-01 10:00:12	2020-07-01 10:00:12	0.25198603	459	\N		279	\N	None	0.8913044	0.8541667	0.87234044	0.2782719	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 10:00:42	2020-07-01 10:00:42	2020-07-01 10:00:42	2020-07-01 10:00:42	0.99872893	460	\N		279	\N	None	0.95555556	0.877551	0.9148936	0.77890724	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 10:01:42	2020-07-01 10:01:42	2020-07-01 10:01:42	2020-07-01 10:01:42	0.9984112	461	\N		279	\N	None	1	0.88235295	0.9375	0.8297332	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 10:03:29	2020-07-01 10:03:29	2020-07-01 10:03:29	2020-07-01 10:03:29	0.9872895	462	\N		279	\N	None	0.95652175	0.8979592	0.9263158	0.78907245	\N	3147	787	None
SVC	\N	5	3150	788	1	0.22222222	0.36363637	2020-07-01 10:04:24	2020-07-01 10:04:24	2020-07-01 10:04:24	2020-07-01 10:04:24	0.32538927	463	\N		279	\N	None	1	0.21276596	0.3508772	0.31003812	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 12:44:49	2020-07-01 12:44:49	2020-07-01 12:44:49	2020-07-01 12:44:49	0.9993645	464	\N		280	\N	None	1	0.88235295	0.9375	0.80050826	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 12:45:49	2020-07-01 12:45:49	2020-07-01 12:45:49	2020-07-01 12:45:49	0.9990467	465	\N		280	\N	None	1	0.84313726	0.9148936	0.82337993	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 12:47:51	2020-07-01 12:47:51	2020-07-01 12:47:51	2020-07-01 12:47:51	0.99269146	466	\N		280	\N	None	0.9782609	0.86538464	0.9183673	0.79288435	\N	3147	787	None
SVC	\N	5	3150	788	1	0.16666667	0.2857143	2020-07-01 12:48:56	2020-07-01 12:48:56	2020-07-01 12:48:56	2020-07-01 12:48:56	0.18334922	467	\N		280	\N	None	1	0.1632653	0.28070176	0.1905972	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 13:16:58	2020-07-01 13:16:58	2020-07-01 13:16:58	2020-07-01 13:16:58	0.99872893	468	\N		281	\N	None	0.9782609	0.9375	0.9574468	0.841169	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 13:18:01	2020-07-01 13:18:01	2020-07-01 13:18:01	2020-07-01 13:18:01	0.9990467	469	\N		281	\N	None	1	0.84615386	0.9166667	0.8335451	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 13:20:26	2020-07-01 13:20:26	2020-07-01 13:20:26	2020-07-01 13:20:26	0.99872893	470	\N		281	\N	None	0.9130435	0.89361703	0.9032258	0.8144854	\N	3147	787	None
SVC	\N	5	3150	788	1	0.14814815	0.2580645	2020-07-01 13:21:50	2020-07-01 13:21:50	2020-07-01 13:21:50	2020-07-01 13:21:50	0.13091834	471	\N		281	\N	None	1	0.14285715	0.25	0.1296061	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 13:48:42	2020-07-01 13:48:42	2020-07-01 13:48:42	2020-07-01 13:48:42	0.99872893	472	\N		282	\N	None	0.97727275	0.84313726	0.9052632	0.8271919	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 13:50:05	2020-07-01 13:50:05	2020-07-01 13:50:05	2020-07-01 13:50:05	0.9993645	473	\N		282	\N	None	0.95238096	0.8333333	0.8888889	0.82846254	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9814815	0.99065423	2020-07-01 13:52:43	2020-07-01 13:52:43	2020-07-01 13:52:43	2020-07-01 13:52:43	0.9895138	474	\N		282	\N	None	0.9767442	0.85714287	0.9130435	0.8081322	\N	3147	787	None
SVC	\N	5	3150	788	1	0.12962963	0.22950819	2020-07-01 13:53:50	2020-07-01 13:53:50	2020-07-01 13:53:50	2020-07-01 13:53:50	0.107086115	475	\N		282	\N	None	1	0.06	0.11320755	0.08894536	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 14:43:51	2020-07-01 14:43:51	2020-07-01 14:43:51	2020-07-01 14:43:51	0.9990467	476	\N		283	\N	None	0.9361702	0.8979592	0.9166667	0.8360864	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 14:46:05	2020-07-01 14:46:05	2020-07-01 14:46:05	2020-07-01 14:46:05	1	477	\N		283	\N	None	0.9791667	0.92156863	0.94949496	0.83989835	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 14:49:46	2020-07-01 14:49:46	2020-07-01 14:49:46	2020-07-01 14:49:46	0.9936447	478	\N		283	\N	None	1	0.9183673	0.9574468	0.82337993	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2037037	0.33846155	2020-07-01 14:51:30	2020-07-01 14:51:30	2020-07-01 14:51:30	2020-07-01 14:51:30	0.29806164	479	\N		283	\N	None	1	0.2	0.33333334	0.2909784	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 15:41:50	2020-07-01 15:41:50	2020-07-01 15:41:50	2020-07-01 15:41:50	0.9990467	480	\N		284	\N	None	0.9347826	0.9347826	0.9347826	0.82846254	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 15:43:05	2020-07-01 15:43:05	2020-07-01 15:43:05	2020-07-01 15:43:05	0.99968225	481	\N		284	\N	None	0.9782609	0.86538464	0.9183673	0.8182973	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 15:45:43	2020-07-01 15:45:43	2020-07-01 15:45:43	2020-07-01 15:45:43	0.9974579	482	\N		284	\N	None	0.94	0.9791667	0.9591837	0.80050826	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2037037	0.33846155	2020-07-01 15:46:57	2020-07-01 15:46:57	2020-07-01 15:46:57	2020-07-01 15:46:57	0.2840801	483	\N		284	\N	None	1	0.25531915	0.40677965	0.29987293	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 16:17:50	2020-07-01 16:17:50	2020-07-01 16:17:50	2020-07-01 16:17:50	0.99872893	484	\N		285	\N	None	0.9375	0.9375	0.9375	0.80559087	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 16:19:41	2020-07-01 16:19:41	2020-07-01 16:19:41	2020-07-01 16:19:41	0.9993645	485	\N		285	\N	None	0.93333334	0.875	0.9032258	0.8487929	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 16:23:25	2020-07-01 16:23:25	2020-07-01 16:23:25	2020-07-01 16:23:25	0.99618685	486	\N		285	\N	None	0.9347826	0.8958333	0.9148936	0.8043202	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2037037	0.33846155	2020-07-01 16:24:47	2020-07-01 16:24:47	2020-07-01 16:24:47	2020-07-01 16:24:47	0.24626629	487	\N		285	\N	None	1	0.21276596	0.3508772	0.26302415	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 18:02:01	2020-07-01 18:02:01	2020-07-01 18:02:01	2020-07-01 18:02:01	0.99872893	488	\N		286	\N	None	0.9111111	0.87234044	0.8913044	0.84498096	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 18:03:41	2020-07-01 18:03:41	2020-07-01 18:03:41	2020-07-01 18:03:41	0.99872893	489	\N		286	\N	None	0.95348835	0.8541667	0.9010989	0.82846254	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 18:07:45	2020-07-01 18:07:45	2020-07-01 18:07:45	2020-07-01 18:07:45	0.9971401	490	\N		286	\N	None	0.95652175	0.88	0.9166667	0.8106734	\N	3147	787	None
SVC	\N	5	3150	788	1	0.12962963	0.22950819	2020-07-01 18:09:34	2020-07-01 18:09:34	2020-07-01 18:09:34	2020-07-01 18:09:34	0.11248808	491	\N		286	\N	None	1	0.115384616	0.20689656	0.0952986	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-01 20:17:19	2020-07-01 20:17:19	2020-07-01 20:17:19	2020-07-01 20:17:19	0.99872893	492	\N		287	\N	None	0.9512195	0.78	0.85714287	0.84243965	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-01 20:19:09	2020-07-01 20:19:09	2020-07-01 20:19:09	2020-07-01 20:19:09	0.99872893	493	\N		287	\N	None	0.9756098	0.8695652	0.9195402	0.83227444	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-01 20:22:40	2020-07-01 20:22:40	2020-07-01 20:22:40	2020-07-01 20:22:40	0.9974579	494	\N		287	\N	None	0.97727275	0.8958333	0.9347826	0.8297332	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2037037	0.33846155	2020-07-01 20:24:06	2020-07-01 20:24:06	2020-07-01 20:24:06	2020-07-01 20:24:06	0.23895773	495	\N		287	\N	None	1	0.1875	0.31578946	0.23761117	\N	3147	787	None
Simple Naive Bayes	\N	5	3176	794	1	1	1	2020-07-01 20:39:35	2020-07-01 20:39:35	2020-07-01 20:39:35	2020-07-01 20:39:35	0.6148755	496	\N		288	\N	None	0.9361702	0.9361702	0.9361702	0.52459013	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-01 20:39:51	2020-07-01 20:39:51	2020-07-01 20:39:51	2020-07-01 20:39:51	0.99873936	497	\N		288	\N	None	0.9782609	0.88235295	0.92783505	0.81210595	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-01 20:40:11	2020-07-01 20:40:11	2020-07-01 20:40:11	2020-07-01 20:40:11	0.99842423	498	\N		288	\N	None	1	0.84313726	0.9148936	0.8335435	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-01 20:40:29	2020-07-01 20:40:29	2020-07-01 20:40:29	2020-07-01 20:40:29	0.9836117	499	\N		288	\N	None	0.95555556	0.8958333	0.9247312	0.7969735	\N	3173	793	None
SVC	\N	5	3176	794	1	0.6111111	0.7586207	2020-07-01 20:40:58	2020-07-01 20:40:58	2020-07-01 20:40:58	2020-07-01 20:40:58	0.7343208	500	\N		288	\N	None	1	0.627451	0.7710843	0.6847415	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	0.9814815	0.99065423	2020-07-01 20:58:42	2020-07-01 20:58:42	2020-07-01 20:58:42	2020-07-01 20:58:42	0.30980146	501	\N		289	\N	None	0.9756098	0.78431374	0.8695652	0.30643126	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-01 20:59:04	2020-07-01 20:59:04	2020-07-01 20:59:04	2020-07-01 20:59:04	0.99905455	502	\N		289	\N	None	0.95555556	0.86	0.9052632	0.8411097	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-01 20:59:39	2020-07-01 20:59:39	2020-07-01 20:59:39	2020-07-01 20:59:39	0.9977939	503	\N		289	\N	None	0.9756098	0.8695652	0.9195402	0.83858764	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-01 21:00:27	2020-07-01 21:00:27	2020-07-01 21:00:27	2020-07-01 21:00:27	0.9977939	504	\N		289	\N	None	1	0.9583333	0.9787234	0.814628	\N	3173	793	None
SVC	\N	5	3176	794	1	0.2037037	0.33846155	2020-07-01 21:01:19	2020-07-01 21:01:19	2020-07-01 21:01:19	2020-07-01 21:01:19	0.27040654	505	\N		289	\N	None	1	0.21276596	0.3508772	0.25346786	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	0.9814815	0.99065423	2020-07-01 21:20:37	2020-07-01 21:20:37	2020-07-01 21:20:37	2020-07-01 21:20:37	0.29877087	506	\N		290	\N	None	0.9767442	0.85714287	0.9130435	0.32660782	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-01 21:20:58	2020-07-01 21:20:58	2020-07-01 21:20:58	2020-07-01 21:20:58	0.99842423	507	\N		290	\N	None	0.95454544	0.93333334	0.94382024	0.8284994	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-01 21:21:30	2020-07-01 21:21:30	2020-07-01 21:21:30	2020-07-01 21:21:30	0.99810904	508	\N		290	\N	None	1	0.86	0.9247312	0.81715006	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-01 21:22:34	2020-07-01 21:22:34	2020-07-01 21:22:34	2020-07-01 21:22:34	0.9962181	509	\N		290	\N	None	0.9756098	0.81632656	0.8888889	0.80580074	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-01 21:23:17	2020-07-01 21:23:17	2020-07-01 21:23:17	2020-07-01 21:23:17	0.21021116	510	\N		290	\N	None	1	0.18367347	0.31034482	0.18663304	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	1	1	2020-07-01 21:40:31	2020-07-01 21:40:31	2020-07-01 21:40:31	2020-07-01 21:40:31	0.38512447	511	\N		291	\N	None	0.8695652	0.8888889	0.8791209	0.39848676	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-01 21:40:52	2020-07-01 21:40:52	2020-07-01 21:40:52	2020-07-01 21:40:52	0.99873936	512	\N		291	\N	None	1	0.85714287	0.9230769	0.8272383	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-01 21:41:23	2020-07-01 21:41:23	2020-07-01 21:41:23	2020-07-01 21:41:23	0.9977939	513	\N		291	\N	None	0.975	0.79591835	0.8764045	0.8310214	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-01 21:42:24	2020-07-01 21:42:24	2020-07-01 21:42:24	2020-07-01 21:42:24	0.99590296	514	\N		291	\N	None	1	0.9183673	0.9574468	0.8360656	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-01 21:43:06	2020-07-01 21:43:06	2020-07-01 21:43:06	2020-07-01 21:43:06	0.20737472	515	\N		291	\N	None	1	0.21276596	0.3508772	0.20302649	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	1	1	2020-07-01 22:00:19	2020-07-01 22:00:19	2020-07-01 22:00:19	2020-07-01 22:00:19	0.37409392	516	\N		292	\N	None	0.9148936	0.877551	0.8958333	0.3556116	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-01 22:00:41	2020-07-01 22:00:41	2020-07-01 22:00:41	2020-07-01 22:00:41	0.99905455	517	\N		292	\N	None	0.9777778	0.88	0.9263158	0.82093316	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-01 22:01:22	2020-07-01 22:01:22	2020-07-01 22:01:22	2020-07-01 22:01:22	0.99842423	518	\N		292	\N	None	0.95454544	0.89361703	0.9230769	0.8310214	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-01 22:02:09	2020-07-01 22:02:09	2020-07-01 22:02:09	2020-07-01 22:02:09	0.9936968	519	\N		292	\N	None	1	0.9591837	0.9791667	0.7982346	\N	3173	793	None
SVC	\N	5	3176	794	1	0.33333334	0.5	2020-07-01 22:03:00	2020-07-01 22:03:00	2020-07-01 22:03:00	2020-07-01 22:03:00	0.4298771	520	\N		292	\N	None	1	0.3	0.46153846	0.3783102	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	1	1	2020-07-01 22:24:09	2020-07-01 22:24:09	2020-07-01 22:24:09	2020-07-01 22:24:09	0.3558147	521	\N		293	\N	None	0.9347826	0.877551	0.9052632	0.35687265	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-01 22:24:34	2020-07-01 22:24:34	2020-07-01 22:24:34	2020-07-01 22:24:34	0.9993697	522	\N		293	\N	None	0.95454544	0.875	0.9130435	0.8272383	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-01 22:25:16	2020-07-01 22:25:16	2020-07-01 22:25:16	2020-07-01 22:25:16	0.99873936	523	\N		293	\N	None	1	0.7924528	0.8842105	0.8259773	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-01 22:26:31	2020-07-01 22:26:31	2020-07-01 22:26:31	2020-07-01 22:26:31	0.98644817	524	\N		293	\N	None	0.97727275	0.877551	0.9247312	0.8020176	\N	3173	793	None
SVC	\N	5	3176	794	1	0.2777778	0.4347826	2020-07-01 22:27:21	2020-07-01 22:27:21	2020-07-01 22:27:21	2020-07-01 22:27:21	0.3857548	525	\N		293	\N	None	1	0.26530612	0.41935483	0.35056746	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	1	1	2020-07-01 22:48:33	2020-07-01 22:48:33	2020-07-01 22:48:33	2020-07-01 22:48:33	0.32839584	526	\N		294	\N	None	0.95555556	0.877551	0.9148936	0.3152585	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-01 22:48:57	2020-07-01 22:48:57	2020-07-01 22:48:57	2020-07-01 22:48:57	0.99905455	527	\N		294	\N	None	0.9777778	0.9166667	0.94623655	0.81715006	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-01 22:49:36	2020-07-01 22:49:36	2020-07-01 22:49:36	2020-07-01 22:49:36	0.9977939	528	\N		294	\N	None	1	0.84	0.9130435	0.8284994	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-01 22:50:46	2020-07-01 22:50:46	2020-07-01 22:50:46	2020-07-01 22:50:46	0.9867633	529	\N		294	\N	None	0.9782609	0.9	0.9375	0.8070618	\N	3173	793	None
SVC	\N	5	3176	794	1	0.2962963	0.45714286	2020-07-01 22:51:35	2020-07-01 22:51:35	2020-07-01 22:51:35	2020-07-01 22:51:35	0.3829184	530	\N		294	\N	None	1	0.28	0.4375	0.39344263	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	0.9814815	0.99065423	2020-07-01 23:15:52	2020-07-01 23:15:52	2020-07-01 23:15:52	2020-07-01 23:15:52	0.31074694	531	\N		295	\N	None	0.93333334	0.9130435	0.9230769	0.26229507	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-01 23:16:23	2020-07-01 23:16:23	2020-07-01 23:16:23	2020-07-01 23:16:23	0.9993697	532	\N		295	\N	None	0.95238096	0.8333333	0.8888889	0.82093316	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-01 23:17:17	2020-07-01 23:17:17	2020-07-01 23:17:17	2020-07-01 23:17:17	0.99873936	533	\N		295	\N	None	1	0.8367347	0.9111111	0.8398487	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-01 23:19:07	2020-07-01 23:19:07	2020-07-01 23:19:07	2020-07-01 23:19:07	0.99905455	534	\N		295	\N	None	0.95348835	0.8913044	0.92134833	0.8032787	\N	3173	793	None
SVC	\N	5	3176	794	1	0.16666667	0.2857143	2020-07-01 23:20:13	2020-07-01 23:20:13	2020-07-01 23:20:13	2020-07-01 23:20:13	0.18499842	535	\N		295	\N	None	1	0.18367347	0.31034482	0.19167717	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	0.9444444	0.9714286	2020-07-01 23:44:33	2020-07-01 23:44:33	2020-07-01 23:44:33	2020-07-01 23:44:33	0.24330287	536	\N		296	\N	None	0.925	0.74	0.82222223	0.19672132	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-01 23:45:03	2020-07-01 23:45:03	2020-07-01 23:45:03	2020-07-01 23:45:03	0.99873936	537	\N		296	\N	None	0.9777778	0.9361702	0.95652175	0.83480453	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-01 23:45:56	2020-07-01 23:45:56	2020-07-01 23:45:56	2020-07-01 23:45:56	0.99905455	538	\N		296	\N	None	1	0.84313726	0.9148936	0.8360656	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-01 23:47:42	2020-07-01 23:47:42	2020-07-01 23:47:42	2020-07-01 23:47:42	0.9946423	539	\N		296	\N	None	0.9148936	0.8958333	0.9052632	0.8108449	\N	3173	793	None
SVC	\N	5	3176	794	1	0.16981132	0.29032257	2020-07-01 23:48:47	2020-07-01 23:48:47	2020-07-01 23:48:47	2020-07-01 23:48:47	0.18342263	540	\N		296	\N	None	1	0.18	0.30508474	0.1740227	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	0.9814815	0.99065423	2020-07-02 00:11:01	2020-07-02 00:11:01	2020-07-02 00:11:01	2020-07-02 00:11:01	0.2946738	541	\N		297	\N	None	0.9111111	0.87234044	0.8913044	0.29508197	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 00:11:26	2020-07-02 00:11:26	2020-07-02 00:11:26	2020-07-02 00:11:26	0.99905455	542	\N		297	\N	None	0.97727275	0.8269231	0.8958333	0.815889	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 00:12:10	2020-07-02 00:12:10	2020-07-02 00:12:10	2020-07-02 00:12:10	0.99873936	543	\N		297	\N	None	1	0.9183673	0.9574468	0.82976043	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 00:13:47	2020-07-02 00:13:47	2020-07-02 00:13:47	2020-07-02 00:13:47	0.99810904	544	\N		297	\N	None	1	0.8269231	0.9052632	0.815889	\N	3173	793	None
SVC	\N	5	3176	794	1	0.16666667	0.2857143	2020-07-02 00:14:39	2020-07-02 00:14:39	2020-07-02 00:14:39	2020-07-02 00:14:39	0.13362749	545	\N		297	\N	None	1	0.14	0.24561404	0.12484237	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	0.962963	0.9811321	2020-07-02 00:34:43	2020-07-02 00:34:43	2020-07-02 00:34:43	2020-07-02 00:34:43	0.24393319	546	\N		298	\N	None	0.9459459	0.76086956	0.8433735	0.20554855	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 00:35:08	2020-07-02 00:35:08	2020-07-02 00:35:08	2020-07-02 00:35:08	0.99873936	547	\N		298	\N	None	0.9782609	0.9782609	0.9782609	0.8259773	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 00:35:55	2020-07-02 00:35:55	2020-07-02 00:35:55	2020-07-02 00:35:55	0.99810904	548	\N		298	\N	None	0.9756098	0.90909094	0.9411765	0.85372007	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 00:37:22	2020-07-02 00:37:22	2020-07-02 00:37:22	2020-07-02 00:37:22	0.9962181	549	\N		298	\N	None	0.97619045	0.8367347	0.9010989	0.8373266	\N	3173	793	None
SVC	\N	5	3176	794	1	0.22222222	0.36363637	2020-07-02 00:38:14	2020-07-02 00:38:14	2020-07-02 00:38:14	2020-07-02 00:38:14	0.31169242	550	\N		298	\N	None	1	0.22916667	0.37288135	0.33417404	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	0.9814815	0.99065423	2020-07-02 00:58:05	2020-07-02 00:58:05	2020-07-02 00:58:05	2020-07-02 00:58:05	0.2429877	551	\N		299	\N	None	0.95	0.7755102	0.85393256	0.22068095	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 00:58:29	2020-07-02 00:58:29	2020-07-02 00:58:29	2020-07-02 00:58:29	0.99905455	552	\N		299	\N	None	1	0.9183673	0.9574468	0.84237075	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 00:59:16	2020-07-02 00:59:16	2020-07-02 00:59:16	2020-07-02 00:59:16	0.99842423	553	\N		299	\N	None	1	0.875	0.93333334	0.8436318	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 01:00:46	2020-07-02 01:00:46	2020-07-02 01:00:46	2020-07-02 01:00:46	0.99810904	554	\N		299	\N	None	0.9591837	0.90384614	0.9306931	0.82093316	\N	3173	793	None
SVC	\N	5	3176	794	1	0.25925925	0.4117647	2020-07-02 01:01:37	2020-07-02 01:01:37	2020-07-02 01:01:37	2020-07-02 01:01:37	0.32839584	555	\N		299	\N	None	1	0.2244898	0.36666667	0.3039092	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	0.9444444	0.9714286	2020-07-02 01:21:33	2020-07-02 01:21:33	2020-07-02 01:21:33	2020-07-02 01:21:33	0.24172707	556	\N		300	\N	None	0.95238096	0.81632656	0.8791209	0.22068095	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 01:21:58	2020-07-02 01:21:58	2020-07-02 01:21:58	2020-07-02 01:21:58	0.99905455	557	\N		300	\N	None	1	0.8333333	0.90909094	0.8411097	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 01:22:45	2020-07-02 01:22:45	2020-07-02 01:22:45	2020-07-02 01:22:45	0.9977939	558	\N		300	\N	None	1	0.87234044	0.9318182	0.84741485	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 01:24:28	2020-07-02 01:24:28	2020-07-02 01:24:28	2020-07-02 01:24:28	0.99810904	559	\N		300	\N	None	0.95454544	0.9130435	0.93333334	0.82976043	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-02 01:25:17	2020-07-02 01:25:17	2020-07-02 01:25:17	2020-07-02 01:25:17	0.30349827	560	\N		300	\N	None	1	0.20833333	0.3448276	0.29508197	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 02:46:06	2020-07-02 02:46:06	2020-07-02 02:46:06	2020-07-02 02:46:06	0.9993697	561	\N		301	\N	None	0.97727275	0.877551	0.9247312	0.8284994	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 02:47:14	2020-07-02 02:47:14	2020-07-02 02:47:14	2020-07-02 02:47:14	0.99873936	562	\N		301	\N	None	0.9777778	0.88	0.9263158	0.8587642	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 02:49:20	2020-07-02 02:49:20	2020-07-02 02:49:20	2020-07-02 02:49:20	0.9993697	563	\N		301	\N	None	0.9782609	0.9	0.9375	0.82093316	\N	3173	793	None
SVC	\N	5	3176	794	1	0.12962963	0.22950819	2020-07-02 02:50:20	2020-07-02 02:50:20	2020-07-02 02:50:20	2020-07-02 02:50:20	0.11156634	564	\N		301	\N	None	1	0.10638298	0.1923077	0.10340479	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 03:09:18	2020-07-02 03:09:18	2020-07-02 03:09:18	2020-07-02 03:09:18	0.9996849	565	\N		302	\N	None	1	0.9130435	0.95454544	0.8310214	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 03:10:22	2020-07-02 03:10:22	2020-07-02 03:10:22	2020-07-02 03:10:22	0.99905455	566	\N		302	\N	None	0.9756098	0.8333333	0.8988764	0.83858764	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 03:12:39	2020-07-02 03:12:39	2020-07-02 03:12:39	2020-07-02 03:12:39	0.9946423	567	\N		302	\N	None	0.9166667	0.9166667	0.9166667	0.8221942	\N	3173	793	None
SVC	\N	5	3176	794	1	0.2037037	0.33846155	2020-07-02 03:13:38	2020-07-02 03:13:38	2020-07-02 03:13:38	2020-07-02 03:13:38	0.2722975	568	\N		302	\N	None	1	0.2	0.33333334	0.25977302	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	1	1	2020-07-02 03:26:26	2020-07-02 03:26:26	2020-07-02 03:26:26	2020-07-02 03:26:26	0.5710684	569	\N		303	\N	None	0.95652175	0.8979592	0.9263158	0.5069357	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 03:26:42	2020-07-02 03:26:42	2020-07-02 03:26:42	2020-07-02 03:26:42	0.99873936	570	\N		303	\N	None	1	0.8039216	0.8913044	0.80580074	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 03:27:01	2020-07-02 03:27:01	2020-07-02 03:27:01	2020-07-02 03:27:01	0.99842423	571	\N		303	\N	None	1	0.875	0.93333334	0.8322825	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 03:27:18	2020-07-02 03:27:18	2020-07-02 03:27:18	2020-07-02 03:27:18	0.95682317	572	\N		303	\N	None	0.9347826	0.84313726	0.88659793	0.7553594	\N	3173	793	None
SVC	\N	5	3176	794	1	0.6296296	0.77272725	2020-07-02 03:27:47	2020-07-02 03:27:47	2020-07-02 03:27:47	2020-07-02 03:27:47	0.7403089	573	\N		303	\N	None	1	0.6122449	0.75949365	0.65447664	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	1	1	2020-07-02 03:43:49	2020-07-02 03:43:49	2020-07-02 03:43:49	2020-07-02 03:43:49	0.34604475	574	\N		304	\N	None	0.95652175	0.84615386	0.8979592	0.29508197	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 03:44:11	2020-07-02 03:44:11	2020-07-02 03:44:11	2020-07-02 03:44:11	0.99873936	575	\N		304	\N	None	0.9777778	0.8979592	0.9361702	0.8612863	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 03:44:48	2020-07-02 03:44:48	2020-07-02 03:44:48	2020-07-02 03:44:48	0.99842423	576	\N		304	\N	None	0.95348835	0.87234044	0.9111111	0.83480453	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 03:45:48	2020-07-02 03:45:48	2020-07-02 03:45:48	2020-07-02 03:45:48	0.9971636	577	\N		304	\N	None	0.9782609	0.9782609	0.9782609	0.8259773	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18867925	0.31746033	2020-07-02 03:46:37	2020-07-02 03:46:37	2020-07-02 03:46:37	2020-07-02 03:46:37	0.23763001	578	\N		304	\N	None	1	0.22222222	0.36363637	0.2446406	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	1	1	2020-07-02 04:04:05	2020-07-02 04:04:05	2020-07-02 04:04:05	2020-07-02 04:04:05	0.30349827	579	\N		305	\N	None	0.90909094	0.81632656	0.86021507	0.2925599	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 04:04:31	2020-07-02 04:04:31	2020-07-02 04:04:31	2020-07-02 04:04:31	0.99873936	580	\N		305	\N	None	0.95652175	0.8979592	0.9263158	0.8310214	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 04:05:13	2020-07-02 04:05:13	2020-07-02 04:05:13	2020-07-02 04:05:13	0.99873936	581	\N		305	\N	None	1	0.84313726	0.9148936	0.80453974	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 04:06:43	2020-07-02 04:06:43	2020-07-02 04:06:43	2020-07-02 04:06:43	0.99810904	582	\N		305	\N	None	0.9347826	0.8958333	0.9148936	0.8284994	\N	3173	793	None
SVC	\N	5	3176	794	1	0.16666667	0.2857143	2020-07-02 04:07:33	2020-07-02 04:07:33	2020-07-02 04:07:33	2020-07-02 04:07:33	0.17711945	583	\N		305	\N	None	1	0.16666667	0.2857143	0.20176545	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	0.8888889	0.9411765	2020-07-02 04:25:37	2020-07-02 04:25:37	2020-07-02 04:25:37	2020-07-02 04:25:37	0.20611408	584	\N		306	\N	None	0.9302326	0.78431374	0.85106385	0.2370744	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 04:26:03	2020-07-02 04:26:03	2020-07-02 04:26:03	2020-07-02 04:26:03	0.99873936	585	\N		306	\N	None	1	0.8076923	0.89361703	0.8335435	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 04:26:45	2020-07-02 04:26:45	2020-07-02 04:26:45	2020-07-02 04:26:45	0.99842423	586	\N		306	\N	None	0.9767442	0.85714287	0.9130435	0.8259773	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 04:28:26	2020-07-02 04:28:26	2020-07-02 04:28:26	2020-07-02 04:28:26	0.99842423	587	\N		306	\N	None	0.95454544	0.9130435	0.93333334	0.82976043	\N	3173	793	None
SVC	\N	5	3176	794	1	0.14814815	0.2580645	2020-07-02 04:29:16	2020-07-02 04:29:16	2020-07-02 04:29:16	2020-07-02 04:29:16	0.13205169	588	\N		306	\N	None	1	0.14583333	0.25454545	0.110971	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	1	1	2020-07-02 04:45:15	2020-07-02 04:45:15	2020-07-02 04:45:15	2020-07-02 04:45:15	0.40844625	589	\N		307	\N	None	0.9111111	0.8913044	0.9010989	0.33543506	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 04:45:36	2020-07-02 04:45:36	2020-07-02 04:45:36	2020-07-02 04:45:36	0.99873936	590	\N		307	\N	None	1	0.88235295	0.9375	0.81210595	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 04:46:15	2020-07-02 04:46:15	2020-07-02 04:46:15	2020-07-02 04:46:15	0.99873936	591	\N		307	\N	None	1	0.8367347	0.9111111	0.82976043	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 04:47:16	2020-07-02 04:47:16	2020-07-02 04:47:16	2020-07-02 04:47:16	0.9974787	592	\N		307	\N	None	0.9574468	0.9	0.92783505	0.81715006	\N	3173	793	None
SVC	\N	5	3176	794	1	0.3148148	0.47887325	2020-07-02 04:48:01	2020-07-02 04:48:01	2020-07-02 04:48:01	2020-07-02 04:48:01	0.39363378	593	\N		307	\N	None	1	0.29787233	0.45901638	0.39092055	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	0.9074074	0.9514563	2020-07-02 05:05:26	2020-07-02 05:05:26	2020-07-02 05:05:26	2020-07-02 05:05:26	0.22407816	594	\N		308	\N	None	0.9512195	0.79591835	0.8666667	0.19672132	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 05:05:50	2020-07-02 05:05:50	2020-07-02 05:05:50	2020-07-02 05:05:50	0.99905455	595	\N		308	\N	None	0.97727275	0.877551	0.9247312	0.8284994	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 05:06:33	2020-07-02 05:06:33	2020-07-02 05:06:33	2020-07-02 05:06:33	0.99810904	596	\N		308	\N	None	1	0.8	0.8888889	0.83480453	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 05:08:00	2020-07-02 05:08:00	2020-07-02 05:08:00	2020-07-02 05:08:00	0.99180585	597	\N		308	\N	None	0.9574468	0.9375	0.94736844	0.8335435	\N	3173	793	None
SVC	\N	5	3176	794	1	0.2037037	0.33846155	2020-07-02 05:08:48	2020-07-02 05:08:48	2020-07-02 05:08:48	2020-07-02 05:08:48	0.3202017	598	\N		308	\N	None	1	0.20408164	0.33898306	0.31651956	\N	3173	793	None
Simple Naive Bayes	\N	5	3176	794	1	1	1	2020-07-02 05:27:04	2020-07-02 05:27:04	2020-07-02 05:27:04	2020-07-02 05:27:04	0.3000315	599	\N		309	\N	None	0.8666667	0.90697676	0.8863636	0.29508197	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 05:27:29	2020-07-02 05:27:29	2020-07-02 05:27:29	2020-07-02 05:27:29	0.99873936	600	\N		309	\N	None	0.9782609	0.9375	0.9574468	0.8411097	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 05:28:16	2020-07-02 05:28:16	2020-07-02 05:28:16	2020-07-02 05:28:16	0.99873936	601	\N		309	\N	None	0.9767442	0.9130435	0.94382024	0.8284994	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 05:29:55	2020-07-02 05:29:55	2020-07-02 05:29:55	2020-07-02 05:29:55	0.9933817	602	\N		309	\N	None	1	0.84	0.9130435	0.80958384	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-02 05:30:43	2020-07-02 05:30:43	2020-07-02 05:30:43	2020-07-02 05:30:43	0.3041286	603	\N		309	\N	None	1	0.2	0.33333334	0.27616647	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 07:52:28	2020-07-02 07:52:28	2020-07-02 07:52:28	2020-07-02 07:52:28	0.99873936	604	\N		310	\N	None	0.95555556	0.877551	0.9148936	0.8448928	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 07:53:25	2020-07-02 07:53:25	2020-07-02 07:53:25	2020-07-02 07:53:25	0.99810904	605	\N		310	\N	None	0.9767442	0.9130435	0.94382024	0.85119796	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 07:55:26	2020-07-02 07:55:26	2020-07-02 07:55:26	2020-07-02 07:55:26	0.99905455	606	\N		310	\N	None	0.9574468	0.9183673	0.9375	0.8221942	\N	3173	793	None
SVC	\N	5	3176	794	1	0.14814815	0.2580645	2020-07-02 07:56:29	2020-07-02 07:56:29	2020-07-02 07:56:29	2020-07-02 07:56:29	0.13173653	607	\N		310	\N	None	1	0.12765957	0.2264151	0.12484237	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 09:16:03	2020-07-02 09:16:03	2020-07-02 09:16:03	2020-07-02 09:16:03	0.99873936	608	\N		311	\N	None	0.9777778	0.88	0.9263158	0.85119796	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 09:17:10	2020-07-02 09:17:10	2020-07-02 09:17:10	2020-07-02 09:17:10	0.9993697	609	\N		311	\N	None	1	0.87234044	0.9318182	0.852459	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 09:20:03	2020-07-02 09:20:03	2020-07-02 09:20:03	2020-07-02 09:20:03	0.99905455	610	\N		311	\N	None	0.9777778	0.9166667	0.94623655	0.8284994	\N	3173	793	None
SVC	\N	5	3176	794	1	0.12962963	0.22950819	2020-07-02 09:21:23	2020-07-02 09:21:23	2020-07-02 09:21:23	2020-07-02 09:21:23	0.11219666	611	\N		311	\N	None	1	0.09803922	0.17857143	0.11601513	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 09:45:07	2020-07-02 09:45:07	2020-07-02 09:45:07	2020-07-02 09:45:07	0.9993697	612	\N		312	\N	None	0.95454544	0.875	0.9130435	0.84615386	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 09:47:10	2020-07-02 09:47:10	2020-07-02 09:47:10	2020-07-02 09:47:10	0.99842423	613	\N		312	\N	None	1	0.8039216	0.8913044	0.84237075	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 09:50:43	2020-07-02 09:50:43	2020-07-02 09:50:43	2020-07-02 09:50:43	0.99558777	614	\N		312	\N	None	0.95454544	0.89361703	0.9230769	0.8272383	\N	3173	793	None
SVC	\N	5	3176	794	1	0.11320755	0.20338982	2020-07-02 09:51:50	2020-07-02 09:51:50	2020-07-02 09:51:50	2020-07-02 09:51:50	0.09423259	615	\N		312	\N	None	1	0.078431375	0.14545454	0.09331652	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 10:21:07	2020-07-02 10:21:07	2020-07-02 10:21:07	2020-07-02 10:21:07	0.99873936	616	\N		313	\N	None	0.9777778	0.9361702	0.95652175	0.8322825	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 10:22:34	2020-07-02 10:22:34	2020-07-02 10:22:34	2020-07-02 10:22:34	0.99905455	617	\N		313	\N	None	0.95652175	0.9361702	0.94623655	0.84993696	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 10:25:03	2020-07-02 10:25:03	2020-07-02 10:25:03	2020-07-02 10:25:03	0.99558777	618	\N		313	\N	None	0.875	0.89361703	0.8842105	0.815889	\N	3173	793	None
SVC	\N	5	3176	794	1	0.20754717	0.34375	2020-07-02 10:26:09	2020-07-02 10:26:09	2020-07-02 10:26:09	2020-07-02 10:26:09	0.28206745	619	\N		313	\N	None	1	0.20408164	0.33898306	0.24968474	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 10:43:49	2020-07-02 10:43:49	2020-07-02 10:43:49	2020-07-02 10:43:49	0.9996849	620	\N		314	\N	None	1	0.8541667	0.92134833	0.81336695	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 10:44:56	2020-07-02 10:44:56	2020-07-02 10:44:56	2020-07-02 10:44:56	0.99905455	621	\N		314	\N	None	1	0.85714287	0.9230769	0.81715006	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 10:47:22	2020-07-02 10:47:22	2020-07-02 10:47:22	2020-07-02 10:47:22	0.99905455	622	\N		314	\N	None	0.9130435	0.93333334	0.9230769	0.8411097	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-02 10:48:27	2020-07-02 10:48:27	2020-07-02 10:48:27	2020-07-02 10:48:27	0.2600063	623	\N		314	\N	None	1	0.22727273	0.37037036	0.2749054	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 12:21:01	2020-07-02 12:21:01	2020-07-02 12:21:01	2020-07-02 12:21:01	0.99905455	624	\N		315	\N	None	1	0.85714287	0.9230769	0.82976043	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 12:22:42	2020-07-02 12:22:42	2020-07-02 12:22:42	2020-07-02 12:22:42	0.99905455	625	\N		315	\N	None	0.95652175	0.88	0.9166667	0.8448928	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 12:27:17	2020-07-02 12:27:17	2020-07-02 12:27:18	2020-07-02 12:27:18	0.9968484	626	\N		315	\N	None	0.9574468	0.9183673	0.9375	0.8310214	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-02 12:28:57	2020-07-02 12:28:57	2020-07-02 12:28:57	2020-07-02 12:28:57	0.2275449	627	\N		315	\N	None	1	0.20408164	0.33898306	0.2143758	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 15:40:30	2020-07-02 15:40:30	2020-07-02 15:40:30	2020-07-02 15:40:30	0.9993697	628	\N		316	\N	None	1	0.86538464	0.92783505	0.8284994	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 15:42:08	2020-07-02 15:42:08	2020-07-02 15:42:08	2020-07-02 15:42:08	0.99905455	629	\N		316	\N	None	0.9767442	0.93333334	0.95454544	0.84993696	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 15:45:39	2020-07-02 15:45:39	2020-07-02 15:45:39	2020-07-02 15:45:39	0.99873936	630	\N		316	\N	None	0.97727275	0.8958333	0.9347826	0.85372007	\N	3173	793	None
SVC	\N	5	3176	794	1	0.09259259	0.16949153	2020-07-02 15:47:01	2020-07-02 15:47:01	2020-07-02 15:47:01	2020-07-02 15:47:01	0.109990545	631	\N		316	\N	None	1	0.08163265	0.1509434	0.09331652	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-02 17:29:59	2020-07-02 17:29:59	2020-07-02 17:29:59	2020-07-02 17:29:59	0.9993697	632	\N		317	\N	None	1	0.9148936	0.95555556	0.84615386	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-02 17:32:24	2020-07-02 17:32:24	2020-07-02 17:32:24	2020-07-02 17:32:24	0.99873936	633	\N		317	\N	None	0.95555556	0.877551	0.9148936	0.8322825	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-02 17:36:43	2020-07-02 17:36:43	2020-07-02 17:36:43	2020-07-02 17:36:43	0.994012	634	\N		317	\N	None	0.93333334	0.85714287	0.89361703	0.814628	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-02 17:38:27	2020-07-02 17:38:27	2020-07-02 17:38:27	2020-07-02 17:38:27	0.19130161	635	\N		317	\N	None	1	0.21276596	0.3508772	0.2143758	\N	3173	793	None
Simple Naive Bayes	\N	5	15285	3821	1	1	1	2020-07-02 18:10:59	2020-07-02 18:10:59	2020-07-02 18:10:59	2020-07-02 18:10:59	0.33333334	636	\N		318	\N	None	1	1	1	0.29685864	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-02 18:12:02	2020-07-02 18:12:02	2020-07-02 18:12:02	2020-07-02 18:12:02	0.98056537	637	\N		318	\N	None	0.9814815	1	0.99065423	0.74397904	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-02 18:13:38	2020-07-02 18:13:38	2020-07-02 18:13:38	2020-07-02 18:13:38	0.96342105	638	\N		318	\N	None	1	0.9423077	0.97029704	0.78062826	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-02 18:14:46	2020-07-02 18:14:46	2020-07-02 18:14:46	2020-07-02 18:14:46	0.91362387	639	\N		318	\N	None	1	0.9444444	0.9714286	0.7447644	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.5740741	0.7294118	2020-07-02 18:20:21	2020-07-02 18:20:21	2020-07-02 18:20:21	2020-07-02 18:20:21	0.5703442	640	\N		318	\N	None	1	0.48076922	0.64935064	0.55130893	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	0.9814815	0.99065423	2020-07-02 18:54:11	2020-07-02 18:54:11	2020-07-02 18:54:11	2020-07-02 18:54:11	0.12086114	641	\N		319	\N	None	0.97959185	0.9056604	0.9411765	0.10759162	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-02 18:55:10	2020-07-02 18:55:10	2020-07-02 18:55:10	2020-07-02 18:55:10	0.98953015	642	\N		319	\N	None	1	0.9622642	0.9807692	0.8115183	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-02 18:56:41	2020-07-02 18:56:41	2020-07-02 18:56:41	2020-07-02 18:56:41	0.98593116	643	\N		319	\N	None	0.97959185	0.9230769	0.95049506	0.8028796	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-02 18:59:49	2020-07-02 18:59:49	2020-07-02 18:59:49	2020-07-02 18:59:49	0.9755922	644	\N		319	\N	None	1	0.9622642	0.9807692	0.80183244	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.11111111	0.2	2020-07-02 19:06:33	2020-07-02 19:06:33	2020-07-02 19:06:33	2020-07-02 19:06:33	0.10823191	645	\N		319	\N	None	1	0.09259259	0.16949153	0.10445026	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	1	1	2020-07-02 19:35:33	2020-07-02 19:35:33	2020-07-02 19:35:33	2020-07-02 19:35:33	0.13349038	646	\N		320	\N	None	0.9622642	0.9807692	0.9714286	0.12696335	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-02 19:36:31	2020-07-02 19:36:31	2020-07-02 19:36:31	2020-07-02 19:36:31	0.98933387	647	\N		320	\N	None	1	0.9444444	0.9714286	0.80497384	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-02 19:37:53	2020-07-02 19:37:53	2020-07-02 19:37:53	2020-07-02 19:37:53	0.98292106	648	\N		320	\N	None	1	0.9433962	0.9708738	0.80078536	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-02 19:42:31	2020-07-02 19:42:31	2020-07-02 19:42:31	2020-07-02 19:42:31	0.9728439	649	\N		320	\N	None	0.98	0.9245283	0.9514563	0.7895288	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-02 19:48:49	2020-07-02 19:48:49	2020-07-02 19:48:49	2020-07-02 19:48:49	0.10090303	650	\N		320	\N	None	1	0.0754717	0.14035088	0.10340314	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	1	1	2020-07-02 20:25:55	2020-07-02 20:25:55	2020-07-02 20:25:55	2020-07-02 20:25:55	0.14396021	651	\N		321	\N	None	1	1	1	0.17094241	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-02 20:27:15	2020-07-02 20:27:15	2020-07-02 20:27:15	2020-07-02 20:27:15	0.9890067	652	\N		321	\N	None	1	1	1	0.7947644	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-02 20:29:17	2020-07-02 20:29:17	2020-07-02 20:29:17	2020-07-02 20:29:17	0.97892946	653	\N		321	\N	None	1	0.9433962	0.9708738	0.7950262	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-02 20:35:25	2020-07-02 20:35:25	2020-07-02 20:35:25	2020-07-02 20:35:25	0.9627012	654	\N		321	\N	None	0.98039216	0.9433962	0.96153843	0.78874344	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-02 20:42:53	2020-07-02 20:42:53	2020-07-02 20:42:53	2020-07-02 20:42:53	0.10070671	655	\N		321	\N	None	1	0.0754717	0.14035088	0.107329845	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	0.9814815	0.99065423	2020-07-02 21:12:05	2020-07-02 21:12:05	2020-07-02 21:12:05	2020-07-02 21:12:05	0.104894646	656	\N		322	\N	None	1	0.9074074	0.9514563	0.09057592	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-02 21:13:01	2020-07-02 21:13:01	2020-07-02 21:13:01	2020-07-02 21:13:01	0.9903808	657	\N		322	\N	None	0.9814815	1	0.99065423	0.7905759	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-02 21:14:38	2020-07-02 21:14:38	2020-07-02 21:14:38	2020-07-02 21:14:38	0.98678184	658	\N		322	\N	None	0.98039216	0.98039216	0.98039216	0.80863875	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-02 21:17:53	2020-07-02 21:17:53	2020-07-02 21:17:53	2020-07-02 21:17:53	0.9750687	659	\N		322	\N	None	1	0.9622642	0.9807692	0.7929319	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.24074075	0.3880597	2020-07-02 21:24:28	2020-07-02 21:24:28	2020-07-02 21:24:28	2020-07-02 21:24:28	0.33097762	660	\N		322	\N	None	1	0.24528302	0.3939394	0.32225132	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	1	1	2020-07-02 21:53:49	2020-07-02 21:53:49	2020-07-02 21:53:49	2020-07-02 21:53:49	0.11484099	661	\N		323	\N	None	1	1	1	0.11230367	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-02 21:54:46	2020-07-02 21:54:46	2020-07-02 21:54:46	2020-07-02 21:54:46	0.9894647	662	\N		323	\N	None	1	0.9811321	0.9904762	0.79031414	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-02 21:56:22	2020-07-02 21:56:22	2020-07-02 21:56:22	2020-07-02 21:56:22	0.9861275	663	\N		323	\N	None	1	0.9622642	0.9807692	0.8026178	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	0.9814815	0.99065423	2020-07-02 22:00:40	2020-07-02 22:00:40	2020-07-02 22:00:40	2020-07-02 22:00:40	0.96505696	664	\N		323	\N	None	0.9807692	0.9622642	0.9714286	0.76387435	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.18518518	0.3125	2020-07-02 22:08:05	2020-07-02 22:08:05	2020-07-02 22:08:05	2020-07-02 22:08:05	0.27862844	665	\N		323	\N	None	1	0.18867925	0.31746033	0.27329844	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	1	1	2020-07-02 22:43:53	2020-07-02 22:43:53	2020-07-02 22:43:53	2020-07-02 22:43:53	0.14801727	666	\N		324	\N	None	1	1	1	0.16884817	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-02 22:44:59	2020-07-02 22:44:59	2020-07-02 22:44:59	2020-07-02 22:44:59	0.9847533	667	\N		324	\N	None	1	0.9814815	0.99065423	0.78115183	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-02 22:46:52	2020-07-02 22:46:52	2020-07-02 22:46:52	2020-07-02 22:46:52	0.9837063	668	\N		324	\N	None	1	0.9074074	0.9514563	0.7897906	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-02 22:52:00	2020-07-02 22:52:00	2020-07-02 22:52:00	2020-07-02 22:52:00	0.9662348	669	\N		324	\N	None	1	0.962963	0.9811321	0.760733	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.2037037	0.33846155	2020-07-02 22:59:19	2020-07-02 22:59:19	2020-07-02 22:59:19	2020-07-02 22:59:19	0.2850412	670	\N		324	\N	None	1	0.18867925	0.31746033	0.2764398	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	0.962963	0.9811321	2020-07-02 23:46:10	2020-07-02 23:46:10	2020-07-02 23:46:10	2020-07-02 23:46:10	0.07230729	671	\N		325	\N	None	0.9782609	0.8490566	0.90909094	0.07329843	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-02 23:48:17	2020-07-02 23:48:17	2020-07-02 23:48:17	2020-07-02 23:48:17	0.9887449	672	\N		325	\N	None	0.9811321	0.9811321	0.9811321	0.81911	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-02 23:50:43	2020-07-02 23:50:43	2020-07-02 23:50:43	2020-07-02 23:50:43	0.98789424	673	\N		325	\N	None	1	0.9074074	0.9514563	0.80837697	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 00:02:20	2020-07-03 00:02:20	2020-07-03 00:02:20	2020-07-03 00:02:20	0.98102343	674	\N		325	\N	None	1	0.9433962	0.9708738	0.81439793	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-03 00:14:51	2020-07-03 00:14:51	2020-07-03 00:14:51	2020-07-03 00:14:51	0.09874362	675	\N		325	\N	None	1	0.055555556	0.10526316	0.096858636	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	0.962963	0.9811321	2020-07-03 00:47:02	2020-07-03 00:47:02	2020-07-03 00:47:02	2020-07-03 00:47:02	0.08709593	676	\N		326	\N	None	0.98039216	0.9433962	0.96153843	0.08612566	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 00:48:08	2020-07-03 00:48:08	2020-07-03 00:48:08	2020-07-03 00:48:08	0.9895956	677	\N		326	\N	None	1	0.9444444	0.9714286	0.8091623	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 00:49:35	2020-07-03 00:49:35	2020-07-03 00:49:35	2020-07-03 00:49:35	0.988156	678	\N		326	\N	None	1	0.9230769	0.96	0.8060209	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 00:55:49	2020-07-03 00:55:49	2020-07-03 00:55:49	2020-07-03 00:55:49	0.9810889	679	\N		326	\N	None	1	0.9074074	0.9514563	0.802356	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-03 01:02:48	2020-07-03 01:02:48	2020-07-03 01:02:48	2020-07-03 01:02:48	0.099005364	680	\N		326	\N	None	1	0.0754717	0.14035088	0.096858636	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	1	1	2020-07-03 01:33:49	2020-07-03 01:33:49	2020-07-03 01:33:49	2020-07-03 01:33:49	0.07656066	681	\N		327	\N	None	0.962963	1	0.9811321	0.07146597	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 01:34:53	2020-07-03 01:34:53	2020-07-03 01:34:53	2020-07-03 01:34:53	0.9899882	682	\N		327	\N	None	1	0.962963	0.9811321	0.79554975	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 01:36:29	2020-07-03 01:36:29	2020-07-03 01:36:29	2020-07-03 01:36:29	0.9847533	683	\N		327	\N	None	1	0.9433962	0.9708738	0.7950262	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 01:44:09	2020-07-03 01:44:09	2020-07-03 01:44:09	2020-07-03 01:44:09	0.9751996	684	\N		327	\N	None	1	0.90384614	0.94949496	0.78272253	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-03 01:50:58	2020-07-03 01:50:58	2020-07-03 01:50:58	2020-07-03 01:50:58	0.09756576	685	\N		327	\N	None	1	0.055555556	0.10526316	0.0921466	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	0.962963	0.9811321	2020-07-03 02:22:15	2020-07-03 02:22:15	2020-07-03 02:22:15	2020-07-03 02:22:15	0.06229551	686	\N		328	\N	None	0.98	0.9245283	0.9514563	0.05549738	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 02:23:19	2020-07-03 02:23:19	2020-07-03 02:23:19	2020-07-03 02:23:19	0.9898574	687	\N		328	\N	None	1	0.9622642	0.9807692	0.79554975	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 02:25:04	2020-07-03 02:25:04	2020-07-03 02:25:04	2020-07-03 02:25:04	0.9887449	688	\N		328	\N	None	1	0.9807692	0.99029124	0.80471206	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 02:31:36	2020-07-03 02:31:36	2020-07-03 02:31:36	2020-07-03 02:31:36	0.97389084	689	\N		328	\N	None	1	0.9433962	0.9708738	0.78219897	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.16666667	0.2857143	2020-07-03 02:38:46	2020-07-03 02:38:46	2020-07-03 02:38:46	2020-07-03 02:38:46	0.1444837	690	\N		328	\N	None	1	0.14814815	0.2580645	0.1395288	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	0.9814815	0.99065423	2020-07-03 03:10:08	2020-07-03 03:10:08	2020-07-03 03:10:08	2020-07-03 03:10:08	0.08997513	691	\N		329	\N	None	0.96	0.9230769	0.9411765	0.08403141	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 03:11:11	2020-07-03 03:11:11	2020-07-03 03:11:11	2020-07-03 03:11:11	0.9894647	692	\N		329	\N	None	0.98039216	0.96153843	0.9708738	0.7989529	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 03:12:58	2020-07-03 03:12:58	2020-07-03 03:12:58	2020-07-03 03:12:58	0.9877634	693	\N		329	\N	None	0.98039216	0.98039216	0.98039216	0.8094241	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 03:18:48	2020-07-03 03:18:48	2020-07-03 03:18:48	2020-07-03 03:18:48	0.9775553	694	\N		329	\N	None	0.9807692	0.9622642	0.9714286	0.7910995	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.16666667	0.2857143	2020-07-03 03:25:48	2020-07-03 03:25:48	2020-07-03 03:25:48	2020-07-03 03:25:48	0.14225887	695	\N		329	\N	None	1	0.16981132	0.29032257	0.13900523	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	1	1	2020-07-03 03:56:46	2020-07-03 03:56:46	2020-07-03 03:56:46	2020-07-03 03:56:46	0.093639575	696	\N		330	\N	None	0.9807692	0.9622642	0.9714286	0.10549738	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 03:57:48	2020-07-03 03:57:48	2020-07-03 03:57:48	2020-07-03 03:57:48	0.9886141	697	\N		330	\N	None	0.98039216	0.96153843	0.9708738	0.7795811	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 03:59:36	2020-07-03 03:59:36	2020-07-03 03:59:36	2020-07-03 03:59:36	0.9875016	698	\N		330	\N	None	1	0.9444444	0.9714286	0.7856021	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 04:07:10	2020-07-03 04:07:10	2020-07-03 04:07:10	2020-07-03 04:07:10	0.9751996	699	\N		330	\N	None	0.96153843	0.96153843	0.96153843	0.786911	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.14814815	0.2580645	2020-07-03 04:14:03	2020-07-03 04:14:03	2020-07-03 04:14:03	2020-07-03 04:14:03	0.118570864	700	\N		330	\N	None	1	0.115384616	0.20689656	0.115445025	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 07:59:48	2020-07-03 07:59:48	2020-07-03 07:59:48	2020-07-03 07:59:48	0.9901191	701	\N		331	\N	None	1	1	1	0.8196335	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 08:01:38	2020-07-03 08:01:38	2020-07-03 08:01:38	2020-07-03 08:01:38	0.9878288	702	\N		331	\N	None	1	0.9074074	0.9514563	0.8175393	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 08:11:44	2020-07-03 08:11:44	2020-07-03 08:11:44	2020-07-03 08:11:44	0.9847533	703	\N		331	\N	None	1	0.9074074	0.9514563	0.8175393	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.055555556	0.10526316	2020-07-03 08:19:18	2020-07-03 08:19:18	2020-07-03 08:19:18	2020-07-03 08:19:18	0.095275484	704	\N		331	\N	None	1	0.057692308	0.10909091	0.10104712	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 09:40:24	2020-07-03 09:40:24	2020-07-03 09:40:24	2020-07-03 09:40:24	0.98992276	705	\N		332	\N	None	0.9811321	1	0.9904762	0.8078534	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 09:43:16	2020-07-03 09:43:16	2020-07-03 09:43:16	2020-07-03 09:43:16	0.98854864	706	\N		332	\N	None	1	0.9807692	0.99029124	0.80706805	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 09:53:45	2020-07-03 09:53:45	2020-07-03 09:53:45	2020-07-03 09:53:45	0.97513413	707	\N		332	\N	None	0.9811321	1	0.9904762	0.78455496	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.094339624	0.1724138	2020-07-03 10:01:59	2020-07-03 10:01:59	2020-07-03 10:01:59	2020-07-03 10:01:59	0.10672687	708	\N		332	\N	None	1	0.11111111	0.2	0.118062824	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	1	1	2020-07-03 10:27:09	2020-07-03 10:27:09	2020-07-03 10:27:09	2020-07-03 10:27:09	0.35702133	709	\N		333	\N	None	0.9811321	0.9811321	0.9811321	0.32041883	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 10:27:58	2020-07-03 10:27:58	2020-07-03 10:27:58	2020-07-03 10:27:58	0.97729355	710	\N		333	\N	None	0.9814815	1	0.99065423	0.7366492	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 10:29:08	2020-07-03 10:29:08	2020-07-03 10:29:08	2020-07-03 10:29:08	0.964468	711	\N		333	\N	None	1	0.9245283	0.9607843	0.7722513	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 10:30:03	2020-07-03 10:30:03	2020-07-03 10:30:03	2020-07-03 10:30:03	0.9330585	712	\N		333	\N	None	0.9807692	0.9622642	0.9714286	0.74895287	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.5555556	0.71428573	2020-07-03 10:34:53	2020-07-03 10:34:53	2020-07-03 10:34:53	2020-07-03 10:34:53	0.5673341	713	\N		333	\N	None	1	0.49056605	0.65822786	0.54921466	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	0.962963	0.9811321	2020-07-03 11:06:15	2020-07-03 11:06:15	2020-07-03 11:06:15	2020-07-03 11:06:15	0.09534092	714	\N		334	\N	None	0.9574468	0.86538464	0.90909094	0.08717278	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 11:07:46	2020-07-03 11:07:46	2020-07-03 11:07:46	2020-07-03 11:07:46	0.9899882	715	\N		334	\N	None	1	0.9433962	0.9708738	0.81073296	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 11:09:55	2020-07-03 11:09:55	2020-07-03 11:09:55	2020-07-03 11:09:55	0.98704356	716	\N		334	\N	None	1	0.9622642	0.9807692	0.81256545	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 11:15:26	2020-07-03 11:15:26	2020-07-03 11:15:26	2020-07-03 11:15:26	0.979911	717	\N		334	\N	None	0.9807692	0.9807692	0.9807692	0.8075916	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.09259259	0.16949153	2020-07-03 11:24:46	2020-07-03 11:24:46	2020-07-03 11:24:46	2020-07-03 11:24:46	0.104894646	718	\N		334	\N	None	1	0.09615385	0.1754386	0.10706806	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	0.9259259	0.96153843	2020-07-03 12:04:06	2020-07-03 12:04:06	2020-07-03 12:04:06	2020-07-03 12:04:06	0.06602539	719	\N		335	\N	None	0.9791667	0.8867925	0.9306931	0.05602094	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 12:05:14	2020-07-03 12:05:14	2020-07-03 12:05:14	2020-07-03 12:05:14	0.98822147	720	\N		335	\N	None	1	0.9622642	0.9807692	0.8128272	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 12:06:44	2020-07-03 12:06:44	2020-07-03 12:06:44	2020-07-03 12:06:44	0.98822147	721	\N		335	\N	None	1	0.9622642	0.9807692	0.8188482	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 12:14:35	2020-07-03 12:14:35	2020-07-03 12:14:35	2020-07-03 12:14:35	0.9791258	722	\N		335	\N	None	0.97959185	0.9230769	0.95049506	0.7897906	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.0754717	0.14035088	2020-07-03 12:22:21	2020-07-03 12:22:21	2020-07-03 12:22:21	2020-07-03 12:22:21	0.09946342	723	\N		335	\N	None	1	0.055555556	0.10526316	0.09397906	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	0.9814815	0.99065423	2020-07-03 12:55:43	2020-07-03 12:55:43	2020-07-03 12:55:43	2020-07-03 12:55:43	0.07904725	724	\N		336	\N	None	0.9622642	0.9807692	0.9714286	0.087696336	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 12:57:06	2020-07-03 12:57:06	2020-07-03 12:57:06	2020-07-03 12:57:06	0.9890067	725	\N		336	\N	None	1	0.9811321	0.9904762	0.8057592	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 12:59:11	2020-07-03 12:59:11	2020-07-03 12:59:11	2020-07-03 12:59:11	0.98730534	726	\N		336	\N	None	1	0.9433962	0.9708738	0.8062827	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	0.9814815	0.99065423	2020-07-03 13:14:21	2020-07-03 13:14:21	2020-07-03 13:14:21	2020-07-03 13:14:21	0.9750687	727	\N		336	\N	None	1	0.9259259	0.96153843	0.7929319	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.055555556	0.10526316	2020-07-03 13:26:26	2020-07-03 13:26:26	2020-07-03 13:26:26	2020-07-03 13:26:26	0.09612616	728	\N		336	\N	None	1	0.055555556	0.10526316	0.09764398	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	0.9814815	0.99065423	2020-07-03 14:00:37	2020-07-03 14:00:37	2020-07-03 14:00:37	2020-07-03 14:00:37	0.09553723	729	\N		337	\N	None	0.9787234	0.8679245	0.92	0.080628276	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 14:02:02	2020-07-03 14:02:02	2020-07-03 14:02:02	2020-07-03 14:02:02	0.98789424	730	\N		337	\N	None	1	0.9622642	0.9807692	0.7965969	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 14:04:02	2020-07-03 14:04:02	2020-07-03 14:04:02	2020-07-03 14:04:02	0.98828685	731	\N		337	\N	None	1	0.9622642	0.9807692	0.79764396	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 14:08:43	2020-07-03 14:08:43	2020-07-03 14:08:43	2020-07-03 14:08:43	0.96865594	732	\N		337	\N	None	1	0.9811321	0.9904762	0.79031414	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.2037037	0.33846155	2020-07-03 14:16:46	2020-07-03 14:16:46	2020-07-03 14:16:46	2020-07-03 14:16:46	0.3149457	733	\N		337	\N	None	1	0.21153846	0.34920636	0.32041883	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	0.962963	0.9811321	2020-07-03 14:59:17	2020-07-03 14:59:17	2020-07-03 14:59:17	2020-07-03 14:59:17	0.07891637	734	\N		338	\N	None	0.97959185	0.9056604	0.9411765	0.07356021	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 15:01:19	2020-07-03 15:01:19	2020-07-03 15:01:19	2020-07-03 15:01:19	0.98913753	735	\N		338	\N	None	1	0.9423077	0.97029704	0.7950262	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 15:05:05	2020-07-03 15:05:05	2020-07-03 15:05:05	2020-07-03 15:05:05	0.9884832	736	\N		338	\N	None	1	0.9245283	0.9607843	0.80314136	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 15:12:54	2020-07-03 15:12:54	2020-07-03 15:12:54	2020-07-03 15:12:54	0.9793221	737	\N		338	\N	None	1	0.9259259	0.96153843	0.7853403	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.16666667	0.2857143	2020-07-03 15:20:25	2020-07-03 15:20:25	2020-07-03 15:20:25	2020-07-03 15:20:25	0.13250883	738	\N		338	\N	None	1	0.1509434	0.26229507	0.13717277	\N	15282	3820	None
Simple Naive Bayes	\N	5	15285	3821	1	0.962963	0.9811321	2020-07-03 16:00:12	2020-07-03 16:00:12	2020-07-03 16:00:12	2020-07-03 16:00:12	0.07754221	739	\N		339	\N	None	0.9814815	1	0.99065423	0.087696336	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 16:01:26	2020-07-03 16:01:26	2020-07-03 16:01:26	2020-07-03 16:01:26	0.9852114	740	\N		339	\N	None	0.98039216	0.96153843	0.9708738	0.79581153	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 16:03:38	2020-07-03 16:03:38	2020-07-03 16:03:38	2020-07-03 16:03:38	0.9880251	741	\N		339	\N	None	0.98	0.9423077	0.9607843	0.8115183	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 16:15:54	2020-07-03 16:15:54	2020-07-03 16:15:54	2020-07-03 16:15:54	0.97906035	742	\N		339	\N	None	1	0.962963	0.9811321	0.7908377	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.14814815	0.2580645	2020-07-03 16:23:50	2020-07-03 16:23:50	2020-07-03 16:23:50	2020-07-03 16:23:50	0.12053396	743	\N		339	\N	None	1	0.1509434	0.26229507	0.12068063	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 17:55:53	2020-07-03 17:55:53	2020-07-03 17:55:53	2020-07-03 17:55:53	0.9899882	744	\N		340	\N	None	1	0.9622642	0.9807692	0.8243455	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 17:58:08	2020-07-03 17:58:08	2020-07-03 17:58:08	2020-07-03 17:58:08	0.98913753	745	\N		340	\N	None	1	0.96153843	0.98039216	0.83089006	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 18:11:05	2020-07-03 18:11:05	2020-07-03 18:11:05	2020-07-03 18:11:05	0.98233217	746	\N		340	\N	None	1	0.9074074	0.9514563	0.8078534	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-03 18:18:57	2020-07-03 18:18:57	2020-07-03 18:18:57	2020-07-03 18:18:57	0.09723858	747	\N		340	\N	None	1	0.03773585	0.07272727	0.09319372	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 19:38:55	2020-07-03 19:38:55	2020-07-03 19:38:55	2020-07-03 19:38:55	0.9897919	748	\N		341	\N	None	1	0.9811321	0.9904762	0.8230367	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 19:41:24	2020-07-03 19:41:24	2020-07-03 19:41:24	2020-07-03 19:41:24	0.9884832	749	\N		341	\N	None	1	0.9814815	0.99065423	0.8230367	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 19:54:37	2020-07-03 19:54:37	2020-07-03 19:54:37	2020-07-03 19:54:37	0.98429525	750	\N		341	\N	None	1	0.9074074	0.9514563	0.8041885	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.055555556	0.10526316	2020-07-03 20:02:18	2020-07-03 20:02:18	2020-07-03 20:02:18	2020-07-03 20:02:18	0.098874494	751	\N		341	\N	None	1	0.03773585	0.07272727	0.08664922	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-03 21:32:19	2020-07-03 21:32:19	2020-07-03 21:32:19	2020-07-03 21:32:19	0.98933387	752	\N		342	\N	None	1	0.9444444	0.9714286	0.82565445	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-03 21:34:21	2020-07-03 21:34:21	2020-07-03 21:34:21	2020-07-03 21:34:21	0.9883523	753	\N		342	\N	None	1	0.9622642	0.9807692	0.8206806	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-03 21:48:00	2020-07-03 21:48:00	2020-07-03 21:48:00	2020-07-03 21:48:00	0.980958	754	\N		342	\N	None	1	0.962963	0.9811321	0.7960733	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.037037037	0.071428575	2020-07-03 21:55:48	2020-07-03 21:55:48	2020-07-03 21:55:48	2020-07-03 21:55:48	0.095275484	755	\N		342	\N	None	1	0.018518519	0.036363635	0.09790576	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-04 02:39:58	2020-07-04 02:39:58	2020-07-04 02:39:58	2020-07-04 02:39:58	0.9897265	756	\N		343	\N	None	1	1	1	0.81387436	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-04 02:43:16	2020-07-04 02:43:16	2020-07-04 02:43:16	2020-07-04 02:43:16	0.9899882	757	\N		343	\N	None	1	0.96153843	0.98039216	0.80837697	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-04 02:56:16	2020-07-04 02:56:16	2020-07-04 02:56:16	2020-07-04 02:56:16	0.98213583	758	\N		343	\N	None	1	0.9245283	0.9607843	0.7947644	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.11111111	0.2	2020-07-04 03:06:08	2020-07-04 03:06:08	2020-07-04 03:06:08	2020-07-04 03:06:08	0.10921346	759	\N		343	\N	None	1	0.11111111	0.2	0.10811518	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-04 05:33:07	2020-07-04 05:33:07	2020-07-04 05:33:07	2020-07-04 05:33:07	0.9876325	760	\N		344	\N	None	0.9807692	0.9622642	0.9714286	0.8026178	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-04 05:36:30	2020-07-04 05:36:30	2020-07-04 05:36:30	2020-07-04 05:36:30	0.98966104	761	\N		344	\N	None	0.9791667	0.8867925	0.9306931	0.8167539	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-04 05:49:41	2020-07-04 05:49:41	2020-07-04 05:49:41	2020-07-04 05:49:41	0.9822013	762	\N		344	\N	None	1	0.9807692	0.99029124	0.79162306	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.09259259	0.16949153	2020-07-04 05:59:37	2020-07-04 05:59:37	2020-07-04 05:59:37	2020-07-04 05:59:37	0.10764298	763	\N		344	\N	None	1	0.11111111	0.2	0.11178011	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-04 08:32:29	2020-07-04 08:32:29	2020-07-04 08:32:29	2020-07-04 08:32:29	0.99025	764	\N		345	\N	None	1	1	1	0.7971204	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-04 08:35:31	2020-07-04 08:35:31	2020-07-04 08:35:31	2020-07-04 08:35:31	0.989203	765	\N		345	\N	None	1	0.9259259	0.96153843	0.7965969	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-04 08:49:51	2020-07-04 08:49:51	2020-07-04 08:49:51	2020-07-04 08:49:51	0.9793221	766	\N		345	\N	None	0.9811321	1	0.9904762	0.7832461	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.09259259	0.16949153	2020-07-04 08:58:21	2020-07-04 08:58:21	2020-07-04 08:58:21	2020-07-04 08:58:21	0.10352048	767	\N		345	\N	None	1	0.074074075	0.13793103	0.10314136	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-04 10:06:12	2020-07-04 10:06:12	2020-07-04 10:06:12	2020-07-04 10:06:12	0.9905117	768	\N		346	\N	None	1	0.8888889	0.9411765	0.815445	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-04 10:09:50	2020-07-04 10:09:50	2020-07-04 10:09:50	2020-07-04 10:09:50	0.98953015	769	\N		346	\N	None	1	0.9444444	0.9714286	0.82041883	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-04 10:34:38	2020-07-04 10:34:38	2020-07-04 10:34:38	2020-07-04 10:34:38	0.98279023	770	\N		346	\N	None	1	0.9259259	0.96153843	0.8062827	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.037037037	0.071428575	2020-07-04 10:48:08	2020-07-04 10:48:08	2020-07-04 10:48:08	2020-07-04 10:48:08	0.09632247	771	\N		346	\N	None	1	0.018867925	0.037037037	0.09371728	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-04 12:55:31	2020-07-04 12:55:31	2020-07-04 12:55:31	2020-07-04 12:55:31	0.989203	772	\N		347	\N	None	1	0.9622642	0.9807692	0.81649214	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-04 12:58:35	2020-07-04 12:58:35	2020-07-04 12:58:35	2020-07-04 12:58:35	0.9890067	773	\N		347	\N	None	1	0.90384614	0.94949496	0.80890054	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-04 13:16:08	2020-07-04 13:16:08	2020-07-04 13:16:08	2020-07-04 13:16:08	0.9802382	774	\N		347	\N	None	1	0.962963	0.9811321	0.79424083	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-04 13:27:22	2020-07-04 13:27:22	2020-07-04 13:27:22	2020-07-04 13:27:22	0.10286612	775	\N		347	\N	None	1	0.078431375	0.14545454	0.09528796	\N	15282	3820	None
Simple Naive Bayes	\N	5	15448	3862	1	1	1	2020-07-04 13:48:50	2020-07-04 13:48:50	2020-07-04 13:48:50	2020-07-04 13:48:50	0.27160895	776	\N		348	\N	None	0.9807692	0.9622642	0.9714286	0.25770527	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-04 13:49:48	2020-07-04 13:49:48	2020-07-04 13:49:48	2020-07-04 13:49:48	0.9834898	777	\N		348	\N	None	0.9807692	0.9622642	0.9714286	0.75835276	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-04 13:50:57	2020-07-04 13:50:57	2020-07-04 13:50:57	2020-07-04 13:50:57	0.96322435	778	\N		348	\N	None	1	0.9074074	0.9514563	0.78684276	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-04 13:52:02	2020-07-04 13:52:02	2020-07-04 13:52:02	2020-07-04 13:52:02	0.94516027	779	\N		348	\N	None	0.962963	1	0.9811321	0.75938874	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.4814815	0.65	2020-07-04 13:57:03	2020-07-04 13:57:03	2020-07-04 13:57:03	2020-07-04 13:57:03	0.540628	780	\N		348	\N	None	1	0.43396226	0.6052632	0.52680653	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	0.9814815	0.99065423	2020-07-04 14:20:28	2020-07-04 14:20:28	2020-07-04 14:20:28	2020-07-04 14:20:28	0.064033665	781	\N		349	\N	None	1	0.7962963	0.88659793	0.06034706	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-04 14:21:31	2020-07-04 14:21:31	2020-07-04 14:21:31	2020-07-04 14:21:31	0.9898349	782	\N		349	\N	None	1	0.9259259	0.96153843	0.8215488	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-04 14:22:55	2020-07-04 14:22:55	2020-07-04 14:22:55	2020-07-04 14:22:55	0.9853027	783	\N		349	\N	None	1	0.9245283	0.9607843	0.8130018	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-04 14:26:34	2020-07-04 14:26:34	2020-07-04 14:26:34	2020-07-04 14:26:34	0.98523796	784	\N		349	\N	None	1	1	1	0.8101528	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.09259259	0.16949153	2020-07-04 14:33:58	2020-07-04 14:33:58	2020-07-04 14:33:58	2020-07-04 14:33:58	0.104564585	785	\N		349	\N	None	1	0.09259259	0.16949153	0.10878011	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	1	1	2020-07-04 14:59:39	2020-07-04 14:59:39	2020-07-04 14:59:39	2020-07-04 14:59:39	0.0956944	786	\N		350	\N	None	0.9807692	0.9622642	0.9714286	0.09557109	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-04 15:01:27	2020-07-04 15:01:27	2020-07-04 15:01:27	2020-07-04 15:01:27	0.98989964	787	\N		350	\N	None	1	0.962963	0.9811321	0.8070448	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-04 15:03:35	2020-07-04 15:03:35	2020-07-04 15:03:35	2020-07-04 15:03:35	0.98135316	788	\N		350	\N	None	0.9791667	0.92156863	0.94949496	0.8101528	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-04 15:10:00	2020-07-04 15:10:00	2020-07-04 15:10:00	2020-07-04 15:10:00	0.98394305	789	\N		350	\N	None	0.9814815	1	0.99065423	0.7966848	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-04 15:17:59	2020-07-04 15:17:59	2020-07-04 15:17:59	2020-07-04 15:17:59	0.10203949	790	\N		350	\N	None	1	0.03773585	0.07272727	0.1033411	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	1	1	2020-07-04 15:43:08	2020-07-04 15:43:08	2020-07-04 15:43:08	2020-07-04 15:43:08	0.22563936	791	\N		351	\N	None	1	0.9814815	0.99065423	0.22766122	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-04 15:44:52	2020-07-04 15:44:52	2020-07-04 15:44:52	2020-07-04 15:44:52	0.9888637	792	\N		351	\N	None	0.96153843	0.96153843	0.96153843	0.7956488	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-04 15:46:59	2020-07-04 15:46:59	2020-07-04 15:46:59	2020-07-04 15:46:59	0.97915184	793	\N		351	\N	None	1	0.9433962	0.9708738	0.79461277	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-04 15:53:29	2020-07-04 15:53:29	2020-07-04 15:53:29	2020-07-04 15:53:29	0.9796698	794	\N		351	\N	None	1	0.9814815	0.99065423	0.80315983	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-04 16:01:15	2020-07-04 16:01:15	2020-07-04 16:01:15	2020-07-04 16:01:15	0.10495306	795	\N		351	\N	None	1	0.037037037	0.071428575	0.09168609	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	1	1	2020-07-04 16:26:41	2020-07-04 16:26:41	2020-07-04 16:26:41	2020-07-04 16:26:41	0.2062156	796	\N		352	\N	None	1	0.9444444	0.9714286	0.18673919	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-04 16:28:30	2020-07-04 16:28:30	2020-07-04 16:28:30	2020-07-04 16:28:30	0.98931694	797	\N		352	\N	None	1	0.9811321	0.9904762	0.8023828	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-04 16:30:57	2020-07-04 16:30:57	2020-07-04 16:30:57	2020-07-04 16:30:57	0.98620915	798	\N		352	\N	None	1	0.9622642	0.9807692	0.81869984	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-04 16:35:50	2020-07-04 16:35:50	2020-07-04 16:35:50	2020-07-04 16:35:50	0.9824539	799	\N		352	\N	None	0.9811321	1	0.9904762	0.7917638	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.2037037	0.33846155	2020-07-04 16:44:13	2020-07-04 16:44:13	2020-07-04 16:44:13	2020-07-04 16:44:13	0.28319845	800	\N		352	\N	None	1	0.2264151	0.36923078	0.26728827	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	1	1	2020-07-04 17:10:17	2020-07-04 17:10:17	2020-07-04 17:10:17	2020-07-04 17:10:17	0.10178051	801	\N		353	\N	None	0.96153843	0.96153843	0.96153843	0.10826211	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-04 17:12:08	2020-07-04 17:12:08	2020-07-04 17:12:08	2020-07-04 17:12:08	0.9897054	802	\N		353	\N	None	1	0.9814815	0.99065423	0.7915048	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-04 17:14:34	2020-07-04 17:14:34	2020-07-04 17:14:34	2020-07-04 17:14:34	0.9856264	803	\N		353	\N	None	1	0.9056604	0.95049506	0.8039368	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-04 17:21:22	2020-07-04 17:21:22	2020-07-04 17:21:22	2020-07-04 17:21:22	0.98368406	804	\N		353	\N	None	0.9814815	1	0.99065423	0.77233875	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.18518518	0.3125	2020-07-04 17:29:38	2020-07-04 17:29:38	2020-07-04 17:29:38	2020-07-04 17:29:38	0.20194237	805	\N		353	\N	None	1	0.1923077	0.32258064	0.1994302	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	1	1	2020-07-04 17:55:15	2020-07-04 17:55:15	2020-07-04 17:55:15	2020-07-04 17:55:15	0.122563936	806	\N		354	\N	None	0.9245283	0.98	0.9514563	0.13312614	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-04 17:57:00	2020-07-04 17:57:00	2020-07-04 17:57:00	2020-07-04 17:57:00	0.9895759	807	\N		354	\N	None	0.9811321	0.9811321	0.9811321	0.77907276	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-04 17:59:23	2020-07-04 17:59:23	2020-07-04 17:59:23	2020-07-04 17:59:23	0.98258334	808	\N		354	\N	None	1	0.9444444	0.9714286	0.7964258	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-04 18:05:58	2020-07-04 18:05:58	2020-07-04 18:05:58	2020-07-04 18:05:58	0.97733897	809	\N		354	\N	None	0.9811321	0.9811321	0.9811321	0.76094276	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.18518518	0.3125	2020-07-04 18:13:51	2020-07-04 18:13:51	2020-07-04 18:13:51	2020-07-04 18:13:51	0.23502752	810	\N		354	\N	None	1	0.18867925	0.31746033	0.22740223	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	0.9259259	0.96153843	2020-07-04 18:43:29	2020-07-04 18:43:29	2020-07-04 18:43:29	2020-07-04 18:43:29	0.05755908	811	\N		355	\N	None	0.97727275	0.8113208	0.88659793	0.054131053	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-04 18:45:38	2020-07-04 18:45:38	2020-07-04 18:45:38	2020-07-04 18:45:38	0.9900939	812	\N		355	\N	None	1	0.962963	0.9811321	0.81610984	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-04 18:48:10	2020-07-04 18:48:10	2020-07-04 18:48:10	2020-07-04 18:48:10	0.9869861	813	\N		355	\N	None	1	0.9074074	0.9514563	0.82543385	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-04 18:58:12	2020-07-04 18:58:12	2020-07-04 18:58:12	2020-07-04 18:58:12	0.98607963	814	\N		355	\N	None	0.9811321	0.9811321	0.9811321	0.8096348	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-04 19:07:44	2020-07-04 19:07:44	2020-07-04 19:07:44	2020-07-04 19:07:44	0.101715766	815	\N		355	\N	None	1	0.03773585	0.07272727	0.0979021	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	0.962963	0.9811321	2020-07-04 19:36:56	2020-07-04 19:36:56	2020-07-04 19:36:56	2020-07-04 19:36:56	0.063321464	816	\N		356	\N	None	0.93333334	0.8235294	0.875	0.064232066	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-04 19:38:59	2020-07-04 19:38:59	2020-07-04 19:38:59	2020-07-04 19:38:59	0.9891874	817	\N		356	\N	None	1	0.9622642	0.9807692	0.81792283	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-04 19:41:29	2020-07-04 19:41:29	2020-07-04 19:41:29	2020-07-04 19:41:29	0.9868566	818	\N		356	\N	None	1	0.9433962	0.9708738	0.8199948	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-04 19:50:42	2020-07-04 19:50:42	2020-07-04 19:50:42	2020-07-04 19:50:42	0.9820654	819	\N		356	\N	None	0.9814815	1	0.99065423	0.8122248	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-04 20:00:05	2020-07-04 20:00:05	2020-07-04 20:00:05	2020-07-04 20:00:05	0.10029136	820	\N		356	\N	None	1	0.03773585	0.07272727	0.10360011	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	0.962963	0.9811321	2020-07-04 20:29:23	2020-07-04 20:29:23	2020-07-04 20:29:23	2020-07-04 20:29:23	0.048883133	821	\N		357	\N	None	1	0.9259259	0.96153843	0.054390054	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-04 20:31:23	2020-07-04 20:31:23	2020-07-04 20:31:23	2020-07-04 20:31:23	0.9891227	822	\N		357	\N	None	1	0.962963	0.9811321	0.81429684	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-04 20:33:54	2020-07-04 20:33:54	2020-07-04 20:33:54	2020-07-04 20:33:54	0.9837488	823	\N		357	\N	None	1	0.9433962	0.9708738	0.8047138	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-04 20:44:49	2020-07-04 20:44:49	2020-07-04 20:44:49	2020-07-04 20:44:49	0.984979	824	\N		357	\N	None	1	0.9814815	0.99065423	0.7997928	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-04 20:53:47	2020-07-04 20:53:47	2020-07-04 20:53:47	2020-07-04 20:53:47	0.099579155	825	\N		357	\N	None	1	0.03773585	0.07272727	0.09686609	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	0.9814815	0.99065423	2020-07-04 21:23:29	2020-07-04 21:23:29	2020-07-04 21:23:29	2020-07-04 21:23:29	0.059048235	826	\N		358	\N	None	0.95454544	0.8076923	0.875	0.055167057	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-04 21:25:31	2020-07-04 21:25:31	2020-07-04 21:25:31	2020-07-04 21:25:31	0.9897054	827	\N		358	\N	None	1	0.9811321	0.9904762	0.8158508	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-04 21:28:20	2020-07-04 21:28:20	2020-07-04 21:28:20	2020-07-04 21:28:20	0.98866946	828	\N		358	\N	None	1	0.9622642	0.9807692	0.8127428	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-04 21:38:32	2020-07-04 21:38:32	2020-07-04 21:38:32	2020-07-04 21:38:32	0.9840725	829	\N		358	\N	None	0.9622642	0.9807692	0.9714286	0.7984978	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.12962963	0.22950819	2020-07-04 21:48:03	2020-07-04 21:48:03	2020-07-04 21:48:03	2020-07-04 21:48:03	0.1161541	830	\N		358	\N	None	1	0.11320755	0.20338982	0.11732712	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	0.9814815	0.99065423	2020-07-04 22:20:21	2020-07-04 22:20:21	2020-07-04 22:20:21	2020-07-04 22:20:21	0.07005503	831	\N		359	\N	None	0.97727275	0.8113208	0.88659793	0.05205905	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-04 22:22:47	2020-07-04 22:22:47	2020-07-04 22:22:47	2020-07-04 22:22:47	0.98964065	832	\N		359	\N	None	1	0.962963	0.9811321	0.8044548	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-04 22:26:10	2020-07-04 22:26:10	2020-07-04 22:26:10	2020-07-04 22:26:10	0.98873425	833	\N		359	\N	None	1	0.9230769	0.96	0.8119658	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-04 22:37:24	2020-07-04 22:37:24	2020-07-04 22:37:24	2020-07-04 22:37:24	0.9827776	834	\N		359	\N	None	0.9814815	1	0.99065423	0.7899508	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.14814815	0.2580645	2020-07-04 22:48:54	2020-07-04 22:48:54	2020-07-04 22:48:54	2020-07-04 22:48:54	0.11913241	835	\N		359	\N	None	1	0.12962963	0.22950819	0.11629111	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	0.962963	0.9811321	2020-07-04 23:26:09	2020-07-04 23:26:09	2020-07-04 23:26:09	2020-07-04 23:26:09	0.049789578	836	\N		360	\N	None	1	0.9056604	0.95049506	0.052836053	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-04 23:28:36	2020-07-04 23:28:36	2020-07-04 23:28:36	2020-07-04 23:28:36	0.9895112	837	\N		360	\N	None	1	0.9811321	0.9904762	0.7966848	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-04 23:32:01	2020-07-04 23:32:01	2020-07-04 23:32:01	2020-07-04 23:32:01	0.9873098	838	\N		360	\N	None	1	0.90384614	0.94949496	0.8034188	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-04 23:45:44	2020-07-04 23:45:44	2020-07-04 23:45:44	2020-07-04 23:45:44	0.9840725	839	\N		360	\N	None	0.9814815	1	0.99065423	0.78502977	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.11111111	0.2	2020-07-04 23:56:47	2020-07-04 23:56:47	2020-07-04 23:56:47	2020-07-04 23:56:47	0.11175138	840	\N		360	\N	None	1	0.11111111	0.2	0.10670811	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-05 02:11:53	2020-07-05 02:11:53	2020-07-05 02:11:53	2020-07-05 02:11:53	0.98964065	841	\N		361	\N	None	1	0.9245283	0.9607843	0.8080808	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-05 02:15:08	2020-07-05 02:15:08	2020-07-05 02:15:08	2020-07-05 02:15:08	0.9876335	842	\N		361	\N	None	1	0.9433962	0.9708738	0.8249158	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-05 02:31:05	2020-07-05 02:31:05	2020-07-05 02:31:05	2020-07-05 02:31:05	0.9867271	843	\N		361	\N	None	1	0.9622642	0.9807692	0.8127428	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-05 02:41:21	2020-07-05 02:41:21	2020-07-05 02:41:21	2020-07-05 02:41:21	0.099579155	844	\N		361	\N	None	1	0.03773585	0.07272727	0.09686609	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-05 05:59:58	2020-07-05 05:59:58	2020-07-05 05:59:58	2020-07-05 05:59:58	0.9906766	845	\N		362	\N	None	1	1	1	0.8140378	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-05 06:03:16	2020-07-05 06:03:16	2020-07-05 06:03:16	2020-07-05 06:03:16	0.98873425	846	\N		362	\N	None	1	0.9433962	0.9708738	0.81092983	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-05 06:17:35	2020-07-05 06:17:35	2020-07-05 06:17:35	2020-07-05 06:17:35	0.9845905	847	\N		362	\N	None	0.96153843	0.96153843	0.96153843	0.7979798	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.09259259	0.16949153	2020-07-05 06:28:09	2020-07-05 06:28:09	2020-07-05 06:28:09	2020-07-05 06:28:09	0.10689543	848	\N		362	\N	None	1	0.0754717	0.14035088	0.1020461	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	1	1	2020-07-05 06:48:16	2020-07-05 06:48:16	2020-07-05 06:48:16	2020-07-05 06:48:16	0.26474586	849	\N		363	\N	None	0.9811321	0.9811321	0.9811321	0.25174826	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-05 06:49:53	2020-07-05 06:49:53	2020-07-05 06:49:53	2020-07-05 06:49:53	0.9825186	850	\N		363	\N	None	1	0.962963	0.9811321	0.75835276	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-05 06:51:47	2020-07-05 06:51:47	2020-07-05 06:51:47	2020-07-05 06:51:47	0.9624474	851	\N		363	\N	None	1	0.9622642	0.9807692	0.7889148	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-05 06:53:36	2020-07-05 06:53:36	2020-07-05 06:53:36	2020-07-05 06:53:36	0.949304	852	\N		363	\N	None	0.9814815	1	0.99065423	0.7448847	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.4814815	0.65	2020-07-05 06:59:45	2020-07-05 06:59:45	2020-07-05 06:59:45	2020-07-05 06:59:45	0.5394626	853	\N		363	\N	None	1	0.41509435	0.58666664	0.52499354	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	0.9259259	0.96153843	2020-07-05 07:25:08	2020-07-05 07:25:08	2020-07-05 07:25:08	2020-07-05 07:25:08	0.070573	854	\N		364	\N	None	0.9268293	0.74509805	0.82608694	0.062937066	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-05 07:27:10	2020-07-05 07:27:10	2020-07-05 07:27:10	2020-07-05 07:27:10	0.9894464	855	\N		364	\N	None	0.98039216	0.96153843	0.9708738	0.82310283	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-05 07:29:34	2020-07-05 07:29:34	2020-07-05 07:29:34	2020-07-05 07:29:34	0.98705083	856	\N		364	\N	None	1	0.8888889	0.9411765	0.81792283	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-05 07:36:00	2020-07-05 07:36:00	2020-07-05 07:36:00	2020-07-05 07:36:00	0.9856912	857	\N		364	\N	None	0.9814815	1	0.99065423	0.8044548	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.074074075	0.13793103	2020-07-05 07:45:13	2020-07-05 07:45:13	2020-07-05 07:45:13	2020-07-05 07:45:13	0.104694076	858	\N		364	\N	None	1	0.055555556	0.10526316	0.103859104	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	1	1	2020-07-05 08:12:23	2020-07-05 08:12:23	2020-07-05 08:12:23	2020-07-05 08:12:23	0.15558434	859	\N		365	\N	None	1	0.9814815	0.99065423	0.15229215	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-05 08:14:32	2020-07-05 08:14:32	2020-07-05 08:14:32	2020-07-05 08:14:32	0.9898349	860	\N		365	\N	None	1	0.9245283	0.9607843	0.8269878	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-05 08:17:04	2020-07-05 08:17:04	2020-07-05 08:17:04	2020-07-05 08:17:04	0.98737454	861	\N		365	\N	None	1	0.9074074	0.9514563	0.8155918	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-05 08:27:08	2020-07-05 08:27:08	2020-07-05 08:27:08	2020-07-05 08:27:08	0.9868566	862	\N		365	\N	None	0.962963	1	0.9811321	0.81351984	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-05 08:36:17	2020-07-05 08:36:17	2020-07-05 08:36:17	2020-07-05 08:36:17	0.09938491	863	\N		365	\N	None	1	0.03773585	0.07272727	0.1015281	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	0.8333333	0.90909094	2020-07-05 09:04:17	2020-07-05 09:04:17	2020-07-05 09:04:17	2020-07-05 09:04:17	0.031142764	864	\N		366	\N	None	1	0.8333333	0.90909094	0.037814036	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-05 09:06:24	2020-07-05 09:06:24	2020-07-05 09:06:24	2020-07-05 09:06:24	0.99028814	865	\N		366	\N	None	0.98039216	0.98039216	0.98039216	0.8127428	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-05 09:09:22	2020-07-05 09:09:22	2020-07-05 09:09:22	2020-07-05 09:09:22	0.9867271	866	\N		366	\N	None	1	0.9433962	0.9708738	0.8085988	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-05 09:20:32	2020-07-05 09:20:32	2020-07-05 09:20:32	2020-07-05 09:20:32	0.98620915	867	\N		366	\N	None	1	1	1	0.8101528	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-05 09:27:47	2020-07-05 09:27:47	2020-07-05 09:27:47	2020-07-05 09:27:47	0.09925542	868	\N		366	\N	None	1	0.03773585	0.07272727	0.0981611	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	0.9444444	0.9714286	2020-07-05 09:49:30	2020-07-05 09:49:30	2020-07-05 09:49:30	2020-07-05 09:49:30	0.0728391	869	\N		367	\N	None	0.9459459	0.6730769	0.78651685	0.06086506	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-05 09:50:28	2020-07-05 09:50:28	2020-07-05 09:50:28	2020-07-05 09:50:28	0.99035287	870	\N		367	\N	None	1	0.9622642	0.9807692	0.8021238	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-05 09:51:54	2020-07-05 09:51:54	2020-07-05 09:51:54	2020-07-05 09:51:54	0.9881515	871	\N		367	\N	None	0.98	0.9245283	0.9514563	0.8233618	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-05 09:56:50	2020-07-05 09:56:50	2020-07-05 09:56:50	2020-07-05 09:56:50	0.9845905	872	\N		367	\N	None	1	1	1	0.8021238	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.2037037	0.33846155	2020-07-05 10:03:54	2020-07-05 10:03:54	2020-07-05 10:03:54	2020-07-05 10:03:54	0.23735836	873	\N		367	\N	None	1	0.18867925	0.31746033	0.23543124	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	0.8703704	0.9306931	2020-07-05 10:27:02	2020-07-05 10:27:02	2020-07-05 10:27:02	2020-07-05 10:27:02	0.056393653	874	\N		368	\N	None	0.9791667	0.8867925	0.9306931	0.05957006	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-05 10:28:10	2020-07-05 10:28:10	2020-07-05 10:28:10	2020-07-05 10:28:10	0.9894464	875	\N		368	\N	None	1	0.962963	0.9811321	0.8016058	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-05 10:29:53	2020-07-05 10:29:53	2020-07-05 10:29:53	2020-07-05 10:29:53	0.988022	876	\N		368	\N	None	1	0.9433962	0.9708738	0.8241388	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-05 10:38:00	2020-07-05 10:38:00	2020-07-05 10:38:00	2020-07-05 10:38:00	0.98264813	877	\N		368	\N	None	0.962963	1	0.9811321	0.7852888	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.12962963	0.22950819	2020-07-05 10:44:31	2020-07-05 10:44:31	2020-07-05 10:44:31	2020-07-05 10:44:31	0.11518291	878	\N		368	\N	None	1	0.11320755	0.20338982	0.11758612	\N	15445	3861	None
Simple Naive Bayes	\N	5	15448	3862	1	0.9814815	0.99065423	2020-07-05 11:06:40	2020-07-05 11:06:40	2020-07-05 11:06:40	2020-07-05 11:06:40	0.05820654	879	\N		369	\N	None	0.9782609	0.8490566	0.90909094	0.06138306	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-05 11:07:49	2020-07-05 11:07:49	2020-07-05 11:07:49	2020-07-05 11:07:49	0.9891227	880	\N		369	\N	None	0.98039216	0.96153843	0.9708738	0.8041958	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-05 11:09:52	2020-07-05 11:09:52	2020-07-05 11:09:52	2020-07-05 11:09:52	0.9878278	881	\N		369	\N	None	1	0.9245283	0.9607843	0.81170684	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-05 11:18:42	2020-07-05 11:18:42	2020-07-05 11:18:42	2020-07-05 11:18:42	0.9843962	882	\N		369	\N	None	0.9814815	1	0.99065423	0.77984977	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.11111111	0.2	2020-07-05 11:25:43	2020-07-05 11:25:43	2020-07-05 11:25:43	2020-07-05 11:25:43	0.111103915	883	\N		369	\N	None	1	0.11320755	0.20338982	0.11059311	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-05 12:48:46	2020-07-05 12:48:46	2020-07-05 12:48:46	2020-07-05 12:48:46	0.99035287	884	\N		370	\N	None	1	0.9433962	0.9708738	0.83087283	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-05 12:51:53	2020-07-05 12:51:53	2020-07-05 12:51:53	2020-07-05 12:51:53	0.98847526	885	\N		370	\N	None	1	0.9230769	0.96	0.83139086	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-05 13:04:30	2020-07-05 13:04:30	2020-07-05 13:04:30	2020-07-05 13:04:30	0.9857559	886	\N		370	\N	None	0.9814815	1	0.99065423	0.8096348	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-05 13:12:26	2020-07-05 13:12:26	2020-07-05 13:12:26	2020-07-05 13:12:26	0.100161865	887	\N		370	\N	None	1	0.018518519	0.036363635	0.0945351	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-05 14:12:39	2020-07-05 14:12:39	2020-07-05 14:12:39	2020-07-05 14:12:39	0.9895759	888	\N		371	\N	None	1	0.9074074	0.9514563	0.8363118	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-05 14:14:35	2020-07-05 14:14:35	2020-07-05 14:14:35	2020-07-05 14:14:35	0.9888637	889	\N		371	\N	None	1	0.9074074	0.9514563	0.8166278	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-05 14:27:27	2020-07-05 14:27:27	2020-07-05 14:27:27	2020-07-05 14:27:27	0.984461	890	\N		371	\N	None	0.9433962	1	0.9708738	0.82284385	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-05 14:35:18	2020-07-05 14:35:18	2020-07-05 14:35:18	2020-07-05 14:35:18	0.0996439	891	\N		371	\N	None	1	0.03773585	0.07272727	0.0966071	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-05 15:43:14	2020-07-05 15:43:14	2020-07-05 15:43:14	2020-07-05 15:43:14	0.98989964	892	\N		372	\N	None	1	0.9622642	0.9807692	0.8145558	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-05 15:45:52	2020-07-05 15:45:52	2020-07-05 15:45:52	2020-07-05 15:45:52	0.98847526	893	\N		372	\N	None	1	0.9245283	0.9607843	0.8207718	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-05 22:25:26	2020-07-05 22:25:26	2020-07-05 22:25:26	2020-07-05 22:25:26	0.9874393	894	\N		372	\N	None	1	1	1	0.8065268	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.018518519	0.036363635	2020-07-05 22:35:37	2020-07-05 22:35:37	2020-07-05 22:35:37	2020-07-05 22:35:37	0.09834898	895	\N		372	\N	None	1	0.018867925	0.037037037	0.098679096	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-05 22:55:02	2020-07-05 22:55:02	2020-07-05 22:55:02	2020-07-05 22:55:02	0.99048233	896	\N		373	\N	None	1	1	1	0.82465684	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-05 22:58:17	2020-07-05 22:58:17	2020-07-05 22:58:17	2020-07-05 22:58:17	0.9897702	897	\N		373	\N	None	1	0.96153843	0.98039216	0.82543385	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-05 23:12:23	2020-07-05 23:12:23	2020-07-05 23:12:23	2020-07-05 23:12:23	0.98607963	898	\N		373	\N	None	1	1	1	0.7992748	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.09259259	0.16949153	2020-07-05 23:22:45	2020-07-05 23:22:45	2020-07-05 23:22:45	2020-07-05 23:22:45	0.10676594	899	\N		373	\N	None	1	0.0754717	0.14035088	0.1023051	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-05 23:42:11	2020-07-05 23:42:11	2020-07-05 23:42:11	2020-07-05 23:42:11	0.9900939	900	\N		374	\N	None	1	0.9622642	0.9807692	0.8192178	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-05 23:45:30	2020-07-05 23:45:30	2020-07-05 23:45:30	2020-07-05 23:45:30	0.99035287	901	\N		374	\N	None	1	0.9622642	0.9807692	0.8145558	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-06 00:00:30	2020-07-06 00:00:30	2020-07-06 00:00:30	2020-07-06 00:00:30	0.9869861	902	\N		374	\N	None	0.9814815	1	0.99065423	0.80574983	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.09259259	0.16949153	2020-07-06 00:10:49	2020-07-06 00:10:49	2020-07-06 00:10:49	2020-07-06 00:10:49	0.10579476	903	\N		374	\N	None	1	0.0754717	0.14035088	0.1015281	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-06 00:28:49	2020-07-06 00:28:49	2020-07-06 00:28:49	2020-07-06 00:28:49	0.98964065	904	\N		375	\N	None	1	0.9814815	0.99065423	0.8199948	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-06 00:31:49	2020-07-06 00:31:49	2020-07-06 00:31:49	2020-07-06 00:31:49	0.98931694	905	\N		375	\N	None	1	0.9811321	0.9904762	0.8249158	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-06 00:46:47	2020-07-06 00:46:47	2020-07-06 00:46:47	2020-07-06 00:46:47	0.9862739	906	\N		375	\N	None	1	1	1	0.7940948	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.055555556	0.10526316	2020-07-06 00:55:21	2020-07-06 00:55:21	2020-07-06 00:55:21	2020-07-06 00:55:21	0.10262221	907	\N		375	\N	None	1	0.056603774	0.10714286	0.1033411	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-06 01:12:07	2020-07-06 01:12:07	2020-07-06 01:12:07	2020-07-06 01:12:07	0.9901586	908	\N		376	\N	None	1	0.9811321	0.9904762	0.8197358	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-06 01:15:12	2020-07-06 01:15:12	2020-07-06 01:15:12	2020-07-06 01:15:12	0.9895112	909	\N		376	\N	None	1	0.9074074	0.9514563	0.8321678	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-06 01:34:27	2020-07-06 01:34:27	2020-07-06 01:34:27	2020-07-06 01:34:27	0.98517317	910	\N		376	\N	None	1	1	1	0.8070448	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.018518519	0.036363635	2020-07-06 01:44:12	2020-07-06 01:44:12	2020-07-06 01:44:12	2020-07-06 01:44:12	0.09867271	911	\N		376	\N	None	1	0.018867925	0.037037037	0.097384095	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-06 02:00:51	2020-07-06 02:00:51	2020-07-06 02:00:51	2020-07-06 02:00:51	0.9898349	912	\N		377	\N	None	1	0.9811321	0.9904762	0.81869984	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-06 02:04:18	2020-07-06 02:04:18	2020-07-06 02:04:18	2020-07-06 02:04:18	0.9895759	913	\N		377	\N	None	1	0.9433962	0.9708738	0.82387984	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-06 02:22:18	2020-07-06 02:22:18	2020-07-06 02:22:18	2020-07-06 02:22:18	0.9872451	914	\N		377	\N	None	0.9814815	1	0.99065423	0.8189588	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.055555556	0.10526316	2020-07-06 02:32:08	2020-07-06 02:32:08	2020-07-06 02:32:08	2020-07-06 02:32:08	0.101586275	915	\N		377	\N	None	1	0.03846154	0.074074075	0.1046361	\N	15445	3861	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 02:58:36	2020-07-06 02:58:36	2020-07-06 02:58:36	2020-07-06 02:58:36	0.9990467	916	\N		378	\N	None	1	0.92	0.9583333	0.79796696	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 02:59:41	2020-07-06 02:59:41	2020-07-06 02:59:41	2020-07-06 02:59:41	0.9990467	917	\N		378	\N	None	0.9777778	0.9166667	0.94623655	0.8297332	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 03:00:41	2020-07-06 03:00:41	2020-07-06 03:00:41	2020-07-06 03:00:41	0.98919606	918	\N		378	\N	None	0.9583333	0.92	0.93877554	0.7801779	\N	3147	787	None
SVC	\N	5	3150	788	1	0.6666667	0.8	2020-07-06 03:01:58	2020-07-06 03:01:58	2020-07-06 03:01:58	2020-07-06 03:01:58	0.7324436	919	\N		378	\N	None	1	0.65957445	0.7948718	0.66200763	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 03:28:05	2020-07-06 03:28:05	2020-07-06 03:28:05	2020-07-06 03:28:05	0.99872893	920	\N		379	\N	None	0.9782609	0.88235295	0.92783505	0.8043202	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 03:29:23	2020-07-06 03:29:23	2020-07-06 03:29:23	2020-07-06 03:29:23	0.9990467	921	\N		379	\N	None	0.97619045	0.82	0.8913044	0.82592124	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9814815	0.99065423	2020-07-06 03:30:54	2020-07-06 03:30:54	2020-07-06 03:30:54	2020-07-06 03:30:54	0.9942803	922	\N		379	\N	None	0.95454544	0.875	0.9130435	0.80559087	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2777778	0.4347826	2020-07-06 03:32:26	2020-07-06 03:32:26	2020-07-06 03:32:26	2020-07-06 03:32:26	0.3336511	923	\N		379	\N	None	1	0.19607843	0.32786885	0.30495554	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 03:58:31	2020-07-06 03:58:31	2020-07-06 03:58:31	2020-07-06 03:58:31	0.9993645	924	\N		380	\N	None	0.9166667	0.95652175	0.9361702	0.83227444	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 03:59:47	2020-07-06 03:59:47	2020-07-06 03:59:47	2020-07-06 03:59:47	0.9984112	925	\N		380	\N	None	0.9791667	0.9591837	0.96907216	0.8246506	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 04:01:18	2020-07-06 04:01:18	2020-07-06 04:01:18	2020-07-06 04:01:18	0.9853829	926	\N		380	\N	None	0.9318182	0.8541667	0.8913044	0.78907245	\N	3147	787	None
SVC	\N	5	3150	788	1	0.22222222	0.36363637	2020-07-06 04:02:45	2020-07-06 04:02:45	2020-07-06 04:02:45	2020-07-06 04:02:45	0.29742613	927	\N		380	\N	None	1	0.26666668	0.42105263	0.28208387	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 04:29:09	2020-07-06 04:29:09	2020-07-06 04:29:09	2020-07-06 04:29:09	0.99872893	928	\N		381	\N	None	0.9777778	0.8627451	0.9166667	0.82592124	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 04:30:23	2020-07-06 04:30:23	2020-07-06 04:30:23	2020-07-06 04:30:23	0.9984112	929	\N		381	\N	None	0.9767442	0.85714287	0.9130435	0.8081322	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 04:31:48	2020-07-06 04:31:48	2020-07-06 04:31:48	2020-07-06 04:31:48	0.9596441	930	\N		381	\N	None	0.875	0.9130435	0.89361703	0.77890724	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2962963	0.45714286	2020-07-06 04:33:13	2020-07-06 04:33:13	2020-07-06 04:33:13	2020-07-06 04:33:13	0.33333334	931	\N		381	\N	None	1	0.23529412	0.3809524	0.32401526	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 04:59:20	2020-07-06 04:59:20	2020-07-06 04:59:20	2020-07-06 04:59:20	0.99872893	932	\N		382	\N	None	0.94	0.94	0.94	0.78653115	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 05:00:45	2020-07-06 05:00:45	2020-07-06 05:00:45	2020-07-06 05:00:45	0.9990467	933	\N		382	\N	None	1	0.85714287	0.9230769	0.8271919	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 05:02:16	2020-07-06 05:02:16	2020-07-06 05:02:16	2020-07-06 05:02:16	0.9965046	934	\N		382	\N	None	0.9574468	0.9183673	0.9375	0.80050826	\N	3147	787	None
SVC	\N	5	3150	788	1	0.37037036	0.5405405	2020-07-06 05:03:45	2020-07-06 05:03:45	2020-07-06 05:03:45	2020-07-06 05:03:45	0.4795043	935	\N		382	\N	None	1	0.35416666	0.52307695	0.46886912	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 05:29:42	2020-07-06 05:29:42	2020-07-06 05:29:42	2020-07-06 05:29:42	0.9984112	936	\N		383	\N	None	0.9375	0.9	0.9183673	0.7700127	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 05:31:06	2020-07-06 05:31:06	2020-07-06 05:31:06	2020-07-06 05:31:06	0.99872893	937	\N		383	\N	None	0.95555556	0.8958333	0.9247312	0.8170267	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 05:32:38	2020-07-06 05:32:38	2020-07-06 05:32:38	2020-07-06 05:32:38	0.99110264	938	\N		383	\N	None	0.9782609	0.9	0.9375	0.80559087	\N	3147	787	None
SVC	\N	5	3150	788	1	0.35185185	0.5205479	2020-07-06 05:34:03	2020-07-06 05:34:03	2020-07-06 05:34:03	2020-07-06 05:34:03	0.4674293	939	\N		383	\N	None	1	0.375	0.54545456	0.44345617	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 06:00:05	2020-07-06 06:00:05	2020-07-06 06:00:05	2020-07-06 06:00:05	0.9980934	940	\N		384	\N	None	0.95555556	0.9148936	0.9347826	0.8170267	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 06:01:23	2020-07-06 06:01:23	2020-07-06 06:01:23	2020-07-06 06:01:23	0.9990467	941	\N		384	\N	None	0.9777778	0.8979592	0.9361702	0.8271919	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 06:02:50	2020-07-06 06:02:50	2020-07-06 06:02:50	2020-07-06 06:02:50	0.9818875	942	\N		384	\N	None	0.8888889	0.8333333	0.86021507	0.80050826	\N	3147	787	None
SVC	\N	5	3150	788	1	0.3962264	0.5675676	2020-07-06 06:04:15	2020-07-06 06:04:15	2020-07-06 06:04:15	2020-07-06 06:04:15	0.48331743	943	\N		384	\N	None	1	0.36734694	0.53731346	0.4599746	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 06:30:36	2020-07-06 06:30:36	2020-07-06 06:30:36	2020-07-06 06:30:36	0.9990467	944	\N		385	\N	None	0.9375	0.9375	0.9375	0.8081322	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 06:32:05	2020-07-06 06:32:05	2020-07-06 06:32:05	2020-07-06 06:32:05	0.9990467	945	\N		385	\N	None	0.95454544	0.89361703	0.9230769	0.8360864	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9814815	0.99065423	2020-07-06 06:34:16	2020-07-06 06:34:16	2020-07-06 06:34:16	2020-07-06 06:34:16	0.98697174	946	\N		385	\N	None	0.95652175	0.88	0.9166667	0.79796696	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2037037	0.33846155	2020-07-06 06:35:55	2020-07-06 06:35:55	2020-07-06 06:35:55	2020-07-06 06:35:55	0.23991102	947	\N		385	\N	None	1	0.18867925	0.31746033	0.2249047	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 07:02:01	2020-07-06 07:02:01	2020-07-06 07:02:01	2020-07-06 07:02:01	0.99872893	948	\N		386	\N	None	0.95348835	0.87234044	0.9111111	0.8335451	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 07:03:32	2020-07-06 07:03:32	2020-07-06 07:03:32	2020-07-06 07:03:32	0.9984112	949	\N		386	\N	None	0.97727275	0.84313726	0.9052632	0.8602287	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 07:05:32	2020-07-06 07:05:32	2020-07-06 07:05:32	2020-07-06 07:05:32	0.99459803	950	\N		386	\N	None	0.95348835	0.8913044	0.92134833	0.7916137	\N	3147	787	None
SVC	\N	5	3150	788	1	0.22222222	0.36363637	2020-07-06 07:07:09	2020-07-06 07:07:09	2020-07-06 07:07:09	2020-07-06 07:07:09	0.24213536	951	\N		386	\N	None	1	0.22	0.36065573	0.22236341	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 07:33:12	2020-07-06 07:33:12	2020-07-06 07:33:12	2020-07-06 07:33:12	0.99872893	952	\N		387	\N	None	0.9787234	0.93877554	0.9583333	0.815756	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 07:34:38	2020-07-06 07:34:38	2020-07-06 07:34:38	2020-07-06 07:34:38	0.9984112	953	\N		387	\N	None	1	0.94	0.96907216	0.8132147	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 07:36:36	2020-07-06 07:36:36	2020-07-06 07:36:36	2020-07-06 07:36:36	0.98824275	954	\N		387	\N	None	0.9130435	0.9130435	0.9130435	0.8246506	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2037037	0.33846155	2020-07-06 07:38:09	2020-07-06 07:38:09	2020-07-06 07:38:09	2020-07-06 07:38:09	0.2281538	955	\N		387	\N	None	1	0.20833333	0.3448276	0.2249047	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 08:04:20	2020-07-06 08:04:20	2020-07-06 08:04:20	2020-07-06 08:04:20	0.99872893	956	\N		388	\N	None	0.9318182	0.8541667	0.8913044	0.80050826	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 08:06:00	2020-07-06 08:06:00	2020-07-06 08:06:00	2020-07-06 08:06:00	0.99872893	957	\N		388	\N	None	1	0.94	0.96907216	0.8221093	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 08:08:09	2020-07-06 08:08:09	2020-07-06 08:08:09	2020-07-06 08:08:09	0.9907849	958	\N		388	\N	None	0.9148936	0.9148936	0.9148936	0.7700127	\N	3147	787	None
SVC	\N	5	3150	788	1	0.33333334	0.5	2020-07-06 08:09:45	2020-07-06 08:09:45	2020-07-06 08:09:45	2020-07-06 08:09:45	0.4022879	959	\N		388	\N	None	1	0.2857143	0.44444445	0.37738246	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 08:36:12	2020-07-06 08:36:12	2020-07-06 08:36:12	2020-07-06 08:36:12	0.9990467	960	\N		389	\N	None	0.93877554	0.9583333	0.9484536	0.80559087	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 08:37:37	2020-07-06 08:37:37	2020-07-06 08:37:37	2020-07-06 08:37:37	0.9990467	961	\N		389	\N	None	0.95555556	0.8958333	0.9247312	0.8386277	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 08:39:13	2020-07-06 08:39:13	2020-07-06 08:39:13	2020-07-06 08:39:13	0.99618685	962	\N		389	\N	None	0.97727275	0.8958333	0.9347826	0.82083863	\N	3147	787	None
SVC	\N	5	3150	788	1	0.33333334	0.5	2020-07-06 08:40:21	2020-07-06 08:40:21	2020-07-06 08:40:21	2020-07-06 08:40:21	0.39434382	963	\N		389	\N	None	1	0.31914893	0.48387095	0.39263025	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 09:10:29	2020-07-06 09:10:29	2020-07-06 09:10:29	2020-07-06 09:10:29	0.9984112	964	\N		390	\N	None	0.9777778	0.9166667	0.94623655	0.8335451	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 09:12:23	2020-07-06 09:12:23	2020-07-06 09:12:24	2020-07-06 09:12:24	0.9993645	965	\N		390	\N	None	0.9782609	0.9	0.9375	0.8132147	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 09:14:52	2020-07-06 09:14:52	2020-07-06 09:14:52	2020-07-06 09:14:52	0.99046713	966	\N		390	\N	None	0.93333334	0.89361703	0.9130435	0.8043202	\N	3147	787	None
SVC	\N	5	3150	788	1	0.35185185	0.5205479	2020-07-06 09:16:07	2020-07-06 09:16:07	2020-07-06 09:16:07	2020-07-06 09:16:07	0.40864316	967	\N		390	\N	None	1	0.2857143	0.44444445	0.3939009	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 09:51:16	2020-07-06 09:51:16	2020-07-06 09:51:16	2020-07-06 09:51:16	0.9990467	968	\N		391	\N	None	0.9318182	0.87234044	0.9010989	0.84243965	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 09:52:57	2020-07-06 09:52:57	2020-07-06 09:52:57	2020-07-06 09:52:57	0.99872893	969	\N		391	\N	None	1	0.86	0.9247312	0.82592124	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 09:54:51	2020-07-06 09:54:51	2020-07-06 09:54:51	2020-07-06 09:54:51	0.9971401	970	\N		391	\N	None	0.95454544	0.84	0.89361703	0.80050826	\N	3147	787	None
SVC	\N	5	3150	788	1	0.18518518	0.3125	2020-07-06 09:56:01	2020-07-06 09:56:01	2020-07-06 09:56:01	2020-07-06 09:56:01	0.1912933	971	\N		391	\N	None	1	0.18	0.30508474	0.20838627	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 10:22:22	2020-07-06 10:22:22	2020-07-06 10:22:22	2020-07-06 10:22:22	0.99872893	972	\N		392	\N	None	0.95454544	0.875	0.9130435	0.8081322	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 10:23:36	2020-07-06 10:23:36	2020-07-06 10:23:36	2020-07-06 10:23:36	0.9993645	973	\N		392	\N	None	0.9787234	0.9019608	0.93877554	0.8310038	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 10:26:11	2020-07-06 10:26:11	2020-07-06 10:26:11	2020-07-06 10:26:11	0.99173814	974	\N		392	\N	None	0.95348835	0.82	0.8817204	0.80304956	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2777778	0.4347826	2020-07-06 10:27:30	2020-07-06 10:27:30	2020-07-06 10:27:30	2020-07-06 10:27:30	0.35430568	975	\N		392	\N	None	1	0.26530612	0.41935483	0.36594662	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 11:03:42	2020-07-06 11:03:42	2020-07-06 11:03:42	2020-07-06 11:03:42	0.9977757	976	\N		393	\N	None	0.95652175	0.88	0.9166667	0.8170267	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 11:04:46	2020-07-06 11:04:46	2020-07-06 11:04:46	2020-07-06 11:04:46	0.9984112	977	\N		393	\N	None	0.97727275	0.86	0.9148936	0.83989835	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 11:05:44	2020-07-06 11:05:44	2020-07-06 11:05:44	2020-07-06 11:05:44	0.9914204	978	\N		393	\N	None	0.9347826	0.877551	0.9052632	0.78398985	\N	3147	787	None
SVC	\N	5	3150	788	1	0.6481481	0.78651685	2020-07-06 11:06:50	2020-07-06 11:06:50	2020-07-06 11:06:50	2020-07-06 11:06:50	0.74165875	979	\N		393	\N	None	1	0.6	0.75	0.6404066	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 11:32:17	2020-07-06 11:32:17	2020-07-06 11:32:17	2020-07-06 11:32:17	0.9993645	980	\N		394	\N	None	0.95652175	0.88	0.9166667	0.81194407	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 11:33:11	2020-07-06 11:33:11	2020-07-06 11:33:11	2020-07-06 11:33:11	0.9993645	981	\N		394	\N	None	0.95238096	0.81632656	0.8791209	0.8144854	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 11:34:35	2020-07-06 11:34:35	2020-07-06 11:34:35	2020-07-06 11:34:35	0.99269146	982	\N		394	\N	None	1	0.88	0.9361702	0.80304956	\N	3147	787	None
SVC	\N	5	3150	788	1	0.24074075	0.3880597	2020-07-06 11:35:54	2020-07-06 11:35:54	2020-07-06 11:35:54	2020-07-06 11:35:54	0.2650143	983	\N		394	\N	None	1	0.2173913	0.35714287	0.26048285	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 12:00:02	2020-07-06 12:00:02	2020-07-06 12:00:02	2020-07-06 12:00:02	0.9984112	984	\N		395	\N	None	0.93333334	0.89361703	0.9130435	0.78653115	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 12:01:08	2020-07-06 12:01:08	2020-07-06 12:01:08	2020-07-06 12:01:08	0.9990467	985	\N		395	\N	None	1	0.9019608	0.9484536	0.8360864	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9814815	0.99065423	2020-07-06 12:03:07	2020-07-06 12:03:07	2020-07-06 12:03:07	2020-07-06 12:03:07	0.987925	986	\N		395	\N	None	0.9130435	0.875	0.89361703	0.77382463	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2037037	0.33846155	2020-07-06 12:04:35	2020-07-06 12:04:35	2020-07-06 12:04:35	2020-07-06 12:04:35	0.18811567	987	\N		395	\N	None	1	0.18367347	0.31034482	0.1956798	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 12:31:38	2020-07-06 12:31:38	2020-07-06 12:31:38	2020-07-06 12:31:38	0.9990467	988	\N		396	\N	None	0.89361703	0.93333334	0.9130435	0.8068615	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 12:32:45	2020-07-06 12:32:45	2020-07-06 12:32:45	2020-07-06 12:32:45	0.9990467	989	\N		396	\N	None	0.9777778	0.88	0.9263158	0.8246506	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9814815	0.99065423	2020-07-06 12:35:08	2020-07-06 12:35:08	2020-07-06 12:35:08	2020-07-06 12:35:08	0.98919606	990	\N		396	\N	None	0.97727275	0.877551	0.9247312	0.815756	\N	3147	787	None
SVC	\N	5	3150	788	1	0.18518518	0.3125	2020-07-06 12:36:21	2020-07-06 12:36:21	2020-07-06 12:36:21	2020-07-06 12:36:21	0.1731808	991	\N		396	\N	None	1	0.17021276	0.29090908	0.1956798	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 13:01:30	2020-07-06 13:01:30	2020-07-06 13:01:30	2020-07-06 13:01:30	0.9984112	992	\N		397	\N	None	1	0.88461536	0.93877554	0.80050826	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 13:02:32	2020-07-06 13:02:32	2020-07-06 13:02:32	2020-07-06 13:02:32	0.99872893	993	\N		397	\N	None	0.975	0.79591835	0.8764045	0.82337993	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 13:03:51	2020-07-06 13:03:51	2020-07-06 13:03:51	2020-07-06 13:03:51	0.9901493	994	\N		397	\N	None	0.95555556	0.84313726	0.8958333	0.79542565	\N	3147	787	None
SVC	\N	5	3150	788	1	0.33962265	0.5070422	2020-07-06 13:04:48	2020-07-06 13:04:48	2020-07-06 13:04:48	2020-07-06 13:04:48	0.43279314	995	\N		397	\N	None	1	0.34	0.5074627	0.38754764	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 13:35:06	2020-07-06 13:35:06	2020-07-06 13:35:06	2020-07-06 13:35:06	0.9990467	996	\N		398	\N	None	0.9777778	0.9166667	0.94623655	0.8182973	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 13:36:10	2020-07-06 13:36:10	2020-07-06 13:36:10	2020-07-06 13:36:10	0.99872893	997	\N		398	\N	None	1	0.88	0.9361702	0.815756	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 13:37:50	2020-07-06 13:37:50	2020-07-06 13:37:50	2020-07-06 13:37:50	0.9828408	998	\N		398	\N	None	0.9782609	0.88235295	0.92783505	0.794155	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2777778	0.4347826	2020-07-06 13:38:47	2020-07-06 13:38:47	2020-07-06 13:38:47	2020-07-06 13:38:47	0.37178266	999	\N		398	\N	None	1	0.26086956	0.41379312	0.35324016	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 14:01:42	2020-07-06 14:01:42	2020-07-06 14:01:42	2020-07-06 14:01:42	1	1000	\N		399	\N	None	1	0.86	0.9247312	0.815756	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 14:02:47	2020-07-06 14:02:47	2020-07-06 14:02:47	2020-07-06 14:02:47	0.99872893	1001	\N		399	\N	None	0.97727275	0.86	0.9148936	0.83989835	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 14:05:03	2020-07-06 14:05:03	2020-07-06 14:05:03	2020-07-06 14:05:03	0.98983157	1002	\N		399	\N	None	0.95555556	0.9347826	0.94505495	0.78398985	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2962963	0.45714286	2020-07-06 14:06:17	2020-07-06 14:06:17	2020-07-06 14:06:17	2020-07-06 14:06:17	0.35430568	1003	\N		399	\N	None	1	0.26086956	0.41379312	0.33163914	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 14:34:55	2020-07-06 14:34:55	2020-07-06 14:34:55	2020-07-06 14:34:55	0.9990467	1004	\N		400	\N	None	0.9777778	0.8979592	0.9361702	0.81194407	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 14:36:10	2020-07-06 14:36:10	2020-07-06 14:36:10	2020-07-06 14:36:10	0.99872893	1005	\N		400	\N	None	0.97619045	0.8541667	0.9111111	0.8297332	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 14:38:47	2020-07-06 14:38:47	2020-07-06 14:38:47	2020-07-06 14:38:47	0.9936447	1006	\N		400	\N	None	0.9782609	0.88235295	0.92783505	0.7878018	\N	3147	787	None
SVC	\N	5	3150	788	1	0.16666667	0.2857143	2020-07-06 14:40:02	2020-07-06 14:40:02	2020-07-06 14:40:02	2020-07-06 14:40:02	0.16428344	1007	\N		400	\N	None	1	0.16666667	0.2857143	0.1639136	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 15:02:37	2020-07-06 15:02:37	2020-07-06 15:02:37	2020-07-06 15:02:37	0.9990467	1008	\N		401	\N	None	1	0.9591837	0.9791667	0.82337993	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 15:04:14	2020-07-06 15:04:14	2020-07-06 15:04:14	2020-07-06 15:04:14	0.9993645	1009	\N		401	\N	None	0.9318182	0.9111111	0.92134833	0.8310038	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 15:07:09	2020-07-06 15:07:09	2020-07-06 15:07:09	2020-07-06 15:07:09	0.9958691	1010	\N		401	\N	None	0.9574468	0.9574468	0.9574468	0.80559087	\N	3147	787	None
SVC	\N	5	3150	788	1	0.14814815	0.2580645	2020-07-06 15:08:28	2020-07-06 15:08:28	2020-07-06 15:08:28	2020-07-06 15:08:28	0.15824595	1011	\N		401	\N	None	1	0.14285715	0.25	0.158831	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 15:37:37	2020-07-06 15:37:37	2020-07-06 15:37:37	2020-07-06 15:37:37	0.99872893	1012	\N		402	\N	None	1	0.8958333	0.94505495	0.8310038	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 15:39:05	2020-07-06 15:39:05	2020-07-06 15:39:05	2020-07-06 15:39:05	0.9990467	1013	\N		402	\N	None	0.97619045	0.8367347	0.9010989	0.82337993	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 15:42:21	2020-07-06 15:42:21	2020-07-06 15:42:21	2020-07-06 15:42:21	0.99618685	1014	\N		402	\N	None	0.9777778	0.88	0.9263158	0.8182973	\N	3147	787	None
SVC	\N	5	3150	788	1	0.11111111	0.2	2020-07-06 15:43:44	2020-07-06 15:43:44	2020-07-06 15:43:44	2020-07-06 15:43:44	0.12837623	1015	\N		402	\N	None	1	0.09615385	0.1754386	0.11817027	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 16:08:40	2020-07-06 16:08:40	2020-07-06 16:08:40	2020-07-06 16:08:40	0.99872893	1016	\N		403	\N	None	1	0.9	0.94736844	0.8132147	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 16:10:14	2020-07-06 16:10:14	2020-07-06 16:10:14	2020-07-06 16:10:14	0.9990467	1017	\N		403	\N	None	0.9318182	0.8367347	0.8817204	0.8246506	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 16:14:12	2020-07-06 16:14:12	2020-07-06 16:14:12	2020-07-06 16:14:12	0.99618685	1018	\N		403	\N	None	0.95555556	0.9347826	0.94505495	0.8271919	\N	3147	787	None
SVC	\N	5	3150	788	1	0.25925925	0.4117647	2020-07-06 16:16:03	2020-07-06 16:16:03	2020-07-06 16:16:03	2020-07-06 16:16:03	0.3231649	1019	\N		403	\N	None	1	0.23404256	0.37931034	0.32528588	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 16:46:14	2020-07-06 16:46:14	2020-07-06 16:46:14	2020-07-06 16:46:14	0.9990467	1020	\N		404	\N	None	1	0.8867925	0.94	0.81194407	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 16:48:19	2020-07-06 16:48:19	2020-07-06 16:48:19	2020-07-06 16:48:19	0.9990467	1021	\N		404	\N	None	0.95454544	0.84	0.89361703	0.82337993	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 16:51:12	2020-07-06 16:51:12	2020-07-06 16:51:12	2020-07-06 16:51:12	0.9930092	1022	\N		404	\N	None	0.9782609	0.86538464	0.9183673	0.7852605	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2777778	0.4347826	2020-07-06 16:52:22	2020-07-06 16:52:22	2020-07-06 16:52:22	2020-07-06 16:52:22	0.30537018	1023	\N		404	\N	None	1	0.25	0.4	0.28716645	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 17:14:31	2020-07-06 17:14:31	2020-07-06 17:14:31	2020-07-06 17:14:31	0.9990467	1024	\N		405	\N	None	0.95454544	0.89361703	0.9230769	0.82337993	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 17:16:11	2020-07-06 17:16:11	2020-07-06 17:16:11	2020-07-06 17:16:11	0.99872893	1025	\N		405	\N	None	0.9767442	0.8076923	0.8842105	0.78144854	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 17:19:32	2020-07-06 17:19:32	2020-07-06 17:19:32	2020-07-06 17:19:32	0.99046713	1026	\N		405	\N	None	0.95454544	0.84	0.89361703	0.8068615	\N	3147	787	None
SVC	\N	5	3150	788	1	0.22222222	0.36363637	2020-07-06 17:20:51	2020-07-06 17:20:51	2020-07-06 17:20:51	2020-07-06 17:20:51	0.2745472	1027	\N		405	\N	None	1	0.22222222	0.36363637	0.27191868	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 17:43:38	2020-07-06 17:43:38	2020-07-06 17:43:38	2020-07-06 17:43:38	0.99872893	1028	\N		406	\N	None	0.9791667	0.92156863	0.94949496	0.841169	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 17:45:30	2020-07-06 17:45:30	2020-07-06 17:45:30	2020-07-06 17:45:30	0.99872893	1029	\N		406	\N	None	0.97727275	0.8958333	0.9347826	0.8271919	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 17:49:40	2020-07-06 17:49:40	2020-07-06 17:49:40	2020-07-06 17:49:40	0.9888783	1030	\N		406	\N	None	0.8888889	0.8888889	0.8888889	0.8043202	\N	3147	787	None
SVC	\N	5	3150	788	1	0.11111111	0.2	2020-07-06 17:51:07	2020-07-06 17:51:07	2020-07-06 17:51:07	2020-07-06 17:51:07	0.14648873	1031	\N		406	\N	None	1	0.104166664	0.18867925	0.12833545	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-06 18:13:10	2020-07-06 18:13:10	2020-07-06 18:13:10	2020-07-06 18:13:10	0.9990467	1032	\N		407	\N	None	0.9777778	0.8627451	0.9166667	0.81194407	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-06 18:15:24	2020-07-06 18:15:24	2020-07-06 18:15:24	2020-07-06 18:15:24	0.9990467	1033	\N		407	\N	None	0.95454544	0.9130435	0.93333334	0.8170267	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-06 18:19:25	2020-07-06 18:19:25	2020-07-06 18:19:25	2020-07-06 18:19:25	0.99205595	1034	\N		407	\N	None	0.9591837	0.94	0.94949496	0.7687421	\N	3147	787	None
SVC	\N	5	3150	788	1	0.18518518	0.3125	2020-07-06 18:20:51	2020-07-06 18:20:51	2020-07-06 18:20:51	2020-07-06 18:20:51	0.25198603	1035	\N		407	\N	None	1	0.19607843	0.32786885	0.24396442	\N	3147	787	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 18:35:07	2020-07-06 18:35:07	2020-07-06 18:35:07	2020-07-06 18:35:07	0.99873936	1036	\N		408	\N	None	0.95454544	0.875	0.9130435	0.83858764	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 18:35:31	2020-07-06 18:35:31	2020-07-06 18:35:31	2020-07-06 18:35:31	0.99810904	1037	\N		408	\N	None	1	0.8888889	0.9411765	0.8259773	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 18:35:51	2020-07-06 18:35:51	2020-07-06 18:35:51	2020-07-06 18:35:51	0.99275136	1038	\N		408	\N	None	0.93333334	0.875	0.9032258	0.7957125	\N	3173	793	None
SVC	\N	5	3176	794	1	0.6111111	0.7586207	2020-07-06 18:36:25	2020-07-06 18:36:25	2020-07-06 18:36:25	2020-07-06 18:36:25	0.66088873	1039	\N		408	\N	None	1	0.5625	0.72	0.6141236	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 18:50:44	2020-07-06 18:50:44	2020-07-06 18:50:44	2020-07-06 18:50:44	0.99873936	1040	\N		409	\N	None	0.97619045	0.8367347	0.9010989	0.8310214	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 18:51:20	2020-07-06 18:51:20	2020-07-06 18:51:20	2020-07-06 18:51:20	0.99842423	1041	\N		409	\N	None	1	0.877551	0.9347826	0.84237075	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 18:52:10	2020-07-06 18:52:10	2020-07-06 18:52:10	2020-07-06 18:52:10	0.9974787	1042	\N		409	\N	None	0.95652175	0.8979592	0.9263158	0.78688526	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-06 18:53:01	2020-07-06 18:53:01	2020-07-06 18:53:01	2020-07-06 18:53:01	0.23731485	1043	\N		409	\N	None	1	0.21276596	0.3508772	0.24716267	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 19:07:24	2020-07-06 19:07:24	2020-07-06 19:07:24	2020-07-06 19:07:24	0.99873936	1044	\N		410	\N	None	0.9347826	0.877551	0.9052632	0.8322825	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 19:07:59	2020-07-06 19:07:59	2020-07-06 19:07:59	2020-07-06 19:07:59	0.99873936	1045	\N		410	\N	None	0.97727275	0.8958333	0.9347826	0.82976043	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 19:08:50	2020-07-06 19:08:50	2020-07-06 19:08:50	2020-07-06 19:08:50	0.9965333	1046	\N		410	\N	None	0.9574468	0.88235295	0.9183673	0.80580074	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-06 19:09:39	2020-07-06 19:09:39	2020-07-06 19:09:39	2020-07-06 19:09:39	0.22565396	1047	\N		410	\N	None	1	0.2	0.33333334	0.19924338	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 19:24:10	2020-07-06 19:24:10	2020-07-06 19:24:10	2020-07-06 19:24:10	0.99905455	1048	\N		411	\N	None	1	0.8958333	0.94505495	0.852459	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 19:24:42	2020-07-06 19:24:42	2020-07-06 19:24:42	2020-07-06 19:24:42	0.9977939	1049	\N		411	\N	None	1	0.8627451	0.9263158	0.84741485	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 19:25:25	2020-07-06 19:25:25	2020-07-06 19:25:25	2020-07-06 19:25:25	0.9977939	1050	\N		411	\N	None	0.9767442	0.89361703	0.93333334	0.8020176	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-06 19:26:09	2020-07-06 19:26:09	2020-07-06 19:26:09	2020-07-06 19:26:09	0.24739994	1051	\N		411	\N	None	1	0.20408164	0.33898306	0.24211854	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 19:40:32	2020-07-06 19:40:32	2020-07-06 19:40:32	2020-07-06 19:40:32	0.99905455	1052	\N		412	\N	None	0.9767442	0.89361703	0.93333334	0.84993696	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 19:41:09	2020-07-06 19:41:09	2020-07-06 19:41:09	2020-07-06 19:41:09	0.99810904	1053	\N		412	\N	None	1	0.92	0.9583333	0.8575032	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 19:41:59	2020-07-06 19:41:59	2020-07-06 19:41:59	2020-07-06 19:41:59	0.9968484	1054	\N		412	\N	None	0.93333334	0.89361703	0.9130435	0.83858764	\N	3173	793	None
SVC	\N	5	3176	794	1	0.3148148	0.47887325	2020-07-06 19:42:47	2020-07-06 19:42:47	2020-07-06 19:42:47	2020-07-06 19:42:47	0.4011976	1055	\N		412	\N	None	1	0.31111112	0.47457626	0.39092055	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 19:57:10	2020-07-06 19:57:10	2020-07-06 19:57:10	2020-07-06 19:57:10	0.99905455	1056	\N		413	\N	None	0.9347826	0.877551	0.9052632	0.8284994	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 19:57:45	2020-07-06 19:57:45	2020-07-06 19:57:45	2020-07-06 19:57:45	0.99842423	1057	\N		413	\N	None	0.9767442	0.84	0.9032258	0.8234552	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 19:58:37	2020-07-06 19:58:37	2020-07-06 19:58:37	2020-07-06 19:58:37	0.9965333	1058	\N		413	\N	None	0.95555556	0.9148936	0.9347826	0.7894073	\N	3173	793	None
SVC	\N	5	3176	794	1	0.2962963	0.45714286	2020-07-06 19:59:22	2020-07-06 19:59:22	2020-07-06 19:59:22	2020-07-06 19:59:22	0.3911125	1059	\N		413	\N	None	1	0.26	0.41269842	0.41361916	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 20:14:04	2020-07-06 20:14:04	2020-07-06 20:14:04	2020-07-06 20:14:04	0.9996849	1060	\N		414	\N	None	0.9787234	0.9019608	0.93877554	0.8221942	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 20:14:37	2020-07-06 20:14:37	2020-07-06 20:14:37	2020-07-06 20:14:37	0.99810904	1061	\N		414	\N	None	1	0.81632656	0.8988764	0.8221942	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 20:15:21	2020-07-06 20:15:21	2020-07-06 20:15:21	2020-07-06 20:15:21	0.97888434	1062	\N		414	\N	None	0.9347826	0.877551	0.9052632	0.81336695	\N	3173	793	None
SVC	\N	5	3176	794	1	0.33333334	0.5	2020-07-06 20:16:03	2020-07-06 20:16:03	2020-07-06 20:16:03	2020-07-06 20:16:03	0.41853136	1063	\N		414	\N	None	1	0.31914893	0.48387095	0.39596468	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 20:31:14	2020-07-06 20:31:14	2020-07-06 20:31:14	2020-07-06 20:31:14	0.99873936	1064	\N		415	\N	None	0.9782609	0.9782609	0.9782609	0.8398487	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 20:32:01	2020-07-06 20:32:01	2020-07-06 20:32:01	2020-07-06 20:32:01	0.99873936	1065	\N		415	\N	None	1	0.9183673	0.9574468	0.83858764	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 20:33:24	2020-07-06 20:33:24	2020-07-06 20:33:24	2020-07-06 20:33:24	0.99905455	1066	\N		415	\N	None	0.9782609	0.88235295	0.92783505	0.814628	\N	3173	793	None
SVC	\N	5	3176	794	1	0.16666667	0.2857143	2020-07-06 20:34:22	2020-07-06 20:34:22	2020-07-06 20:34:22	2020-07-06 20:34:22	0.168295	1067	\N		415	\N	None	1	0.1764706	0.3	0.14880201	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 20:49:03	2020-07-06 20:49:03	2020-07-06 20:49:03	2020-07-06 20:49:03	0.99873936	1068	\N		416	\N	None	0.9777778	0.8979592	0.9361702	0.83480453	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 20:49:47	2020-07-06 20:49:47	2020-07-06 20:49:47	2020-07-06 20:49:47	0.99810904	1069	\N		416	\N	None	1	0.88235295	0.9375	0.85498106	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 20:51:11	2020-07-06 20:51:11	2020-07-06 20:51:11	2020-07-06 20:51:11	0.99905455	1070	\N		416	\N	None	0.95555556	0.9148936	0.9347826	0.80958384	\N	3173	793	None
SVC	\N	5	3176	794	1	0.16666667	0.2857143	2020-07-06 20:52:10	2020-07-06 20:52:10	2020-07-06 20:52:10	2020-07-06 20:52:10	0.19193192	1071	\N		416	\N	None	1	0.1875	0.31578946	0.19293821	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 21:06:47	2020-07-06 21:06:47	2020-07-06 21:06:47	2020-07-06 21:06:47	0.99905455	1072	\N		417	\N	None	0.95555556	0.877551	0.9148936	0.8373266	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 21:07:28	2020-07-06 21:07:28	2020-07-06 21:07:28	2020-07-06 21:07:28	0.99842423	1073	\N		417	\N	None	1	0.93877554	0.96842104	0.8259773	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 21:08:48	2020-07-06 21:08:48	2020-07-06 21:08:48	2020-07-06 21:08:48	0.99842423	1074	\N		417	\N	None	0.9019608	0.9583333	0.9292929	0.8272383	\N	3173	793	None
SVC	\N	5	3176	794	1	0.16666667	0.2857143	2020-07-06 21:09:41	2020-07-06 21:09:41	2020-07-06 21:09:41	2020-07-06 21:09:41	0.16073117	1075	\N		417	\N	None	1	0.1875	0.31578946	0.1261034	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 21:24:27	2020-07-06 21:24:27	2020-07-06 21:24:27	2020-07-06 21:24:27	0.99905455	1076	\N		418	\N	None	0.97727275	0.877551	0.9247312	0.8196721	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 21:25:15	2020-07-06 21:25:15	2020-07-06 21:25:15	2020-07-06 21:25:15	0.99873936	1077	\N		418	\N	None	1	0.8958333	0.94505495	0.8184111	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 21:26:39	2020-07-06 21:26:39	2020-07-06 21:26:39	2020-07-06 21:26:39	0.99527264	1078	\N		418	\N	None	0.97727275	0.84313726	0.9052632	0.8272383	\N	3173	793	None
SVC	\N	5	3176	794	1	0.22222222	0.36363637	2020-07-06 21:27:35	2020-07-06 21:27:35	2020-07-06 21:27:35	2020-07-06 21:27:35	0.32366845	1079	\N		418	\N	None	1	0.23529412	0.3809524	0.2849937	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 21:42:06	2020-07-06 21:42:06	2020-07-06 21:42:06	2020-07-06 21:42:06	0.9993697	1080	\N		419	\N	None	0.9777778	0.88	0.9263158	0.83858764	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 21:42:52	2020-07-06 21:42:52	2020-07-06 21:42:52	2020-07-06 21:42:52	0.99905455	1081	\N		419	\N	None	0.9767442	0.89361703	0.93333334	0.84615386	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 21:44:08	2020-07-06 21:44:08	2020-07-06 21:44:08	2020-07-06 21:44:08	0.9946423	1082	\N		419	\N	None	0.9782609	0.88235295	0.92783505	0.8032787	\N	3173	793	None
SVC	\N	5	3176	794	1	0.25925925	0.4117647	2020-07-06 21:45:02	2020-07-06 21:45:02	2020-07-06 21:45:02	2020-07-06 21:45:02	0.35014182	1083	\N		419	\N	None	1	0.24489796	0.39344263	0.35056746	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 21:59:42	2020-07-06 21:59:42	2020-07-06 21:59:42	2020-07-06 21:59:42	0.99905455	1084	\N		420	\N	None	0.97619045	0.9111111	0.9425287	0.8259773	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 22:00:26	2020-07-06 22:00:26	2020-07-06 22:00:26	2020-07-06 22:00:26	0.9993697	1085	\N		420	\N	None	0.9767442	0.875	0.9230769	0.8373266	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 22:01:49	2020-07-06 22:01:49	2020-07-06 22:01:49	2020-07-06 22:01:49	0.99212104	1086	\N		420	\N	None	0.9777778	0.8627451	0.9166667	0.8032787	\N	3173	793	None
SVC	\N	5	3176	794	1	0.25925925	0.4117647	2020-07-06 22:02:47	2020-07-06 22:02:47	2020-07-06 22:02:47	2020-07-06 22:02:47	0.3271352	1087	\N		420	\N	None	1	0.22	0.36065573	0.31399748	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 22:20:15	2020-07-06 22:20:15	2020-07-06 22:20:15	2020-07-06 22:20:15	0.99905455	1088	\N		421	\N	None	0.97727275	0.86	0.9148936	0.84237075	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 22:21:19	2020-07-06 22:21:19	2020-07-06 22:21:19	2020-07-06 22:21:19	0.99905455	1089	\N		421	\N	None	1	0.84	0.9130435	0.8335435	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 22:23:35	2020-07-06 22:23:35	2020-07-06 22:23:35	2020-07-06 22:23:35	0.9965333	1090	\N		421	\N	None	0.89361703	0.9130435	0.9032258	0.7957125	\N	3173	793	None
SVC	\N	5	3176	794	1	0.16666667	0.2857143	2020-07-06 22:24:48	2020-07-06 22:24:48	2020-07-06 22:24:48	2020-07-06 22:24:48	0.12700914	1091	\N		421	\N	None	1	0.16666667	0.2857143	0.14501892	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 22:42:29	2020-07-06 22:42:29	2020-07-06 22:42:29	2020-07-06 22:42:29	0.9993697	1092	\N		422	\N	None	1	0.877551	0.9347826	0.8259773	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 22:43:38	2020-07-06 22:43:38	2020-07-06 22:43:38	2020-07-06 22:43:38	0.99905455	1093	\N		422	\N	None	0.95348835	0.87234044	0.9111111	0.85498106	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 22:45:45	2020-07-06 22:45:45	2020-07-06 22:45:45	2020-07-06 22:45:45	0.99558777	1094	\N		422	\N	None	0.9583333	0.9583333	0.9583333	0.8032787	\N	3173	793	None
SVC	\N	5	3176	794	1	0.2037037	0.33846155	2020-07-06 22:47:00	2020-07-06 22:47:00	2020-07-06 22:47:00	2020-07-06 22:47:00	0.2908919	1095	\N		422	\N	None	1	0.20833333	0.3448276	0.2559899	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 23:02:10	2020-07-06 23:02:10	2020-07-06 23:02:10	2020-07-06 23:02:10	0.99873936	1096	\N		423	\N	None	1	0.9	0.94736844	0.82471627	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 23:02:38	2020-07-06 23:02:38	2020-07-06 23:02:38	2020-07-06 23:02:38	0.99905455	1097	\N		423	\N	None	0.97619045	0.78846157	0.87234044	0.8360656	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 23:03:04	2020-07-06 23:03:04	2020-07-06 23:03:04	2020-07-06 23:03:04	0.99117553	1098	\N		423	\N	None	0.9361702	0.9361702	0.9361702	0.8108449	\N	3173	793	None
SVC	\N	5	3176	794	1	0.6111111	0.7586207	2020-07-06 23:03:47	2020-07-06 23:03:47	2020-07-06 23:03:47	2020-07-06 23:03:47	0.6797983	1099	\N		423	\N	None	1	0.60784316	0.75609756	0.61664563	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 23:18:52	2020-07-06 23:18:52	2020-07-06 23:18:52	2020-07-06 23:18:52	0.99873936	1100	\N		424	\N	None	0.9347826	0.9347826	0.9347826	0.8259773	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 23:19:46	2020-07-06 23:19:46	2020-07-06 23:19:46	2020-07-06 23:19:46	0.99842423	1101	\N		424	\N	None	1	0.81632656	0.8988764	0.852459	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 23:21:13	2020-07-06 23:21:13	2020-07-06 23:21:13	2020-07-06 23:21:13	0.99810904	1102	\N		424	\N	None	1	0.8039216	0.8913044	0.81715006	\N	3173	793	None
SVC	\N	5	3176	794	1	0.16666667	0.2857143	2020-07-06 23:22:21	2020-07-06 23:22:21	2020-07-06 23:22:21	2020-07-06 23:22:21	0.1998109	1103	\N		424	\N	None	1	0.18367347	0.31034482	0.21311475	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 23:37:37	2020-07-06 23:37:37	2020-07-06 23:37:37	2020-07-06 23:37:37	0.99873936	1104	\N		425	\N	None	1	0.9	0.94736844	0.8335435	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 23:38:39	2020-07-06 23:38:39	2020-07-06 23:38:39	2020-07-06 23:38:39	0.99873936	1105	\N		425	\N	None	1	0.877551	0.9347826	0.8486759	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-06 23:40:39	2020-07-06 23:40:39	2020-07-06 23:40:39	2020-07-06 23:40:39	0.9996849	1106	\N		425	\N	None	0.95348835	0.8913044	0.92134833	0.8272383	\N	3173	793	None
SVC	\N	5	3176	794	1	0.14814815	0.2580645	2020-07-06 23:41:49	2020-07-06 23:41:49	2020-07-06 23:41:49	2020-07-06 23:41:49	0.12417271	1107	\N		425	\N	None	1	0.14285715	0.25	0.11601513	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-06 23:57:09	2020-07-06 23:57:09	2020-07-06 23:57:09	2020-07-06 23:57:09	0.99873936	1108	\N		426	\N	None	0.9777778	0.8979592	0.9361702	0.84615386	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-06 23:58:10	2020-07-06 23:58:10	2020-07-06 23:58:10	2020-07-06 23:58:10	0.99905455	1109	\N		426	\N	None	1	0.9166667	0.95652175	0.84741485	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-07 00:00:24	2020-07-07 00:00:24	2020-07-07 00:00:24	2020-07-07 00:00:24	0.99873936	1110	\N		426	\N	None	0.9375	0.9375	0.9375	0.7982346	\N	3173	793	None
SVC	\N	5	3176	794	1	0.09259259	0.16949153	2020-07-07 00:01:35	2020-07-07 00:01:35	2020-07-07 00:01:35	2020-07-07 00:01:35	0.10589348	1111	\N		426	\N	None	1	0.0625	0.11764706	0.095838584	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-07 00:16:46	2020-07-07 00:16:46	2020-07-07 00:16:46	2020-07-07 00:16:46	0.9993697	1112	\N		427	\N	None	0.97727275	0.84313726	0.9052632	0.814628	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-07 00:17:34	2020-07-07 00:17:34	2020-07-07 00:17:34	2020-07-07 00:17:34	0.99842423	1113	\N		427	\N	None	0.95238096	0.85106385	0.8988764	0.84741485	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-07 00:18:43	2020-07-07 00:18:43	2020-07-07 00:18:43	2020-07-07 00:18:43	0.9965333	1114	\N		427	\N	None	0.95555556	0.877551	0.9148936	0.81210595	\N	3173	793	None
SVC	\N	5	3176	794	1	0.25925925	0.4117647	2020-07-07 00:19:37	2020-07-07 00:19:37	2020-07-07 00:19:37	2020-07-07 00:19:37	0.3526631	1115	\N		427	\N	None	1	0.24489796	0.39344263	0.34678435	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-07 00:32:11	2020-07-07 00:32:11	2020-07-07 00:32:11	2020-07-07 00:32:11	0.9993697	1116	\N		428	\N	None	0.97727275	0.8958333	0.9347826	0.8398487	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-07 00:33:04	2020-07-07 00:33:04	2020-07-07 00:33:04	2020-07-07 00:33:04	0.99873936	1117	\N		428	\N	None	1	0.877551	0.9347826	0.8234552	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-07 00:34:49	2020-07-07 00:34:49	2020-07-07 00:34:49	2020-07-07 00:34:49	0.99905455	1118	\N		428	\N	None	1	0.875	0.93333334	0.81715006	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-07 00:35:45	2020-07-07 00:35:45	2020-07-07 00:35:45	2020-07-07 00:35:45	0.29404348	1119	\N		428	\N	None	1	0.20833333	0.3448276	0.26607817	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-07 00:48:21	2020-07-07 00:48:21	2020-07-07 00:48:21	2020-07-07 00:48:21	0.99873936	1120	\N		429	\N	None	1	0.8979592	0.94623655	0.8184111	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-07 00:49:15	2020-07-07 00:49:15	2020-07-07 00:49:15	2020-07-07 00:49:15	0.99842423	1121	\N		429	\N	None	1	0.84444445	0.91566265	0.8448928	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-07 00:51:11	2020-07-07 00:51:11	2020-07-07 00:51:11	2020-07-07 00:51:11	0.99842423	1122	\N		429	\N	None	0.94	0.94	0.94	0.8284994	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-07 00:52:07	2020-07-07 00:52:07	2020-07-07 00:52:07	2020-07-07 00:52:07	0.27954617	1123	\N		429	\N	None	1	0.2	0.33333334	0.26229507	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-07 01:04:51	2020-07-07 01:04:51	2020-07-07 01:04:51	2020-07-07 01:04:51	0.9996849	1124	\N		430	\N	None	0.9583333	0.9019608	0.9292929	0.85498106	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-07 01:06:01	2020-07-07 01:06:01	2020-07-07 01:06:01	2020-07-07 01:06:01	0.9993697	1125	\N		430	\N	None	0.97727275	0.86	0.9148936	0.8587642	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-07 01:08:25	2020-07-07 01:08:25	2020-07-07 01:08:25	2020-07-07 01:08:25	0.9974787	1126	\N		430	\N	None	1	0.9183673	0.9574468	0.814628	\N	3173	793	None
SVC	\N	5	3176	794	1	0.09259259	0.16949153	2020-07-07 01:09:39	2020-07-07 01:09:39	2020-07-07 01:09:39	2020-07-07 01:09:39	0.10085093	1127	\N		430	\N	None	1	0.10638298	0.1923077	0.11223203	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-07 01:22:22	2020-07-07 01:22:22	2020-07-07 01:22:22	2020-07-07 01:22:22	0.99873936	1128	\N		431	\N	None	1	0.84313726	0.9148936	0.82976043	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-07 01:23:33	2020-07-07 01:23:33	2020-07-07 01:23:33	2020-07-07 01:23:33	0.99873936	1129	\N		431	\N	None	0.9767442	0.84	0.9032258	0.83480453	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-07 01:26:10	2020-07-07 01:26:10	2020-07-07 01:26:10	2020-07-07 01:26:10	0.99873936	1130	\N		431	\N	None	0.93877554	0.92	0.9292929	0.814628	\N	3173	793	None
SVC	\N	5	3176	794	1	0.09259259	0.16949153	2020-07-07 01:27:22	2020-07-07 01:27:22	2020-07-07 01:27:22	2020-07-07 01:27:22	0.09612354	1131	\N		431	\N	None	1	0.057692308	0.10909091	0.10844893	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-07 01:40:08	2020-07-07 01:40:08	2020-07-07 01:40:08	2020-07-07 01:40:08	0.99873936	1132	\N		432	\N	None	0.9782609	0.88235295	0.92783505	0.8360656	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-07 01:41:59	2020-07-07 01:41:59	2020-07-07 01:41:59	2020-07-07 01:41:59	0.99842423	1133	\N		432	\N	None	0.9767442	0.875	0.9230769	0.8411097	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-07 01:45:18	2020-07-07 01:45:18	2020-07-07 01:45:18	2020-07-07 01:45:18	0.9996849	1134	\N		432	\N	None	0.9777778	0.8627451	0.9166667	0.8221942	\N	3173	793	None
SVC	\N	5	3176	794	1	0.055555556	0.10526316	2020-07-07 01:46:31	2020-07-07 01:46:31	2020-07-07 01:46:31	2020-07-07 01:46:31	0.087929405	1135	\N		432	\N	None	1	0.044444446	0.08510638	0.08953342	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-07 01:59:16	2020-07-07 01:59:16	2020-07-07 01:59:16	2020-07-07 01:59:16	0.9996849	1136	\N		433	\N	None	0.975	0.82978725	0.8965517	0.8360656	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-07 02:00:33	2020-07-07 02:00:33	2020-07-07 02:00:33	2020-07-07 02:00:33	0.99905455	1137	\N		433	\N	None	0.97619045	0.8541667	0.9111111	0.815889	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-07 02:03:09	2020-07-07 02:03:09	2020-07-07 02:03:09	2020-07-07 02:03:09	0.9962181	1138	\N		433	\N	None	0.9361702	0.8627451	0.8979592	0.81715006	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18867925	0.31746033	2020-07-07 02:04:18	2020-07-07 02:04:18	2020-07-07 02:04:18	2020-07-07 02:04:18	0.2322723	1139	\N		433	\N	None	1	0.18867925	0.31746033	0.21689786	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-07 02:17:18	2020-07-07 02:17:18	2020-07-07 02:17:18	2020-07-07 02:17:18	0.99905455	1140	\N		434	\N	None	0.95348835	0.8913044	0.92134833	0.82471627	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-07 02:18:37	2020-07-07 02:18:37	2020-07-07 02:18:37	2020-07-07 02:18:37	0.9993697	1141	\N		434	\N	None	0.9777778	0.8979592	0.9361702	0.8322825	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-07 02:21:20	2020-07-07 02:21:20	2020-07-07 02:21:20	2020-07-07 02:21:20	0.99873936	1142	\N		434	\N	None	0.9318182	0.8367347	0.8817204	0.8272383	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-07 02:22:31	2020-07-07 02:22:31	2020-07-07 02:22:31	2020-07-07 02:22:31	0.21966593	1143	\N		434	\N	None	1	0.20408164	0.33898306	0.22950819	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-07 02:35:22	2020-07-07 02:35:22	2020-07-07 02:35:22	2020-07-07 02:35:22	0.9996849	1144	\N		435	\N	None	0.95348835	0.8541667	0.9010989	0.81715006	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-07 02:36:49	2020-07-07 02:36:49	2020-07-07 02:36:49	2020-07-07 02:36:49	0.99905455	1145	\N		435	\N	None	1	0.85714287	0.9230769	0.8284994	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-07 02:40:09	2020-07-07 02:40:09	2020-07-07 02:40:09	2020-07-07 02:40:09	0.9977939	1146	\N		435	\N	None	0.9777778	0.9166667	0.94623655	0.8196721	\N	3173	793	None
SVC	\N	5	3176	794	1	0.16666667	0.2857143	2020-07-07 02:41:21	2020-07-07 02:41:21	2020-07-07 02:41:21	2020-07-07 02:41:21	0.19319256	1147	\N		435	\N	None	1	0.1875	0.31578946	0.16897856	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-07 02:54:22	2020-07-07 02:54:22	2020-07-07 02:54:22	2020-07-07 02:54:22	0.9993697	1148	\N		436	\N	None	0.9756098	0.8333333	0.8988764	0.85119796	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-07 02:56:10	2020-07-07 02:56:10	2020-07-07 02:56:10	2020-07-07 02:56:10	0.9993697	1149	\N		436	\N	None	1	0.86	0.9247312	0.83858764	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-07 03:00:15	2020-07-07 03:00:15	2020-07-07 03:00:15	2020-07-07 03:00:15	0.99873936	1150	\N		436	\N	None	0.97727275	0.877551	0.9247312	0.7969735	\N	3173	793	None
SVC	\N	5	3176	794	1	0.055555556	0.10526316	2020-07-07 03:01:42	2020-07-07 03:01:42	2020-07-07 03:01:42	2020-07-07 03:01:42	0.08477781	1151	\N		436	\N	None	1	0.06	0.11320755	0.09331652	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-07 03:14:53	2020-07-07 03:14:53	2020-07-07 03:14:53	2020-07-07 03:14:53	0.99873936	1152	\N		437	\N	None	0.97727275	0.877551	0.9247312	0.8373266	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-07 03:16:50	2020-07-07 03:16:50	2020-07-07 03:16:50	2020-07-07 03:16:50	0.99905455	1153	\N		437	\N	None	1	0.8541667	0.92134833	0.8360656	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-07 03:20:22	2020-07-07 03:20:22	2020-07-07 03:20:22	2020-07-07 03:20:22	0.99905455	1154	\N		437	\N	None	0.9574468	0.9	0.92783505	0.7805801	\N	3173	793	None
SVC	\N	5	3176	794	1	0.16666667	0.2857143	2020-07-07 03:21:49	2020-07-07 03:21:49	2020-07-07 03:21:49	2020-07-07 03:21:49	0.1736527	1155	\N		437	\N	None	1	0.18	0.30508474	0.1815889	\N	3173	793	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 03:45:29	2020-07-07 03:45:29	2020-07-07 03:45:29	2020-07-07 03:45:29	0.9750687	1156	\N		438	\N	None	0.9811321	0.9811321	0.9811321	0.75287956	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 03:46:47	2020-07-07 03:46:47	2020-07-07 03:46:47	2020-07-07 03:46:47	0.9797147	1157	\N		438	\N	None	1	0.8888889	0.9411765	0.7858639	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 03:47:49	2020-07-07 03:47:49	2020-07-07 03:47:49	2020-07-07 03:47:49	0.9594294	1158	\N		438	\N	None	0.98	0.9423077	0.9607843	0.776178	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.4814815	0.65	2020-07-07 03:52:44	2020-07-07 03:52:44	2020-07-07 03:52:44	2020-07-07 03:52:44	0.5405052	1159	\N		438	\N	None	1	0.4528302	0.6233766	0.53062826	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 04:17:14	2020-07-07 04:17:14	2020-07-07 04:17:14	2020-07-07 04:17:14	0.9865855	1160	\N		439	\N	None	1	0.9259259	0.96153843	0.8057592	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 04:18:43	2020-07-07 04:18:43	2020-07-07 04:18:43	2020-07-07 04:18:43	0.98580027	1161	\N		439	\N	None	1	0.9433962	0.9708738	0.8060209	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	0.9814815	0.99065423	2020-07-07 04:21:59	2020-07-07 04:21:59	2020-07-07 04:21:59	2020-07-07 04:21:59	0.97042274	1162	\N		439	\N	None	1	0.9245283	0.9607843	0.79005235	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.16666667	0.2857143	2020-07-07 04:28:42	2020-07-07 04:28:42	2020-07-07 04:28:42	2020-07-07 04:28:42	0.12498364	1163	\N		439	\N	None	1	0.13207547	0.23333333	0.12460733	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 04:52:29	2020-07-07 04:52:29	2020-07-07 04:52:29	2020-07-07 04:52:29	0.9822667	1164	\N		440	\N	None	1	0.962963	0.9811321	0.79267013	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 04:53:59	2020-07-07 04:53:59	2020-07-07 04:53:59	2020-07-07 04:53:59	0.9834446	1165	\N		440	\N	None	1	0.8888889	0.9411765	0.80497384	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 04:57:19	2020-07-07 04:57:19	2020-07-07 04:57:19	2020-07-07 04:57:19	0.9770972	1166	\N		440	\N	None	1	0.9444444	0.9714286	0.80130893	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.14814815	0.2580645	2020-07-07 05:03:40	2020-07-07 05:03:40	2020-07-07 05:03:40	2020-07-07 05:03:40	0.11274702	1167	\N		440	\N	None	1	0.13207547	0.23333333	0.115445025	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 05:27:36	2020-07-07 05:27:36	2020-07-07 05:27:36	2020-07-07 05:27:36	0.98141605	1168	\N		441	\N	None	1	1	1	0.79031414	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 05:28:57	2020-07-07 05:28:57	2020-07-07 05:28:57	2020-07-07 05:28:57	0.9795838	1169	\N		441	\N	None	0.9807692	0.9622642	0.9714286	0.7798429	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 05:31:42	2020-07-07 05:31:42	2020-07-07 05:31:42	2020-07-07 05:31:42	0.9647952	1170	\N		441	\N	None	1	0.9074074	0.9514563	0.7853403	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.18518518	0.3125	2020-07-07 05:37:48	2020-07-07 05:37:48	2020-07-07 05:37:48	2020-07-07 05:37:48	0.13185447	1171	\N		441	\N	None	1	0.1509434	0.26229507	0.1408377	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 06:01:45	2020-07-07 06:01:45	2020-07-07 06:01:45	2020-07-07 06:01:45	0.9892684	1172	\N		442	\N	None	0.9811321	1	0.9904762	0.786911	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 06:03:31	2020-07-07 06:03:31	2020-07-07 06:03:31	2020-07-07 06:03:31	0.9878288	1173	\N		442	\N	None	1	0.9622642	0.9807692	0.8002618	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 06:06:55	2020-07-07 06:06:55	2020-07-07 06:06:55	2020-07-07 06:06:55	0.972713	1174	\N		442	\N	None	1	0.9811321	0.9904762	0.78089005	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.24074075	0.3880597	2020-07-07 06:13:35	2020-07-07 06:13:35	2020-07-07 06:13:35	2020-07-07 06:13:35	0.30800942	1175	\N		442	\N	None	1	0.23076923	0.375	0.2908377	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 06:37:31	2020-07-07 06:37:31	2020-07-07 06:37:31	2020-07-07 06:37:31	0.98593116	1176	\N		443	\N	None	0.9807692	0.9622642	0.9714286	0.77905756	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 06:39:14	2020-07-07 06:39:14	2020-07-07 06:39:14	2020-07-07 06:39:14	0.98566943	1177	\N		443	\N	None	1	0.9622642	0.9807692	0.7945026	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 06:42:47	2020-07-07 06:42:47	2020-07-07 06:42:47	2020-07-07 06:42:47	0.957728	1178	\N		443	\N	None	1	0.9814815	0.99065423	0.7683246	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.22222222	0.36363637	2020-07-07 06:49:13	2020-07-07 06:49:13	2020-07-07 06:49:13	2020-07-07 06:49:13	0.31272084	1179	\N		443	\N	None	1	0.2264151	0.36923078	0.30157068	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 07:13:22	2020-07-07 07:13:22	2020-07-07 07:13:22	2020-07-07 07:13:22	0.98141605	1180	\N		444	\N	None	0.9814815	1	0.99065423	0.7615183	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 07:15:00	2020-07-07 07:15:00	2020-07-07 07:15:00	2020-07-07 07:15:00	0.984557	1181	\N		444	\N	None	0.97959185	0.9230769	0.95049506	0.7945026	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 07:17:45	2020-07-07 07:17:45	2020-07-07 07:17:45	2020-07-07 07:17:45	0.9645989	1182	\N		444	\N	None	0.9811321	0.9811321	0.9811321	0.75654453	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.25925925	0.4117647	2020-07-07 07:23:47	2020-07-07 07:23:47	2020-07-07 07:23:47	2020-07-07 07:23:47	0.32587358	1183	\N		444	\N	None	1	0.22222222	0.36363637	0.33115184	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 07:47:55	2020-07-07 07:47:55	2020-07-07 07:47:55	2020-07-07 07:47:55	0.98756707	1184	\N		445	\N	None	1	0.9622642	0.9807692	0.80890054	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 07:49:35	2020-07-07 07:49:35	2020-07-07 07:49:35	2020-07-07 07:49:35	0.9865855	1185	\N		445	\N	None	1	0.9811321	0.9904762	0.81649214	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	0.9814815	0.99065423	2020-07-07 07:55:58	2020-07-07 07:55:58	2020-07-07 07:55:58	2020-07-07 07:55:58	0.9787331	1186	\N		445	\N	None	0.9807692	0.9807692	0.9807692	0.8054974	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-07 08:03:12	2020-07-07 08:03:12	2020-07-07 08:03:12	2020-07-07 08:03:12	0.10299699	1187	\N		445	\N	None	1	0.09615385	0.1754386	0.10104712	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 08:27:22	2020-07-07 08:27:22	2020-07-07 08:27:22	2020-07-07 08:27:22	0.9890721	1188	\N		446	\N	None	1	0.9444444	0.9714286	0.7997382	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 08:29:07	2020-07-07 08:29:07	2020-07-07 08:29:07	2020-07-07 08:29:07	0.98665094	1189	\N		446	\N	None	1	0.9444444	0.9714286	0.813089	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 08:35:24	2020-07-07 08:35:24	2020-07-07 08:35:24	2020-07-07 08:35:24	0.97840595	1190	\N		446	\N	None	1	0.9811321	0.9904762	0.7798429	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.09259259	0.16949153	2020-07-07 08:44:40	2020-07-07 08:44:40	2020-07-07 08:44:40	2020-07-07 08:44:40	0.104960084	1191	\N		446	\N	None	1	0.0754717	0.14035088	0.10549738	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 09:12:43	2020-07-07 09:12:43	2020-07-07 09:12:43	2020-07-07 09:12:43	0.9852768	1192	\N		447	\N	None	1	0.96153843	0.98039216	0.79790574	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 09:14:40	2020-07-07 09:14:40	2020-07-07 09:14:40	2020-07-07 09:14:40	0.9840335	1193	\N		447	\N	None	1	0.9811321	0.9904762	0.8044503	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 09:21:02	2020-07-07 09:21:02	2020-07-07 09:21:02	2020-07-07 09:21:02	0.96917945	1194	\N		447	\N	None	1	0.9622642	0.9807692	0.77905756	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-07 09:28:23	2020-07-07 09:28:23	2020-07-07 09:28:23	2020-07-07 09:28:23	0.10469834	1195	\N		447	\N	None	1	0.0754717	0.14035088	0.10314136	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 09:59:27	2020-07-07 09:59:27	2020-07-07 09:59:27	2020-07-07 09:59:27	0.9859966	1196	\N		448	\N	None	1	1	1	0.7913613	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 10:02:13	2020-07-07 10:02:13	2020-07-07 10:02:13	2020-07-07 10:02:13	0.98867947	1197	\N		448	\N	None	0.9811321	0.9811321	0.9811321	0.7965969	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 10:10:00	2020-07-07 10:10:00	2020-07-07 10:10:00	2020-07-07 10:10:00	0.9804999	1198	\N		448	\N	None	0.98039216	0.9433962	0.96153843	0.7795811	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.2037037	0.33846155	2020-07-07 10:18:58	2020-07-07 10:18:58	2020-07-07 10:18:58	2020-07-07 10:18:58	0.2550713	1199	\N		448	\N	None	1	0.2037037	0.33846155	0.23481676	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 10:47:09	2020-07-07 10:47:09	2020-07-07 10:47:09	2020-07-07 10:47:09	0.98769796	1200	\N		449	\N	None	1	0.9811321	0.9904762	0.7895288	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 10:49:11	2020-07-07 10:49:11	2020-07-07 10:49:11	2020-07-07 10:49:11	0.9865201	1201	\N		449	\N	None	1	0.9074074	0.9514563	0.8172775	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 10:55:04	2020-07-07 10:55:04	2020-07-07 10:55:04	2020-07-07 10:55:04	0.9808271	1202	\N		449	\N	None	1	1	1	0.7908377	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.2037037	0.33846155	2020-07-07 11:02:46	2020-07-07 11:02:46	2020-07-07 11:02:46	2020-07-07 11:02:46	0.25310823	1203	\N		449	\N	None	1	0.1923077	0.32258064	0.24764398	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 11:28:21	2020-07-07 11:28:21	2020-07-07 11:28:21	2020-07-07 11:28:21	0.9840989	1204	\N		450	\N	None	0.962963	1	0.9811321	0.776178	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 11:30:28	2020-07-07 11:30:28	2020-07-07 11:30:28	2020-07-07 11:30:28	0.98822147	1205	\N		450	\N	None	1	0.9245283	0.9607843	0.80314136	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 11:37:23	2020-07-07 11:37:23	2020-07-07 11:37:23	2020-07-07 11:37:23	0.9723858	1206	\N		450	\N	None	0.9423077	0.98	0.9607843	0.7722513	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.18518518	0.3125	2020-07-07 11:45:44	2020-07-07 11:45:44	2020-07-07 11:45:44	2020-07-07 11:45:44	0.24558304	1207	\N		450	\N	None	1	0.1923077	0.32258064	0.23324607	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 12:13:52	2020-07-07 12:13:52	2020-07-07 12:13:52	2020-07-07 12:13:52	0.9906426	1208	\N		451	\N	None	0.98	0.9607843	0.97029704	0.8052356	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 12:15:40	2020-07-07 12:15:40	2020-07-07 12:15:40	2020-07-07 12:15:40	0.9878288	1209	\N		451	\N	None	1	0.9622642	0.9807692	0.81649214	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 12:23:37	2020-07-07 12:23:37	2020-07-07 12:23:37	2020-07-07 12:23:37	0.980958	1210	\N		451	\N	None	0.9807692	0.9807692	0.9807692	0.80157065	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-07 12:32:19	2020-07-07 12:32:19	2020-07-07 12:32:19	2020-07-07 12:32:19	0.10162283	1211	\N		451	\N	None	1	0.057692308	0.10909091	0.09319372	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 13:03:19	2020-07-07 13:03:19	2020-07-07 13:03:19	2020-07-07 13:03:19	0.98305196	1212	\N		452	\N	None	1	0.9811321	0.9904762	0.79031414	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 13:08:05	2020-07-07 13:08:05	2020-07-07 13:08:05	2020-07-07 13:08:05	0.98841774	1213	\N		452	\N	None	1	0.9433962	0.9708738	0.7986911	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 13:33:14	2020-07-07 13:33:14	2020-07-07 13:33:14	2020-07-07 13:33:14	0.977359	1214	\N		452	\N	None	0.9811321	1	0.9904762	0.7960733	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.18518518	0.3125	2020-07-07 13:48:54	2020-07-07 13:48:54	2020-07-07 13:48:54	2020-07-07 13:48:54	0.17137809	1215	\N		452	\N	None	1	0.18867925	0.31746033	0.16753927	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 14:25:37	2020-07-07 14:25:37	2020-07-07 14:25:37	2020-07-07 14:25:37	0.97840595	1216	\N		453	\N	None	0.962963	1	0.9811321	0.74685866	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 14:27:59	2020-07-07 14:27:59	2020-07-07 14:27:59	2020-07-07 14:27:59	0.97906035	1217	\N		453	\N	None	1	0.9245283	0.9607843	0.7963351	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	0.9814815	0.99065423	2020-07-07 14:30:31	2020-07-07 14:30:31	2020-07-07 14:30:31	2020-07-07 14:30:31	0.95681196	1218	\N		453	\N	None	0.98	0.9423077	0.9607843	0.75863874	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.5	0.6666667	2020-07-07 14:39:35	2020-07-07 14:39:35	2020-07-07 14:39:35	2020-07-07 14:39:35	0.54410416	1219	\N		453	\N	None	1	0.4528302	0.6233766	0.5353403	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 15:11:31	2020-07-07 15:11:31	2020-07-07 15:11:31	2020-07-07 15:11:31	0.9897919	1220	\N		454	\N	None	0.9607843	0.9607843	0.9607843	0.8246073	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 15:13:12	2020-07-07 15:13:12	2020-07-07 15:13:12	2020-07-07 15:13:12	0.9878288	1221	\N		454	\N	None	1	0.9245283	0.9607843	0.81623036	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 15:19:14	2020-07-07 15:19:14	2020-07-07 15:19:14	2020-07-07 15:19:14	0.97879857	1222	\N		454	\N	None	1	0.9259259	0.96153843	0.78769636	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.11111111	0.2	2020-07-07 15:26:59	2020-07-07 15:26:59	2020-07-07 15:26:59	2020-07-07 15:26:59	0.10770842	1223	\N		454	\N	None	1	0.094339624	0.1724138	0.108376965	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 15:51:56	2020-07-07 15:51:56	2020-07-07 15:51:56	2020-07-07 15:51:56	0.98468786	1224	\N		455	\N	None	1	0.9259259	0.96153843	0.8146597	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 15:53:49	2020-07-07 15:53:49	2020-07-07 15:53:49	2020-07-07 15:53:49	0.98881036	1225	\N		455	\N	None	1	0.9811321	0.9904762	0.8157068	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 16:01:51	2020-07-07 16:01:51	2020-07-07 16:01:51	2020-07-07 16:01:51	0.95753175	1226	\N		455	\N	None	1	0.9811321	0.9904762	0.7960733	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-07 16:09:15	2020-07-07 16:09:15	2020-07-07 16:09:15	2020-07-07 16:09:15	0.09965973	1227	\N		455	\N	None	1	0.0754717	0.14035088	0.10209424	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 16:33:01	2020-07-07 16:33:01	2020-07-07 16:33:01	2020-07-07 16:33:01	0.9839681	1228	\N		456	\N	None	1	0.9433962	0.9708738	0.8096859	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 16:35:34	2020-07-07 16:35:34	2020-07-07 16:35:34	2020-07-07 16:35:34	0.98717445	1229	\N		456	\N	None	1	0.9444444	0.9714286	0.8287958	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 16:45:09	2020-07-07 16:45:09	2020-07-07 16:45:09	2020-07-07 16:45:09	0.97866774	1230	\N		456	\N	None	1	0.9622642	0.9807692	0.7879581	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-07 16:53:14	2020-07-07 16:53:14	2020-07-07 16:53:14	2020-07-07 16:53:14	0.09893993	1231	\N		456	\N	None	1	0.07692308	0.14285715	0.102356024	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 17:17:35	2020-07-07 17:17:35	2020-07-07 17:17:35	2020-07-07 17:17:35	0.98305196	1232	\N		457	\N	None	0.9807692	0.9622642	0.9714286	0.79790574	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 17:20:17	2020-07-07 17:20:17	2020-07-07 17:20:17	2020-07-07 17:20:17	0.9883523	1233	\N		457	\N	None	1	0.9622642	0.9807692	0.8036649	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 17:26:11	2020-07-07 17:26:11	2020-07-07 17:26:11	2020-07-07 17:26:11	0.96041095	1234	\N		457	\N	None	1	0.9622642	0.9807692	0.7764398	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.22222222	0.36363637	2020-07-07 17:34:07	2020-07-07 17:34:07	2020-07-07 17:34:07	2020-07-07 17:34:07	0.2889674	1235	\N		457	\N	None	1	0.2037037	0.33846155	0.2882199	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 17:58:39	2020-07-07 17:58:39	2020-07-07 17:58:39	2020-07-07 17:58:39	0.98841774	1236	\N		458	\N	None	1	0.9814815	0.99065423	0.7945026	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 18:01:25	2020-07-07 18:01:25	2020-07-07 18:01:25	2020-07-07 18:01:25	0.9890721	1237	\N		458	\N	None	1	0.9074074	0.9514563	0.80497384	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 18:10:02	2020-07-07 18:10:02	2020-07-07 18:10:02	2020-07-07 18:10:02	0.9808271	1238	\N		458	\N	None	0.9807692	0.9622642	0.9714286	0.7819372	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.18518518	0.3125	2020-07-07 18:18:05	2020-07-07 18:18:05	2020-07-07 18:18:05	2020-07-07 18:18:05	0.1688915	1239	\N		458	\N	None	1	0.16981132	0.29032257	0.15314136	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 18:42:26	2020-07-07 18:42:26	2020-07-07 18:42:26	2020-07-07 18:42:26	0.98292106	1240	\N		459	\N	None	1	0.9622642	0.9807692	0.8026178	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 18:46:12	2020-07-07 18:46:12	2020-07-07 18:46:12	2020-07-07 18:46:12	0.98789424	1241	\N		459	\N	None	1	1	1	0.80863875	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 18:56:55	2020-07-07 18:56:55	2020-07-07 18:56:55	2020-07-07 18:56:55	0.97866774	1242	\N		459	\N	None	1	0.9074074	0.9514563	0.7774869	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.18518518	0.3125	2020-07-07 19:05:35	2020-07-07 19:05:35	2020-07-07 19:05:35	2020-07-07 19:05:35	0.16686298	1243	\N		459	\N	None	1	0.18867925	0.31746033	0.16151832	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 19:31:04	2020-07-07 19:31:04	2020-07-07 19:31:04	2020-07-07 19:31:04	0.9897265	1244	\N		460	\N	None	1	0.962963	0.9811321	0.82958114	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 19:33:24	2020-07-07 19:33:24	2020-07-07 19:33:24	2020-07-07 19:33:24	0.98933387	1245	\N		460	\N	None	1	0.9444444	0.9714286	0.8157068	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	0.9811321	0.9904762	2020-07-07 19:45:53	2020-07-07 19:45:53	2020-07-07 19:45:53	2020-07-07 19:45:53	0.9811543	1246	\N		460	\N	None	0.9807692	0.9622642	0.9714286	0.8062827	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.055555556	0.10526316	2020-07-07 19:56:36	2020-07-07 19:56:36	2020-07-07 19:56:36	2020-07-07 19:56:36	0.0990708	1247	\N		460	\N	None	1	0.03773585	0.07272727	0.09790576	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 20:22:03	2020-07-07 20:22:03	2020-07-07 20:22:03	2020-07-07 20:22:03	0.9895956	1248	\N		461	\N	None	0.98039216	0.96153843	0.9708738	0.8246073	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 20:24:15	2020-07-07 20:24:15	2020-07-07 20:24:15	2020-07-07 20:24:15	0.9893993	1249	\N		461	\N	None	1	0.96153843	0.98039216	0.83089006	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 20:36:11	2020-07-07 20:36:11	2020-07-07 20:36:11	2020-07-07 20:36:11	0.98305196	1250	\N		461	\N	None	0.98039216	0.96153843	0.9708738	0.80314136	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-07 20:45:11	2020-07-07 20:45:11	2020-07-07 20:45:11	2020-07-07 20:45:11	0.0976312	1251	\N		461	\N	None	1	0.03846154	0.074074075	0.102879584	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 21:09:40	2020-07-07 21:09:40	2020-07-07 21:09:40	2020-07-07 21:09:40	0.9892684	1252	\N		462	\N	None	1	0.9811321	0.9904762	0.8115183	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 21:12:40	2020-07-07 21:12:40	2020-07-07 21:12:40	2020-07-07 21:12:40	0.98894125	1253	\N		462	\N	None	1	0.962963	0.9811321	0.8188482	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 21:27:54	2020-07-07 21:27:54	2020-07-07 21:27:54	2020-07-07 21:27:54	0.9831174	1254	\N		462	\N	None	0.98	0.9423077	0.9607843	0.79162306	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.055555556	0.10526316	2020-07-07 21:36:56	2020-07-07 21:36:56	2020-07-07 21:36:56	2020-07-07 21:36:56	0.09926711	1255	\N		462	\N	None	1	0.03773585	0.07272727	0.09554974	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 22:01:15	2020-07-07 22:01:15	2020-07-07 22:01:15	2020-07-07 22:01:15	0.9899882	1256	\N		463	\N	None	1	0.9814815	0.99065423	0.80994767	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 22:05:07	2020-07-07 22:05:07	2020-07-07 22:05:07	2020-07-07 22:05:07	0.9899882	1257	\N		463	\N	None	1	0.9811321	0.9904762	0.813089	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 22:18:45	2020-07-07 22:18:45	2020-07-07 22:18:45	2020-07-07 22:18:45	0.97277844	1258	\N		463	\N	None	0.98	0.9245283	0.9514563	0.79424083	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.16666667	0.2857143	2020-07-07 22:29:24	2020-07-07 22:29:24	2020-07-07 22:29:24	2020-07-07 22:29:24	0.12701218	1259	\N		463	\N	None	1	0.13461539	0.23728813	0.12748691	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 22:58:51	2020-07-07 22:58:51	2020-07-07 22:58:51	2020-07-07 22:58:51	0.9861275	1260	\N		464	\N	None	1	0.9433962	0.9708738	0.81387436	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-07 23:03:05	2020-07-07 23:03:05	2020-07-07 23:03:05	2020-07-07 23:03:05	0.99025	1261	\N		464	\N	None	1	0.9423077	0.97029704	0.81780106	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-07 23:18:45	2020-07-07 23:18:45	2020-07-07 23:18:45	2020-07-07 23:18:45	0.982463	1262	\N		464	\N	None	1	0.9622642	0.9807692	0.80104715	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.12962963	0.22950819	2020-07-07 23:29:23	2020-07-07 23:29:23	2020-07-07 23:29:23	2020-07-07 23:29:23	0.11732758	1263	\N		464	\N	None	1	0.13207547	0.23333333	0.11465969	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-07 23:59:09	2020-07-07 23:59:09	2020-07-07 23:59:09	2020-07-07 23:59:09	0.98593116	1264	\N		465	\N	None	0.96153843	0.98039216	0.9708738	0.7981675	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-08 00:03:39	2020-07-08 00:03:39	2020-07-08 00:03:39	2020-07-08 00:03:39	0.98953015	1265	\N		465	\N	None	0.97959185	0.9230769	0.95049506	0.80471206	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-08 00:22:03	2020-07-08 00:22:03	2020-07-08 00:22:03	2020-07-08 00:22:03	0.9672163	1266	\N		465	\N	None	1	0.9444444	0.9714286	0.7740838	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.12962963	0.22950819	2020-07-08 00:31:06	2020-07-08 00:31:06	2020-07-08 00:31:06	2020-07-08 00:31:06	0.10999869	1267	\N		465	\N	None	1	0.11320755	0.20338982	0.10811518	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-08 00:56:15	2020-07-08 00:56:15	2020-07-08 00:56:15	2020-07-08 00:56:15	0.9894647	1268	\N		466	\N	None	0.9607843	0.9607843	0.9607843	0.82146597	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-08 00:59:50	2020-07-08 00:59:50	2020-07-08 00:59:50	2020-07-08 00:59:50	0.9897265	1269	\N		466	\N	None	1	0.9807692	0.99029124	0.826178	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	0.9814815	0.99065423	2020-07-08 01:18:40	2020-07-08 01:18:40	2020-07-08 01:18:40	2020-07-08 01:18:40	0.9810889	1270	\N		466	\N	None	1	0.9056604	0.95049506	0.8062827	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.055555556	0.10526316	2020-07-08 01:28:57	2020-07-08 01:28:57	2020-07-08 01:28:57	2020-07-08 01:28:57	0.09992148	1271	\N		466	\N	None	1	0.037037037	0.071428575	0.09162304	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-08 01:53:50	2020-07-08 01:53:50	2020-07-08 01:53:50	2020-07-08 01:53:50	0.98854864	1272	\N		467	\N	None	1	0.9259259	0.96153843	0.8188482	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-08 01:58:10	2020-07-08 01:58:10	2020-07-08 01:58:10	2020-07-08 01:58:10	0.9897265	1273	\N		467	\N	None	1	0.9622642	0.9807692	0.8159686	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-08 02:18:56	2020-07-08 02:18:56	2020-07-08 02:18:56	2020-07-08 02:18:56	0.9797147	1274	\N		467	\N	None	1	0.9433962	0.9708738	0.79267013	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.09259259	0.16949153	2020-07-08 02:39:56	2020-07-08 02:39:56	2020-07-08 02:39:56	2020-07-08 02:39:56	0.104174845	1275	\N		467	\N	None	1	0.074074075	0.13793103	0.11204188	\N	15282	3820	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 03:13:05	2020-07-08 03:13:05	2020-07-08 03:13:05	2020-07-08 03:13:05	0.9884105	1276	\N		468	\N	None	0.9814815	1	0.99065423	0.7648278	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 03:15:39	2020-07-08 03:15:39	2020-07-08 03:15:39	2020-07-08 03:15:39	0.9779864	1277	\N		468	\N	None	0.98039216	0.9433962	0.96153843	0.7909868	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 03:19:39	2020-07-08 03:19:39	2020-07-08 03:19:39	2020-07-08 03:19:39	0.96931046	1278	\N		468	\N	None	0.962963	1	0.9811321	0.77311575	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.3888889	0.56	2020-07-08 03:27:24	2020-07-08 03:27:24	2020-07-08 03:27:24	2020-07-08 03:27:24	0.47063774	1279	\N		468	\N	None	1	0.35185185	0.5205479	0.46179748	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 03:52:33	2020-07-08 03:52:33	2020-07-08 03:52:33	2020-07-08 03:52:33	0.9897054	1280	\N		469	\N	None	1	0.9807692	0.99029124	0.8130018	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 03:55:07	2020-07-08 03:55:07	2020-07-08 03:55:07	2020-07-08 03:55:07	0.984979	1281	\N		469	\N	None	1	0.9056604	0.95049506	0.8176638	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 04:05:39	2020-07-08 04:05:39	2020-07-08 04:05:39	2020-07-08 04:05:39	0.98426676	1282	\N		469	\N	None	0.962963	1	0.9811321	0.80833983	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.074074075	0.13793103	2020-07-08 04:15:01	2020-07-08 04:15:01	2020-07-08 04:15:01	2020-07-08 04:15:01	0.10333441	1283	\N		469	\N	None	1	0.037037037	0.071428575	0.103082106	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 04:29:40	2020-07-08 04:29:40	2020-07-08 04:29:40	2020-07-08 04:29:40	0.98931694	1284	\N		470	\N	None	1	0.962963	0.9811321	0.81351984	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 04:30:49	2020-07-08 04:30:49	2020-07-08 04:30:49	2020-07-08 04:30:49	0.98031723	1285	\N		470	\N	None	1	0.9245283	0.9607843	0.8127428	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 04:34:16	2020-07-08 04:34:16	2020-07-08 04:34:16	2020-07-08 04:34:16	0.9812237	1286	\N		470	\N	None	1	0.9814815	0.99065423	0.8039368	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.055555556	0.10526316	2020-07-08 04:40:01	2020-07-08 04:40:01	2020-07-08 04:40:01	2020-07-08 04:40:01	0.10203949	1287	\N		470	\N	None	1	0.056603774	0.10714286	0.104377106	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 04:54:29	2020-07-08 04:54:29	2020-07-08 04:54:29	2020-07-08 04:54:29	0.98834574	1288	\N		471	\N	None	0.9807692	0.9807692	0.9807692	0.8016058	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 04:55:37	2020-07-08 04:55:37	2020-07-08 04:55:37	2020-07-08 04:55:37	0.9755908	1289	\N		471	\N	None	1	0.96153843	0.98039216	0.8124838	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 04:58:31	2020-07-08 04:58:31	2020-07-08 04:58:31	2020-07-08 04:58:31	0.976303	1290	\N		471	\N	None	0.9811321	0.9811321	0.9811321	0.7881378	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.11111111	0.2	2020-07-08 05:04:03	2020-07-08 05:04:03	2020-07-08 05:04:03	2020-07-08 05:04:03	0.10326967	1291	\N		471	\N	None	1	0.056603774	0.10714286	0.1041181	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 05:18:46	2020-07-08 05:18:46	2020-07-08 05:18:46	2020-07-08 05:18:46	0.99002916	1292	\N		472	\N	None	1	0.9622642	0.9807692	0.8062678	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 05:20:05	2020-07-08 05:20:05	2020-07-08 05:20:05	2020-07-08 05:20:05	0.98750407	1293	\N		472	\N	None	1	0.9259259	0.96153843	0.8067858	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 05:23:22	2020-07-08 05:23:22	2020-07-08 05:23:22	2020-07-08 05:23:22	0.9838135	1294	\N		472	\N	None	1	1	1	0.7933178	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.22222222	0.36363637	2020-07-08 05:29:32	2020-07-08 05:29:32	2020-07-08 05:29:32	2020-07-08 05:29:32	0.21120104	1295	\N		472	\N	None	1	0.18867925	0.31746033	0.2004662	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 05:44:20	2020-07-08 05:44:20	2020-07-08 05:44:20	2020-07-08 05:44:20	0.9894464	1296	\N		473	\N	None	0.98039216	0.9433962	0.96153843	0.7969438	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 05:45:39	2020-07-08 05:45:39	2020-07-08 05:45:39	2020-07-08 05:45:39	0.98556167	1297	\N		473	\N	None	1	0.9622642	0.9807692	0.8088578	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 05:49:08	2020-07-08 05:49:08	2020-07-08 05:49:08	2020-07-08 05:49:08	0.9829071	1298	\N		473	\N	None	0.9814815	1	0.99065423	0.7987568	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.18518518	0.3125	2020-07-08 05:55:05	2020-07-08 05:55:05	2020-07-08 05:55:05	2020-07-08 05:55:05	0.18841049	1299	\N		473	\N	None	1	0.1923077	0.32258064	0.17948718	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 06:09:40	2020-07-08 06:09:40	2020-07-08 06:09:40	2020-07-08 06:09:40	0.9897702	1300	\N		474	\N	None	1	0.962963	0.9811321	0.76974875	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 06:10:57	2020-07-08 06:10:57	2020-07-08 06:10:57	2020-07-08 06:10:57	0.9837488	1301	\N		474	\N	None	1	0.9074074	0.9514563	0.8041958	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 06:13:44	2020-07-08 06:13:44	2020-07-08 06:13:44	2020-07-08 06:13:44	0.98141795	1302	\N		474	\N	None	0.9444444	1	0.9714286	0.7821808	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.2037037	0.33846155	2020-07-08 06:19:22	2020-07-08 06:19:22	2020-07-08 06:19:22	2020-07-08 06:19:22	0.27471673	1303	\N		474	\N	None	1	0.23076923	0.375	0.28360528	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 06:34:22	2020-07-08 06:34:22	2020-07-08 06:34:22	2020-07-08 06:34:22	0.9897702	1304	\N		475	\N	None	1	0.9245283	0.9607843	0.8166278	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 06:35:43	2020-07-08 06:35:43	2020-07-08 06:35:43	2020-07-08 06:35:43	0.9862739	1305	\N		475	\N	None	1	0.8888889	0.9411765	0.8189588	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 06:41:52	2020-07-08 06:41:52	2020-07-08 06:41:52	2020-07-08 06:41:52	0.98517317	1306	\N		475	\N	None	0.9622642	0.9807692	0.9714286	0.8106708	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.055555556	0.10526316	2020-07-08 06:48:35	2020-07-08 06:48:35	2020-07-08 06:48:35	2020-07-08 06:48:35	0.099320166	1307	\N		475	\N	None	1	0.03773585	0.07272727	0.1033411	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 07:03:18	2020-07-08 07:03:18	2020-07-08 07:03:18	2020-07-08 07:03:18	0.99002916	1308	\N		476	\N	None	1	0.9811321	0.9904762	0.8148148	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 07:04:39	2020-07-08 07:04:39	2020-07-08 07:04:39	2020-07-08 07:04:39	0.98646814	1309	\N		476	\N	None	1	0.9245283	0.9607843	0.8225848	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 07:10:15	2020-07-08 07:10:15	2020-07-08 07:10:15	2020-07-08 07:10:15	0.98329556	1310	\N		476	\N	None	0.9444444	1	0.9714286	0.8111888	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.055555556	0.10526316	2020-07-08 07:16:54	2020-07-08 07:16:54	2020-07-08 07:16:54	2020-07-08 07:16:54	0.10087407	1311	\N		476	\N	None	1	0.03846154	0.074074075	0.1015281	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 07:31:35	2020-07-08 07:31:35	2020-07-08 07:31:35	2020-07-08 07:31:35	0.9886047	1312	\N		477	\N	None	1	0.9811321	0.9904762	0.8096348	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 07:32:49	2020-07-08 07:32:49	2020-07-08 07:32:49	2020-07-08 07:32:49	0.98394305	1313	\N		477	\N	None	1	0.9423077	0.97029704	0.8021238	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 07:38:24	2020-07-08 07:38:24	2020-07-08 07:38:24	2020-07-08 07:38:24	0.9825186	1314	\N		477	\N	None	0.962963	1	0.9811321	0.8150738	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.055555556	0.10526316	2020-07-08 07:44:35	2020-07-08 07:44:35	2020-07-08 07:44:35	2020-07-08 07:44:35	0.098607965	1315	\N		477	\N	None	1	0.03773585	0.07272727	0.101787105	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 07:59:19	2020-07-08 07:59:19	2020-07-08 07:59:19	2020-07-08 07:59:19	0.9897054	1316	\N		478	\N	None	0.98039216	0.96153843	0.9708738	0.8041958	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 08:00:52	2020-07-08 08:00:52	2020-07-08 08:00:52	2020-07-08 08:00:52	0.9886047	1317	\N		478	\N	None	1	0.9622642	0.9807692	0.8158508	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 08:07:04	2020-07-08 08:07:04	2020-07-08 08:07:04	2020-07-08 08:07:04	0.98329556	1318	\N		478	\N	None	0.9814815	1	0.99065423	0.8039368	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.12962963	0.22950819	2020-07-08 08:14:04	2020-07-08 08:14:04	2020-07-08 08:14:04	2020-07-08 08:14:04	0.1153124	1319	\N		478	\N	None	1	0.13461539	0.23728813	0.11162911	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 08:28:47	2020-07-08 08:28:47	2020-07-08 08:28:47	2020-07-08 08:28:47	0.9897054	1320	\N		479	\N	None	1	0.9622642	0.9807692	0.8093758	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 08:30:18	2020-07-08 08:30:18	2020-07-08 08:30:18	2020-07-08 08:30:18	0.98769826	1321	\N		479	\N	None	1	0.9245283	0.9607843	0.81792283	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 08:35:39	2020-07-08 08:35:39	2020-07-08 08:35:39	2020-07-08 08:35:39	0.98355454	1322	\N		479	\N	None	0.9811321	0.9811321	0.9811321	0.7837348	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.16666667	0.2857143	2020-07-08 08:42:15	2020-07-08 08:42:15	2020-07-08 08:42:15	2020-07-08 08:42:15	0.12521851	1323	\N		479	\N	None	1	0.16981132	0.29032257	0.12069412	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 08:57:00	2020-07-08 08:57:00	2020-07-08 08:57:00	2020-07-08 08:57:00	0.99048233	1324	\N		480	\N	None	1	0.9622642	0.9807692	0.7977208	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 08:58:25	2020-07-08 08:58:25	2020-07-08 08:58:25	2020-07-08 08:58:25	0.98711556	1325	\N		480	\N	None	1	1	1	0.81429684	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 09:04:39	2020-07-08 09:04:39	2020-07-08 09:04:39	2020-07-08 09:04:39	0.9838135	1326	\N		480	\N	None	0.9814815	1	0.99065423	0.7907278	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.14814815	0.2580645	2020-07-08 09:11:01	2020-07-08 09:11:01	2020-07-08 09:11:01	2020-07-08 09:11:01	0.12120427	1327	\N		480	\N	None	1	0.1509434	0.26229507	0.11965812	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 09:26:11	2020-07-08 09:26:11	2020-07-08 09:26:11	2020-07-08 09:26:11	0.9897702	1328	\N		481	\N	None	1	0.9811321	0.9904762	0.82646984	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 09:27:43	2020-07-08 09:27:43	2020-07-08 09:27:43	2020-07-08 09:27:43	0.9869861	1329	\N		481	\N	None	1	0.9074074	0.9514563	0.8197358	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 09:35:33	2020-07-08 09:35:33	2020-07-08 09:35:33	2020-07-08 09:35:33	0.9857559	1330	\N		481	\N	None	0.9811321	0.9811321	0.9811321	0.8096348	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-08 09:46:14	2020-07-08 09:46:14	2020-07-08 09:46:14	2020-07-08 09:46:14	0.09770152	1331	\N		481	\N	None	1	0.039215688	0.0754717	0.104377106	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 10:19:09	2020-07-08 10:19:09	2020-07-08 10:19:09	2020-07-08 10:19:09	0.9910003	1332	\N		482	\N	None	0.98039216	0.9433962	0.96153843	0.8049728	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 10:25:31	2020-07-08 10:25:31	2020-07-08 10:25:31	2020-07-08 10:25:31	0.9878278	1333	\N		482	\N	None	1	0.9245283	0.9607843	0.8269878	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 10:51:06	2020-07-08 10:51:06	2020-07-08 10:51:06	2020-07-08 10:51:06	0.9856264	1334	\N		482	\N	None	1	0.9814815	0.99065423	0.8070448	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.11111111	0.2	2020-07-08 11:01:35	2020-07-08 11:01:35	2020-07-08 11:01:35	2020-07-08 11:01:35	0.106571704	1335	\N		482	\N	None	1	0.094339624	0.1724138	0.10826211	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 11:23:26	2020-07-08 11:23:26	2020-07-08 11:23:26	2020-07-08 11:23:26	0.98653287	1336	\N		483	\N	None	0.9811321	0.9811321	0.9811321	0.7718208	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 11:25:18	2020-07-08 11:25:18	2020-07-08 11:25:18	2020-07-08 11:25:18	0.9777274	1337	\N		483	\N	None	1	0.9433962	0.9708738	0.7974618	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 11:27:22	2020-07-08 11:27:22	2020-07-08 11:27:22	2020-07-08 11:27:22	0.9719003	1338	\N		483	\N	None	0.9814815	1	0.99065423	0.7702668	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.33333334	0.5	2020-07-08 11:36:10	2020-07-08 11:36:10	2020-07-08 11:36:10	2020-07-08 11:36:10	0.47089672	1339	\N		483	\N	None	1	0.33962265	0.5070422	0.45480445	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 11:59:40	2020-07-08 11:59:40	2020-07-08 11:59:40	2020-07-08 11:59:40	0.9897054	1340	\N		484	\N	None	1	0.9807692	0.99029124	0.82543385	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 12:02:43	2020-07-08 12:02:43	2020-07-08 12:02:43	2020-07-08 12:02:43	0.98711556	1341	\N		484	\N	None	1	0.9259259	0.96153843	0.8241388	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 12:11:39	2020-07-08 12:11:39	2020-07-08 12:11:39	2020-07-08 12:11:39	0.9868566	1342	\N		484	\N	None	0.9814815	1	0.99065423	0.8023828	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-08 12:21:46	2020-07-08 12:21:46	2020-07-08 12:21:46	2020-07-08 12:21:46	0.10126255	1343	\N		484	\N	None	1	0.03773585	0.07272727	0.10541311	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 12:42:56	2020-07-08 12:42:56	2020-07-08 12:42:56	2020-07-08 12:42:56	0.9901586	1344	\N		485	\N	None	0.9811321	1	0.9904762	0.82880086	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 12:45:02	2020-07-08 12:45:02	2020-07-08 12:45:02	2020-07-08 12:45:02	0.9874393	1345	\N		485	\N	None	0.98039216	0.96153843	0.9708738	0.8210308	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 12:56:04	2020-07-08 12:56:04	2020-07-08 12:56:04	2020-07-08 12:56:04	0.98679185	1346	\N		485	\N	None	0.9814815	1	0.99065423	0.8054908	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-08 13:06:00	2020-07-08 13:06:00	2020-07-08 13:06:00	2020-07-08 13:06:00	0.09906118	1347	\N		485	\N	None	1	0.03773585	0.07272727	0.0989381	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 13:25:09	2020-07-08 13:25:09	2020-07-08 13:25:09	2020-07-08 13:25:09	0.9895759	1348	\N		486	\N	None	1	0.962963	0.9811321	0.8181818	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 13:27:17	2020-07-08 13:27:17	2020-07-08 13:27:17	2020-07-08 13:27:17	0.9872451	1349	\N		486	\N	None	1	0.9056604	0.95049506	0.8078218	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 13:38:54	2020-07-08 13:38:54	2020-07-08 13:38:54	2020-07-08 13:38:54	0.9856264	1350	\N		486	\N	None	1	1	1	0.8171458	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-08 13:48:44	2020-07-08 13:48:44	2020-07-08 13:48:44	2020-07-08 13:48:44	0.09977339	1351	\N		486	\N	None	1	0.03846154	0.074074075	0.096089095	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 14:08:55	2020-07-08 14:08:55	2020-07-08 14:08:55	2020-07-08 14:08:55	0.9894464	1352	\N		487	\N	None	1	0.962963	0.9811321	0.8096348	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 14:11:49	2020-07-08 14:11:49	2020-07-08 14:11:49	2020-07-08 14:11:49	0.9884105	1353	\N		487	\N	None	1	0.9622642	0.9807692	0.82206684	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 14:20:22	2020-07-08 14:20:22	2020-07-08 14:20:22	2020-07-08 14:20:22	0.9843315	1354	\N		487	\N	None	0.9814815	1	0.99065423	0.7863248	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.18518518	0.3125	2020-07-08 14:30:49	2020-07-08 14:30:49	2020-07-08 14:30:49	2020-07-08 14:30:49	0.14548397	1355	\N		487	\N	None	1	0.16981132	0.29032257	0.14219114	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 14:52:21	2020-07-08 14:52:21	2020-07-08 14:52:21	2020-07-08 14:52:21	0.9897054	1356	\N		488	\N	None	0.98	0.9607843	0.97029704	0.8158508	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 14:55:04	2020-07-08 14:55:04	2020-07-08 14:55:04	2020-07-08 14:55:04	0.98808676	1357	\N		488	\N	None	1	0.9811321	0.9904762	0.8199948	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 15:07:43	2020-07-08 15:07:43	2020-07-08 15:07:43	2020-07-08 15:07:43	0.98646814	1358	\N		488	\N	None	1	0.962963	0.9811321	0.7907278	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.11320755	0.20338982	2020-07-08 15:18:24	2020-07-08 15:18:24	2020-07-08 15:18:24	2020-07-08 15:18:24	0.10663645	1359	\N		488	\N	None	1	0.11111111	0.2	0.10929811	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 15:38:21	2020-07-08 15:38:21	2020-07-08 15:38:21	2020-07-08 15:38:21	0.98989964	1360	\N		489	\N	None	1	0.9811321	0.9904762	0.8029008	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 15:40:58	2020-07-08 15:40:58	2020-07-08 15:40:58	2020-07-08 15:40:58	0.988281	1361	\N		489	\N	None	1	0.962963	0.9811321	0.8124838	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 15:53:28	2020-07-08 15:53:28	2020-07-08 15:53:28	2020-07-08 15:53:28	0.98484945	1362	\N		489	\N	None	0.962963	1	0.9811321	0.78943276	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.09259259	0.16949153	2020-07-08 16:03:00	2020-07-08 16:03:00	2020-07-08 16:03:00	2020-07-08 16:03:00	0.10540628	1363	\N		489	\N	None	1	0.09615385	0.1754386	0.112924114	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 16:26:42	2020-07-08 16:26:42	2020-07-08 16:26:42	2020-07-08 16:26:42	0.9905471	1364	\N		490	\N	None	1	0.9622642	0.9807692	0.83501685	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 16:29:55	2020-07-08 16:29:55	2020-07-08 16:29:55	2020-07-08 16:29:55	0.9892522	1365	\N		490	\N	None	1	0.9056604	0.95049506	0.8236208	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 16:49:42	2020-07-08 16:49:42	2020-07-08 16:49:42	2020-07-08 16:49:42	0.9882163	1366	\N		490	\N	None	1	0.9814815	0.99065423	0.8166278	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-08 17:00:47	2020-07-08 17:00:47	2020-07-08 17:00:47	2020-07-08 17:00:47	0.09834898	1367	\N		490	\N	None	1	0.039215688	0.0754717	0.101787105	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 17:22:59	2020-07-08 17:22:59	2020-07-08 17:22:59	2020-07-08 17:22:59	0.9897702	1368	\N		491	\N	None	1	1	1	0.82724684	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 17:25:45	2020-07-08 17:25:45	2020-07-08 17:25:45	2020-07-08 17:25:45	0.9897702	1369	\N		491	\N	None	1	0.9433962	0.9708738	0.82569283	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 17:45:37	2020-07-08 17:45:37	2020-07-08 17:45:37	2020-07-08 17:45:37	0.9862739	1370	\N		491	\N	None	0.9811321	0.9811321	0.9811321	0.81610984	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.018518519	0.036363635	2020-07-08 17:57:51	2020-07-08 17:57:51	2020-07-08 17:57:51	2020-07-08 17:57:51	0.09944966	1371	\N		491	\N	None	1	0.018867925	0.037037037	0.09427609	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 18:19:20	2020-07-08 18:19:20	2020-07-08 18:19:20	2020-07-08 18:19:20	0.99022335	1372	\N		492	\N	None	1	0.9622642	0.9807692	0.82828283	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 18:21:58	2020-07-08 18:21:58	2020-07-08 18:21:58	2020-07-08 18:21:58	0.98873425	1373	\N		492	\N	None	1	0.9245283	0.9607843	0.8122248	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 18:40:29	2020-07-08 18:40:29	2020-07-08 18:40:29	2020-07-08 18:40:29	0.9869213	1374	\N		492	\N	None	0.9807692	0.9622642	0.9714286	0.8174048	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.018518519	0.036363635	2020-07-08 18:50:25	2020-07-08 18:50:25	2020-07-08 18:50:25	2020-07-08 18:50:25	0.09679508	1375	\N		492	\N	None	1	0.018867925	0.037037037	0.10489511	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 19:12:42	2020-07-08 19:12:42	2020-07-08 19:12:42	2020-07-08 19:12:42	0.99022335	1376	\N		493	\N	None	1	0.9622642	0.9807692	0.82128984	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 19:16:33	2020-07-08 19:16:33	2020-07-08 19:16:33	2020-07-08 19:16:33	0.9897702	1377	\N		493	\N	None	1	0.9444444	0.9714286	0.82465684	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 19:33:24	2020-07-08 19:33:24	2020-07-08 19:33:24	2020-07-08 19:33:24	0.98737454	1378	\N		493	\N	None	0.9814815	1	0.99065423	0.81688684	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.074074075	0.13793103	2020-07-08 19:44:33	2020-07-08 19:44:33	2020-07-08 19:44:33	2020-07-08 19:44:33	0.10385238	1379	\N		493	\N	None	1	0.055555556	0.10526316	0.1010101	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 20:05:19	2020-07-08 20:05:19	2020-07-08 20:05:19	2020-07-08 20:05:19	0.99061185	1380	\N		494	\N	None	1	0.9245283	0.9607843	0.8148148	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 20:08:22	2020-07-08 20:08:22	2020-07-08 20:08:22	2020-07-08 20:08:22	0.9897702	1381	\N		494	\N	None	1	0.9807692	0.99029124	0.82206684	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 20:29:19	2020-07-08 20:29:19	2020-07-08 20:29:19	2020-07-08 20:29:19	0.9868566	1382	\N		494	\N	None	0.9814815	1	0.99065423	0.8036778	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.074074075	0.13793103	2020-07-08 20:40:38	2020-07-08 20:40:38	2020-07-08 20:40:38	2020-07-08 20:40:38	0.10333441	1383	\N		494	\N	None	1	0.055555556	0.10526316	0.0997151	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 21:00:13	2020-07-08 21:00:13	2020-07-08 21:00:13	2020-07-08 21:00:13	0.9897054	1384	\N		495	\N	None	1	0.9811321	0.9904762	0.8130018	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 21:03:26	2020-07-08 21:03:26	2020-07-08 21:03:26	2020-07-08 21:03:26	0.988799	1385	\N		495	\N	None	1	0.962963	0.9811321	0.81688684	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 21:22:30	2020-07-08 21:22:30	2020-07-08 21:22:30	2020-07-08 21:22:30	0.9872451	1386	\N		495	\N	None	1	0.962963	0.9811321	0.7966848	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-08 21:32:45	2020-07-08 21:32:45	2020-07-08 21:32:45	2020-07-08 21:32:45	0.10145678	1387	\N		495	\N	None	1	0.037037037	0.071428575	0.1023051	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 21:52:31	2020-07-08 21:52:31	2020-07-08 21:52:31	2020-07-08 21:52:31	0.9901586	1388	\N		496	\N	None	0.98039216	0.96153843	0.9708738	0.8233618	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 21:55:51	2020-07-08 21:55:51	2020-07-08 21:55:51	2020-07-08 21:55:51	0.9891874	1389	\N		496	\N	None	1	0.9433962	0.9708738	0.82025385	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 22:21:13	2020-07-08 22:21:13	2020-07-08 22:21:13	2020-07-08 22:21:13	0.98711556	1390	\N		496	\N	None	0.9811321	0.9811321	0.9811321	0.80574983	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.018518519	0.036363635	2020-07-08 22:35:23	2020-07-08 22:35:23	2020-07-08 22:35:23	2020-07-08 22:35:23	0.09841373	1391	\N		496	\N	None	1	0.018867925	0.037037037	0.0984201	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-08 22:58:51	2020-07-08 22:58:51	2020-07-08 22:58:51	2020-07-08 22:58:51	0.98996437	1392	\N		497	\N	None	1	0.9622642	0.9807692	0.82802385	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-08 23:03:43	2020-07-08 23:03:43	2020-07-08 23:03:43	2020-07-08 23:03:43	0.9895759	1393	\N		497	\N	None	1	0.9807692	0.99029124	0.8174048	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-08 23:34:13	2020-07-08 23:34:13	2020-07-08 23:34:13	2020-07-08 23:34:13	0.9869861	1394	\N		497	\N	None	1	1	1	0.8041958	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-08 23:47:45	2020-07-08 23:47:45	2020-07-08 23:47:45	2020-07-08 23:47:45	0.10203949	1395	\N		497	\N	None	1	0.037037037	0.071428575	0.0981611	\N	15445	3861	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 00:29:59	2020-07-09 00:29:59	2020-07-09 00:29:59	2020-07-09 00:29:59	0.99682236	1396	\N		498	\N	None	0.9782609	0.88235295	0.92783505	0.81194407	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 00:30:48	2020-07-09 00:30:48	2020-07-09 00:30:48	2020-07-09 00:30:48	0.9990467	1397	\N		498	\N	None	1	0.8333333	0.90909094	0.8221093	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 00:31:25	2020-07-09 00:31:25	2020-07-09 00:31:25	2020-07-09 00:31:25	0.9761678	1398	\N		498	\N	None	0.9318182	0.9111111	0.92134833	0.7966963	\N	3147	787	None
SVC	\N	5	3150	788	1	0.7962963	0.88659793	2020-07-09 00:32:37	2020-07-09 00:32:37	2020-07-09 00:32:37	2020-07-09 00:32:37	0.810931	1399	\N		498	\N	None	1	0.6666667	0.8	0.72808135	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 01:09:51	2020-07-09 01:09:51	2020-07-09 01:09:51	2020-07-09 01:09:51	0.9974579	1400	\N		499	\N	None	0.9148936	0.8958333	0.9052632	0.81194407	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 01:10:59	2020-07-09 01:10:59	2020-07-09 01:10:59	2020-07-09 01:10:59	0.9984112	1401	\N		499	\N	None	0.9047619	0.80851066	0.85393256	0.819568	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 01:11:56	2020-07-09 01:11:56	2020-07-09 01:11:56	2020-07-09 01:11:56	0.97585005	1402	\N		499	\N	None	0.97959185	0.96	0.969697	0.82592124	\N	3147	787	None
SVC	\N	5	3150	788	1	0.35185185	0.5205479	2020-07-09 01:13:14	2020-07-09 01:13:14	2020-07-09 01:13:14	2020-07-09 01:13:14	0.4229425	1403	\N		499	\N	None	1	0.3478261	0.516129	0.42439646	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 01:47:46	2020-07-09 01:47:46	2020-07-09 01:47:46	2020-07-09 01:47:46	0.9974579	1404	\N		500	\N	None	0.9791667	0.8867925	0.9306931	0.80559087	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 01:48:35	2020-07-09 01:48:35	2020-07-09 01:48:35	2020-07-09 01:48:35	0.99872893	1405	\N		500	\N	None	0.95652175	0.9166667	0.9361702	0.8081322	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9444444	0.9714286	2020-07-09 01:49:21	2020-07-09 01:49:21	2020-07-09 01:49:21	2020-07-09 01:49:21	0.9577375	1406	\N		500	\N	None	1	0.877551	0.9347826	0.7801779	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2962963	0.45714286	2020-07-09 01:50:29	2020-07-09 01:50:29	2020-07-09 01:50:29	2020-07-09 01:50:29	0.40768987	1407	\N		500	\N	None	1	0.2857143	0.44444445	0.39771283	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 02:24:41	2020-07-09 02:24:41	2020-07-09 02:24:41	2020-07-09 02:24:41	0.9971401	1408	\N		501	\N	None	0.9347826	0.8958333	0.9148936	0.82592124	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 02:25:22	2020-07-09 02:25:22	2020-07-09 02:25:22	2020-07-09 02:25:22	0.9984112	1409	\N		501	\N	None	0.9285714	0.8666667	0.8965517	0.815756	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.962963	0.9811321	2020-07-09 02:26:00	2020-07-09 02:26:00	2020-07-09 02:26:00	2020-07-09 02:26:00	0.9199237	1410	\N		501	\N	None	1	0.8333333	0.90909094	0.7700127	\N	3147	787	None
SVC	\N	5	3150	788	1	0.3888889	0.56	2020-07-09 02:27:00	2020-07-09 02:27:00	2020-07-09 02:27:00	2020-07-09 02:27:00	0.47791547	1411	\N		501	\N	None	1	0.375	0.54545456	0.47268108	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 03:00:58	2020-07-09 03:00:58	2020-07-09 03:00:58	2020-07-09 03:00:58	0.99682236	1412	\N		502	\N	None	0.9767442	0.85714287	0.9130435	0.7966963	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 03:01:53	2020-07-09 03:01:53	2020-07-09 03:01:53	2020-07-09 03:01:53	0.9990467	1413	\N		502	\N	None	1	0.88	0.9361702	0.83735704	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9814815	0.99065423	2020-07-09 03:02:57	2020-07-09 03:02:57	2020-07-09 03:02:57	2020-07-09 03:02:57	0.97203684	1414	\N		502	\N	None	0.9756098	0.7692308	0.86021507	0.7966963	\N	3147	787	None
SVC	\N	5	3150	788	1	0.5555556	0.71428573	2020-07-09 03:04:39	2020-07-09 03:04:39	2020-07-09 03:04:39	2020-07-09 03:04:39	0.60311407	1415	\N		502	\N	None	1	0.48076922	0.64935064	0.545108	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 03:39:00	2020-07-09 03:39:00	2020-07-09 03:39:00	2020-07-09 03:39:00	0.9974579	1416	\N		503	\N	None	0.9787234	0.9019608	0.93877554	0.7966963	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 03:39:49	2020-07-09 03:39:49	2020-07-09 03:39:49	2020-07-09 03:39:49	0.99872893	1417	\N		503	\N	None	1	0.8235294	0.9032258	0.8094028	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 03:40:38	2020-07-09 03:40:38	2020-07-09 03:40:38	2020-07-09 03:40:38	0.9374007	1418	\N		503	\N	None	0.95454544	0.875	0.9130435	0.79288435	\N	3147	787	None
SVC	\N	5	3150	788	1	0.5	0.6666667	2020-07-09 03:41:43	2020-07-09 03:41:43	2020-07-09 03:41:43	2020-07-09 03:41:43	0.60247856	1419	\N		503	\N	None	1	0.44	0.6111111	0.5565438	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 04:19:17	2020-07-09 04:19:17	2020-07-09 04:19:17	2020-07-09 04:19:17	0.99523354	1420	\N		504	\N	None	0.9583333	0.92	0.93877554	0.77890724	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 04:20:04	2020-07-09 04:20:04	2020-07-09 04:20:04	2020-07-09 04:20:04	0.99872893	1421	\N		504	\N	None	1	0.8913044	0.9425287	0.8360864	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9811321	0.9904762	2020-07-09 04:20:45	2020-07-09 04:20:45	2020-07-09 04:20:45	2020-07-09 04:20:45	0.9647283	1422	\N		504	\N	None	0.93333334	0.89361703	0.9130435	0.8081322	\N	3147	787	None
SVC	\N	5	3150	788	1	0.6111111	0.7586207	2020-07-09 04:21:50	2020-07-09 04:21:50	2020-07-09 04:21:50	2020-07-09 04:21:50	0.6914522	1423	\N		504	\N	None	1	0.5625	0.72	0.65311307	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 04:59:33	2020-07-09 04:59:33	2020-07-09 04:59:33	2020-07-09 04:59:33	0.9980934	1424	\N		505	\N	None	0.93333334	0.875	0.9032258	0.8081322	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 05:00:40	2020-07-09 05:00:40	2020-07-09 05:00:40	2020-07-09 05:00:40	0.99872893	1425	\N		505	\N	None	1	0.9375	0.9677419	0.8310038	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 05:01:58	2020-07-09 05:01:58	2020-07-09 05:01:58	2020-07-09 05:01:58	0.9831586	1426	\N		505	\N	None	0.9361702	0.9361702	0.9361702	0.8335451	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2777778	0.4347826	2020-07-09 05:03:35	2020-07-09 05:03:35	2020-07-09 05:03:35	2020-07-09 05:03:35	0.3523991	1427	\N		505	\N	None	1	0.22	0.36065573	0.364676	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 05:41:16	2020-07-09 05:41:16	2020-07-09 05:41:16	2020-07-09 05:41:16	0.99872893	1428	\N		506	\N	None	0.93877554	0.9787234	0.9583333	0.8132147	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 05:42:20	2020-07-09 05:42:20	2020-07-09 05:42:20	2020-07-09 05:42:20	0.99872893	1429	\N		506	\N	None	0.97727275	0.86	0.9148936	0.82592124	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9814815	0.99065423	2020-07-09 05:43:32	2020-07-09 05:43:32	2020-07-09 05:43:32	2020-07-09 05:43:32	0.9853829	1430	\N		506	\N	None	0.9361702	0.9361702	0.9361702	0.82846254	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2962963	0.45714286	2020-07-09 05:45:02	2020-07-09 05:45:02	2020-07-09 05:45:02	2020-07-09 05:45:02	0.3876708	1431	\N		506	\N	None	1	0.27272728	0.42857143	0.33163914	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 06:23:20	2020-07-09 06:23:20	2020-07-09 06:23:20	2020-07-09 06:23:20	0.99682236	1432	\N		507	\N	None	0.9787234	0.92	0.9484536	0.8081322	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 06:24:18	2020-07-09 06:24:18	2020-07-09 06:24:18	2020-07-09 06:24:18	0.9980934	1433	\N		507	\N	None	0.95348835	0.87234044	0.9111111	0.83481574	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9814815	0.99065423	2020-07-09 06:25:22	2020-07-09 06:25:22	2020-07-09 06:25:22	2020-07-09 06:25:22	0.9793454	1434	\N		507	\N	None	0.9148936	0.8958333	0.9052632	0.8106734	\N	3147	787	None
SVC	\N	5	3150	788	1	0.25925925	0.4117647	2020-07-09 06:26:55	2020-07-09 06:26:55	2020-07-09 06:26:55	2020-07-09 06:26:55	0.37146488	1435	\N		507	\N	None	1	0.26530612	0.41935483	0.35832274	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 07:05:17	2020-07-09 07:05:17	2020-07-09 07:05:17	2020-07-09 07:05:17	0.9974579	1436	\N		508	\N	None	0.9574468	0.88235295	0.9183673	0.8221093	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 07:06:26	2020-07-09 07:06:26	2020-07-09 07:06:26	2020-07-09 07:06:26	0.99968225	1437	\N		508	\N	None	0.9782609	0.86538464	0.9183673	0.8081322	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 07:07:45	2020-07-09 07:07:45	2020-07-09 07:07:45	2020-07-09 07:07:45	0.97998095	1438	\N		508	\N	None	0.93333334	0.875	0.9032258	0.8170267	\N	3147	787	None
SVC	\N	5	3150	788	1	0.4074074	0.57894737	2020-07-09 07:09:15	2020-07-09 07:09:15	2020-07-09 07:09:15	2020-07-09 07:09:15	0.5068319	1439	\N		508	\N	None	1	0.41666666	0.5882353	0.49555272	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 07:47:59	2020-07-09 07:47:59	2020-07-09 07:47:59	2020-07-09 07:47:59	0.9977757	1440	\N		509	\N	None	1	0.88461536	0.93877554	0.80559087	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 07:49:08	2020-07-09 07:49:08	2020-07-09 07:49:08	2020-07-09 07:49:08	0.99872893	1441	\N		509	\N	None	1	0.86	0.9247312	0.8437103	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 07:50:17	2020-07-09 07:50:17	2020-07-09 07:50:17	2020-07-09 07:50:17	0.9783921	1442	\N		509	\N	None	0.9361702	0.88	0.9072165	0.7966963	\N	3147	787	None
SVC	\N	5	3150	788	1	0.4528302	0.6233766	2020-07-09 07:51:42	2020-07-09 07:51:42	2020-07-09 07:51:42	2020-07-09 07:51:42	0.5564029	1443	\N		509	\N	None	1	0.37254903	0.54285717	0.53113085	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 08:30:12	2020-07-09 08:30:12	2020-07-09 08:30:12	2020-07-09 08:30:12	0.9977757	1444	\N		510	\N	None	0.95555556	0.877551	0.9148936	0.7966963	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 08:31:14	2020-07-09 08:31:14	2020-07-09 08:31:15	2020-07-09 08:31:15	0.9984112	1445	\N		510	\N	None	0.975	0.7647059	0.85714287	0.819568	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 08:32:23	2020-07-09 08:32:23	2020-07-09 08:32:23	2020-07-09 08:32:23	0.94820464	1446	\N		510	\N	None	0.975	0.84782606	0.90697676	0.8043202	\N	3147	787	None
SVC	\N	5	3150	788	1	0.46296296	0.6329114	2020-07-09 08:33:38	2020-07-09 08:33:38	2020-07-09 08:33:38	2020-07-09 08:33:38	0.54528123	1447	\N		510	\N	None	1	0.42857143	0.6	0.49809402	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 09:15:41	2020-07-09 09:15:41	2020-07-09 09:15:41	2020-07-09 09:15:41	0.9984112	1448	\N		511	\N	None	0.9777778	0.9361702	0.95652175	0.82592124	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 09:17:19	2020-07-09 09:17:19	2020-07-09 09:17:19	2020-07-09 09:17:19	0.99872893	1449	\N		511	\N	None	0.9767442	0.85714287	0.9130435	0.819568	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 09:19:25	2020-07-09 09:19:25	2020-07-09 09:19:25	2020-07-09 09:19:25	0.98983157	1450	\N		511	\N	None	0.9791667	0.92156863	0.94949496	0.8094028	\N	3147	787	None
SVC	\N	5	3150	788	1	0.24074075	0.3880597	2020-07-09 09:21:01	2020-07-09 09:21:01	2020-07-09 09:21:01	2020-07-09 09:21:01	0.33460438	1451	\N		511	\N	None	1	0.22916667	0.37288135	0.30495554	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 09:56:49	2020-07-09 09:56:49	2020-07-09 09:56:49	2020-07-09 09:56:49	0.9980934	1452	\N		512	\N	None	0.9777778	0.84615386	0.9072165	0.819568	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 09:57:58	2020-07-09 09:57:58	2020-07-09 09:57:58	2020-07-09 09:57:58	0.9990467	1453	\N		512	\N	None	1	0.7962963	0.88659793	0.8360864	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 09:59:38	2020-07-09 09:59:38	2020-07-09 09:59:38	2020-07-09 09:59:38	0.9793454	1454	\N		512	\N	None	0.97727275	0.877551	0.9247312	0.815756	\N	3147	787	None
SVC	\N	5	3150	788	1	0.37037036	0.5405405	2020-07-09 10:01:10	2020-07-09 10:01:10	2020-07-09 10:01:10	2020-07-09 10:01:10	0.4931681	1455	\N		512	\N	None	1	0.36	0.5294118	0.44091487	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 10:40:24	2020-07-09 10:40:24	2020-07-09 10:40:24	2020-07-09 10:40:24	0.9974579	1456	\N		513	\N	None	0.9767442	0.84	0.9032258	0.78398985	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 10:41:10	2020-07-09 10:41:10	2020-07-09 10:41:10	2020-07-09 10:41:10	0.9984112	1457	\N		513	\N	None	0.95238096	0.81632656	0.8791209	0.8068615	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 10:41:45	2020-07-09 10:41:45	2020-07-09 10:41:45	2020-07-09 10:41:45	0.86749285	1458	\N		513	\N	None	0.97727275	0.877551	0.9247312	0.7357052	\N	3147	787	None
SVC	\N	5	3150	788	1	0.7962963	0.88659793	2020-07-09 10:43:31	2020-07-09 10:43:31	2020-07-09 10:43:31	2020-07-09 10:43:31	0.8080712	1459	\N		513	\N	None	1	0.6666667	0.8	0.66963154	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 11:23:18	2020-07-09 11:23:18	2020-07-09 11:23:18	2020-07-09 11:23:18	0.9977757	1460	\N		514	\N	None	0.84782606	0.8666667	0.85714287	0.8221093	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 11:24:36	2020-07-09 11:24:36	2020-07-09 11:24:36	2020-07-09 11:24:36	0.9984112	1461	\N		514	\N	None	0.975	0.84782606	0.90697676	0.82592124	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 11:25:53	2020-07-09 11:25:53	2020-07-09 11:25:53	2020-07-09 11:25:53	0.9831586	1462	\N		514	\N	None	0.97619045	0.82	0.8913044	0.79796696	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2777778	0.4347826	2020-07-09 11:27:53	2020-07-09 11:27:53	2020-07-09 11:27:53	2020-07-09 11:27:53	0.35112807	1463	\N		514	\N	None	1	0.23404256	0.37931034	0.33545107	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 12:03:26	2020-07-09 12:03:26	2020-07-09 12:03:26	2020-07-09 12:03:26	0.99872893	1464	\N		515	\N	None	0.9361702	0.8979592	0.9166667	0.82083863	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 12:05:13	2020-07-09 12:05:13	2020-07-09 12:05:13	2020-07-09 12:05:13	0.99872893	1465	\N		515	\N	None	0.95238096	0.8	0.8695652	0.82592124	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9814815	0.99065423	2020-07-09 12:08:14	2020-07-09 12:08:14	2020-07-09 12:08:14	2020-07-09 12:08:14	0.98760724	1466	\N		515	\N	None	1	0.84313726	0.9148936	0.80559087	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2037037	0.33846155	2020-07-09 12:10:34	2020-07-09 12:10:34	2020-07-09 12:10:34	2020-07-09 12:10:34	0.23101367	1467	\N		515	\N	None	1	0.1764706	0.3	0.20965692	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 12:47:13	2020-07-09 12:47:13	2020-07-09 12:47:13	2020-07-09 12:47:13	0.99872893	1468	\N		516	\N	None	0.97727275	0.86	0.9148936	0.82083863	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 12:49:08	2020-07-09 12:49:08	2020-07-09 12:49:08	2020-07-09 12:49:08	0.99872893	1469	\N		516	\N	None	1	0.88	0.9361702	0.82337993	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9814815	0.99065423	2020-07-09 12:52:55	2020-07-09 12:52:55	2020-07-09 12:52:55	2020-07-09 12:52:55	0.98760724	1470	\N		516	\N	None	0.9347826	0.86	0.8958333	0.80304956	\N	3147	787	None
SVC	\N	5	3150	788	1	0.14814815	0.2580645	2020-07-09 12:55:12	2020-07-09 12:55:12	2020-07-09 12:55:12	2020-07-09 12:55:12	0.18970448	1471	\N		516	\N	None	1	0.17777778	0.3018868	0.17789072	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 13:32:55	2020-07-09 13:32:55	2020-07-09 13:32:55	2020-07-09 13:32:55	0.9974579	1472	\N		517	\N	None	0.97619045	0.82	0.8913044	0.7992376	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 13:34:16	2020-07-09 13:34:16	2020-07-09 13:34:16	2020-07-09 13:34:16	0.9990467	1473	\N		517	\N	None	1	0.9	0.94736844	0.8132147	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 13:35:35	2020-07-09 13:35:35	2020-07-09 13:35:35	2020-07-09 13:35:35	0.9742612	1474	\N		517	\N	None	1	0.86538464	0.92783505	0.8081322	\N	3147	787	None
SVC	\N	5	3150	788	1	0.42592594	0.5974026	2020-07-09 13:37:18	2020-07-09 13:37:18	2020-07-09 13:37:18	2020-07-09 13:37:18	0.5246266	1475	\N		517	\N	None	1	0.3877551	0.5588235	0.47141042	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 14:14:12	2020-07-09 14:14:12	2020-07-09 14:14:12	2020-07-09 14:14:12	0.9974579	1476	\N		518	\N	None	0.97619045	0.82	0.8913044	0.8297332	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 14:15:51	2020-07-09 14:15:51	2020-07-09 14:15:51	2020-07-09 14:15:51	0.99872893	1477	\N		518	\N	None	0.9767442	0.85714287	0.9130435	0.8132147	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 14:18:41	2020-07-09 14:18:41	2020-07-09 14:18:41	2020-07-09 14:18:41	0.981252	1478	\N		518	\N	None	0.9347826	0.9148936	0.9247312	0.81194407	\N	3147	787	None
SVC	\N	5	3150	788	1	0.3148148	0.47887325	2020-07-09 14:20:43	2020-07-09 14:20:43	2020-07-09 14:20:43	2020-07-09 14:20:43	0.39752144	1479	\N		518	\N	None	1	0.26	0.41269842	0.37102923	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 14:59:09	2020-07-09 14:59:09	2020-07-09 14:59:09	2020-07-09 14:59:09	0.9984112	1480	\N		519	\N	None	1	0.94	0.96907216	0.8132147	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 15:01:58	2020-07-09 15:01:58	2020-07-09 15:01:58	2020-07-09 15:01:58	0.9990467	1481	\N		519	\N	None	0.975	0.79591835	0.8764045	0.815756	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 15:07:06	2020-07-09 15:07:06	2020-07-09 15:07:06	2020-07-09 15:07:06	0.9434382	1482	\N		519	\N	None	0.95454544	0.875	0.9130435	0.7712833	\N	3147	787	None
SVC	\N	5	3150	788	1	0.24528302	0.3939394	2020-07-09 15:09:49	2020-07-09 15:09:49	2020-07-09 15:09:49	2020-07-09 15:09:49	0.34350175	1483	\N		519	\N	None	1	0.22	0.36065573	0.33799237	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 15:48:47	2020-07-09 15:48:47	2020-07-09 15:48:47	2020-07-09 15:48:47	0.99872893	1484	\N		520	\N	None	0.97727275	0.86	0.9148936	0.82592124	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 15:51:16	2020-07-09 15:51:16	2020-07-09 15:51:16	2020-07-09 15:51:16	0.9990467	1485	\N		520	\N	None	0.95238096	0.7692308	0.85106385	0.83481574	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 15:55:43	2020-07-09 15:55:43	2020-07-09 15:55:43	2020-07-09 15:55:43	0.99459803	1486	\N		520	\N	None	0.9318182	0.87234044	0.9010989	0.82846254	\N	3147	787	None
SVC	\N	5	3150	788	1	0.18518518	0.3125	2020-07-09 15:59:47	2020-07-09 15:59:47	2020-07-09 15:59:47	2020-07-09 15:59:47	0.21734986	1487	\N		520	\N	None	1	0.1875	0.31578946	0.20584498	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 16:34:28	2020-07-09 16:34:28	2020-07-09 16:34:28	2020-07-09 16:34:28	0.9993645	1488	\N		521	\N	None	0.97727275	0.8958333	0.9347826	0.8551461	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 16:36:56	2020-07-09 16:36:56	2020-07-09 16:36:56	2020-07-09 16:36:56	0.9990467	1489	\N		521	\N	None	0.9512195	0.79591835	0.8666667	0.8335451	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 16:41:13	2020-07-09 16:41:13	2020-07-09 16:41:13	2020-07-09 16:41:13	0.9974579	1490	\N		521	\N	None	0.9777778	0.84615386	0.9072165	0.78144854	\N	3147	787	None
SVC	\N	5	3150	788	1	0.16666667	0.2857143	2020-07-09 16:43:48	2020-07-09 16:43:48	2020-07-09 16:43:48	2020-07-09 16:43:48	0.18652685	1491	\N		521	\N	None	1	0.14583333	0.25454545	0.1639136	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 17:17:30	2020-07-09 17:17:30	2020-07-09 17:17:30	2020-07-09 17:17:30	0.9990467	1492	\N		522	\N	None	0.95	0.7916667	0.8636364	0.84752226	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 17:20:33	2020-07-09 17:20:33	2020-07-09 17:20:33	2020-07-09 17:20:33	0.9990467	1493	\N		522	\N	None	0.9756098	0.81632656	0.8888889	0.8462516	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 17:25:46	2020-07-09 17:25:46	2020-07-09 17:25:46	2020-07-09 17:25:46	0.9949158	1494	\N		522	\N	None	1	0.86	0.9247312	0.80304956	\N	3147	787	None
SVC	\N	5	3150	788	1	0.14814815	0.2580645	2020-07-09 17:28:30	2020-07-09 17:28:30	2020-07-09 17:28:30	2020-07-09 17:28:30	0.14903082	1495	\N		522	\N	None	1	0.16	0.27586207	0.15628971	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 18:01:32	2020-07-09 18:01:32	2020-07-09 18:01:32	2020-07-09 18:01:32	0.9980934	1496	\N		523	\N	None	0.97619045	0.8367347	0.9010989	0.7966963	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 18:04:16	2020-07-09 18:04:16	2020-07-09 18:04:16	2020-07-09 18:04:16	0.9993645	1497	\N		523	\N	None	0.97727275	0.86	0.9148936	0.82592124	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 18:07:33	2020-07-09 18:07:33	2020-07-09 18:07:33	2020-07-09 18:07:33	0.9656816	1498	\N		523	\N	None	1	0.86	0.9247312	0.77636594	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2962963	0.45714286	2020-07-09 18:10:02	2020-07-09 18:10:02	2020-07-09 18:10:02	2020-07-09 18:10:02	0.35462344	1499	\N		523	\N	None	1	0.24	0.38709676	0.33418044	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 18:42:47	2020-07-09 18:42:47	2020-07-09 18:42:47	2020-07-09 18:42:47	0.9990467	1500	\N		524	\N	None	1	0.92	0.9583333	0.8310038	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 18:45:23	2020-07-09 18:45:23	2020-07-09 18:45:23	2020-07-09 18:45:23	0.9993645	1501	\N		524	\N	None	1	0.86	0.9247312	0.8462516	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 18:49:41	2020-07-09 18:49:41	2020-07-09 18:49:41	2020-07-09 18:49:41	0.9853829	1502	\N		524	\N	None	1	0.9361702	0.96703297	0.841169	\N	3147	787	None
SVC	\N	5	3150	788	1	0.24074075	0.3880597	2020-07-09 18:52:10	2020-07-09 18:52:10	2020-07-09 18:52:10	2020-07-09 18:52:10	0.32824913	1503	\N		524	\N	None	1	0.23404256	0.37931034	0.3278272	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 19:25:35	2020-07-09 19:25:35	2020-07-09 19:25:35	2020-07-09 19:25:35	0.99872893	1504	\N		525	\N	None	0.95238096	0.8333333	0.8888889	0.8271919	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 19:28:29	2020-07-09 19:28:29	2020-07-09 19:28:29	2020-07-09 19:28:29	0.9990467	1505	\N		525	\N	None	0.97619045	0.8039216	0.8817204	0.82337993	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 19:34:06	2020-07-09 19:34:06	2020-07-09 19:34:06	2020-07-09 19:34:06	0.98824275	1506	\N		525	\N	None	1	0.877551	0.9347826	0.79034305	\N	3147	787	None
SVC	\N	5	3150	788	1	0.22222222	0.36363637	2020-07-09 19:36:43	2020-07-09 19:36:43	2020-07-09 19:36:43	2020-07-09 19:36:43	0.2840801	1507	\N		525	\N	None	1	0.20833333	0.3448276	0.28208387	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 20:10:36	2020-07-09 20:10:36	2020-07-09 20:10:36	2020-07-09 20:10:36	0.9984112	1508	\N		526	\N	None	1	0.8541667	0.92134833	0.84752226	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 20:14:18	2020-07-09 20:14:18	2020-07-09 20:14:18	2020-07-09 20:14:18	0.9990467	1509	\N		526	\N	None	0.97619045	0.8541667	0.9111111	0.8551461	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 20:21:14	2020-07-09 20:21:14	2020-07-09 20:21:14	2020-07-09 20:21:14	0.9980934	1510	\N		526	\N	None	0.9777778	0.9166667	0.94623655	0.815756	\N	3147	787	None
SVC	\N	5	3150	788	1	0.16666667	0.2857143	2020-07-09 20:24:23	2020-07-09 20:24:23	2020-07-09 20:24:23	2020-07-09 20:24:23	0.14871307	1511	\N		526	\N	None	1	0.13461539	0.23728813	0.12706481	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-09 20:57:40	2020-07-09 20:57:40	2020-07-09 20:57:40	2020-07-09 20:57:40	0.9990467	1512	\N		527	\N	None	1	0.88235295	0.9375	0.82337993	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-09 21:01:10	2020-07-09 21:01:10	2020-07-09 21:01:10	2020-07-09 21:01:10	0.9993645	1513	\N		527	\N	None	1	0.877551	0.9347826	0.82592124	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-09 21:06:59	2020-07-09 21:06:59	2020-07-09 21:06:59	2020-07-09 21:06:59	0.9949158	1514	\N		527	\N	None	0.9767442	0.8235294	0.89361703	0.8017789	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2264151	0.36923078	2020-07-09 21:10:11	2020-07-09 21:10:11	2020-07-09 21:10:11	2020-07-09 21:10:11	0.28948206	1515	\N		527	\N	None	1	0.20408164	0.33898306	0.27954257	\N	3147	787	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-09 21:32:52	2020-07-09 21:32:52	2020-07-09 21:32:52	2020-07-09 21:32:52	0.9965333	1516	\N		528	\N	None	0.97727275	0.8958333	0.9347826	0.8020176	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-09 21:33:26	2020-07-09 21:33:26	2020-07-09 21:33:26	2020-07-09 21:33:26	0.99842423	1517	\N		528	\N	None	0.9767442	0.85714287	0.9130435	0.8310214	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-09 21:33:53	2020-07-09 21:33:53	2020-07-09 21:33:53	2020-07-09 21:33:53	0.9716357	1518	\N		528	\N	None	0.9782609	0.9	0.9375	0.7931904	\N	3173	793	None
SVC	\N	5	3176	794	1	0.7407407	0.85106385	2020-07-09 21:34:45	2020-07-09 21:34:45	2020-07-09 21:34:45	2020-07-09 21:34:45	0.78443116	1519	\N		528	\N	None	1	0.6530612	0.79012346	0.7061791	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-09 21:57:11	2020-07-09 21:57:11	2020-07-09 21:57:11	2020-07-09 21:57:11	0.99905455	1520	\N		529	\N	None	1	0.88	0.9361702	0.81336695	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-09 21:57:58	2020-07-09 21:57:58	2020-07-09 21:57:58	2020-07-09 21:57:58	0.99842423	1521	\N		529	\N	None	0.97727275	0.877551	0.9247312	0.8411097	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-09 21:58:48	2020-07-09 21:58:48	2020-07-09 21:58:48	2020-07-09 21:58:48	0.98802394	1522	\N		529	\N	None	0.97727275	0.8958333	0.9347826	0.815889	\N	3173	793	None
SVC	\N	5	3176	794	1	0.3018868	0.46376812	2020-07-09 22:00:07	2020-07-09 22:00:07	2020-07-09 22:00:07	2020-07-09 22:00:07	0.39710054	1523	\N		529	\N	None	1	0.27083334	0.4262295	0.36443883	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-09 22:27:13	2020-07-09 22:27:13	2020-07-09 22:27:13	2020-07-09 22:27:13	0.99905455	1524	\N		530	\N	None	0.95555556	0.8958333	0.9247312	0.8272383	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-09 22:28:07	2020-07-09 22:28:07	2020-07-09 22:28:07	2020-07-09 22:28:07	0.99810904	1525	\N		530	\N	None	0.95555556	0.8958333	0.9247312	0.8322825	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-09 22:29:10	2020-07-09 22:29:10	2020-07-09 22:29:10	2020-07-09 22:29:10	0.97573274	1526	\N		530	\N	None	0.9591837	0.9591837	0.9591837	0.8108449	\N	3173	793	None
SVC	\N	5	3176	794	1	0.2777778	0.4347826	2020-07-09 22:30:34	2020-07-09 22:30:34	2020-07-09 22:30:34	2020-07-09 22:30:34	0.37125748	1527	\N		530	\N	None	1	0.25531915	0.40677965	0.3820933	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-09 22:58:52	2020-07-09 22:58:52	2020-07-09 22:58:52	2020-07-09 22:58:52	0.99810904	1528	\N		531	\N	None	0.9782609	0.9183673	0.94736844	0.8398487	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-09 22:59:38	2020-07-09 22:59:38	2020-07-09 22:59:39	2020-07-09 22:59:39	0.9977939	1529	\N		531	\N	None	1	0.84313726	0.9148936	0.8196721	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-09 23:00:26	2020-07-09 23:00:26	2020-07-09 23:00:26	2020-07-09 23:00:26	0.9776237	1530	\N		531	\N	None	0.9767442	0.95454544	0.9655172	0.7982346	\N	3173	793	None
SVC	\N	5	3176	794	1	0.33333334	0.5	2020-07-09 23:01:44	2020-07-09 23:01:44	2020-07-09 23:01:44	2020-07-09 23:01:44	0.4298771	1531	\N		531	\N	None	1	0.32608697	0.4918033	0.44010088	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-09 23:30:41	2020-07-09 23:30:41	2020-07-09 23:30:41	2020-07-09 23:30:41	0.99905455	1532	\N		532	\N	None	1	0.81632656	0.8988764	0.8196721	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-09 23:31:56	2020-07-09 23:31:56	2020-07-09 23:31:56	2020-07-09 23:31:56	0.99873936	1533	\N		532	\N	None	0.95555556	0.95555556	0.95555556	0.84993696	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-09 23:33:04	2020-07-09 23:33:04	2020-07-09 23:33:04	2020-07-09 23:33:04	0.9300347	1534	\N		532	\N	None	1	0.875	0.93333334	0.776797	\N	3173	793	None
SVC	\N	5	3176	794	1	0.46296296	0.6329114	2020-07-09 23:34:53	2020-07-09 23:34:53	2020-07-09 23:34:53	2020-07-09 23:34:53	0.5726442	1535	\N		532	\N	None	1	0.47916666	0.64788735	0.5472888	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 00:04:10	2020-07-10 00:04:10	2020-07-10 00:04:10	2020-07-10 00:04:10	0.9946423	1536	\N		533	\N	None	0.95652175	0.9166667	0.9361702	0.83480453	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 00:05:12	2020-07-10 00:05:12	2020-07-10 00:05:12	2020-07-10 00:05:12	0.99873936	1537	\N		533	\N	None	0.9512195	0.8125	0.8764045	0.80832285	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 00:06:11	2020-07-10 00:06:11	2020-07-10 00:06:11	2020-07-10 00:06:11	0.96974474	1538	\N		533	\N	None	0.95652175	0.88	0.9166667	0.7957125	\N	3173	793	None
SVC	\N	5	3176	794	1	0.4716981	0.64102566	2020-07-10 00:07:33	2020-07-10 00:07:33	2020-07-10 00:07:33	2020-07-10 00:07:33	0.5739048	1539	\N		533	\N	None	1	0.4489796	0.6197183	0.56116015	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 00:36:47	2020-07-10 00:36:47	2020-07-10 00:36:47	2020-07-10 00:36:47	0.9974787	1540	\N		534	\N	None	0.95652175	0.88	0.9166667	0.8020176	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 00:37:37	2020-07-10 00:37:37	2020-07-10 00:37:37	2020-07-10 00:37:37	0.99873936	1541	\N		534	\N	None	0.97619045	0.8367347	0.9010989	0.814628	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 00:38:24	2020-07-10 00:38:24	2020-07-10 00:38:24	2020-07-10 00:38:24	0.9776237	1542	\N		534	\N	None	1	0.84	0.9130435	0.80832285	\N	3173	793	None
SVC	\N	5	3176	794	1	0.537037	0.6987952	2020-07-10 00:39:39	2020-07-10 00:39:39	2020-07-10 00:39:39	2020-07-10 00:39:39	0.6334699	1543	\N		534	\N	None	1	0.48979592	0.65753424	0.5889029	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 01:07:05	2020-07-10 01:07:05	2020-07-10 01:07:05	2020-07-10 01:07:05	0.9993697	1544	\N		535	\N	None	0.97727275	0.877551	0.9247312	0.82093316	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 01:07:59	2020-07-10 01:07:59	2020-07-10 01:07:59	2020-07-10 01:07:59	0.99873936	1545	\N		535	\N	None	1	0.8	0.8888889	0.8587642	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 01:09:13	2020-07-10 01:09:13	2020-07-10 01:09:13	2020-07-10 01:09:13	0.97321147	1546	\N		535	\N	None	1	0.82	0.9010989	0.7742749	\N	3173	793	None
SVC	\N	5	3176	794	1	0.2037037	0.33846155	2020-07-10 01:10:52	2020-07-10 01:10:52	2020-07-10 01:10:52	2020-07-10 01:10:52	0.31578946	1547	\N		535	\N	None	1	0.24444444	0.39285713	0.30769232	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 01:33:46	2020-07-10 01:33:46	2020-07-10 01:33:46	2020-07-10 01:33:46	0.99873936	1548	\N		536	\N	None	0.95454544	0.875	0.9130435	0.852459	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 01:34:35	2020-07-10 01:34:35	2020-07-10 01:34:35	2020-07-10 01:34:35	0.99810904	1549	\N		536	\N	None	0.9767442	0.84	0.9032258	0.8575032	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 01:35:37	2020-07-10 01:35:37	2020-07-10 01:35:37	2020-07-10 01:35:37	0.9908604	1550	\N		536	\N	None	0.9767442	0.89361703	0.93333334	0.8184111	\N	3173	793	None
SVC	\N	5	3176	794	1	0.25925925	0.4117647	2020-07-10 01:37:00	2020-07-10 01:37:00	2020-07-10 01:37:00	2020-07-10 01:37:00	0.34383863	1551	\N		536	\N	None	1	0.24	0.38709676	0.36191678	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 01:59:41	2020-07-10 01:59:41	2020-07-10 01:59:41	2020-07-10 01:59:41	0.99873936	1552	\N		537	\N	None	0.9347826	0.877551	0.9052632	0.81715006	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 02:00:34	2020-07-10 02:00:34	2020-07-10 02:00:34	2020-07-10 02:00:34	0.99810904	1553	\N		537	\N	None	0.95348835	0.8367347	0.8913044	0.8398487	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 02:01:33	2020-07-10 02:01:33	2020-07-10 02:01:33	2020-07-10 02:01:33	0.9845572	1554	\N		537	\N	None	0.97727275	0.8958333	0.9347826	0.8070618	\N	3173	793	None
SVC	\N	5	3176	794	1	0.22222222	0.36363637	2020-07-10 02:02:42	2020-07-10 02:02:42	2020-07-10 02:02:42	2020-07-10 02:02:42	0.3239836	1555	\N		537	\N	None	1	0.2	0.33333334	0.3442623	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 02:26:11	2020-07-10 02:26:11	2020-07-10 02:26:11	2020-07-10 02:26:11	0.99873936	1556	\N		538	\N	None	0.95454544	0.85714287	0.9032258	0.80580074	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 02:27:14	2020-07-10 02:27:14	2020-07-10 02:27:14	2020-07-10 02:27:14	0.99842423	1557	\N		538	\N	None	1	0.9318182	0.9647059	0.8284994	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 02:28:27	2020-07-10 02:28:27	2020-07-10 02:28:27	2020-07-10 02:28:27	0.96974474	1558	\N		538	\N	None	1	0.82	0.9010989	0.7944515	\N	3173	793	None
SVC	\N	5	3176	794	1	0.37037036	0.5405405	2020-07-10 02:29:47	2020-07-10 02:29:47	2020-07-10 02:29:47	2020-07-10 02:29:47	0.469272	1559	\N		538	\N	None	1	0.3529412	0.5217391	0.4665826	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 02:53:03	2020-07-10 02:53:03	2020-07-10 02:53:03	2020-07-10 02:53:03	0.99873936	1560	\N		539	\N	None	1	0.84313726	0.9148936	0.8272383	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 02:54:00	2020-07-10 02:54:00	2020-07-10 02:54:00	2020-07-10 02:54:00	0.99873936	1561	\N		539	\N	None	0.97727275	0.877551	0.9247312	0.82471627	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 02:54:59	2020-07-10 02:54:59	2020-07-10 02:54:59	2020-07-10 02:54:59	0.98487234	1562	\N		539	\N	None	0.97619045	0.87234044	0.92134833	0.79192936	\N	3173	793	None
SVC	\N	5	3176	794	1	0.3888889	0.56	2020-07-10 02:56:17	2020-07-10 02:56:17	2020-07-10 02:56:17	2020-07-10 02:56:17	0.5064608	1563	\N		539	\N	None	1	0.38	0.5507246	0.4703657	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 03:19:36	2020-07-10 03:19:36	2020-07-10 03:19:36	2020-07-10 03:19:36	0.9977939	1564	\N		540	\N	None	0.9777778	0.88	0.9263158	0.8259773	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 03:20:25	2020-07-10 03:20:25	2020-07-10 03:20:25	2020-07-10 03:20:25	0.9977939	1565	\N		540	\N	None	1	0.88	0.9361702	0.814628	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 03:21:25	2020-07-10 03:21:25	2020-07-10 03:21:25	2020-07-10 03:21:25	0.9467381	1566	\N		540	\N	None	0.97727275	0.877551	0.9247312	0.7931904	\N	3173	793	None
SVC	\N	5	3176	794	1	0.37037036	0.5405405	2020-07-10 03:22:36	2020-07-10 03:22:36	2020-07-10 03:22:36	2020-07-10 03:22:36	0.50110304	1567	\N		540	\N	None	1	0.3877551	0.5588235	0.47540984	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 03:46:33	2020-07-10 03:46:33	2020-07-10 03:46:33	2020-07-10 03:46:33	0.99905455	1568	\N		541	\N	None	0.9782609	0.9375	0.9574468	0.82471627	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 03:47:31	2020-07-10 03:47:31	2020-07-10 03:47:31	2020-07-10 03:47:31	0.99842423	1569	\N		541	\N	None	1	0.89361703	0.94382024	0.8411097	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 03:49:03	2020-07-10 03:49:03	2020-07-10 03:49:03	2020-07-10 03:49:03	0.9930665	1570	\N		541	\N	None	0.89361703	0.875	0.8842105	0.80958384	\N	3173	793	None
SVC	\N	5	3176	794	1	0.22222222	0.36363637	2020-07-10 03:50:35	2020-07-10 03:50:35	2020-07-10 03:50:35	2020-07-10 03:50:35	0.30034667	1571	\N		541	\N	None	1	0.22916667	0.37288135	0.28373265	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 04:13:57	2020-07-10 04:13:57	2020-07-10 04:13:57	2020-07-10 04:13:57	0.99842423	1572	\N		542	\N	None	0.9767442	0.85714287	0.9130435	0.8234552	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 04:15:04	2020-07-10 04:15:04	2020-07-10 04:15:04	2020-07-10 04:15:04	0.99873936	1573	\N		542	\N	None	0.97727275	0.86	0.9148936	0.84615386	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 04:16:34	2020-07-10 04:16:34	2020-07-10 04:16:34	2020-07-10 04:16:34	0.974157	1574	\N		542	\N	None	0.95555556	0.84313726	0.8958333	0.83480453	\N	3173	793	None
SVC	\N	5	3176	794	1	0.33333334	0.5	2020-07-10 04:17:59	2020-07-10 04:17:59	2020-07-10 04:17:59	2020-07-10 04:17:59	0.45761108	1575	\N		542	\N	None	1	0.3125	0.47619048	0.41992435	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 04:37:09	2020-07-10 04:37:09	2020-07-10 04:37:09	2020-07-10 04:37:09	0.9974787	1576	\N		543	\N	None	1	0.88461536	0.93877554	0.8196721	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 04:37:42	2020-07-10 04:37:42	2020-07-10 04:37:42	2020-07-10 04:37:42	0.9996849	1577	\N		543	\N	None	1	0.79591835	0.8863636	0.8020176	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 04:38:11	2020-07-10 04:38:11	2020-07-10 04:38:11	2020-07-10 04:38:11	0.9587141	1578	\N		543	\N	None	0.9302326	0.8	0.86021507	0.80580074	\N	3173	793	None
SVC	\N	5	3176	794	1	0.7407407	0.85106385	2020-07-10 04:39:05	2020-07-10 04:39:05	2020-07-10 04:39:05	2020-07-10 04:39:05	0.78285533	1579	\N		543	\N	None	1	0.6666667	0.8	0.72761667	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 04:58:23	2020-07-10 04:58:23	2020-07-10 04:58:23	2020-07-10 04:58:23	0.99873936	1580	\N		544	\N	None	0.97619045	0.82	0.8913044	0.82471627	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 04:59:23	2020-07-10 04:59:23	2020-07-10 04:59:23	2020-07-10 04:59:23	0.9993697	1581	\N		544	\N	None	1	0.84	0.9130435	0.83858764	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 05:00:32	2020-07-10 05:00:32	2020-07-10 05:00:32	2020-07-10 05:00:32	0.99527264	1582	\N		544	\N	None	1	0.93877554	0.96842104	0.8070618	\N	3173	793	None
SVC	\N	5	3176	794	1	0.22222222	0.36363637	2020-07-10 05:02:16	2020-07-10 05:02:16	2020-07-10 05:02:16	2020-07-10 05:02:16	0.3350142	1583	\N		544	\N	None	1	0.22916667	0.37288135	0.32912987	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 05:21:45	2020-07-10 05:21:45	2020-07-10 05:21:45	2020-07-10 05:21:45	0.99905455	1584	\N		545	\N	None	0.95555556	0.877551	0.9148936	0.82976043	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 05:23:02	2020-07-10 05:23:02	2020-07-10 05:23:02	2020-07-10 05:23:02	0.9993697	1585	\N		545	\N	None	1	0.8333333	0.90909094	0.8436318	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 05:25:37	2020-07-10 05:25:37	2020-07-10 05:25:37	2020-07-10 05:25:37	0.9974787	1586	\N		545	\N	None	0.9767442	0.84	0.9032258	0.8360656	\N	3173	793	None
SVC	\N	5	3176	794	1	0.16666667	0.2857143	2020-07-10 05:27:34	2020-07-10 05:27:34	2020-07-10 05:27:34	2020-07-10 05:27:34	0.21273243	1587	\N		545	\N	None	1	0.16666667	0.2857143	0.20554855	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 05:47:13	2020-07-10 05:47:13	2020-07-10 05:47:13	2020-07-10 05:47:13	0.99905455	1588	\N		546	\N	None	1	0.84	0.9130435	0.8448928	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 05:48:40	2020-07-10 05:48:40	2020-07-10 05:48:40	2020-07-10 05:48:40	0.9993697	1589	\N		546	\N	None	1	0.8039216	0.8913044	0.84741485	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 05:52:06	2020-07-10 05:52:06	2020-07-10 05:52:06	2020-07-10 05:52:06	0.9930665	1590	\N		546	\N	None	1	0.8627451	0.9263158	0.81715006	\N	3173	793	None
SVC	\N	5	3176	794	1	0.14814815	0.2580645	2020-07-10 05:54:02	2020-07-10 05:54:02	2020-07-10 05:54:02	2020-07-10 05:54:02	0.17428301	1591	\N		546	\N	None	1	0.14	0.24561404	0.16645649	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 06:13:45	2020-07-10 06:13:45	2020-07-10 06:13:45	2020-07-10 06:13:45	0.9993697	1592	\N		547	\N	None	0.9767442	0.89361703	0.93333334	0.8448928	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 06:14:57	2020-07-10 06:14:57	2020-07-10 06:14:57	2020-07-10 06:14:57	1	1593	\N		547	\N	None	1	0.877551	0.9347826	0.83480453	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 06:16:08	2020-07-10 06:16:08	2020-07-10 06:16:08	2020-07-10 06:16:08	0.9930665	1594	\N		547	\N	None	0.95454544	0.8235294	0.8842105	0.8234552	\N	3173	793	None
SVC	\N	5	3176	794	1	0.37037036	0.5405405	2020-07-10 06:17:45	2020-07-10 06:17:45	2020-07-10 06:17:45	2020-07-10 06:17:45	0.47967222	1595	\N		547	\N	None	1	0.3469388	0.5151515	0.46153846	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 06:37:03	2020-07-10 06:37:03	2020-07-10 06:37:03	2020-07-10 06:37:03	0.99842423	1596	\N		548	\N	None	0.97619045	0.8039216	0.8817204	0.815889	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 06:38:28	2020-07-10 06:38:28	2020-07-10 06:38:28	2020-07-10 06:38:28	0.99905455	1597	\N		548	\N	None	0.9767442	0.85714287	0.9130435	0.8284994	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 06:41:00	2020-07-10 06:41:00	2020-07-10 06:41:00	2020-07-10 06:41:00	0.9388591	1598	\N		548	\N	None	0.97727275	0.86	0.9148936	0.7591425	\N	3173	793	None
SVC	\N	5	3176	794	1	0.25925925	0.4117647	2020-07-10 06:42:45	2020-07-10 06:42:45	2020-07-10 06:42:45	2020-07-10 06:42:45	0.37377876	1599	\N		548	\N	None	1	0.23076923	0.375	0.3366961	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 07:01:47	2020-07-10 07:01:47	2020-07-10 07:01:47	2020-07-10 07:01:47	0.9993697	1600	\N		549	\N	None	1	0.8695652	0.9302326	0.83858764	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 07:03:23	2020-07-10 07:03:23	2020-07-10 07:03:23	2020-07-10 07:03:23	0.9993697	1601	\N		549	\N	None	1	0.8125	0.8965517	0.8398487	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 07:06:47	2020-07-10 07:06:47	2020-07-10 07:06:47	2020-07-10 07:06:47	0.98172075	1602	\N		549	\N	None	1	0.8679245	0.9292929	0.83480453	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-10 07:08:35	2020-07-10 07:08:35	2020-07-10 07:08:35	2020-07-10 07:08:35	0.30570439	1603	\N		549	\N	None	1	0.20408164	0.33898306	0.29382095	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 07:28:08	2020-07-10 07:28:08	2020-07-10 07:28:08	2020-07-10 07:28:08	0.9993697	1604	\N		550	\N	None	1	0.86	0.9247312	0.83858764	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 07:29:50	2020-07-10 07:29:50	2020-07-10 07:29:50	2020-07-10 07:29:50	0.99873936	1605	\N		550	\N	None	0.97619045	0.8367347	0.9010989	0.8486759	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 07:33:08	2020-07-10 07:33:08	2020-07-10 07:33:08	2020-07-10 07:33:08	0.99873936	1606	\N		550	\N	None	0.9148936	0.95555556	0.9347826	0.81336695	\N	3173	793	None
SVC	\N	5	3176	794	1	0.16981132	0.29032257	2020-07-10 07:35:33	2020-07-10 07:35:33	2020-07-10 07:35:33	2020-07-10 07:35:33	0.21210212	1607	\N		550	\N	None	1	0.17307693	0.29508197	0.17654477	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 07:54:47	2020-07-10 07:54:47	2020-07-10 07:54:47	2020-07-10 07:54:47	0.99905455	1608	\N		551	\N	None	1	0.8269231	0.9052632	0.84237075	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 07:56:40	2020-07-10 07:56:40	2020-07-10 07:56:40	2020-07-10 07:56:40	0.99905455	1609	\N		551	\N	None	0.9777778	0.84615386	0.9072165	0.84993696	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 08:00:31	2020-07-10 08:00:31	2020-07-10 08:00:31	2020-07-10 08:00:31	0.99873936	1610	\N		551	\N	None	0.9318182	0.8367347	0.8817204	0.8448928	\N	3173	793	None
SVC	\N	5	3176	794	1	0.14814815	0.2580645	2020-07-10 08:02:57	2020-07-10 08:02:57	2020-07-10 08:02:57	2020-07-10 08:02:57	0.16703436	1611	\N		551	\N	None	1	0.14	0.24561404	0.16141236	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 08:23:01	2020-07-10 08:23:01	2020-07-10 08:23:01	2020-07-10 08:23:01	0.99905455	1612	\N		552	\N	None	1	0.877551	0.9347826	0.82976043	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 08:25:07	2020-07-10 08:25:07	2020-07-10 08:25:07	2020-07-10 08:25:07	0.99873936	1613	\N		552	\N	None	1	0.875	0.93333334	0.8486759	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 08:30:22	2020-07-10 08:30:22	2020-07-10 08:30:22	2020-07-10 08:30:22	0.9977939	1614	\N		552	\N	None	0.97727275	0.84313726	0.9052632	0.8398487	\N	3173	793	None
SVC	\N	5	3176	794	1	0.12962963	0.22950819	2020-07-10 08:32:55	2020-07-10 08:32:55	2020-07-10 08:32:55	2020-07-10 08:32:55	0.13110621	1615	\N		552	\N	None	1	0.11764706	0.21052632	0.12484237	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 08:52:54	2020-07-10 08:52:54	2020-07-10 08:52:54	2020-07-10 08:52:54	0.99873936	1616	\N		553	\N	None	0.9574468	0.9574468	0.9574468	0.84993696	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 08:54:58	2020-07-10 08:54:58	2020-07-10 08:54:58	2020-07-10 08:54:58	0.99873936	1617	\N		553	\N	None	1	0.8269231	0.9052632	0.8310214	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 08:58:18	2020-07-10 08:58:18	2020-07-10 08:58:18	2020-07-10 08:58:18	0.99527264	1618	\N		553	\N	None	1	0.86	0.9247312	0.79192936	\N	3173	793	None
SVC	\N	5	3176	794	1	0.2264151	0.36923078	2020-07-10 09:00:38	2020-07-10 09:00:38	2020-07-10 09:00:38	2020-07-10 09:00:38	0.34541443	1619	\N		553	\N	None	1	0.20408164	0.33898306	0.3215637	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 09:22:35	2020-07-10 09:22:35	2020-07-10 09:22:36	2020-07-10 09:22:36	0.99905455	1620	\N		554	\N	None	1	0.8541667	0.92134833	0.8360656	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 09:25:05	2020-07-10 09:25:05	2020-07-10 09:25:05	2020-07-10 09:25:05	0.99905455	1621	\N		554	\N	None	1	0.875	0.93333334	0.83858764	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 09:30:06	2020-07-10 09:30:06	2020-07-10 09:30:06	2020-07-10 09:30:06	0.9946423	1622	\N		554	\N	None	0.95652175	0.8979592	0.9263158	0.8272383	\N	3173	793	None
SVC	\N	5	3176	794	1	0.2037037	0.33846155	2020-07-10 09:33:13	2020-07-10 09:33:13	2020-07-10 09:33:13	2020-07-10 09:33:13	0.29561928	1623	\N		554	\N	None	1	0.21276596	0.3508772	0.2849937	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 10:02:19	2020-07-10 10:02:19	2020-07-10 10:02:19	2020-07-10 10:02:19	0.9993697	1624	\N		555	\N	None	1	0.8958333	0.94505495	0.8221942	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 10:07:12	2020-07-10 10:07:12	2020-07-10 10:07:12	2020-07-10 10:07:12	0.99905455	1625	\N		555	\N	None	1	0.8235294	0.9032258	0.8284994	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 10:18:22	2020-07-10 10:18:22	2020-07-10 10:18:22	2020-07-10 10:18:22	0.9968484	1626	\N		555	\N	None	0.9767442	0.84	0.9032258	0.8284994	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-10 10:23:11	2020-07-10 10:23:11	2020-07-10 10:23:11	2020-07-10 10:23:11	0.25811535	1627	\N		555	\N	None	1	0.20833333	0.3448276	0.25094578	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 10:54:41	2020-07-10 10:54:41	2020-07-10 10:54:41	2020-07-10 10:54:41	0.99873936	1628	\N		556	\N	None	1	0.8039216	0.8913044	0.84237075	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 10:59:11	2020-07-10 10:59:11	2020-07-10 10:59:11	2020-07-10 10:59:11	0.99873936	1629	\N		556	\N	None	1	0.82	0.9010989	0.8448928	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 11:08:06	2020-07-10 11:08:06	2020-07-10 11:08:06	2020-07-10 11:08:06	0.99873936	1630	\N		556	\N	None	1	0.9	0.94736844	0.81715006	\N	3173	793	None
SVC	\N	5	3176	794	1	0.14814815	0.2580645	2020-07-10 11:12:42	2020-07-10 11:12:42	2020-07-10 11:12:42	2020-07-10 11:12:42	0.14150646	1631	\N		556	\N	None	1	0.13043478	0.23076923	0.13114753	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-10 11:37:51	2020-07-10 11:37:51	2020-07-10 11:37:51	2020-07-10 11:37:51	0.99873936	1632	\N		557	\N	None	1	0.875	0.93333334	0.84993696	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-10 11:41:33	2020-07-10 11:41:33	2020-07-10 11:41:33	2020-07-10 11:41:33	0.99905455	1633	\N		557	\N	None	1	0.81632656	0.8988764	0.8562421	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-10 11:48:42	2020-07-10 11:48:42	2020-07-10 11:48:42	2020-07-10 11:48:42	0.9977939	1634	\N		557	\N	None	1	0.8039216	0.8913044	0.8259773	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-10 11:52:09	2020-07-10 11:52:09	2020-07-10 11:52:09	2020-07-10 11:52:09	0.25370312	1635	\N		557	\N	None	1	0.1875	0.31578946	0.24716267	\N	3173	793	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-10 12:36:22	2020-07-10 12:36:22	2020-07-10 12:36:22	2020-07-10 12:36:22	0.9858657	1636	\N		558	\N	None	0.9814815	1	0.99065423	0.75078535	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-10 12:39:35	2020-07-10 12:39:35	2020-07-10 12:39:35	2020-07-10 12:39:35	0.96963745	1637	\N		558	\N	None	1	0.9814815	0.99065423	0.7748691	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-10 12:41:54	2020-07-10 12:41:54	2020-07-10 12:41:54	2020-07-10 12:41:54	0.93116087	1638	\N		558	\N	None	1	0.9811321	0.9904762	0.7518325	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.5925926	0.74418604	2020-07-10 12:52:58	2020-07-10 12:52:58	2020-07-10 12:52:58	2020-07-10 12:52:58	0.6068577	1639	\N		558	\N	None	1	0.5283019	0.69135803	0.5816754	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-10 13:46:26	2020-07-10 13:46:26	2020-07-10 13:46:26	2020-07-10 13:46:26	0.98992276	1640	\N		559	\N	None	1	0.9259259	0.96153843	0.79528797	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-10 13:49:31	2020-07-10 13:49:31	2020-07-10 13:49:31	2020-07-10 13:49:31	0.9839681	1641	\N		559	\N	None	1	0.9811321	0.9904762	0.81230366	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-10 13:53:04	2020-07-10 13:53:04	2020-07-10 13:53:04	2020-07-10 13:53:04	0.96976835	1642	\N		559	\N	None	1	0.9622642	0.9807692	0.78848165	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.18518518	0.3125	2020-07-10 14:07:26	2020-07-10 14:07:26	2020-07-10 14:07:26	2020-07-10 14:07:26	0.2457139	1643	\N		559	\N	None	1	0.18367347	0.31034482	0.24528795	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-10 14:48:58	2020-07-10 14:48:58	2020-07-10 14:48:58	2020-07-10 14:48:58	0.9858657	1644	\N		560	\N	None	1	0.9433962	0.9708738	0.78612566	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-10 14:51:53	2020-07-10 14:51:53	2020-07-10 14:51:53	2020-07-10 14:51:53	0.9761157	1645	\N		560	\N	None	1	0.9074074	0.9514563	0.79424083	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-10 14:55:53	2020-07-10 14:55:53	2020-07-10 14:55:53	2020-07-10 14:55:53	0.95753175	1646	\N		560	\N	None	1	0.9259259	0.96153843	0.78062826	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.16666667	0.2857143	2020-07-10 15:06:54	2020-07-10 15:06:54	2020-07-10 15:06:54	2020-07-10 15:06:54	0.22856955	1647	\N		560	\N	None	1	0.1764706	0.3	0.22382198	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-10 15:45:50	2020-07-10 15:45:50	2020-07-10 15:45:50	2020-07-10 15:45:50	0.9832483	1648	\N		561	\N	None	0.9622642	0.9807692	0.9714286	0.77015704	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-10 15:48:39	2020-07-10 15:48:39	2020-07-10 15:48:39	2020-07-10 15:48:39	0.9596257	1649	\N		561	\N	None	0.97959185	0.9230769	0.95049506	0.786911	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-10 15:52:09	2020-07-10 15:52:09	2020-07-10 15:52:09	2020-07-10 15:52:09	0.93436724	1650	\N		561	\N	None	1	0.9245283	0.9607843	0.7722513	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.22222222	0.36363637	2020-07-10 16:05:17	2020-07-10 16:05:17	2020-07-10 16:05:17	2020-07-10 16:05:17	0.29806307	1651	\N		561	\N	None	1	0.1923077	0.32258064	0.28586388	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-10 16:45:57	2020-07-10 16:45:57	2020-07-10 16:45:57	2020-07-10 16:45:57	0.9893993	1652	\N		562	\N	None	0.9811321	0.9811321	0.9811321	0.7850785	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-10 16:49:33	2020-07-10 16:49:33	2020-07-10 16:49:33	2020-07-10 16:49:33	0.9867164	1653	\N		562	\N	None	1	0.9622642	0.9807692	0.80314136	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-10 16:53:38	2020-07-10 16:53:38	2020-07-10 16:53:38	2020-07-10 16:53:38	0.96564585	1654	\N		562	\N	None	1	0.9056604	0.95049506	0.78612566	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.2777778	0.4347826	2020-07-10 17:06:49	2020-07-10 17:06:49	2020-07-10 17:06:49	2020-07-10 17:06:49	0.39392748	1655	\N		562	\N	None	1	0.28301886	0.44117647	0.37643978	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-10 17:56:42	2020-07-10 17:56:42	2020-07-10 17:56:42	2020-07-10 17:56:42	0.9890721	1656	\N		563	\N	None	1	0.9811321	0.9904762	0.7704188	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-10 18:00:29	2020-07-10 18:00:29	2020-07-10 18:00:29	2020-07-10 18:00:29	0.9822667	1657	\N		563	\N	None	1	0.9245283	0.9607843	0.7816754	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-10 18:05:03	2020-07-10 18:05:03	2020-07-10 18:05:03	2020-07-10 18:05:03	0.9450988	1658	\N		563	\N	None	1	0.9622642	0.9807692	0.75994766	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.25925925	0.4117647	2020-07-10 18:18:44	2020-07-10 18:18:44	2020-07-10 18:18:44	2020-07-10 18:18:44	0.39942417	1659	\N		563	\N	None	1	0.26415095	0.41791046	0.3934555	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-10 19:09:31	2020-07-10 19:09:31	2020-07-10 19:09:31	2020-07-10 19:09:31	0.98769796	1660	\N		564	\N	None	0.9814815	1	0.99065423	0.7534031	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-10 19:13:17	2020-07-10 19:13:17	2020-07-10 19:13:17	2020-07-10 19:13:17	0.9784714	1661	\N		564	\N	None	1	0.962963	0.9811321	0.776178	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-10 19:16:54	2020-07-10 19:16:54	2020-07-10 19:16:54	2020-07-10 19:16:54	0.94738907	1662	\N		564	\N	None	0.9807692	0.9622642	0.9714286	0.7672775	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.33333334	0.5	2020-07-10 19:29:28	2020-07-10 19:29:28	2020-07-10 19:29:28	2020-07-10 19:29:28	0.47277844	1663	\N		564	\N	None	1	0.3148148	0.47887325	0.4431937	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-10 21:04:49	2020-07-10 21:04:49	2020-07-10 21:04:49	2020-07-10 21:04:49	0.9897919	1664	\N		565	\N	None	1	0.9811321	0.9904762	0.79685867	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-10 21:07:09	2020-07-10 21:07:09	2020-07-10 21:07:09	2020-07-10 21:07:09	0.98665094	1665	\N		565	\N	None	0.98039216	0.96153843	0.9708738	0.80340314	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-10 21:12:38	2020-07-10 21:12:38	2020-07-10 21:12:38	2020-07-10 21:12:38	0.9750687	1666	\N		565	\N	None	0.98039216	0.96153843	0.9708738	0.80157065	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.16666667	0.2857143	2020-07-10 21:25:07	2020-07-10 21:25:07	2020-07-10 21:25:07	2020-07-10 21:25:07	0.1679754	1667	\N		565	\N	None	1	0.16666667	0.2857143	0.16256544	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-10 22:07:09	2020-07-10 22:07:09	2020-07-10 22:07:09	2020-07-10 22:07:09	0.98854864	1668	\N		566	\N	None	1	0.962963	0.9811321	0.81020945	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-10 22:10:40	2020-07-10 22:10:40	2020-07-10 22:10:40	2020-07-10 22:10:40	0.984557	1669	\N		566	\N	None	1	0.9622642	0.9807692	0.81806284	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-10 22:17:27	2020-07-10 22:17:27	2020-07-10 22:17:27	2020-07-10 22:17:27	0.96466434	1670	\N		566	\N	None	1	0.9245283	0.9607843	0.7780105	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.16666667	0.2857143	2020-07-10 22:32:49	2020-07-10 22:32:49	2020-07-10 22:32:49	2020-07-10 22:32:49	0.18767177	1671	\N		566	\N	None	1	0.16666667	0.2857143	0.17382199	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-10 23:10:25	2020-07-10 23:10:25	2020-07-10 23:10:25	2020-07-10 23:10:25	0.98645467	1672	\N		567	\N	None	1	0.9814815	0.99065423	0.7963351	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-10 23:13:22	2020-07-10 23:13:22	2020-07-10 23:13:22	2020-07-10 23:13:22	0.9774898	1673	\N		567	\N	None	1	0.9259259	0.96153843	0.8133508	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-10 23:17:43	2020-07-10 23:17:43	2020-07-10 23:17:43	2020-07-10 23:17:43	0.95216596	1674	\N		567	\N	None	1	0.9622642	0.9807692	0.7743456	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.16666667	0.2857143	2020-07-10 23:29:25	2020-07-10 23:29:25	2020-07-10 23:29:25	2020-07-10 23:29:25	0.19709462	1675	\N		567	\N	None	1	0.17307693	0.29508197	0.1908377	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 00:07:54	2020-07-11 00:07:54	2020-07-11 00:07:54	2020-07-11 00:07:54	0.9903808	1676	\N		568	\N	None	0.9811321	1	0.9904762	0.789267	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 00:11:40	2020-07-11 00:11:40	2020-07-11 00:11:40	2020-07-11 00:11:40	0.98894125	1677	\N		568	\N	None	1	0.9807692	0.99029124	0.7984293	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 00:17:31	2020-07-11 00:17:31	2020-07-11 00:17:31	2020-07-11 00:17:31	0.9714697	1678	\N		568	\N	None	1	0.9245283	0.9607843	0.77853405	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.24074075	0.3880597	2020-07-11 00:31:12	2020-07-11 00:31:12	2020-07-11 00:31:12	2020-07-11 00:31:12	0.32135847	1679	\N		568	\N	None	1	0.23076923	0.375	0.31937173	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 01:07:48	2020-07-11 01:07:48	2020-07-11 01:07:48	2020-07-11 01:07:48	0.98717445	1680	\N		569	\N	None	0.9814815	1	0.99065423	0.79005235	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 01:10:56	2020-07-11 01:10:56	2020-07-11 01:10:56	2020-07-11 01:10:56	0.9877634	1681	\N		569	\N	None	1	0.9433962	0.9708738	0.8005236	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 01:15:18	2020-07-11 01:15:18	2020-07-11 01:15:18	2020-07-11 01:15:18	0.9623086	1682	\N		569	\N	None	1	0.9811321	0.9904762	0.77146596	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.25925925	0.4117647	2020-07-11 01:26:32	2020-07-11 01:26:32	2020-07-11 01:26:32	2020-07-11 01:26:32	0.35217902	1683	\N		569	\N	None	1	0.24528302	0.3939394	0.3565445	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 01:59:01	2020-07-11 01:59:01	2020-07-11 01:59:01	2020-07-11 01:59:01	0.98881036	1684	\N		570	\N	None	0.98039216	0.96153843	0.9708738	0.7743456	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 02:02:04	2020-07-11 02:02:04	2020-07-11 02:02:04	2020-07-11 02:02:04	0.98377174	1685	\N		570	\N	None	1	0.9622642	0.9807692	0.79764396	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 02:06:22	2020-07-11 02:06:22	2020-07-11 02:06:22	2020-07-11 02:06:22	0.9531475	1686	\N		570	\N	None	1	0.9622642	0.9807692	0.77146596	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.26415095	0.41791046	2020-07-11 02:16:31	2020-07-11 02:16:31	2020-07-11 02:16:31	2020-07-11 02:16:31	0.36068577	1687	\N		570	\N	None	1	0.24528302	0.3939394	0.36335078	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 02:49:37	2020-07-11 02:49:37	2020-07-11 02:49:37	2020-07-11 02:49:37	0.99005365	1688	\N		571	\N	None	1	0.9811321	0.9904762	0.80890054	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 02:52:26	2020-07-11 02:52:26	2020-07-11 02:52:26	2020-07-11 02:52:26	0.98678184	1689	\N		571	\N	None	1	0.9444444	0.9714286	0.82329845	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 02:59:22	2020-07-11 02:59:22	2020-07-11 02:59:22	2020-07-11 02:59:22	0.9736291	1690	\N		571	\N	None	1	0.9056604	0.95049506	0.8002618	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.14814815	0.2580645	2020-07-11 03:11:41	2020-07-11 03:11:41	2020-07-11 03:11:41	2020-07-11 03:11:41	0.13879074	1691	\N		571	\N	None	1	0.13461539	0.23728813	0.1408377	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 03:45:18	2020-07-11 03:45:18	2020-07-11 03:45:18	2020-07-11 03:45:18	0.9903154	1692	\N		572	\N	None	1	0.9811321	0.9904762	0.79267013	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 03:48:40	2020-07-11 03:48:40	2020-07-11 03:48:40	2020-07-11 03:48:40	0.98789424	1693	\N		572	\N	None	0.9791667	0.8867925	0.9306931	0.8052356	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 03:55:58	2020-07-11 03:55:58	2020-07-11 03:55:58	2020-07-11 03:55:58	0.972713	1694	\N		572	\N	None	0.9807692	0.9807692	0.9807692	0.79031414	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.24074075	0.3880597	2020-07-11 04:08:34	2020-07-11 04:08:34	2020-07-11 04:08:34	2020-07-11 04:08:34	0.3051302	1695	\N		572	\N	None	1	0.23076923	0.375	0.30078533	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 04:38:36	2020-07-11 04:38:36	2020-07-11 04:38:36	2020-07-11 04:38:36	0.98390263	1696	\N		573	\N	None	0.9622642	0.9807692	0.9714286	0.7518325	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 04:41:11	2020-07-11 04:41:11	2020-07-11 04:41:11	2020-07-11 04:41:11	0.97153515	1697	\N		573	\N	None	1	0.9444444	0.9714286	0.7777487	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 04:43:07	2020-07-11 04:43:07	2020-07-11 04:43:07	2020-07-11 04:43:07	0.9226541	1698	\N		573	\N	None	1	0.9433962	0.9708738	0.74319375	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.5740741	0.7294118	2020-07-11 04:50:58	2020-07-11 04:50:58	2020-07-11 04:50:58	2020-07-11 04:50:58	0.60024863	1699	\N		573	\N	None	1	0.5471698	0.70731705	0.5895288	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 05:21:56	2020-07-11 05:21:56	2020-07-11 05:21:56	2020-07-11 05:21:56	0.9894647	1700	\N		574	\N	None	1	0.9622642	0.9807692	0.8175393	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 05:24:57	2020-07-11 05:24:57	2020-07-11 05:24:57	2020-07-11 05:24:57	0.9890721	1701	\N		574	\N	None	1	0.9433962	0.9708738	0.82565445	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 05:30:02	2020-07-11 05:30:02	2020-07-11 05:30:02	2020-07-11 05:30:02	0.982005	1702	\N		574	\N	None	0.97959185	0.9230769	0.95049506	0.79685867	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.16666667	0.2857143	2020-07-11 05:43:42	2020-07-11 05:43:42	2020-07-11 05:43:42	2020-07-11 05:43:42	0.19303755	1703	\N		574	\N	None	1	0.16981132	0.29032257	0.19633508	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 06:15:12	2020-07-11 06:15:12	2020-07-11 06:15:12	2020-07-11 06:15:12	0.9908389	1704	\N		575	\N	None	1	0.9807692	0.99029124	0.81256545	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 06:18:29	2020-07-11 06:18:29	2020-07-11 06:18:29	2020-07-11 06:18:29	0.9895956	1705	\N		575	\N	None	1	0.9622642	0.9807692	0.82041883	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 06:30:45	2020-07-11 06:30:45	2020-07-11 06:30:45	2020-07-11 06:30:45	0.97304016	1706	\N		575	\N	None	1	0.9433962	0.9708738	0.786911	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.055555556	0.10526316	2020-07-11 06:44:43	2020-07-11 06:44:43	2020-07-11 06:44:43	2020-07-11 06:44:43	0.09926711	1707	\N		575	\N	None	1	0.057692308	0.10909091	0.09267016	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 07:17:06	2020-07-11 07:17:06	2020-07-11 07:17:06	2020-07-11 07:17:06	0.99116606	1708	\N		576	\N	None	0.9811321	0.9811321	0.9811321	0.8206806	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 07:20:57	2020-07-11 07:20:57	2020-07-11 07:20:57	2020-07-11 07:20:57	0.98913753	1709	\N		576	\N	None	1	0.9433962	0.9708738	0.80994767	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 07:37:16	2020-07-11 07:37:16	2020-07-11 07:37:16	2020-07-11 07:37:16	0.98017275	1710	\N		576	\N	None	1	0.9444444	0.9714286	0.78612566	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-11 07:51:27	2020-07-11 07:51:27	2020-07-11 07:51:27	2020-07-11 07:51:27	0.09645335	1711	\N		576	\N	None	1	0.018518519	0.036363635	0.096335076	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 08:28:08	2020-07-11 08:28:08	2020-07-11 08:28:08	2020-07-11 08:28:08	0.98966104	1712	\N		577	\N	None	1	0.9811321	0.9904762	0.8028796	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 08:32:15	2020-07-11 08:32:15	2020-07-11 08:32:15	2020-07-11 08:32:15	0.99018455	1713	\N		577	\N	None	1	0.9259259	0.96153843	0.8183246	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 08:38:08	2020-07-11 08:38:08	2020-07-11 08:38:08	2020-07-11 08:38:08	0.97729355	1714	\N		577	\N	None	1	0.9811321	0.9904762	0.77905756	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.25925925	0.4117647	2020-07-11 08:54:48	2020-07-11 08:54:48	2020-07-11 08:54:48	2020-07-11 08:54:48	0.33241722	1715	\N		577	\N	None	1	0.2264151	0.36923078	0.32198954	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 09:26:28	2020-07-11 09:26:28	2020-07-11 09:26:28	2020-07-11 09:26:28	0.98867947	1716	\N		578	\N	None	1	0.962963	0.9811321	0.80497384	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 09:29:42	2020-07-11 09:29:42	2020-07-11 09:29:42	2020-07-11 09:29:42	0.99005365	1717	\N		578	\N	None	1	0.9433962	0.9708738	0.82198954	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 09:41:25	2020-07-11 09:41:25	2020-07-11 09:41:26	2020-07-11 09:41:26	0.9759848	1718	\N		578	\N	None	0.9807692	0.9807692	0.9807692	0.7856021	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.16666667	0.2857143	2020-07-11 09:54:56	2020-07-11 09:54:56	2020-07-11 09:54:56	2020-07-11 09:54:56	0.21116346	1719	\N		578	\N	None	1	0.16981132	0.29032257	0.20811519	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 10:23:33	2020-07-11 10:23:33	2020-07-11 10:23:33	2020-07-11 10:23:33	0.9899882	1720	\N		579	\N	None	0.9807692	0.9807692	0.9807692	0.8196335	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 10:27:04	2020-07-11 10:27:04	2020-07-11 10:27:04	2020-07-11 10:27:04	0.9903808	1721	\N		579	\N	None	1	0.9622642	0.9807692	0.8041885	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 10:41:33	2020-07-11 10:41:33	2020-07-11 10:41:33	2020-07-11 10:41:33	0.97290933	1722	\N		579	\N	None	1	0.9259259	0.96153843	0.7850785	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.16666667	0.2857143	2020-07-11 10:54:56	2020-07-11 10:54:56	2020-07-11 10:54:56	2020-07-11 10:54:56	0.18943855	1723	\N		579	\N	None	1	0.1509434	0.26229507	0.18769634	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 11:19:28	2020-07-11 11:19:28	2020-07-11 11:19:28	2020-07-11 11:19:28	0.9914933	1724	\N		580	\N	None	1	0.96153843	0.98039216	0.8222513	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 11:22:16	2020-07-11 11:22:16	2020-07-11 11:22:16	2020-07-11 11:22:16	0.9901191	1725	\N		580	\N	None	1	0.9056604	0.95049506	0.83089006	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 11:35:50	2020-07-11 11:35:50	2020-07-11 11:35:50	2020-07-11 11:35:50	0.9816123	1726	\N		580	\N	None	1	0.9074074	0.9514563	0.8094241	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-11 11:50:07	2020-07-11 11:50:07	2020-07-11 11:50:07	2020-07-11 11:50:07	0.09841644	1727	\N		580	\N	None	1	0.03846154	0.074074075	0.09319372	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 12:15:17	2020-07-11 12:15:17	2020-07-11 12:15:17	2020-07-11 12:15:17	0.9903808	1728	\N		581	\N	None	1	0.9444444	0.9714286	0.8206806	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 12:18:09	2020-07-11 12:18:09	2020-07-11 12:18:09	2020-07-11 12:18:09	0.9899882	1729	\N		581	\N	None	1	0.9811321	0.9904762	0.8277487	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 12:36:52	2020-07-11 12:36:52	2020-07-11 12:36:52	2020-07-11 12:36:52	0.9847533	1730	\N		581	\N	None	0.9807692	0.9807692	0.9807692	0.80732983	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.055555556	0.10526316	2020-07-11 12:52:43	2020-07-11 12:52:43	2020-07-11 12:52:43	2020-07-11 12:52:43	0.09756576	1731	\N		581	\N	None	1	0.03846154	0.074074075	0.091884814	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 13:19:02	2020-07-11 13:19:02	2020-07-11 13:19:02	2020-07-11 13:19:02	0.990708	1732	\N		582	\N	None	1	0.962963	0.9811321	0.8212042	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 13:22:18	2020-07-11 13:22:18	2020-07-11 13:22:18	2020-07-11 13:22:18	0.99018455	1733	\N		582	\N	None	1	0.9259259	0.96153843	0.82015705	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 13:42:31	2020-07-11 13:42:31	2020-07-11 13:42:31	2020-07-11 13:42:31	0.9840335	1734	\N		582	\N	None	1	0.9245283	0.9607843	0.8036649	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.037037037	0.071428575	2020-07-11 13:55:26	2020-07-11 13:55:26	2020-07-11 13:55:26	2020-07-11 13:55:26	0.095864415	1735	\N		582	\N	None	1	0.018518519	0.036363635	0.09554974	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 14:19:09	2020-07-11 14:19:09	2020-07-11 14:19:09	2020-07-11 14:19:09	0.99110067	1736	\N		583	\N	None	1	1	1	0.82382196	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 14:22:22	2020-07-11 14:22:22	2020-07-11 14:22:22	2020-07-11 14:22:22	0.9903808	1737	\N		583	\N	None	1	0.9622642	0.9807692	0.8264398	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 14:34:02	2020-07-11 14:34:02	2020-07-11 14:34:02	2020-07-11 14:34:02	0.979911	1738	\N		583	\N	None	0.97959185	0.9230769	0.95049506	0.79554975	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.16666667	0.2857143	2020-07-11 14:46:51	2020-07-11 14:46:51	2020-07-11 14:46:51	2020-07-11 14:46:51	0.19172883	1739	\N		583	\N	None	1	0.16981132	0.29032257	0.19581152	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 15:10:59	2020-07-11 15:10:59	2020-07-11 15:10:59	2020-07-11 15:10:59	0.99077344	1740	\N		584	\N	None	1	0.9814815	0.99065423	0.8172775	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 15:14:24	2020-07-11 15:14:24	2020-07-11 15:14:24	2020-07-11 15:14:24	0.9908389	1741	\N		584	\N	None	1	0.9074074	0.9514563	0.82748693	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 15:29:00	2020-07-11 15:29:00	2020-07-11 15:29:00	2020-07-11 15:29:00	0.9827248	1742	\N		584	\N	None	1	0.9622642	0.9807692	0.81492144	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.12962963	0.22950819	2020-07-11 15:41:51	2020-07-11 15:41:51	2020-07-11 15:41:51	2020-07-11 15:41:51	0.1205994	1743	\N		584	\N	None	1	0.13207547	0.23333333	0.11178011	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 16:06:23	2020-07-11 16:06:23	2020-07-11 16:06:23	2020-07-11 16:06:23	0.99018455	1744	\N		585	\N	None	0.98039216	0.96153843	0.9708738	0.8091623	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 16:10:43	2020-07-11 16:10:43	2020-07-11 16:10:43	2020-07-11 16:10:43	0.99018455	1745	\N		585	\N	None	1	0.9433962	0.9708738	0.8193717	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 16:33:56	2020-07-11 16:33:56	2020-07-11 16:33:56	2020-07-11 16:33:56	0.98442614	1746	\N		585	\N	None	1	0.9423077	0.97029704	0.8057592	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.094339624	0.1724138	2020-07-11 16:46:52	2020-07-11 16:46:52	2020-07-11 16:46:52	2020-07-11 16:46:52	0.105614446	1747	\N		585	\N	None	1	0.094339624	0.1724138	0.10157068	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 17:11:51	2020-07-11 17:11:51	2020-07-11 17:11:51	2020-07-11 17:11:51	0.99025	1748	\N		586	\N	None	1	0.96153843	0.98039216	0.8319372	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 17:15:47	2020-07-11 17:15:47	2020-07-11 17:15:47	2020-07-11 17:15:47	0.9903154	1749	\N		586	\N	None	1	0.9245283	0.9607843	0.8327225	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 17:39:07	2020-07-11 17:39:07	2020-07-11 17:39:07	2020-07-11 17:39:07	0.9862583	1750	\N		586	\N	None	1	0.9433962	0.9708738	0.813089	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.037037037	0.071428575	2020-07-11 17:54:34	2020-07-11 17:54:34	2020-07-11 17:54:34	2020-07-11 17:54:34	0.097500324	1751	\N		586	\N	None	1	0.018867925	0.037037037	0.08900524	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-11 18:19:08	2020-07-11 18:19:08	2020-07-11 18:19:08	2020-07-11 18:19:08	0.9905117	1752	\N		587	\N	None	1	0.9622642	0.9807692	0.8104712	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-11 18:24:12	2020-07-11 18:24:12	2020-07-11 18:24:12	2020-07-11 18:24:12	0.99057716	1753	\N		587	\N	None	1	0.96153843	0.98039216	0.8277487	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-11 18:47:43	2020-07-11 18:47:43	2020-07-11 18:47:43	2020-07-11 18:47:43	0.9844916	1754	\N		587	\N	None	1	0.9259259	0.96153843	0.802356	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.11111111	0.2	2020-07-11 19:03:01	2020-07-11 19:03:01	2020-07-11 19:03:01	2020-07-11 19:03:01	0.104174845	1755	\N		587	\N	None	1	0.074074075	0.13793103	0.10418848	\N	15282	3820	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-11 19:19:43	2020-07-11 19:19:43	2020-07-11 19:19:43	2020-07-11 19:19:43	0.98582065	1756	\N		588	\N	None	1	0.9433962	0.9708738	0.76353276	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-11 19:20:58	2020-07-11 19:20:58	2020-07-11 19:20:58	2020-07-11 19:20:58	0.96931046	1757	\N		588	\N	None	1	0.9433962	0.9708738	0.7938358	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-11 19:21:55	2020-07-11 19:21:55	2020-07-11 19:21:55	2020-07-11 19:21:55	0.9434121	1758	\N		588	\N	None	1	1	1	0.75757575	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.537037	0.6987952	2020-07-11 19:27:34	2020-07-11 19:27:34	2020-07-11 19:27:34	2020-07-11 19:27:34	0.57481384	1759	\N		588	\N	None	1	0.509434	0.675	0.57342654	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-11 19:44:13	2020-07-11 19:44:13	2020-07-11 19:44:13	2020-07-11 19:44:13	0.9898349	1760	\N		589	\N	None	1	0.9622642	0.9807692	0.8088578	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-11 19:45:35	2020-07-11 19:45:35	2020-07-11 19:45:35	2020-07-11 19:45:35	0.9837488	1761	\N		589	\N	None	1	0.9245283	0.9607843	0.8104118	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-11 19:48:10	2020-07-11 19:48:10	2020-07-11 19:48:10	2020-07-11 19:48:10	0.975785	1762	\N		589	\N	None	0.98039216	0.9433962	0.96153843	0.7930588	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.18518518	0.3125	2020-07-11 19:56:40	2020-07-11 19:56:40	2020-07-11 19:56:40	2020-07-11 19:56:40	0.21204273	1763	\N		589	\N	None	1	0.16981132	0.29032257	0.20383321	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-11 20:13:22	2020-07-11 20:13:22	2020-07-11 20:13:22	2020-07-11 20:13:22	0.98905796	1764	\N		590	\N	None	1	0.962963	0.9811321	0.8003108	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-11 20:14:37	2020-07-11 20:14:37	2020-07-11 20:14:37	2020-07-11 20:14:37	0.9750081	1765	\N		590	\N	None	0.98	0.9423077	0.9607843	0.80574983	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-11 20:16:50	2020-07-11 20:16:50	2020-07-11 20:16:50	2020-07-11 20:16:50	0.9710586	1766	\N		590	\N	None	1	0.9814815	0.99065423	0.8073038	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.16666667	0.2857143	2020-07-11 20:24:03	2020-07-11 20:24:03	2020-07-11 20:24:03	2020-07-11 20:24:03	0.20369051	1767	\N		590	\N	None	1	0.16981132	0.29032257	0.20849521	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-11 20:40:50	2020-07-11 20:40:50	2020-07-11 20:40:50	2020-07-11 20:40:50	0.98653287	1768	\N		591	\N	None	0.9814815	1	0.99065423	0.78425276	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-11 20:42:00	2020-07-11 20:42:00	2020-07-11 20:42:00	2020-07-11 20:42:00	0.9598576	1769	\N		591	\N	None	1	0.9423077	0.97029704	0.7982388	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-11 20:43:34	2020-07-11 20:43:34	2020-07-11 20:43:34	2020-07-11 20:43:34	0.9472321	1770	\N		591	\N	None	1	0.962963	0.9811321	0.7762238	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.22222222	0.36363637	2020-07-11 20:50:22	2020-07-11 20:50:22	2020-07-11 20:50:22	2020-07-11 20:50:22	0.26481062	1771	\N		591	\N	None	1	0.21153846	0.34920636	0.25200725	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-11 21:07:50	2020-07-11 21:07:50	2020-07-11 21:07:50	2020-07-11 21:07:50	0.99022335	1772	\N		592	\N	None	1	0.9259259	0.96153843	0.79202276	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-11 21:09:23	2020-07-11 21:09:23	2020-07-11 21:09:23	2020-07-11 21:09:23	0.9868566	1773	\N		592	\N	None	0.97959185	0.9230769	0.95049506	0.8096348	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-11 21:12:02	2020-07-11 21:12:02	2020-07-11 21:12:02	2020-07-11 21:12:02	0.97300094	1774	\N		592	\N	None	1	0.962963	0.9811321	0.7770008	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.22222222	0.36363637	2020-07-11 21:20:17	2020-07-11 21:20:17	2020-07-11 21:20:17	2020-07-11 21:20:17	0.36607316	1775	\N		592	\N	None	1	0.2264151	0.36923078	0.37244236	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-11 21:37:07	2020-07-11 21:37:07	2020-07-11 21:37:07	2020-07-11 21:37:07	0.98989964	1776	\N		593	\N	None	1	0.9622642	0.9807692	0.7969438	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-11 21:38:32	2020-07-11 21:38:32	2020-07-11 21:38:32	2020-07-11 21:38:32	0.9837488	1777	\N		593	\N	None	1	0.9433962	0.9708738	0.8049728	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-11 21:41:02	2020-07-11 21:41:02	2020-07-11 21:41:02	2020-07-11 21:41:02	0.95914537	1778	\N		593	\N	None	1	1	1	0.75912976	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.22222222	0.36363637	2020-07-11 21:48:06	2020-07-11 21:48:06	2020-07-11 21:48:06	2020-07-11 21:48:06	0.37293622	1779	\N		593	\N	None	1	0.2264151	0.36923078	0.37037036	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-11 22:05:39	2020-07-11 22:05:39	2020-07-11 22:05:39	2020-07-11 22:05:39	0.9878278	1780	\N		594	\N	None	1	0.9811321	0.9904762	0.76508677	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-11 22:07:15	2020-07-11 22:07:15	2020-07-11 22:07:15	2020-07-11 22:07:15	0.9766915	1781	\N		594	\N	None	0.97959185	0.9411765	0.96	0.77829576	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-11 22:09:14	2020-07-11 22:09:14	2020-07-11 22:09:14	2020-07-11 22:09:14	0.9412755	1782	\N		594	\N	None	1	0.9814815	0.99065423	0.7606838	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.3148148	0.47887325	2020-07-11 22:16:49	2020-07-11 22:16:49	2020-07-11 22:16:49	2020-07-11 22:16:49	0.435157	1783	\N		594	\N	None	1	0.28301886	0.44117647	0.42968142	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-11 22:37:22	2020-07-11 22:37:22	2020-07-11 22:37:22	2020-07-11 22:37:22	0.99035287	1784	\N		595	\N	None	1	0.9444444	0.9714286	0.8060088	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-11 22:39:09	2020-07-11 22:39:09	2020-07-11 22:39:09	2020-07-11 22:39:09	0.98549694	1785	\N		595	\N	None	1	0.9607843	0.98	0.8207718	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-11 22:43:43	2020-07-11 22:43:43	2020-07-11 22:43:43	2020-07-11 22:43:43	0.98271286	1786	\N		595	\N	None	0.9811321	1	0.9904762	0.8096348	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.14814815	0.2580645	2020-07-11 22:54:35	2020-07-11 22:54:35	2020-07-11 22:54:35	2020-07-11 22:54:35	0.11628359	1787	\N		595	\N	None	1	0.13207547	0.23333333	0.11525512	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-11 23:15:30	2020-07-11 23:15:30	2020-07-11 23:15:30	2020-07-11 23:15:30	0.9897702	1788	\N		596	\N	None	1	0.9433962	0.9708738	0.8034188	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-11 23:17:14	2020-07-11 23:17:14	2020-07-11 23:17:14	2020-07-11 23:17:14	0.9843315	1789	\N		596	\N	None	1	0.9811321	0.9904762	0.8148148	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-11 23:20:42	2020-07-11 23:20:42	2020-07-11 23:20:42	2020-07-11 23:20:42	0.9796051	1790	\N		596	\N	None	1	0.9814815	0.99065423	0.8073038	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.16666667	0.2857143	2020-07-11 23:30:58	2020-07-11 23:30:58	2020-07-11 23:30:58	2020-07-11 23:30:58	0.15603755	1791	\N		596	\N	None	1	0.13461539	0.23728813	0.14814815	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-11 23:51:31	2020-07-11 23:51:31	2020-07-11 23:51:31	2020-07-11 23:51:31	0.9892522	1792	\N		597	\N	None	1	0.9811321	0.9904762	0.7982388	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-11 23:53:04	2020-07-11 23:53:04	2020-07-11 23:53:04	2020-07-11 23:53:04	0.976821	1793	\N		597	\N	None	1	0.9056604	0.95049506	0.8026418	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-11 23:56:48	2020-07-11 23:56:48	2020-07-11 23:56:48	2020-07-11 23:56:48	0.9741664	1794	\N		597	\N	None	0.9814815	1	0.99065423	0.78425276	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.16666667	0.2857143	2020-07-12 00:05:52	2020-07-12 00:05:52	2020-07-12 00:05:52	2020-07-12 00:05:52	0.12554225	1795	\N		597	\N	None	1	0.1509434	0.26229507	0.12302512	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 00:26:38	2020-07-12 00:26:38	2020-07-12 00:26:38	2020-07-12 00:26:38	0.99184203	1796	\N		598	\N	None	0.9607843	0.9423077	0.9514563	0.7987568	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 00:28:19	2020-07-12 00:28:19	2020-07-12 00:28:19	2020-07-12 00:28:19	0.9878925	1797	\N		598	\N	None	1	0.9245283	0.9607843	0.80833983	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 00:32:08	2020-07-12 00:32:08	2020-07-12 00:32:08	2020-07-12 00:32:08	0.97552603	1798	\N		598	\N	None	0.962963	1	0.9811321	0.78166276	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.22222222	0.36363637	2020-07-12 00:41:00	2020-07-12 00:41:00	2020-07-12 00:41:00	2020-07-12 00:41:00	0.3096795	1799	\N		598	\N	None	1	0.2264151	0.36923078	0.3069153	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 00:58:17	2020-07-12 00:58:17	2020-07-12 00:58:17	2020-07-12 00:58:17	0.9895759	1800	\N		599	\N	None	1	1	1	0.8041958	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 00:59:56	2020-07-12 00:59:56	2020-07-12 00:59:56	2020-07-12 00:59:56	0.98776305	1801	\N		599	\N	None	1	0.9056604	0.95049506	0.8091168	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 01:03:16	2020-07-12 01:03:16	2020-07-12 01:03:16	2020-07-12 01:03:16	0.9709939	1802	\N		599	\N	None	1	0.962963	0.9811321	0.7891738	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.22222222	0.36363637	2020-07-12 01:11:46	2020-07-12 01:11:46	2020-07-12 01:11:46	2020-07-12 01:11:46	0.3272904	1803	\N		599	\N	None	1	0.22222222	0.36363637	0.33954933	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 01:28:34	2020-07-12 01:28:34	2020-07-12 01:28:34	2020-07-12 01:28:34	0.9897702	1804	\N		600	\N	None	1	1	1	0.7909868	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 01:30:04	2020-07-12 01:30:04	2020-07-12 01:30:04	2020-07-12 01:30:04	0.98387825	1805	\N		600	\N	None	1	0.9259259	0.96153843	0.8008288	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 01:33:03	2020-07-12 01:33:03	2020-07-12 01:33:03	2020-07-12 01:33:03	0.96283585	1806	\N		600	\N	None	1	0.9433962	0.9708738	0.7707848	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.22222222	0.36363637	2020-07-12 01:40:26	2020-07-12 01:40:26	2020-07-12 01:40:26	2020-07-12 01:40:26	0.33130464	1807	\N		600	\N	None	1	0.2264151	0.36923078	0.33540535	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 01:57:31	2020-07-12 01:57:31	2020-07-12 01:57:31	2020-07-12 01:57:31	0.9910651	1808	\N		601	\N	None	1	0.962963	0.9811321	0.7997928	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 01:59:02	2020-07-12 01:59:02	2020-07-12 01:59:02	2020-07-12 01:59:02	0.9866623	1809	\N		601	\N	None	1	0.9245283	0.9607843	0.8140378	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 02:04:05	2020-07-12 02:04:05	2020-07-12 02:04:05	2020-07-12 02:04:05	0.9832308	1810	\N		601	\N	None	0.9807692	0.9622642	0.9714286	0.8093758	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.09259259	0.16949153	2020-07-12 02:13:21	2020-07-12 02:13:21	2020-07-12 02:13:21	2020-07-12 02:13:21	0.109679505	1811	\N		601	\N	None	1	0.09615385	0.1754386	0.103859104	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 02:30:23	2020-07-12 02:30:23	2020-07-12 02:30:23	2020-07-12 02:30:23	0.99087083	1812	\N		602	\N	None	0.9811321	1	0.9904762	0.79202276	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 02:32:06	2020-07-12 02:32:06	2020-07-12 02:32:06	2020-07-12 02:32:06	0.9882163	1813	\N		602	\N	None	1	0.9245283	0.9607843	0.8085988	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 02:37:12	2020-07-12 02:37:12	2020-07-12 02:37:12	2020-07-12 02:37:12	0.97397214	1814	\N		602	\N	None	1	0.9811321	0.9904762	0.7922818	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.22222222	0.36363637	2020-07-12 02:46:14	2020-07-12 02:46:14	2020-07-12 02:46:14	2020-07-12 02:46:14	0.28533506	1815	\N		602	\N	None	1	0.21153846	0.34920636	0.2962963	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 03:00:13	2020-07-12 03:00:13	2020-07-12 03:00:13	2020-07-12 03:00:13	0.9858854	1816	\N		603	\N	None	1	0.9622642	0.9807692	0.7477338	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 03:01:25	2020-07-12 03:01:25	2020-07-12 03:01:25	2020-07-12 03:01:25	0.9707349	1817	\N		603	\N	None	1	0.9622642	0.9807692	0.7795908	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 03:02:21	2020-07-12 03:02:21	2020-07-12 03:02:21	2020-07-12 03:02:21	0.9435416	1818	\N		603	\N	None	0.9807692	0.9622642	0.9714286	0.75602174	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.5660377	0.72289157	2020-07-12 03:07:59	2020-07-12 03:07:59	2020-07-12 03:07:59	2020-07-12 03:07:59	0.5775332	1819	\N		603	\N	None	1	0.4814815	0.65	0.5754986	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 03:22:10	2020-07-12 03:22:10	2020-07-12 03:22:10	2020-07-12 03:22:10	0.9910651	1820	\N		604	\N	None	1	0.9433962	0.9708738	0.8189588	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 03:23:44	2020-07-12 03:23:44	2020-07-12 03:23:44	2020-07-12 03:23:44	0.988799	1821	\N		604	\N	None	1	0.9433962	0.9708738	0.82310283	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 03:27:28	2020-07-12 03:27:28	2020-07-12 03:27:28	2020-07-12 03:27:28	0.98705083	1822	\N		604	\N	None	0.9807692	0.9622642	0.9714286	0.8047138	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.16666667	0.2857143	2020-07-12 03:37:12	2020-07-12 03:37:12	2020-07-12 03:37:12	2020-07-12 03:37:12	0.11854969	1823	\N		604	\N	None	1	0.1509434	0.26229507	0.12069412	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 03:51:59	2020-07-12 03:51:59	2020-07-12 03:51:59	2020-07-12 03:51:59	0.9917773	1824	\N		605	\N	None	1	0.962963	0.9811321	0.81869984	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 03:53:43	2020-07-12 03:53:43	2020-07-12 03:53:43	2020-07-12 03:53:43	0.98996437	1825	\N		605	\N	None	1	0.9074074	0.9514563	0.8241388	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 04:02:04	2020-07-12 04:02:04	2020-07-12 04:02:04	2020-07-12 04:02:04	0.98640335	1826	\N		605	\N	None	1	0.9622642	0.9807692	0.8223258	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-12 04:12:02	2020-07-12 04:12:02	2020-07-12 04:12:02	2020-07-12 04:12:02	0.099320166	1827	\N		605	\N	None	1	0.03773585	0.07272727	0.1015281	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 04:26:30	2020-07-12 04:26:30	2020-07-12 04:26:30	2020-07-12 04:26:30	0.9905471	1828	\N		606	\N	None	1	0.9433962	0.9708738	0.8249158	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 04:28:25	2020-07-12 04:28:25	2020-07-12 04:28:25	2020-07-12 04:28:25	0.9897702	1829	\N		606	\N	None	1	0.9423077	0.97029704	0.81533283	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 04:40:08	2020-07-12 04:40:08	2020-07-12 04:40:08	2020-07-12 04:40:08	0.9866623	1830	\N		606	\N	None	0.9807692	0.9622642	0.9714286	0.7974618	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-12 04:50:00	2020-07-12 04:50:00	2020-07-12 04:50:00	2020-07-12 04:50:00	0.09944966	1831	\N		606	\N	None	1	0.03773585	0.07272727	0.097384095	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 05:04:22	2020-07-12 05:04:22	2020-07-12 05:04:22	2020-07-12 05:04:22	0.99087083	1832	\N		607	\N	None	1	0.962963	0.9811321	0.8062678	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 05:06:11	2020-07-12 05:06:11	2020-07-12 05:06:11	2020-07-12 05:06:11	0.9889932	1833	\N		607	\N	None	1	0.96153843	0.98039216	0.8150738	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 05:09:55	2020-07-12 05:09:55	2020-07-12 05:09:55	2020-07-12 05:09:55	0.980641	1834	\N		607	\N	None	0.9811321	1	0.9904762	0.7871018	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.22222222	0.36363637	2020-07-12 05:19:26	2020-07-12 05:19:26	2020-07-12 05:19:26	2020-07-12 05:19:26	0.31259307	1835	\N		607	\N	None	1	0.2264151	0.36923078	0.30898732	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 05:33:43	2020-07-12 05:33:43	2020-07-12 05:33:43	2020-07-12 05:33:43	0.99022335	1836	\N		608	\N	None	1	0.9811321	0.9904762	0.8150738	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 05:35:49	2020-07-12 05:35:49	2020-07-12 05:35:49	2020-07-12 05:35:49	0.9897054	1837	\N		608	\N	None	1	0.9230769	0.96	0.8148148	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 05:44:45	2020-07-12 05:44:45	2020-07-12 05:44:45	2020-07-12 05:44:45	0.9845905	1838	\N		608	\N	None	1	0.962963	0.9811321	0.8075628	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.16666667	0.2857143	2020-07-12 05:54:45	2020-07-12 05:54:45	2020-07-12 05:54:45	2020-07-12 05:54:45	0.18271285	1839	\N		608	\N	None	1	0.16981132	0.29032257	0.17663817	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 06:09:08	2020-07-12 06:09:08	2020-07-12 06:09:08	2020-07-12 06:09:08	0.99061185	1840	\N		609	\N	None	0.98039216	0.96153843	0.9708738	0.81533283	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 06:11:23	2020-07-12 06:11:23	2020-07-12 06:11:23	2020-07-12 06:11:23	0.9900939	1841	\N		609	\N	None	1	0.9811321	0.9904762	0.8127428	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 06:22:54	2020-07-12 06:22:54	2020-07-12 06:22:54	2020-07-12 06:22:54	0.9854322	1842	\N		609	\N	None	0.9811321	0.9811321	0.9811321	0.8093758	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.12962963	0.22950819	2020-07-12 06:33:07	2020-07-12 06:33:07	2020-07-12 06:33:07	2020-07-12 06:33:07	0.11317579	1843	\N		609	\N	None	1	0.09615385	0.1754386	0.116032116	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 06:47:54	2020-07-12 06:47:54	2020-07-12 06:47:54	2020-07-12 06:47:54	0.99087083	1844	\N		610	\N	None	1	0.9444444	0.9714286	0.82465684	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 06:50:05	2020-07-12 06:50:05	2020-07-12 06:50:05	2020-07-12 06:50:05	0.9905471	1845	\N		610	\N	None	1	0.9056604	0.95049506	0.83423984	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 07:02:26	2020-07-12 07:02:26	2020-07-12 07:02:26	2020-07-12 07:02:26	0.98679185	1846	\N		610	\N	None	0.98039216	0.9433962	0.96153843	0.8062678	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-12 07:14:40	2020-07-12 07:14:40	2020-07-12 07:14:40	2020-07-12 07:14:40	0.0996439	1847	\N		610	\N	None	1	0.03773585	0.07272727	0.1004921	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 07:29:32	2020-07-12 07:29:32	2020-07-12 07:29:32	2020-07-12 07:29:32	0.9915183	1848	\N		611	\N	None	1	0.9433962	0.9708738	0.8199948	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 07:31:56	2020-07-12 07:31:56	2020-07-12 07:31:56	2020-07-12 07:31:56	0.9904176	1849	\N		611	\N	None	1	0.9245283	0.9607843	0.8275058	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 07:47:30	2020-07-12 07:47:30	2020-07-12 07:47:30	2020-07-12 07:47:30	0.98646814	1850	\N		611	\N	None	0.9814815	1	0.99065423	0.8130018	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-12 07:59:43	2020-07-12 07:59:43	2020-07-12 07:59:43	2020-07-12 07:59:43	0.0996439	1851	\N		611	\N	None	1	0.037037037	0.071428575	0.0966071	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 08:14:50	2020-07-12 08:14:50	2020-07-12 08:14:50	2020-07-12 08:14:50	0.9904176	1852	\N		612	\N	None	1	0.9433962	0.9708738	0.8207718	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 08:17:27	2020-07-12 08:17:27	2020-07-12 08:17:27	2020-07-12 08:17:27	0.9910651	1853	\N		612	\N	None	1	0.9245283	0.9607843	0.81869984	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 08:37:53	2020-07-12 08:37:53	2020-07-12 08:37:53	2020-07-12 08:37:53	0.9876335	1854	\N		612	\N	None	0.9811321	0.9811321	0.9811321	0.81869984	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.018518519	0.036363635	2020-07-12 08:50:12	2020-07-12 08:50:12	2020-07-12 08:50:12	2020-07-12 08:50:12	0.09867271	1855	\N		612	\N	None	1	0.018867925	0.037037037	0.097384095	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 09:05:20	2020-07-12 09:05:20	2020-07-12 09:05:20	2020-07-12 09:05:20	0.9905471	1856	\N		613	\N	None	1	0.9814815	0.99065423	0.82646984	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 09:07:52	2020-07-12 09:07:52	2020-07-12 09:07:52	2020-07-12 09:07:52	0.99035287	1857	\N		613	\N	None	1	0.962963	0.9811321	0.81947684	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 09:20:03	2020-07-12 09:20:03	2020-07-12 09:20:03	2020-07-12 09:20:03	0.98711556	1858	\N		613	\N	None	1	0.9811321	0.9904762	0.8158508	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.14814815	0.2580645	2020-07-12 09:32:21	2020-07-12 09:32:21	2020-07-12 09:32:21	2020-07-12 09:32:21	0.12217546	1859	\N		613	\N	None	1	0.13207547	0.23333333	0.13183112	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 09:47:16	2020-07-12 09:47:16	2020-07-12 09:47:16	2020-07-12 09:47:16	0.99125934	1860	\N		614	\N	None	1	0.9811321	0.9904762	0.8223258	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 09:50:05	2020-07-12 09:50:05	2020-07-12 09:50:05	2020-07-12 09:50:05	0.99087083	1861	\N		614	\N	None	0.9807692	0.9807692	0.9807692	0.83657086	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 10:06:29	2020-07-12 10:06:29	2020-07-12 10:06:29	2020-07-12 10:06:29	0.98847526	1862	\N		614	\N	None	0.9814815	1	0.99065423	0.8067858	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.09259259	0.16949153	2020-07-12 10:18:43	2020-07-12 10:18:43	2020-07-12 10:18:43	2020-07-12 10:18:43	0.10806086	1863	\N		614	\N	None	1	0.11320755	0.20338982	0.0999741	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 10:33:44	2020-07-12 10:33:44	2020-07-12 10:33:44	2020-07-12 10:33:44	0.9907413	1864	\N		615	\N	None	1	0.9622642	0.9807692	0.8243978	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 10:36:53	2020-07-12 10:36:53	2020-07-12 10:36:53	2020-07-12 10:36:53	0.9906766	1865	\N		615	\N	None	1	0.9230769	0.96	0.82905984	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 10:55:56	2020-07-12 10:55:56	2020-07-12 10:55:56	2020-07-12 10:55:56	0.9856912	1866	\N		615	\N	None	1	0.9814815	0.99065423	0.8101528	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.055555556	0.10526316	2020-07-12 11:07:47	2020-07-12 11:07:47	2020-07-12 11:07:47	2020-07-12 11:07:47	0.10236322	1867	\N		615	\N	None	1	0.055555556	0.10526316	0.103082106	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 11:23:03	2020-07-12 11:23:03	2020-07-12 11:23:03	2020-07-12 11:23:03	0.9916478	1868	\N		616	\N	None	1	0.9622642	0.9807692	0.81869984	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 11:26:40	2020-07-12 11:26:40	2020-07-12 11:26:40	2020-07-12 11:26:40	0.9901586	1869	\N		616	\N	None	1	0.9245283	0.9607843	0.83423984	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 11:51:24	2020-07-12 11:51:24	2020-07-12 11:51:24	2020-07-12 11:51:24	0.988022	1870	\N		616	\N	None	1	1	1	0.8285418	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.018518519	0.036363635	2020-07-12 12:09:58	2020-07-12 12:09:58	2020-07-12 12:09:58	2020-07-12 12:09:58	0.09731305	1871	\N		616	\N	None	1	0.018867925	0.037037037	0.1028231	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-12 12:35:46	2020-07-12 12:35:46	2020-07-12 12:35:46	2020-07-12 12:35:46	0.9911298	1872	\N		617	\N	None	1	0.9622642	0.9807692	0.82051283	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-12 12:44:38	2020-07-12 12:44:38	2020-07-12 12:44:38	2020-07-12 12:44:38	0.99035287	1873	\N		617	\N	None	0.98	0.9245283	0.9514563	0.82646984	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-12 13:34:21	2020-07-12 13:34:21	2020-07-12 13:34:21	2020-07-12 13:34:21	0.98711556	1874	\N		617	\N	None	0.98039216	0.96153843	0.9708738	0.8096348	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.055555556	0.10526316	2020-07-12 13:51:03	2020-07-12 13:51:03	2020-07-12 13:51:03	2020-07-12 13:51:03	0.10242797	1875	\N		617	\N	None	1	0.056603774	0.10714286	0.0989381	\N	15445	3861	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 14:19:57	2020-07-12 14:19:57	2020-07-12 14:19:57	2020-07-12 14:19:57	0.99618685	1876	\N		618	\N	None	0.97727275	0.86	0.9148936	0.8043202	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 14:20:27	2020-07-12 14:20:27	2020-07-12 14:20:27	2020-07-12 14:20:27	0.99872893	1877	\N		618	\N	None	0.97727275	0.86	0.9148936	0.8297332	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 14:20:51	2020-07-12 14:20:51	2020-07-12 14:20:51	2020-07-12 14:20:51	0.96091515	1878	\N		618	\N	None	0.95652175	0.8979592	0.9263158	0.7687421	\N	3147	787	None
SVC	\N	5	3150	788	1	0.7592593	0.86315787	2020-07-12 14:21:38	2020-07-12 14:21:38	2020-07-12 14:21:38	2020-07-12 14:21:38	0.7947251	1879	\N		618	\N	None	1	0.64	0.7804878	0.6772554	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 14:51:11	2020-07-12 14:51:11	2020-07-12 14:51:11	2020-07-12 14:51:11	0.99682236	1880	\N		619	\N	None	0.9361702	0.9166667	0.9263158	0.8246506	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 14:52:07	2020-07-12 14:52:07	2020-07-12 14:52:07	2020-07-12 14:52:07	0.9990467	1881	\N		619	\N	None	1	0.84313726	0.9148936	0.80304956	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 14:53:00	2020-07-12 14:53:00	2020-07-12 14:53:00	2020-07-12 14:53:00	0.96536386	1882	\N		619	\N	None	0.97727275	0.86	0.9148936	0.7649301	\N	3147	787	None
SVC	\N	5	3150	788	1	0.3148148	0.47887325	2020-07-12 14:54:13	2020-07-12 14:54:13	2020-07-12 14:54:13	2020-07-12 14:54:13	0.42898	1883	\N		619	\N	None	1	0.29166666	0.4516129	0.4040661	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 15:18:51	2020-07-12 15:18:51	2020-07-12 15:18:51	2020-07-12 15:18:51	0.9990467	1884	\N		620	\N	None	0.9347826	0.86	0.8958333	0.7852605	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 15:19:25	2020-07-12 15:19:25	2020-07-12 15:19:25	2020-07-12 15:19:25	0.9980934	1885	\N		620	\N	None	0.9574468	0.9	0.92783505	0.8221093	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 15:20:01	2020-07-12 15:20:01	2020-07-12 15:20:01	2020-07-12 15:20:01	0.97235465	1886	\N		620	\N	None	0.93333334	0.85714287	0.89361703	0.77890724	\N	3147	787	None
SVC	\N	5	3150	788	1	0.37037036	0.5405405	2020-07-12 15:20:52	2020-07-12 15:20:52	2020-07-12 15:20:52	2020-07-12 15:20:52	0.4226247	1887	\N		620	\N	None	1	0.30612245	0.46875	0.433291	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 15:44:33	2020-07-12 15:44:33	2020-07-12 15:44:33	2020-07-12 15:44:33	0.99682236	1888	\N		621	\N	None	1	0.88235295	0.9375	0.78398985	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 15:45:03	2020-07-12 15:45:03	2020-07-12 15:45:03	2020-07-12 15:45:03	0.9984112	1889	\N		621	\N	None	0.9777778	0.8627451	0.9166667	0.8068615	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 15:45:33	2020-07-12 15:45:33	2020-07-12 15:45:33	2020-07-12 15:45:33	0.9555132	1890	\N		621	\N	None	0.9111111	0.8367347	0.87234044	0.79796696	\N	3147	787	None
SVC	\N	5	3150	788	1	0.4074074	0.57894737	2020-07-12 15:46:18	2020-07-12 15:46:18	2020-07-12 15:46:18	2020-07-12 15:46:18	0.49539244	1891	\N		621	\N	None	1	0.41304347	0.5846154	0.501906	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 16:10:13	2020-07-12 16:10:13	2020-07-12 16:10:13	2020-07-12 16:10:13	0.9990467	1892	\N		622	\N	None	0.9777778	0.88	0.9263158	0.8106734	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 16:10:55	2020-07-12 16:10:55	2020-07-12 16:10:55	2020-07-12 16:10:55	0.99872893	1893	\N		622	\N	None	0.97619045	0.9111111	0.9425287	0.8297332	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 16:11:38	2020-07-12 16:11:38	2020-07-12 16:11:38	2020-07-12 16:11:38	0.9818875	1894	\N		622	\N	None	0.95555556	0.877551	0.9148936	0.83227444	\N	3147	787	None
SVC	\N	5	3150	788	1	0.537037	0.6987952	2020-07-12 16:12:36	2020-07-12 16:12:36	2020-07-12 16:12:36	2020-07-12 16:12:36	0.6075628	1895	\N		622	\N	None	1	0.4489796	0.6197183	0.57052094	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 16:36:13	2020-07-12 16:36:13	2020-07-12 16:36:13	2020-07-12 16:36:13	0.9974579	1896	\N		623	\N	None	0.9361702	0.88	0.9072165	0.7966963	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 16:36:50	2020-07-12 16:36:50	2020-07-12 16:36:50	2020-07-12 16:36:50	0.9993645	1897	\N		623	\N	None	0.9782609	0.9	0.9375	0.8106734	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 16:37:27	2020-07-12 16:37:27	2020-07-12 16:37:27	2020-07-12 16:37:27	0.9605974	1898	\N		623	\N	None	0.9782609	0.9183673	0.94736844	0.7712833	\N	3147	787	None
SVC	\N	5	3150	788	1	0.537037	0.6987952	2020-07-12 16:38:16	2020-07-12 16:38:16	2020-07-12 16:38:16	2020-07-12 16:38:16	0.61995554	1899	\N		623	\N	None	1	0.43396226	0.6052632	0.5933926	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 17:02:00	2020-07-12 17:02:00	2020-07-12 17:02:00	2020-07-12 17:02:00	0.9977757	1900	\N		624	\N	None	0.9777778	0.9166667	0.94623655	0.8017789	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 17:02:33	2020-07-12 17:02:33	2020-07-12 17:02:33	2020-07-12 17:02:33	0.9990467	1901	\N		624	\N	None	1	0.877551	0.9347826	0.8017789	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 17:03:02	2020-07-12 17:03:02	2020-07-12 17:03:02	2020-07-12 17:03:02	0.9818875	1902	\N		624	\N	None	0.93333334	0.875	0.9032258	0.79288435	\N	3147	787	None
SVC	\N	5	3150	788	1	0.6111111	0.7586207	2020-07-12 17:03:51	2020-07-12 17:03:51	2020-07-12 17:03:51	2020-07-12 17:03:51	0.7165555	1903	\N		624	\N	None	1	0.6037736	0.7529412	0.6404066	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 17:27:40	2020-07-12 17:27:40	2020-07-12 17:27:40	2020-07-12 17:27:40	0.9990467	1904	\N		625	\N	None	0.9777778	0.9166667	0.94623655	0.815756	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 17:28:27	2020-07-12 17:28:27	2020-07-12 17:28:27	2020-07-12 17:28:27	0.99872893	1905	\N		625	\N	None	1	0.877551	0.9347826	0.8310038	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9814815	0.99065423	2020-07-12 17:29:25	2020-07-12 17:29:25	2020-07-12 17:29:25	2020-07-12 17:29:25	0.9748967	1906	\N		625	\N	None	1	0.8235294	0.9032258	0.8132147	\N	3147	787	None
SVC	\N	5	3150	788	1	0.28301886	0.44117647	2020-07-12 17:30:31	2020-07-12 17:30:31	2020-07-12 17:30:31	2020-07-12 17:30:31	0.3755958	1907	\N		625	\N	None	1	0.24489796	0.39344263	0.364676	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 17:54:40	2020-07-12 17:54:40	2020-07-12 17:54:40	2020-07-12 17:54:40	0.9990467	1908	\N		626	\N	None	0.8958333	0.9347826	0.9148936	0.82846254	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 17:55:25	2020-07-12 17:55:25	2020-07-12 17:55:25	2020-07-12 17:55:25	0.99872893	1909	\N		626	\N	None	0.9736842	0.8043478	0.88095236	0.8386277	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 17:56:15	2020-07-12 17:56:15	2020-07-12 17:56:15	2020-07-12 17:56:15	0.9787099	1910	\N		626	\N	None	0.9787234	0.9019608	0.93877554	0.7801779	\N	3147	787	None
SVC	\N	5	3150	788	1	0.3148148	0.47887325	2020-07-12 17:57:18	2020-07-12 17:57:18	2020-07-12 17:57:18	2020-07-12 17:57:18	0.39911026	1911	\N		626	\N	None	1	0.30232558	0.4642857	0.4231258	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 18:20:57	2020-07-12 18:20:57	2020-07-12 18:20:57	2020-07-12 18:20:57	0.99872893	1912	\N		627	\N	None	0.9777778	0.8979592	0.9361702	0.8017789	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 18:21:33	2020-07-12 18:21:33	2020-07-12 18:21:33	2020-07-12 18:21:33	0.9980934	1913	\N		627	\N	None	1	0.9375	0.9677419	0.83481574	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 18:22:21	2020-07-12 18:22:21	2020-07-12 18:22:21	2020-07-12 18:22:21	0.9837941	1914	\N		627	\N	None	0.97727275	0.877551	0.9247312	0.8132147	\N	3147	787	None
SVC	\N	5	3150	788	1	0.33333334	0.5	2020-07-12 18:23:14	2020-07-12 18:23:14	2020-07-12 18:23:14	2020-07-12 18:23:14	0.4054655	1915	\N		627	\N	None	1	0.3	0.46153846	0.37102923	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 18:47:41	2020-07-12 18:47:41	2020-07-12 18:47:41	2020-07-12 18:47:41	0.9965046	1916	\N		628	\N	None	0.9583333	0.9019608	0.9292929	0.7916137	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 18:48:32	2020-07-12 18:48:32	2020-07-12 18:48:32	2020-07-12 18:48:32	0.99872893	1917	\N		628	\N	None	1	0.86	0.9247312	0.80304956	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 18:49:35	2020-07-12 18:49:35	2020-07-12 18:49:35	2020-07-12 18:49:35	0.9802987	1918	\N		628	\N	None	0.9130435	0.89361703	0.9032258	0.815756	\N	3147	787	None
SVC	\N	5	3150	788	1	0.46296296	0.6329114	2020-07-12 18:50:41	2020-07-12 18:50:41	2020-07-12 18:50:41	2020-07-12 18:50:41	0.5332062	1919	\N		628	\N	None	1	0.42553192	0.5970149	0.5044473	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 19:21:31	2020-07-12 19:21:31	2020-07-12 19:21:31	2020-07-12 19:21:31	0.9958691	1920	\N		629	\N	None	0.96	0.9411765	0.95049506	0.8081322	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 19:22:39	2020-07-12 19:22:39	2020-07-12 19:22:39	2020-07-12 19:22:39	0.99872893	1921	\N		629	\N	None	0.95454544	0.875	0.9130435	0.82083863	\N	3147	787	None
SGDC	\N	5	3150	788	1	0.9814815	0.99065423	2020-07-12 19:23:33	2020-07-12 19:23:33	2020-07-12 19:23:33	2020-07-12 19:23:33	0.9586908	1922	\N		629	\N	None	0.9782609	0.9183673	0.94736844	0.7712833	\N	3147	787	None
SVC	\N	5	3150	788	1	0.46296296	0.6329114	2020-07-12 19:24:38	2020-07-12 19:24:38	2020-07-12 19:24:38	2020-07-12 19:24:38	0.5719733	1923	\N		629	\N	None	1	0.4375	0.6086956	0.53113085	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 19:50:45	2020-07-12 19:50:45	2020-07-12 19:50:45	2020-07-12 19:50:45	0.99618685	1924	\N		630	\N	None	0.9777778	0.8627451	0.9166667	0.794155	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 19:51:26	2020-07-12 19:51:26	2020-07-12 19:51:26	2020-07-12 19:51:26	0.9990467	1925	\N		630	\N	None	1	0.7647059	0.8666667	0.8017789	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 19:52:14	2020-07-12 19:52:14	2020-07-12 19:52:14	2020-07-12 19:52:14	0.9860184	1926	\N		630	\N	None	0.9777778	0.8627451	0.9166667	0.8144854	\N	3147	787	None
SVC	\N	5	3150	788	1	0.5	0.6666667	2020-07-12 19:53:07	2020-07-12 19:53:07	2020-07-12 19:53:07	2020-07-12 19:53:07	0.5859549	1927	\N		630	\N	None	1	0.39215687	0.5633803	0.52731895	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 20:20:20	2020-07-12 20:20:20	2020-07-12 20:20:20	2020-07-12 20:20:20	0.9984112	1928	\N		631	\N	None	0.9375	0.9	0.9183673	0.80050826	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 20:21:17	2020-07-12 20:21:17	2020-07-12 20:21:17	2020-07-12 20:21:17	0.99872893	1929	\N		631	\N	None	0.95	0.82608694	0.88372093	0.82846254	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 20:22:38	2020-07-12 20:22:38	2020-07-12 20:22:38	2020-07-12 20:22:38	0.9828408	1930	\N		631	\N	None	0.9591837	0.94	0.94949496	0.7801779	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2777778	0.4347826	2020-07-12 20:23:56	2020-07-12 20:23:56	2020-07-12 20:23:56	2020-07-12 20:23:56	0.36669844	1931	\N		631	\N	None	1	0.23913044	0.3859649	0.37484118	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 20:51:50	2020-07-12 20:51:50	2020-07-12 20:51:50	2020-07-12 20:51:50	0.99872893	1932	\N		632	\N	None	0.9782609	0.9	0.9375	0.82083863	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 20:52:47	2020-07-12 20:52:47	2020-07-12 20:52:47	2020-07-12 20:52:47	0.9990467	1933	\N		632	\N	None	1	0.89361703	0.94382024	0.8106734	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 20:54:20	2020-07-12 20:54:20	2020-07-12 20:54:20	2020-07-12 20:54:20	0.98474735	1934	\N		632	\N	None	0.9767442	0.875	0.9230769	0.82337993	\N	3147	787	None
SVC	\N	5	3150	788	1	0.4074074	0.57894737	2020-07-12 20:55:47	2020-07-12 20:55:47	2020-07-12 20:55:47	2020-07-12 20:55:47	0.51064503	1935	\N		632	\N	None	1	0.45652175	0.6268657	0.50571793	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 21:22:42	2020-07-12 21:22:42	2020-07-12 21:22:42	2020-07-12 21:22:42	0.9984112	1936	\N		633	\N	None	1	0.8039216	0.8913044	0.8170267	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 21:23:21	2020-07-12 21:23:21	2020-07-12 21:23:21	2020-07-12 21:23:21	0.99968225	1937	\N		633	\N	None	1	0.84	0.9130435	0.82592124	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 21:23:48	2020-07-12 21:23:48	2020-07-12 21:23:48	2020-07-12 21:23:48	0.9669527	1938	\N		633	\N	None	0.9782609	0.9	0.9375	0.7750953	\N	3147	787	None
SVC	\N	5	3150	788	1	0.7962963	0.88659793	2020-07-12 21:24:38	2020-07-12 21:24:38	2020-07-12 21:24:38	2020-07-12 21:24:38	0.7915475	1939	\N		633	\N	None	1	0.62	0.7654321	0.7141042	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 21:49:49	2020-07-12 21:49:49	2020-07-12 21:49:49	2020-07-12 21:49:49	0.9993645	1940	\N		634	\N	None	0.9791667	0.90384614	0.94	0.8246506	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 21:50:58	2020-07-12 21:50:58	2020-07-12 21:50:58	2020-07-12 21:50:58	0.9993645	1941	\N		634	\N	None	1	0.8627451	0.9263158	0.8386277	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 21:52:21	2020-07-12 21:52:21	2020-07-12 21:52:21	2020-07-12 21:52:21	0.99110264	1942	\N		634	\N	None	0.95	0.8636364	0.9047619	0.7878018	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2777778	0.4347826	2020-07-12 21:54:04	2020-07-12 21:54:04	2020-07-12 21:54:04	2020-07-12 21:54:04	0.35875437	1943	\N		634	\N	None	1	0.2244898	0.36666667	0.33926302	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 22:25:20	2020-07-12 22:25:20	2020-07-12 22:25:20	2020-07-12 22:25:20	0.99872893	1944	\N		635	\N	None	0.9756098	0.85106385	0.90909094	0.8335451	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 22:26:50	2020-07-12 22:26:50	2020-07-12 22:26:50	2020-07-12 22:26:50	0.9993645	1945	\N		635	\N	None	1	0.89361703	0.94382024	0.8526048	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 22:29:40	2020-07-12 22:29:40	2020-07-12 22:29:40	2020-07-12 22:29:40	0.99523354	1946	\N		635	\N	None	0.95555556	0.9148936	0.9347826	0.7916137	\N	3147	787	None
SVC	\N	5	3150	788	1	0.18518518	0.3125	2020-07-12 22:31:38	2020-07-12 22:31:38	2020-07-12 22:31:38	2020-07-12 22:31:38	0.23609787	1947	\N		635	\N	None	1	0.21276596	0.3508772	0.22363405	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 23:03:23	2020-07-12 23:03:23	2020-07-12 23:03:23	2020-07-12 23:03:23	0.9984112	1948	\N		636	\N	None	0.95555556	0.877551	0.9148936	0.8271919	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 23:05:18	2020-07-12 23:05:18	2020-07-12 23:05:18	2020-07-12 23:05:18	0.9990467	1949	\N		636	\N	None	1	0.82	0.9010989	0.82337993	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 23:09:09	2020-07-12 23:09:09	2020-07-12 23:09:09	2020-07-12 23:09:09	0.98919606	1950	\N		636	\N	None	0.8913044	0.9111111	0.9010989	0.84498096	\N	3147	787	None
SVC	\N	5	3150	788	1	0.18518518	0.3125	2020-07-12 23:11:06	2020-07-12 23:11:06	2020-07-12 23:11:06	2020-07-12 23:11:06	0.19034001	1951	\N		636	\N	None	1	0.18367347	0.31034482	0.20330368	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-12 23:40:56	2020-07-12 23:40:56	2020-07-12 23:40:56	2020-07-12 23:40:56	0.9984112	1952	\N		637	\N	None	0.9318182	0.95348835	0.9425287	0.82337993	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-12 23:42:06	2020-07-12 23:42:06	2020-07-12 23:42:06	2020-07-12 23:42:06	0.9990467	1953	\N		637	\N	None	1	0.81632656	0.8988764	0.80559087	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-12 23:43:35	2020-07-12 23:43:35	2020-07-12 23:43:35	2020-07-12 23:43:35	0.9752145	1954	\N		637	\N	None	1	0.9	0.94736844	0.78907245	\N	3147	787	None
SVC	\N	5	3150	788	1	0.3888889	0.56	2020-07-12 23:45:21	2020-07-12 23:45:21	2020-07-12 23:45:21	2020-07-12 23:45:21	0.50810295	1955	\N		637	\N	None	1	0.38297874	0.5538462	0.47395173	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-13 00:13:23	2020-07-13 00:13:23	2020-07-13 00:13:23	2020-07-13 00:13:23	0.9971401	1956	\N		638	\N	None	1	0.89361703	0.94382024	0.82337993	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-13 00:15:03	2020-07-13 00:15:03	2020-07-13 00:15:03	2020-07-13 00:15:03	0.9990467	1957	\N		638	\N	None	0.9756098	0.85106385	0.90909094	0.8221093	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-13 00:18:10	2020-07-13 00:18:10	2020-07-13 00:18:10	2020-07-13 00:18:10	0.98411185	1958	\N		638	\N	None	0.9767442	0.875	0.9230769	0.7966963	\N	3147	787	None
SVC	\N	5	3150	788	1	0.33333334	0.5	2020-07-13 00:20:03	2020-07-13 00:20:03	2020-07-13 00:20:03	2020-07-13 00:20:03	0.40610105	1959	\N		638	\N	None	1	0.30612245	0.46875	0.39517152	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-13 00:46:38	2020-07-13 00:46:38	2020-07-13 00:46:38	2020-07-13 00:46:38	0.99968225	1960	\N		639	\N	None	0.9777778	0.8627451	0.9166667	0.8106734	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-13 00:48:12	2020-07-13 00:48:12	2020-07-13 00:48:12	2020-07-13 00:48:12	0.9990467	1961	\N		639	\N	None	0.9777778	0.8979592	0.9361702	0.8297332	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-13 00:51:15	2020-07-13 00:51:15	2020-07-13 00:51:15	2020-07-13 00:51:15	0.9936447	1962	\N		639	\N	None	0.9782609	0.9782609	0.9782609	0.8221093	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2777778	0.4347826	2020-07-13 00:52:45	2020-07-13 00:52:45	2020-07-13 00:52:45	2020-07-13 00:52:45	0.37527806	1963	\N		639	\N	None	1	0.25	0.4	0.33418044	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-13 01:15:45	2020-07-13 01:15:45	2020-07-13 01:15:45	2020-07-13 01:15:45	0.9990467	1964	\N		640	\N	None	0.97619045	0.9111111	0.9425287	0.83735704	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-13 01:17:31	2020-07-13 01:17:31	2020-07-13 01:17:31	2020-07-13 01:17:31	0.9990467	1965	\N		640	\N	None	1	0.8076923	0.89361703	0.819568	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-13 01:20:51	2020-07-13 01:20:51	2020-07-13 01:20:51	2020-07-13 01:20:51	0.9949158	1966	\N		640	\N	None	0.9574468	0.9	0.92783505	0.79796696	\N	3147	787	None
SVC	\N	5	3150	788	1	0.18518518	0.3125	2020-07-13 01:22:52	2020-07-13 01:22:52	2020-07-13 01:22:52	2020-07-13 01:22:52	0.22529393	1967	\N		640	\N	None	1	0.19607843	0.32786885	0.18424396	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-13 01:45:39	2020-07-13 01:45:39	2020-07-13 01:45:39	2020-07-13 01:45:39	0.99872893	1968	\N		641	\N	None	1	0.85714287	0.9230769	0.82846254	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-13 01:47:33	2020-07-13 01:47:33	2020-07-13 01:47:33	2020-07-13 01:47:33	0.99872893	1969	\N		641	\N	None	0.9756098	0.8695652	0.9195402	0.841169	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-13 01:50:58	2020-07-13 01:50:58	2020-07-13 01:50:58	2020-07-13 01:50:58	0.98411185	1970	\N		641	\N	None	0.90697676	0.82978725	0.8666667	0.79034305	\N	3147	787	None
SVC	\N	5	3150	788	1	0.16666667	0.2857143	2020-07-13 01:53:02	2020-07-13 01:53:02	2020-07-13 01:53:02	2020-07-13 01:53:02	0.19224659	1971	\N		641	\N	None	1	0.18	0.30508474	0.16772553	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-13 02:16:09	2020-07-13 02:16:09	2020-07-13 02:16:09	2020-07-13 02:16:09	0.99872893	1972	\N		642	\N	None	1	0.877551	0.9347826	0.8360864	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-13 02:18:25	2020-07-13 02:18:25	2020-07-13 02:18:25	2020-07-13 02:18:25	0.9993645	1973	\N		642	\N	None	0.9767442	0.84	0.9032258	0.8246506	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-13 02:23:17	2020-07-13 02:23:17	2020-07-13 02:23:17	2020-07-13 02:23:17	0.99459803	1974	\N		642	\N	None	0.97727275	0.86	0.9148936	0.8170267	\N	3147	787	None
SVC	\N	5	3150	788	1	0.14814815	0.2580645	2020-07-13 02:25:22	2020-07-13 02:25:22	2020-07-13 02:25:22	2020-07-13 02:25:22	0.15570384	1975	\N		642	\N	None	1	0.1632653	0.28070176	0.14866582	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-13 02:48:24	2020-07-13 02:48:24	2020-07-13 02:48:24	2020-07-13 02:48:24	0.9984112	1976	\N		643	\N	None	0.9782609	0.9	0.9375	0.8221093	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-13 02:50:09	2020-07-13 02:50:09	2020-07-13 02:50:09	2020-07-13 02:50:09	0.99872893	1977	\N		643	\N	None	0.97619045	0.82	0.8913044	0.8271919	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-13 02:53:15	2020-07-13 02:53:15	2020-07-13 02:53:15	2020-07-13 02:53:15	0.9965046	1978	\N		643	\N	None	0.9318182	0.9111111	0.92134833	0.82337993	\N	3147	787	None
SVC	\N	5	3150	788	1	0.2962963	0.45714286	2020-07-13 02:55:21	2020-07-13 02:55:21	2020-07-13 02:55:21	2020-07-13 02:55:21	0.374007	1979	\N		643	\N	None	1	0.25	0.4	0.36721727	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-13 03:18:34	2020-07-13 03:18:34	2020-07-13 03:18:34	2020-07-13 03:18:34	0.9993645	1980	\N		644	\N	None	0.9574468	0.9	0.92783505	0.8297332	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-13 03:21:14	2020-07-13 03:21:14	2020-07-13 03:21:14	2020-07-13 03:21:14	0.99872893	1981	\N		644	\N	None	1	0.85714287	0.9230769	0.8335451	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-13 03:24:46	2020-07-13 03:24:46	2020-07-13 03:24:46	2020-07-13 03:24:46	0.97712106	1982	\N		644	\N	None	0.9318182	0.8367347	0.8817204	0.7992376	\N	3147	787	None
SVC	\N	5	3150	788	1	0.22222222	0.36363637	2020-07-13 03:26:44	2020-07-13 03:26:44	2020-07-13 03:26:44	2020-07-13 03:26:44	0.35208136	1983	\N		644	\N	None	1	0.21568628	0.3548387	0.33163914	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-13 03:49:35	2020-07-13 03:49:35	2020-07-13 03:49:35	2020-07-13 03:49:35	0.99872893	1984	\N		645	\N	None	1	0.9148936	0.95555556	0.8170267	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-13 03:52:13	2020-07-13 03:52:13	2020-07-13 03:52:13	2020-07-13 03:52:13	0.9993645	1985	\N		645	\N	None	1	0.87234044	0.9318182	0.83989835	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-13 03:57:17	2020-07-13 03:57:17	2020-07-13 03:57:17	2020-07-13 03:57:17	0.9949158	1986	\N		645	\N	None	0.97619045	0.82	0.8913044	0.79796696	\N	3147	787	None
SVC	\N	5	3150	788	1	0.22222222	0.36363637	2020-07-13 03:59:53	2020-07-13 03:59:53	2020-07-13 03:59:53	2020-07-13 03:59:53	0.3072768	1987	\N		645	\N	None	1	0.22916667	0.37288135	0.29479036	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-13 04:23:03	2020-07-13 04:23:03	2020-07-13 04:23:03	2020-07-13 04:23:03	0.99872893	1988	\N		646	\N	None	1	0.8	0.8888889	0.84752226	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-13 04:25:59	2020-07-13 04:25:59	2020-07-13 04:25:59	2020-07-13 04:25:59	0.9990467	1989	\N		646	\N	None	0.97727275	0.8958333	0.9347826	0.8487929	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-13 04:31:24	2020-07-13 04:31:24	2020-07-13 04:31:24	2020-07-13 04:31:24	0.99682236	1990	\N		646	\N	None	0.97727275	0.86	0.9148936	0.8068615	\N	3147	787	None
SVC	\N	5	3150	788	1	0.16666667	0.2857143	2020-07-13 04:33:57	2020-07-13 04:33:57	2020-07-13 04:33:57	2020-07-13 04:33:57	0.17349857	1991	\N		646	\N	None	1	0.16	0.27586207	0.17280813	\N	3147	787	None
Linear SVC	\N	5	3150	788	1	1	1	2020-07-13 04:57:12	2020-07-13 04:57:12	2020-07-13 04:57:12	2020-07-13 04:57:12	0.9990467	1992	\N		647	\N	None	0.95652175	0.9361702	0.94623655	0.83735704	\N	3147	787	None
Logistic Regression	\N	5	3150	788	1	1	1	2020-07-13 05:00:21	2020-07-13 05:00:21	2020-07-13 05:00:21	2020-07-13 05:00:21	0.9993645	1993	\N		647	\N	None	1	0.84	0.9130435	0.8182973	\N	3147	787	None
SGDC	\N	5	3150	788	1	1	1	2020-07-13 05:06:05	2020-07-13 05:06:05	2020-07-13 05:06:05	2020-07-13 05:06:05	0.99173814	1994	\N		647	\N	None	1	0.86538464	0.92783505	0.79034305	\N	3147	787	None
SVC	\N	5	3150	788	1	0.24074075	0.3880597	2020-07-13 05:08:34	2020-07-13 05:08:34	2020-07-13 05:08:34	2020-07-13 05:08:34	0.2872577	1995	\N		647	\N	None	1	0.2	0.33333334	0.2782719	\N	3147	787	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 05:23:48	2020-07-13 05:23:48	2020-07-13 05:23:48	2020-07-13 05:23:48	0.9977939	1996	\N		648	\N	None	1	0.875	0.93333334	0.81715006	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 05:24:14	2020-07-13 05:24:14	2020-07-13 05:24:14	2020-07-13 05:24:14	0.99873936	1997	\N		648	\N	None	0.9767442	0.875	0.9230769	0.8322825	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 05:24:36	2020-07-13 05:24:36	2020-07-13 05:24:36	2020-07-13 05:24:36	0.9776237	1998	\N		648	\N	None	0.9583333	0.9019608	0.9292929	0.80832285	\N	3173	793	None
SVC	\N	5	3176	794	1	0.6111111	0.7586207	2020-07-13 05:25:20	2020-07-13 05:25:20	2020-07-13 05:25:20	2020-07-13 05:25:20	0.74787265	1999	\N		648	\N	None	1	0.65957445	0.7948718	0.67465323	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 05:40:31	2020-07-13 05:40:31	2020-07-13 05:40:31	2020-07-13 05:40:31	0.9993697	2000	\N		649	\N	None	0.95555556	0.84313726	0.8958333	0.8259773	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 05:41:08	2020-07-13 05:41:08	2020-07-13 05:41:08	2020-07-13 05:41:08	0.99842423	2001	\N		649	\N	None	1	0.8367347	0.9111111	0.8284994	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 05:41:53	2020-07-13 05:41:53	2020-07-13 05:41:53	2020-07-13 05:41:53	0.99180585	2002	\N		649	\N	None	1	0.85714287	0.9230769	0.8196721	\N	3173	793	None
SVC	\N	5	3176	794	1	0.26415095	0.41791046	2020-07-13 05:42:56	2020-07-13 05:42:56	2020-07-13 05:42:56	2020-07-13 05:42:56	0.37409392	2003	\N		649	\N	None	1	0.26086956	0.41379312	0.39848676	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 05:58:24	2020-07-13 05:58:24	2020-07-13 05:58:24	2020-07-13 05:58:24	0.99842423	2004	\N		650	\N	None	0.9782609	0.9183673	0.94736844	0.81336695	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 05:58:55	2020-07-13 05:58:55	2020-07-13 05:58:55	2020-07-13 05:58:55	0.99810904	2005	\N		650	\N	None	0.9767442	0.89361703	0.93333334	0.84993696	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 05:59:36	2020-07-13 05:59:36	2020-07-13 05:59:36	2020-07-13 05:59:36	0.95619285	2006	\N		650	\N	None	0.97727275	0.84313726	0.9052632	0.8284994	\N	3173	793	None
SVC	\N	5	3176	794	1	0.24074075	0.3880597	2020-07-13 06:00:28	2020-07-13 06:00:28	2020-07-13 06:00:28	2020-07-13 06:00:28	0.3734636	2007	\N		650	\N	None	1	0.22916667	0.37288135	0.38335434	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 06:15:41	2020-07-13 06:15:41	2020-07-13 06:15:41	2020-07-13 06:15:41	0.99905455	2008	\N		651	\N	None	0.97727275	0.8958333	0.9347826	0.7994956	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 06:16:09	2020-07-13 06:16:09	2020-07-13 06:16:09	2020-07-13 06:16:09	0.99810904	2009	\N		651	\N	None	1	0.87234044	0.9318182	0.8436318	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 06:16:41	2020-07-13 06:16:41	2020-07-13 06:16:41	2020-07-13 06:16:41	0.98802394	2010	\N		651	\N	None	1	0.8235294	0.9032258	0.81210595	\N	3173	793	None
SVC	\N	5	3176	794	1	0.3148148	0.47887325	2020-07-13 06:17:28	2020-07-13 06:17:28	2020-07-13 06:17:28	2020-07-13 06:17:28	0.4298771	2011	\N		651	\N	None	1	0.3478261	0.516129	0.4110971	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 06:33:01	2020-07-13 06:33:01	2020-07-13 06:33:01	2020-07-13 06:33:01	0.99905455	2012	\N		652	\N	None	0.9777778	0.8627451	0.9166667	0.8234552	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 06:33:57	2020-07-13 06:33:57	2020-07-13 06:33:57	2020-07-13 06:33:57	0.99873936	2013	\N		652	\N	None	1	0.8958333	0.94505495	0.85498106	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 06:34:44	2020-07-13 06:34:44	2020-07-13 06:34:44	2020-07-13 06:34:44	0.98581785	2014	\N		652	\N	None	0.97727275	0.8269231	0.8958333	0.82093316	\N	3173	793	None
SVC	\N	5	3176	794	1	0.4074074	0.57894737	2020-07-13 06:35:55	2020-07-13 06:35:55	2020-07-13 06:35:55	2020-07-13 06:35:55	0.560353	2015	\N		652	\N	None	1	0.45652175	0.6268657	0.51450187	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 06:51:19	2020-07-13 06:51:19	2020-07-13 06:51:19	2020-07-13 06:51:19	0.99873936	2016	\N		653	\N	None	1	0.8979592	0.94623655	0.80958384	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 06:51:54	2020-07-13 06:51:54	2020-07-13 06:51:54	2020-07-13 06:51:54	0.99842423	2017	\N		653	\N	None	1	0.78846157	0.8817204	0.8272383	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 06:52:33	2020-07-13 06:52:33	2020-07-13 06:52:33	2020-07-13 06:52:33	0.97919947	2018	\N		653	\N	None	1	0.84313726	0.9148936	0.79192936	\N	3173	793	None
SVC	\N	5	3176	794	1	0.46296296	0.6329114	2020-07-13 06:53:23	2020-07-13 06:53:23	2020-07-13 06:53:23	2020-07-13 06:53:23	0.56255907	2019	\N		653	\N	None	1	0.38	0.5507246	0.5119798	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 07:08:52	2020-07-13 07:08:52	2020-07-13 07:08:52	2020-07-13 07:08:52	0.9977939	2020	\N		654	\N	None	0.97727275	0.86	0.9148936	0.81715006	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 07:09:23	2020-07-13 07:09:23	2020-07-13 07:09:23	2020-07-13 07:09:23	0.99842423	2021	\N		654	\N	None	0.97727275	0.877551	0.9247312	0.8448928	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 07:09:54	2020-07-13 07:09:54	2020-07-13 07:09:54	2020-07-13 07:09:54	0.9810904	2022	\N		654	\N	None	0.9787234	0.8679245	0.92	0.82093316	\N	3173	793	None
SVC	\N	5	3176	794	1	0.537037	0.6987952	2020-07-13 07:10:40	2020-07-13 07:10:40	2020-07-13 07:10:40	2020-07-13 07:10:40	0.63536084	2023	\N		654	\N	None	1	0.48979592	0.65753424	0.5460277	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 07:26:02	2020-07-13 07:26:02	2020-07-13 07:26:02	2020-07-13 07:26:02	0.99905455	2024	\N		655	\N	None	0.9777778	0.9166667	0.94623655	0.8486759	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 07:26:43	2020-07-13 07:26:43	2020-07-13 07:26:43	2020-07-13 07:26:43	0.99905455	2025	\N		655	\N	None	1	0.85714287	0.9230769	0.8284994	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 07:27:42	2020-07-13 07:27:42	2020-07-13 07:27:42	2020-07-13 07:27:42	0.99495745	2026	\N		655	\N	None	0.93333334	0.84	0.8842105	0.79066837	\N	3173	793	None
SVC	\N	5	3176	794	1	0.22222222	0.36363637	2020-07-13 07:28:52	2020-07-13 07:28:52	2020-07-13 07:28:52	2020-07-13 07:28:52	0.30066183	2027	\N		655	\N	None	1	0.22916667	0.37288135	0.29382095	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 07:44:17	2020-07-13 07:44:17	2020-07-13 07:44:17	2020-07-13 07:44:17	0.9993697	2028	\N		656	\N	None	0.95555556	0.86	0.9052632	0.82976043	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 07:44:55	2020-07-13 07:44:55	2020-07-13 07:44:55	2020-07-13 07:44:55	0.9977939	2029	\N		656	\N	None	0.975	0.78	0.8666667	0.83480453	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 07:45:47	2020-07-13 07:45:47	2020-07-13 07:45:47	2020-07-13 07:45:47	0.98487234	2030	\N		656	\N	None	0.95555556	0.8958333	0.9247312	0.8020176	\N	3173	793	None
SVC	\N	5	3176	794	1	0.24074075	0.3880597	2020-07-13 07:46:52	2020-07-13 07:46:52	2020-07-13 07:46:52	2020-07-13 07:46:52	0.35140246	2031	\N		656	\N	None	1	0.24	0.38709676	0.37452713	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 08:02:12	2020-07-13 08:02:12	2020-07-13 08:02:12	2020-07-13 08:02:12	0.99905455	2032	\N		657	\N	None	1	0.8039216	0.8913044	0.8184111	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 08:02:45	2020-07-13 08:02:45	2020-07-13 08:02:45	2020-07-13 08:02:45	0.99810904	2033	\N		657	\N	None	1	0.9183673	0.9574468	0.8448928	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 08:03:36	2020-07-13 08:03:36	2020-07-13 08:03:36	2020-07-13 08:03:36	0.9845572	2034	\N		657	\N	None	0.9787234	0.92	0.9484536	0.8259773	\N	3173	793	None
SVC	\N	5	3176	794	1	0.24074075	0.3880597	2020-07-13 08:04:33	2020-07-13 08:04:33	2020-07-13 08:04:33	2020-07-13 08:04:33	0.33753544	2035	\N		657	\N	None	1	0.26086956	0.41379312	0.32786885	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 08:20:05	2020-07-13 08:20:05	2020-07-13 08:20:05	2020-07-13 08:20:05	0.99873936	2036	\N		658	\N	None	0.95652175	0.9166667	0.9361702	0.8310214	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 08:20:51	2020-07-13 08:20:51	2020-07-13 08:20:51	2020-07-13 08:20:51	0.99873936	2037	\N		658	\N	None	1	0.85106385	0.9195402	0.8411097	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 08:21:51	2020-07-13 08:21:51	2020-07-13 08:21:51	2020-07-13 08:21:51	0.9877088	2038	\N		658	\N	None	0.93333334	0.875	0.9032258	0.82976043	\N	3173	793	None
SVC	\N	5	3176	794	1	0.37037036	0.5405405	2020-07-13 08:22:58	2020-07-13 08:22:58	2020-07-13 08:22:58	2020-07-13 08:22:58	0.46359912	2039	\N		658	\N	None	1	0.3469388	0.5151515	0.43631777	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 08:41:03	2020-07-13 08:41:03	2020-07-13 08:41:03	2020-07-13 08:41:03	0.99905455	2040	\N		659	\N	None	0.97619045	0.8913044	0.9318182	0.8284994	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 08:42:02	2020-07-13 08:42:02	2020-07-13 08:42:02	2020-07-13 08:42:02	0.99905455	2041	\N		659	\N	None	1	0.8235294	0.9032258	0.8259773	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 08:43:12	2020-07-13 08:43:12	2020-07-13 08:43:12	2020-07-13 08:43:12	0.98959976	2042	\N		659	\N	None	0.9782609	0.9574468	0.9677419	0.8310214	\N	3173	793	None
SVC	\N	5	3176	794	1	0.37037036	0.5405405	2020-07-13 08:44:47	2020-07-13 08:44:47	2020-07-13 08:44:47	2020-07-13 08:44:47	0.5130791	2043	\N		659	\N	None	1	0.3469388	0.5151515	0.49684742	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 09:05:35	2020-07-13 09:05:35	2020-07-13 09:05:35	2020-07-13 09:05:35	0.99810904	2044	\N		660	\N	None	1	0.8958333	0.94505495	0.81715006	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 09:06:26	2020-07-13 09:06:26	2020-07-13 09:06:26	2020-07-13 09:06:26	0.99905455	2045	\N		660	\N	None	0.9767442	0.8235294	0.89361703	0.8322825	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 09:07:26	2020-07-13 09:07:26	2020-07-13 09:07:26	2020-07-13 09:07:26	0.98865426	2046	\N		660	\N	None	0.9767442	0.875	0.9230769	0.80580074	\N	3173	793	None
SVC	\N	5	3176	794	1	0.37037036	0.5405405	2020-07-13 09:08:34	2020-07-13 09:08:34	2020-07-13 09:08:34	2020-07-13 09:08:34	0.49606052	2047	\N		660	\N	None	1	0.36	0.5294118	0.481715	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 09:27:59	2020-07-13 09:27:59	2020-07-13 09:27:59	2020-07-13 09:27:59	0.9993697	2048	\N		661	\N	None	0.974359	0.82608694	0.89411765	0.8398487	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 09:28:55	2020-07-13 09:28:55	2020-07-13 09:28:55	2020-07-13 09:28:55	0.99873936	2049	\N		661	\N	None	1	0.82978725	0.90697676	0.83858764	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 09:30:45	2020-07-13 09:30:45	2020-07-13 09:30:45	2020-07-13 09:30:45	0.9873936	2050	\N		661	\N	None	0.97619045	0.8367347	0.9010989	0.8020176	\N	3173	793	None
SVC	\N	5	3176	794	1	0.2037037	0.33846155	2020-07-13 09:32:27	2020-07-13 09:32:27	2020-07-13 09:32:27	2020-07-13 09:32:27	0.30444375	2051	\N		661	\N	None	1	0.23404256	0.37931034	0.28373265	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 09:52:12	2020-07-13 09:52:12	2020-07-13 09:52:12	2020-07-13 09:52:12	0.99873936	2052	\N		662	\N	None	0.97727275	0.86	0.9148936	0.85372007	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 09:53:25	2020-07-13 09:53:25	2020-07-13 09:53:25	2020-07-13 09:53:25	0.9993697	2053	\N		662	\N	None	1	0.82978725	0.90697676	0.8259773	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 09:55:00	2020-07-13 09:55:00	2020-07-13 09:55:00	2020-07-13 09:55:00	0.984242	2054	\N		662	\N	None	0.95652175	0.9166667	0.9361702	0.8259773	\N	3173	793	None
SVC	\N	5	3176	794	1	0.33333334	0.5	2020-07-13 09:56:17	2020-07-13 09:56:17	2020-07-13 09:56:17	2020-07-13 09:56:17	0.4522534	2055	\N		662	\N	None	1	0.3125	0.47619048	0.41740227	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 10:10:43	2020-07-13 10:10:43	2020-07-13 10:10:43	2020-07-13 10:10:43	0.9977939	2056	\N		663	\N	None	0.9777778	0.88	0.9263158	0.81336695	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 10:11:13	2020-07-13 10:11:13	2020-07-13 10:11:13	2020-07-13 10:11:13	0.99873936	2057	\N		663	\N	None	1	0.88	0.9361702	0.8272383	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 10:11:42	2020-07-13 10:11:42	2020-07-13 10:11:42	2020-07-13 10:11:42	0.972266	2058	\N		663	\N	None	1	0.8367347	0.9111111	0.81715006	\N	3173	793	None
SVC	\N	5	3176	794	1	0.6111111	0.7586207	2020-07-13 10:12:35	2020-07-13 10:12:35	2020-07-13 10:12:35	2020-07-13 10:12:35	0.7491333	2059	\N		663	\N	None	1	0.63265306	0.775	0.6960908	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 10:27:17	2020-07-13 10:27:17	2020-07-13 10:27:17	2020-07-13 10:27:17	0.99873936	2060	\N		664	\N	None	1	0.8541667	0.92134833	0.852459	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 10:28:09	2020-07-13 10:28:09	2020-07-13 10:28:09	2020-07-13 10:28:09	0.99905455	2061	\N		664	\N	None	1	0.86	0.9247312	0.84237075	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 10:29:27	2020-07-13 10:29:27	2020-07-13 10:29:27	2020-07-13 10:29:27	0.98487234	2062	\N		664	\N	None	0.9574468	0.9375	0.94736844	0.7994956	\N	3173	793	None
SVC	\N	5	3176	794	1	0.2037037	0.33846155	2020-07-13 10:30:58	2020-07-13 10:30:58	2020-07-13 10:30:58	2020-07-13 10:30:58	0.3079105	2063	\N		664	\N	None	1	0.2244898	0.36666667	0.2849937	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 10:53:53	2020-07-13 10:53:53	2020-07-13 10:53:53	2020-07-13 10:53:53	0.99873936	2064	\N		665	\N	None	1	0.78431374	0.8791209	0.8398487	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 10:55:07	2020-07-13 10:55:07	2020-07-13 10:55:07	2020-07-13 10:55:07	0.99905455	2065	\N		665	\N	None	1	0.8235294	0.9032258	0.8070618	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 10:57:36	2020-07-13 10:57:36	2020-07-13 10:57:36	2020-07-13 10:57:36	0.99842423	2066	\N		665	\N	None	0.9777778	0.8627451	0.9166667	0.80958384	\N	3173	793	None
SVC	\N	5	3176	794	1	0.16666667	0.2857143	2020-07-13 10:59:44	2020-07-13 10:59:44	2020-07-13 10:59:44	2020-07-13 10:59:44	0.19224708	2067	\N		665	\N	None	1	0.15384616	0.26666668	0.1815889	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 11:15:08	2020-07-13 11:15:08	2020-07-13 11:15:08	2020-07-13 11:15:08	0.99873936	2068	\N		666	\N	None	1	0.84	0.9130435	0.84993696	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 11:16:25	2020-07-13 11:16:25	2020-07-13 11:16:25	2020-07-13 11:16:25	0.9993697	2069	\N		666	\N	None	1	0.8541667	0.92134833	0.8335435	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 11:19:39	2020-07-13 11:19:39	2020-07-13 11:19:39	2020-07-13 11:19:39	0.9996849	2070	\N		666	\N	None	0.95652175	0.8627451	0.9072165	0.8259773	\N	3173	793	None
SVC	\N	5	3176	794	1	0.12962963	0.22950819	2020-07-13 11:21:29	2020-07-13 11:21:29	2020-07-13 11:21:29	2020-07-13 11:21:29	0.14749448	2071	\N		666	\N	None	1	0.16	0.27586207	0.16519547	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 11:37:06	2020-07-13 11:37:06	2020-07-13 11:37:06	2020-07-13 11:37:06	0.9993697	2072	\N		667	\N	None	1	0.82	0.9010989	0.82471627	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 11:38:18	2020-07-13 11:38:18	2020-07-13 11:38:18	2020-07-13 11:38:18	0.9993697	2073	\N		667	\N	None	1	0.8235294	0.9032258	0.8196721	\N	3173	793	None
SGDC	\N	5	3176	794	1	0.9814815	0.99065423	2020-07-13 11:39:47	2020-07-13 11:39:47	2020-07-13 11:39:47	2020-07-13 11:39:47	0.96344155	2074	\N		667	\N	None	0.95454544	0.89361703	0.9230769	0.80075663	\N	3173	793	None
SVC	\N	5	3176	794	1	0.35185185	0.5205479	2020-07-13 11:41:05	2020-07-13 11:41:05	2020-07-13 11:41:05	2020-07-13 11:41:05	0.453514	2075	\N		667	\N	None	1	0.30612245	0.46875	0.41488022	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 11:54:30	2020-07-13 11:54:30	2020-07-13 11:54:30	2020-07-13 11:54:30	0.9993697	2076	\N		668	\N	None	1	0.8888889	0.9411765	0.8398487	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 11:55:48	2020-07-13 11:55:48	2020-07-13 11:55:48	2020-07-13 11:55:48	0.99905455	2077	\N		668	\N	None	0.97619045	0.8541667	0.9111111	0.8398487	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 11:58:12	2020-07-13 11:58:12	2020-07-13 11:58:12	2020-07-13 11:58:12	0.91553736	2078	\N		668	\N	None	0.9574468	0.9	0.92783505	0.7553594	\N	3173	793	None
SVC	\N	5	3176	794	1	0.22222222	0.36363637	2020-07-13 11:59:42	2020-07-13 11:59:42	2020-07-13 11:59:42	2020-07-13 11:59:42	0.3265049	2079	\N		668	\N	None	1	0.23529412	0.3809524	0.33291298	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 12:13:08	2020-07-13 12:13:08	2020-07-13 12:13:08	2020-07-13 12:13:08	0.99873936	2080	\N		669	\N	None	1	0.9583333	0.9787234	0.8360656	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 12:14:24	2020-07-13 12:14:24	2020-07-13 12:14:24	2020-07-13 12:14:24	0.9993697	2081	\N		669	\N	None	1	0.85714287	0.9230769	0.8398487	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 12:17:18	2020-07-13 12:17:18	2020-07-13 12:17:18	2020-07-13 12:17:18	0.99495745	2082	\N		669	\N	None	1	0.8627451	0.9263158	0.78310215	\N	3173	793	None
SVC	\N	5	3176	794	1	0.2037037	0.33846155	2020-07-13 12:18:47	2020-07-13 12:18:47	2020-07-13 12:18:47	2020-07-13 12:18:47	0.2855342	2083	\N		669	\N	None	1	0.20833333	0.3448276	0.2711223	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 12:32:35	2020-07-13 12:32:35	2020-07-13 12:32:35	2020-07-13 12:32:35	0.99905455	2084	\N		670	\N	None	1	0.877551	0.9347826	0.8272383	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 12:34:03	2020-07-13 12:34:03	2020-07-13 12:34:03	2020-07-13 12:34:03	0.9993697	2085	\N		670	\N	None	1	0.85106385	0.9195402	0.8600252	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 12:36:53	2020-07-13 12:36:53	2020-07-13 12:36:53	2020-07-13 12:36:53	0.99873936	2086	\N		670	\N	None	0.9512195	0.8125	0.8764045	0.8398487	\N	3173	793	None
SVC	\N	5	3176	794	1	0.14814815	0.2580645	2020-07-13 12:38:56	2020-07-13 12:38:56	2020-07-13 12:38:56	2020-07-13 12:38:56	0.18373778	2087	\N		670	\N	None	1	0.14285715	0.25	0.19041614	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 12:54:04	2020-07-13 12:54:04	2020-07-13 12:54:04	2020-07-13 12:54:04	0.99905455	2088	\N		671	\N	None	1	0.89361703	0.94382024	0.8398487	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 12:55:56	2020-07-13 12:55:56	2020-07-13 12:55:56	2020-07-13 12:55:56	0.9996849	2089	\N		671	\N	None	1	0.8627451	0.9263158	0.8600252	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 13:00:40	2020-07-13 13:00:40	2020-07-13 13:00:40	2020-07-13 13:00:40	0.9974787	2090	\N		671	\N	None	0.95652175	0.9166667	0.9361702	0.8234552	\N	3173	793	None
SVC	\N	5	3176	794	1	0.14814815	0.2580645	2020-07-13 13:02:50	2020-07-13 13:02:50	2020-07-13 13:02:50	2020-07-13 13:02:50	0.14623384	2091	\N		671	\N	None	1	0.18181819	0.30769232	0.14501892	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 13:17:02	2020-07-13 13:17:02	2020-07-13 13:17:02	2020-07-13 13:17:02	0.99905455	2092	\N		672	\N	None	1	0.8627451	0.9263158	0.8335435	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 13:20:06	2020-07-13 13:20:06	2020-07-13 13:20:06	2020-07-13 13:20:06	0.99905455	2093	\N		672	\N	None	1	0.84313726	0.9148936	0.8398487	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 13:27:19	2020-07-13 13:27:19	2020-07-13 13:27:19	2020-07-13 13:27:19	0.99842423	2094	\N		672	\N	None	0.9777778	0.8627451	0.9166667	0.8196721	\N	3173	793	None
SVC	\N	5	3176	794	1	0.11111111	0.2	2020-07-13 13:30:22	2020-07-13 13:30:22	2020-07-13 13:30:22	2020-07-13 13:30:22	0.12417271	2095	\N		672	\N	None	1	0.10204082	0.18518518	0.12484237	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 13:49:22	2020-07-13 13:49:22	2020-07-13 13:49:22	2020-07-13 13:49:22	0.9993697	2096	\N		673	\N	None	1	0.8076923	0.89361703	0.8284994	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 13:51:46	2020-07-13 13:51:46	2020-07-13 13:51:46	2020-07-13 13:51:46	0.99873936	2097	\N		673	\N	None	1	0.78	0.8764045	0.83858764	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 13:55:24	2020-07-13 13:55:24	2020-07-13 13:55:24	2020-07-13 13:55:24	0.9930665	2098	\N		673	\N	None	0.9375	0.9183673	0.92783505	0.8070618	\N	3173	793	None
SVC	\N	5	3176	794	1	0.22222222	0.36363637	2020-07-13 13:57:31	2020-07-13 13:57:31	2020-07-13 13:57:31	2020-07-13 13:57:31	0.31295305	2099	\N		673	\N	None	1	0.2244898	0.36666667	0.3039092	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 14:12:30	2020-07-13 14:12:30	2020-07-13 14:12:30	2020-07-13 14:12:30	0.99873936	2100	\N		674	\N	None	0.9777778	0.8979592	0.9361702	0.8612863	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 14:14:37	2020-07-13 14:14:37	2020-07-13 14:14:37	2020-07-13 14:14:37	0.9993697	2101	\N		674	\N	None	1	0.81632656	0.8988764	0.82471627	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 14:18:43	2020-07-13 14:18:43	2020-07-13 14:18:43	2020-07-13 14:18:43	0.9943271	2102	\N		674	\N	None	1	0.86	0.9247312	0.7982346	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-13 14:20:48	2020-07-13 14:20:48	2020-07-13 14:20:48	2020-07-13 14:20:48	0.28616452	2103	\N		674	\N	None	1	0.1923077	0.32258064	0.23833543	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 14:35:28	2020-07-13 14:35:28	2020-07-13 14:35:28	2020-07-13 14:35:28	0.99873936	2104	\N		675	\N	None	1	0.84313726	0.9148936	0.83858764	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 14:37:49	2020-07-13 14:37:49	2020-07-13 14:37:49	2020-07-13 14:37:49	0.99905455	2105	\N		675	\N	None	1	0.8958333	0.94505495	0.8436318	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 14:43:18	2020-07-13 14:43:18	2020-07-13 14:43:18	2020-07-13 14:43:18	0.986133	2106	\N		675	\N	None	0.9347826	0.9148936	0.9247312	0.85119796	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-13 14:45:29	2020-07-13 14:45:29	2020-07-13 14:45:29	2020-07-13 14:45:29	0.23006618	2107	\N		675	\N	None	1	0.20512821	0.34042552	0.26481715	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 15:01:43	2020-07-13 15:01:43	2020-07-13 15:01:43	2020-07-13 15:01:43	0.99905455	2108	\N		676	\N	None	1	0.8333333	0.90909094	0.8448928	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 15:04:47	2020-07-13 15:04:47	2020-07-13 15:04:47	2020-07-13 15:04:47	0.99905455	2109	\N		676	\N	None	1	0.8039216	0.8913044	0.8322825	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 15:11:11	2020-07-13 15:11:11	2020-07-13 15:11:11	2020-07-13 15:11:11	0.99905455	2110	\N		676	\N	None	0.97727275	0.877551	0.9247312	0.8284994	\N	3173	793	None
SVC	\N	5	3176	794	1	0.14814815	0.2580645	2020-07-13 15:14:03	2020-07-13 15:14:03	2020-07-13 15:14:03	2020-07-13 15:14:03	0.12858494	2111	\N		676	\N	None	1	0.12244898	0.21818182	0.1185372	\N	3173	793	None
Linear SVC	\N	5	3176	794	1	1	1	2020-07-13 15:28:59	2020-07-13 15:28:59	2020-07-13 15:28:59	2020-07-13 15:28:59	0.99905455	2112	\N		677	\N	None	1	0.8627451	0.9263158	0.8221942	\N	3173	793	None
Logistic Regression	\N	5	3176	794	1	1	1	2020-07-13 15:32:09	2020-07-13 15:32:09	2020-07-13 15:32:09	2020-07-13 15:32:09	0.99905455	2113	\N		677	\N	None	1	0.8125	0.8965517	0.84237075	\N	3173	793	None
SGDC	\N	5	3176	794	1	1	1	2020-07-13 15:39:01	2020-07-13 15:39:01	2020-07-13 15:39:01	2020-07-13 15:39:01	0.9810904	2114	\N		677	\N	None	0.95555556	0.877551	0.9148936	0.81210595	\N	3173	793	None
SVC	\N	5	3176	794	1	0.18518518	0.3125	2020-07-13 15:41:52	2020-07-13 15:41:52	2020-07-13 15:41:53	2020-07-13 15:41:53	0.23479357	2115	\N		677	\N	None	1	0.20408164	0.33898306	0.2446406	\N	3173	793	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-13 16:12:59	2020-07-13 16:12:59	2020-07-13 16:12:59	2020-07-13 16:12:59	0.9816778	2116	\N		678	\N	None	0.9807692	0.9622642	0.9714286	0.7518325	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-13 16:16:22	2020-07-13 16:16:22	2020-07-13 16:16:22	2020-07-13 16:16:22	0.9810889	2117	\N		678	\N	None	1	0.9444444	0.9714286	0.786911	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-13 16:18:27	2020-07-13 16:18:27	2020-07-13 16:18:27	2020-07-13 16:18:27	0.95648474	2118	\N		678	\N	None	1	0.9807692	0.99029124	0.7657068	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.5740741	0.7294118	2020-07-13 16:28:32	2020-07-13 16:28:32	2020-07-13 16:28:32	2020-07-13 16:28:32	0.59141475	2119	\N		678	\N	None	1	0.509434	0.675	0.576178	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-13 17:00:15	2020-07-13 17:00:15	2020-07-13 17:00:15	2020-07-13 17:00:15	0.9898574	2120	\N		679	\N	None	1	0.9811321	0.9904762	0.79921466	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-13 17:02:21	2020-07-13 17:02:21	2020-07-13 17:02:21	2020-07-13 17:02:21	0.98593116	2121	\N		679	\N	None	1	0.962963	0.9811321	0.8159686	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-13 17:05:31	2020-07-13 17:05:31	2020-07-13 17:05:31	2020-07-13 17:05:31	0.9734982	2122	\N		679	\N	None	1	0.9245283	0.9607843	0.7973822	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.18518518	0.3125	2020-07-13 17:16:12	2020-07-13 17:16:12	2020-07-13 17:16:12	2020-07-13 17:16:12	0.23288837	2123	\N		679	\N	None	1	0.1923077	0.32258064	0.23638743	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-13 17:45:10	2020-07-13 17:45:10	2020-07-13 17:45:10	2020-07-13 17:45:10	0.9849496	2124	\N		680	\N	None	0.9807692	0.9622642	0.9714286	0.78115183	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-13 17:46:56	2020-07-13 17:46:56	2020-07-13 17:46:56	2020-07-13 17:46:56	0.9795184	2125	\N		680	\N	None	1	0.9423077	0.97029704	0.7973822	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	0.9811321	0.9904762	2020-07-13 17:49:31	2020-07-13 17:49:31	2020-07-13 17:49:31	2020-07-13 17:49:31	0.96237403	2126	\N		680	\N	None	1	0.962963	0.9811321	0.7803665	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.2037037	0.33846155	2020-07-13 17:59:03	2020-07-13 17:59:03	2020-07-13 17:59:03	2020-07-13 17:59:03	0.24159141	2127	\N		680	\N	None	1	0.20754717	0.34375	0.23534031	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-13 18:27:35	2020-07-13 18:27:35	2020-07-13 18:27:35	2020-07-13 18:27:35	0.98841774	2128	\N		681	\N	None	1	0.9444444	0.9714286	0.78246075	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-13 18:29:27	2020-07-13 18:29:27	2020-07-13 18:29:27	2020-07-13 18:29:27	0.97153515	2129	\N		681	\N	None	1	0.9433962	0.9708738	0.79371727	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-13 18:31:17	2020-07-13 18:31:17	2020-07-13 18:31:17	2020-07-13 18:31:17	0.9473236	2130	\N		681	\N	None	0.9607843	0.9423077	0.9514563	0.7704188	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.24074075	0.3880597	2020-07-13 18:40:03	2020-07-13 18:40:03	2020-07-13 18:40:03	2020-07-13 18:40:03	0.31396413	2131	\N		681	\N	None	1	0.25490198	0.40625	0.30994764	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-13 19:12:41	2020-07-13 19:12:41	2020-07-13 19:12:41	2020-07-13 19:12:41	0.985604	2132	\N		682	\N	None	1	0.9814815	0.99065423	0.77329844	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-13 19:15:32	2020-07-13 19:15:32	2020-07-13 19:15:32	2020-07-13 19:15:32	0.98881036	2133	\N		682	\N	None	1	0.9245283	0.9607843	0.80130893	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-13 19:18:58	2020-07-13 19:18:58	2020-07-13 19:18:58	2020-07-13 19:18:58	0.96492606	2134	\N		682	\N	None	1	0.9433962	0.9708738	0.77539265	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.3018868	0.46376812	2020-07-13 19:30:19	2020-07-13 19:30:19	2020-07-13 19:30:19	2020-07-13 19:30:19	0.41323125	2135	\N		682	\N	None	1	0.2777778	0.4347826	0.41623038	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-13 20:01:18	2020-07-13 20:01:18	2020-07-13 20:01:18	2020-07-13 20:01:18	0.9883523	2136	\N		683	\N	None	1	1	1	0.7683246	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-13 20:03:43	2020-07-13 20:03:43	2020-07-13 20:03:43	2020-07-13 20:03:43	0.98553854	2137	\N		683	\N	None	0.9807692	0.9807692	0.9807692	0.8002618	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-13 20:06:49	2020-07-13 20:06:49	2020-07-13 20:06:49	2020-07-13 20:06:49	0.96263576	2138	\N		683	\N	None	0.9811321	1	0.9904762	0.7759162	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.3148148	0.47887325	2020-07-13 20:16:17	2020-07-13 20:16:17	2020-07-13 20:16:17	2020-07-13 20:16:17	0.43338567	2139	\N		683	\N	None	1	0.3018868	0.46376812	0.4235602	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-13 20:47:26	2020-07-13 20:47:26	2020-07-13 20:47:26	2020-07-13 20:47:26	0.9867164	2140	\N		684	\N	None	0.9811321	0.9811321	0.9811321	0.7589005	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-13 20:50:02	2020-07-13 20:50:02	2020-07-13 20:50:02	2020-07-13 20:50:02	0.98442614	2141	\N		684	\N	None	1	0.9433962	0.9708738	0.78481674	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-13 20:52:16	2020-07-13 20:52:16	2020-07-13 20:52:16	2020-07-13 20:52:16	0.9560921	2142	\N		684	\N	None	0.96	0.9230769	0.9411765	0.76937175	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.3888889	0.56	2020-07-13 21:04:34	2020-07-13 21:04:34	2020-07-13 21:04:34	2020-07-13 21:04:34	0.48985735	2143	\N		684	\N	None	1	0.35185185	0.5205479	0.486911	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-13 21:49:56	2020-07-13 21:49:56	2020-07-13 21:49:56	2020-07-13 21:49:56	0.98913753	2144	\N		685	\N	None	0.9807692	0.9807692	0.9807692	0.80078536	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-13 21:52:28	2020-07-13 21:52:28	2020-07-13 21:52:28	2020-07-13 21:52:28	0.9863892	2145	\N		685	\N	None	0.98039216	0.9433962	0.96153843	0.8136126	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-13 21:57:48	2020-07-13 21:57:48	2020-07-13 21:57:48	2020-07-13 21:57:48	0.97768617	2146	\N		685	\N	None	1	1	1	0.7963351	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.18518518	0.3125	2020-07-13 22:11:41	2020-07-13 22:11:41	2020-07-13 22:11:41	2020-07-13 22:11:41	0.20272216	2147	\N		685	\N	None	1	0.1923077	0.32258064	0.19188482	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-13 22:50:44	2020-07-13 22:50:44	2020-07-13 22:50:44	2020-07-13 22:50:44	0.99018455	2148	\N		686	\N	None	1	0.9433962	0.9708738	0.80130893	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-13 22:53:36	2020-07-13 22:53:36	2020-07-13 22:53:36	2020-07-13 22:53:36	0.985604	2149	\N		686	\N	None	1	0.9811321	0.9904762	0.8057592	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-13 22:59:15	2020-07-13 22:59:15	2020-07-13 22:59:15	2020-07-13 22:59:15	0.9740872	2150	\N		686	\N	None	1	0.9056604	0.95049506	0.79581153	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.18518518	0.3125	2020-07-13 23:13:47	2020-07-13 23:13:47	2020-07-13 23:13:47	2020-07-13 23:13:47	0.21522053	2151	\N		686	\N	None	1	0.18518518	0.3125	0.21544503	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-13 23:54:07	2020-07-13 23:54:07	2020-07-13 23:54:07	2020-07-13 23:54:07	0.989203	2152	\N		687	\N	None	1	0.9814815	0.99065423	0.79371727	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-13 23:57:06	2020-07-13 23:57:06	2020-07-13 23:57:06	2020-07-13 23:57:06	0.9802382	2153	\N		687	\N	None	1	0.9622642	0.9807692	0.8060209	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 00:01:44	2020-07-14 00:01:44	2020-07-14 00:01:44	2020-07-14 00:01:44	0.95792437	2154	\N		687	\N	None	1	0.9056604	0.95049506	0.7814136	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.18518518	0.3125	2020-07-14 00:14:12	2020-07-14 00:14:12	2020-07-14 00:14:12	2020-07-14 00:14:12	0.21783797	2155	\N		687	\N	None	1	0.18867925	0.31746033	0.21701571	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 00:54:54	2020-07-14 00:54:54	2020-07-14 00:54:54	2020-07-14 00:54:54	0.9887449	2156	\N		688	\N	None	1	0.9444444	0.9714286	0.77905756	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 00:58:39	2020-07-14 00:58:39	2020-07-14 00:58:39	2020-07-14 00:58:39	0.98894125	2157	\N		688	\N	None	1	0.96153843	0.98039216	0.80340314	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 01:04:44	2020-07-14 01:04:44	2020-07-14 01:04:44	2020-07-14 01:04:44	0.96315926	2158	\N		688	\N	None	1	0.9433962	0.9708738	0.7921466	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.2777778	0.4347826	2020-07-14 01:19:16	2020-07-14 01:19:16	2020-07-14 01:19:16	2020-07-14 01:19:16	0.34831828	2159	\N		688	\N	None	1	0.24528302	0.3939394	0.32801047	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 01:58:50	2020-07-14 01:58:50	2020-07-14 01:58:50	2020-07-14 01:58:50	0.98252845	2160	\N		689	\N	None	0.9807692	0.9622642	0.9714286	0.77853405	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 02:02:58	2020-07-14 02:02:58	2020-07-14 02:02:58	2020-07-14 02:02:58	0.98828685	2161	\N		689	\N	None	1	0.9433962	0.9708738	0.80183244	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 02:06:59	2020-07-14 02:06:59	2020-07-14 02:06:59	2020-07-14 02:06:59	0.9658422	2162	\N		689	\N	None	0.9814815	1	0.99065423	0.77905756	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.2777778	0.4347826	2020-07-14 02:19:06	2020-07-14 02:19:06	2020-07-14 02:19:06	2020-07-14 02:19:06	0.3804476	2163	\N		689	\N	None	1	0.25490198	0.40625	0.37460732	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 02:50:42	2020-07-14 02:50:42	2020-07-14 02:50:42	2020-07-14 02:50:42	0.9879597	2164	\N		690	\N	None	1	0.9814815	0.99065423	0.77670157	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 02:53:25	2020-07-14 02:53:25	2020-07-14 02:53:25	2020-07-14 02:53:25	0.9863892	2165	\N		690	\N	None	1	0.962963	0.9811321	0.79528797	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 02:57:06	2020-07-14 02:57:06	2020-07-14 02:57:06	2020-07-14 02:57:06	0.96427166	2166	\N		690	\N	None	1	1	1	0.77670157	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.2962963	0.45714286	2020-07-14 03:07:08	2020-07-14 03:07:08	2020-07-14 03:07:08	2020-07-14 03:07:08	0.39327314	2167	\N		690	\N	None	1	0.28301886	0.44117647	0.38350785	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 03:38:42	2020-07-14 03:38:42	2020-07-14 03:38:42	2020-07-14 03:38:42	0.9883523	2168	\N		691	\N	None	1	0.9622642	0.9807692	0.8062827	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 03:41:17	2020-07-14 03:41:17	2020-07-14 03:41:17	2020-07-14 03:41:17	0.98704356	2169	\N		691	\N	None	1	1	1	0.8151832	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 03:47:15	2020-07-14 03:47:15	2020-07-14 03:47:15	2020-07-14 03:47:15	0.9765083	2170	\N		691	\N	None	1	0.9811321	0.9904762	0.79764396	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.18518518	0.3125	2020-07-14 04:00:46	2020-07-14 04:00:46	2020-07-14 04:00:46	2020-07-14 04:00:46	0.18178248	2171	\N		691	\N	None	1	0.18867925	0.31746033	0.17329843	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 04:33:12	2020-07-14 04:33:12	2020-07-14 04:33:12	2020-07-14 04:33:12	0.98966104	2172	\N		692	\N	None	0.98	0.9423077	0.9607843	0.78219897	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 04:36:03	2020-07-14 04:36:03	2020-07-14 04:36:03	2020-07-14 04:36:03	0.98867947	2173	\N		692	\N	None	1	0.9433962	0.9708738	0.8062827	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 04:42:35	2020-07-14 04:42:35	2020-07-14 04:42:35	2020-07-14 04:42:35	0.97042274	2174	\N		692	\N	None	0.98	0.9245283	0.9514563	0.78219897	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.24074075	0.3880597	2020-07-14 04:55:09	2020-07-14 04:55:09	2020-07-14 04:55:09	2020-07-14 04:55:09	0.3203115	2175	\N		692	\N	None	1	0.24528302	0.3939394	0.3183246	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 05:23:43	2020-07-14 05:23:43	2020-07-14 05:23:43	2020-07-14 05:23:43	0.9853422	2176	\N		693	\N	None	0.9811321	1	0.9904762	0.75602096	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 05:25:51	2020-07-14 05:25:51	2020-07-14 05:25:51	2020-07-14 05:25:51	0.9804345	2177	\N		693	\N	None	1	0.9433962	0.9708738	0.78769636	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	0.9814815	0.99065423	2020-07-14 05:27:29	2020-07-14 05:27:29	2020-07-14 05:27:29	2020-07-14 05:27:29	0.9437901	2178	\N		693	\N	None	1	0.9444444	0.9714286	0.74554974	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.5555556	0.71428573	2020-07-14 05:35:19	2020-07-14 05:35:19	2020-07-14 05:35:19	2020-07-14 05:35:19	0.587554	2179	\N		693	\N	None	1	0.509434	0.675	0.5672775	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 06:04:52	2020-07-14 06:04:52	2020-07-14 06:04:52	2020-07-14 06:04:52	0.9906426	2180	\N		694	\N	None	1	0.9245283	0.9607843	0.81387436	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 06:07:34	2020-07-14 06:07:34	2020-07-14 06:07:34	2020-07-14 06:07:34	0.9890067	2181	\N		694	\N	None	1	0.9622642	0.9807692	0.815445	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	0.9814815	0.99065423	2020-07-14 06:13:58	2020-07-14 06:13:58	2020-07-14 06:13:58	2020-07-14 06:13:58	0.9791258	2182	\N		694	\N	None	1	0.9433962	0.9708738	0.81230366	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.18518518	0.3125	2020-07-14 06:27:49	2020-07-14 06:27:49	2020-07-14 06:27:49	2020-07-14 06:27:49	0.20501243	2183	\N		694	\N	None	1	0.14814815	0.2580645	0.20340315	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 06:58:15	2020-07-14 06:58:15	2020-07-14 06:58:15	2020-07-14 06:58:15	0.99129695	2184	\N		695	\N	None	1	0.9433962	0.9708738	0.8282722	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 07:01:28	2020-07-14 07:01:28	2020-07-14 07:01:28	2020-07-14 07:01:28	0.99025	2185	\N		695	\N	None	1	0.9433962	0.9708738	0.8248691	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	0.9814815	0.99065423	2020-07-14 07:13:46	2020-07-14 07:13:46	2020-07-14 07:13:46	2020-07-14 07:13:46	0.9761157	2186	\N		695	\N	None	1	0.9423077	0.97029704	0.7908377	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-14 07:28:19	2020-07-14 07:28:19	2020-07-14 07:28:19	2020-07-14 07:28:19	0.1024735	2187	\N		695	\N	None	1	0.0754717	0.14035088	0.09842932	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 07:59:37	2020-07-14 07:59:37	2020-07-14 07:59:37	2020-07-14 07:59:37	0.98828685	2188	\N		696	\N	None	1	0.9622642	0.9807692	0.8209424	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 08:03:36	2020-07-14 08:03:36	2020-07-14 08:03:36	2020-07-14 08:03:36	0.99025	2189	\N		696	\N	None	1	0.9622642	0.9807692	0.8183246	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 08:22:50	2020-07-14 08:22:50	2020-07-14 08:22:50	2020-07-14 08:22:50	0.985604	2190	\N		696	\N	None	1	0.9259259	0.96153843	0.79162306	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-14 08:36:43	2020-07-14 08:36:43	2020-07-14 08:36:43	2020-07-14 08:36:43	0.09743489	2191	\N		696	\N	None	1	0.03773585	0.07272727	0.10418848	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 09:08:42	2020-07-14 09:08:42	2020-07-14 09:08:42	2020-07-14 09:08:42	0.99077344	2192	\N		697	\N	None	0.9807692	0.9807692	0.9807692	0.79581153	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 09:18:09	2020-07-14 09:18:09	2020-07-14 09:18:09	2020-07-14 09:18:09	0.9903154	2193	\N		697	\N	None	1	0.9433962	0.9708738	0.8112565	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 09:35:36	2020-07-14 09:35:36	2020-07-14 09:35:36	2020-07-14 09:35:36	0.9801073	2194	\N		697	\N	None	1	0.9074074	0.9514563	0.7897906	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.24074075	0.3880597	2020-07-14 09:49:45	2020-07-14 09:49:45	2020-07-14 09:49:45	2020-07-14 09:49:45	0.32404137	2195	\N		697	\N	None	1	0.24528302	0.3939394	0.31020942	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 10:15:58	2020-07-14 10:15:58	2020-07-14 10:15:58	2020-07-14 10:15:58	0.9903808	2196	\N		698	\N	None	1	0.9622642	0.9807692	0.8026178	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 10:19:04	2020-07-14 10:19:04	2020-07-14 10:19:04	2020-07-14 10:19:04	0.990708	2197	\N		698	\N	None	1	0.96153843	0.98039216	0.81623036	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 10:30:15	2020-07-14 10:30:15	2020-07-14 10:30:15	2020-07-14 10:30:15	0.97428346	2198	\N		698	\N	None	1	0.9811321	0.9904762	0.7782723	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.20754717	0.34375	2020-07-14 10:42:45	2020-07-14 10:42:45	2020-07-14 10:42:45	2020-07-14 10:42:45	0.21580945	2199	\N		698	\N	None	1	0.18518518	0.3125	0.20890053	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 11:15:35	2020-07-14 11:15:35	2020-07-14 11:15:35	2020-07-14 11:15:35	0.9862583	2200	\N		699	\N	None	1	0.9444444	0.9714286	0.80732983	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 11:18:56	2020-07-14 11:18:56	2020-07-14 11:18:56	2020-07-14 11:18:56	0.9903154	2201	\N		699	\N	None	1	0.9433962	0.9708738	0.80471206	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 11:32:26	2020-07-14 11:32:26	2020-07-14 11:32:26	2020-07-14 11:32:26	0.9772281	2202	\N		699	\N	None	1	0.9814815	0.99065423	0.79031414	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.18518518	0.3125	2020-07-14 11:44:02	2020-07-14 11:44:02	2020-07-14 11:44:02	2020-07-14 11:44:02	0.20180605	2203	\N		699	\N	None	1	0.18867925	0.31746033	0.20732984	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 12:11:56	2020-07-14 12:11:56	2020-07-14 12:11:56	2020-07-14 12:11:56	0.99142784	2204	\N		700	\N	None	1	0.9444444	0.9714286	0.8209424	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 12:16:05	2020-07-14 12:16:05	2020-07-14 12:16:05	2020-07-14 12:16:05	0.99044627	2205	\N		700	\N	None	1	0.9433962	0.9708738	0.8298429	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 12:34:24	2020-07-14 12:34:24	2020-07-14 12:34:24	2020-07-14 12:34:24	0.9850805	2206	\N		700	\N	None	1	0.9259259	0.96153843	0.7984293	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.074074075	0.13793103	2020-07-14 12:49:15	2020-07-14 12:49:15	2020-07-14 12:49:15	2020-07-14 12:49:15	0.100444965	2207	\N		700	\N	None	1	0.03773585	0.07272727	0.09267016	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 13:24:54	2020-07-14 13:24:54	2020-07-14 13:24:54	2020-07-14 13:24:54	0.99090433	2208	\N		701	\N	None	1	0.9811321	0.9904762	0.8157068	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 13:29:05	2020-07-14 13:29:05	2020-07-14 13:29:05	2020-07-14 13:29:05	0.99090433	2209	\N		701	\N	None	1	0.9444444	0.9714286	0.82198954	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	0.9814815	0.99065423	2020-07-14 13:46:00	2020-07-14 13:46:00	2020-07-14 13:46:00	2020-07-14 13:46:00	0.9836409	2210	\N		701	\N	None	1	0.9056604	0.95049506	0.8115183	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.055555556	0.10526316	2020-07-14 14:03:06	2020-07-14 14:03:06	2020-07-14 14:03:06	2020-07-14 14:03:06	0.09723858	2211	\N		701	\N	None	1	0.03773585	0.07272727	0.10366492	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 14:49:57	2020-07-14 14:49:57	2020-07-14 14:49:57	2020-07-14 14:49:57	0.99116606	2212	\N		702	\N	None	1	0.9444444	0.9714286	0.8172775	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 14:55:16	2020-07-14 14:55:16	2020-07-14 14:55:16	2020-07-14 14:55:16	0.98966104	2213	\N		702	\N	None	1	0.96153843	0.98039216	0.82146597	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 15:17:54	2020-07-14 15:17:54	2020-07-14 15:17:54	2020-07-14 15:17:54	0.985604	2214	\N		702	\N	None	0.98039216	0.9433962	0.96153843	0.79581153	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.055555556	0.10526316	2020-07-14 15:31:59	2020-07-14 15:31:59	2020-07-14 15:31:59	2020-07-14 15:31:59	0.098154694	2215	\N		702	\N	None	1	0.03773585	0.07272727	0.09319372	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 15:57:10	2020-07-14 15:57:10	2020-07-14 15:57:10	2020-07-14 15:57:10	0.99090433	2216	\N		703	\N	None	1	0.9811321	0.9904762	0.8146597	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 16:01:17	2020-07-14 16:01:17	2020-07-14 16:01:17	2020-07-14 16:01:17	0.99057716	2217	\N		703	\N	None	1	0.9259259	0.96153843	0.8159686	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 16:15:30	2020-07-14 16:15:30	2020-07-14 16:15:30	2020-07-14 16:15:30	0.9778825	2218	\N		703	\N	None	1	0.9433962	0.9708738	0.7816754	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.18518518	0.3125	2020-07-14 16:29:05	2020-07-14 16:29:05	2020-07-14 16:29:05	2020-07-14 16:29:05	0.2051433	2219	\N		703	\N	None	1	0.18867925	0.31746033	0.20183246	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 16:57:29	2020-07-14 16:57:29	2020-07-14 16:57:29	2020-07-14 16:57:29	0.9905117	2220	\N		704	\N	None	0.98039216	0.9433962	0.96153843	0.82041883	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 17:02:45	2020-07-14 17:02:45	2020-07-14 17:02:46	2020-07-14 17:02:46	0.9908389	2221	\N		704	\N	None	1	0.9433962	0.9708738	0.815445	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 17:23:52	2020-07-14 17:23:52	2020-07-14 17:23:52	2020-07-14 17:23:52	0.9840335	2222	\N		704	\N	None	0.9811321	1	0.9904762	0.7960733	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.18518518	0.3125	2020-07-14 17:38:24	2020-07-14 17:38:24	2020-07-14 17:38:24	2020-07-14 17:38:24	0.16372202	2223	\N		704	\N	None	1	0.16981132	0.29032257	0.15497382	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 18:03:36	2020-07-14 18:03:36	2020-07-14 18:03:36	2020-07-14 18:03:36	0.9901191	2224	\N		705	\N	None	1	0.9622642	0.9807692	0.8167539	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 18:08:46	2020-07-14 18:08:46	2020-07-14 18:08:46	2020-07-14 18:08:46	0.98992276	2225	\N		705	\N	None	0.98	0.9607843	0.97029704	0.8248691	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 18:30:36	2020-07-14 18:30:36	2020-07-14 18:30:36	2020-07-14 18:30:36	0.98390263	2226	\N		705	\N	None	1	0.9807692	0.99029124	0.79371727	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.14814815	0.2580645	2020-07-14 18:44:32	2020-07-14 18:44:32	2020-07-14 18:44:32	2020-07-14 18:44:32	0.1135977	2227	\N		705	\N	None	1	0.12962963	0.22950819	0.107329845	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 19:11:33	2020-07-14 19:11:33	2020-07-14 19:11:33	2020-07-14 19:11:33	0.99142784	2228	\N		706	\N	None	0.96	0.9411765	0.95049506	0.828534	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 19:16:27	2020-07-14 19:16:27	2020-07-14 19:16:27	2020-07-14 19:16:27	0.9901191	2229	\N		706	\N	None	1	0.9245283	0.9607843	0.82696337	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 19:40:42	2020-07-14 19:40:42	2020-07-14 19:40:42	2020-07-14 19:40:42	0.96865594	2230	\N		706	\N	None	0.98039216	0.96153843	0.9708738	0.7842932	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.055555556	0.10526316	2020-07-14 19:58:02	2020-07-14 19:58:02	2020-07-14 19:58:02	2020-07-14 19:58:02	0.098874494	2231	\N		706	\N	None	1	0.03773585	0.07272727	0.090314135	\N	15282	3820	None
Linear SVC	\N	5	15285	3821	1	1	1	2020-07-14 20:22:08	2020-07-14 20:22:08	2020-07-14 20:22:08	2020-07-14 20:22:08	0.9906426	2232	\N		707	\N	None	1	1	1	0.81230366	\N	15282	3820	None
Logistic Regression	\N	5	15285	3821	1	1	1	2020-07-14 20:27:14	2020-07-14 20:27:14	2020-07-14 20:27:14	2020-07-14 20:27:14	0.99129695	2233	\N		707	\N	None	1	0.9433962	0.9708738	0.81623036	\N	15282	3820	None
SGDC	\N	5	15285	3821	1	1	1	2020-07-14 20:52:05	2020-07-14 20:52:05	2020-07-14 20:52:05	2020-07-14 20:52:05	0.9869782	2234	\N		707	\N	None	1	0.96153843	0.98039216	0.8039267	\N	15282	3820	None
SVC	\N	5	15285	3821	1	0.094339624	0.1724138	2020-07-14 21:07:31	2020-07-14 21:07:31	2020-07-14 21:07:31	2020-07-14 21:07:31	0.11228897	2235	\N		707	\N	None	1	0.11320755	0.20338982	0.11125655	\N	15282	3820	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-14 21:22:54	2020-07-14 21:22:54	2020-07-14 21:22:54	2020-07-14 21:22:54	0.9886047	2236	\N		708	\N	None	0.9814815	1	0.99065423	0.75912976	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-14 21:24:07	2020-07-14 21:24:07	2020-07-14 21:24:07	2020-07-14 21:24:07	0.98135316	2237	\N		708	\N	None	1	0.9245283	0.9607843	0.78606576	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-14 21:25:15	2020-07-14 21:25:15	2020-07-14 21:25:15	2020-07-14 21:25:15	0.9623827	2238	\N		708	\N	None	0.96153843	0.96153843	0.96153843	0.77570575	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.42592594	0.5974026	2020-07-14 21:31:17	2020-07-14 21:31:17	2020-07-14 21:31:17	2020-07-14 21:31:17	0.52839106	2239	\N		708	\N	None	1	0.4528302	0.6233766	0.4985755	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-14 21:46:39	2020-07-14 21:46:39	2020-07-14 21:46:39	2020-07-14 21:46:39	0.99028814	2240	\N		709	\N	None	1	1	1	0.8096348	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-14 21:48:02	2020-07-14 21:48:02	2020-07-14 21:48:02	2020-07-14 21:48:02	0.98484945	2241	\N		709	\N	None	1	0.9245283	0.9607843	0.8119658	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-14 21:50:41	2020-07-14 21:50:41	2020-07-14 21:50:41	2020-07-14 21:50:41	0.9819359	2242	\N		709	\N	None	0.9807692	0.9622642	0.9714286	0.8054908	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.16666667	0.2857143	2020-07-14 21:59:33	2020-07-14 21:59:33	2020-07-14 21:59:33	2020-07-14 21:59:33	0.19125931	2243	\N		709	\N	None	1	0.16981132	0.29032257	0.19088319	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-14 22:17:39	2020-07-14 22:17:39	2020-07-14 22:17:39	2020-07-14 22:17:39	0.9892522	2244	\N		710	\N	None	1	0.9444444	0.9714286	0.8044548	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-14 22:19:05	2020-07-14 22:19:05	2020-07-14 22:19:05	2020-07-14 22:19:05	0.97915184	2245	\N		710	\N	None	1	0.9056604	0.95049506	0.7961668	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-14 22:21:49	2020-07-14 22:21:49	2020-07-14 22:21:49	2020-07-14 22:21:49	0.97436064	2246	\N		710	\N	None	1	1	1	0.7992748	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.16666667	0.2857143	2020-07-14 22:30:42	2020-07-14 22:30:42	2020-07-14 22:30:42	2020-07-14 22:30:42	0.17649725	2247	\N		710	\N	None	1	0.16666667	0.2857143	0.17715618	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-14 22:49:51	2020-07-14 22:49:51	2020-07-14 22:49:51	2020-07-14 22:49:51	0.988281	2248	\N		711	\N	None	1	1	1	0.79202276	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-14 22:51:39	2020-07-14 22:51:39	2020-07-14 22:51:39	2020-07-14 22:51:39	0.96833926	2249	\N		711	\N	None	1	0.9245283	0.9607843	0.8005698	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-14 22:54:04	2020-07-14 22:54:04	2020-07-14 22:54:04	2020-07-14 22:54:04	0.96445453	2250	\N		711	\N	None	0.9814815	1	0.99065423	0.7759648	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.2037037	0.33846155	2020-07-14 23:03:10	2020-07-14 23:03:10	2020-07-14 23:03:10	2020-07-14 23:03:10	0.247135	2251	\N		711	\N	None	1	0.18867925	0.31746033	0.24838124	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-14 23:23:00	2020-07-14 23:23:00	2020-07-14 23:23:00	2020-07-14 23:23:00	0.99035287	2252	\N		712	\N	None	1	0.962963	0.9811321	0.7927998	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-14 23:25:02	2020-07-14 23:25:02	2020-07-14 23:25:02	2020-07-14 23:25:02	0.98737454	2253	\N		712	\N	None	1	0.9074074	0.9514563	0.8062678	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-14 23:28:13	2020-07-14 23:28:13	2020-07-14 23:28:13	2020-07-14 23:28:13	0.9786986	2254	\N		712	\N	None	1	0.9811321	0.9904762	0.7814038	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.22222222	0.36363637	2020-07-14 23:38:17	2020-07-14 23:38:17	2020-07-14 23:38:17	2020-07-14 23:38:17	0.34645516	2255	\N		712	\N	None	1	0.22222222	0.36363637	0.34188035	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-14 23:57:08	2020-07-14 23:57:08	2020-07-14 23:57:08	2020-07-14 23:57:08	0.9904176	2256	\N		713	\N	None	1	0.9807692	0.99029124	0.7865838	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-14 23:58:50	2020-07-14 23:58:50	2020-07-14 23:58:50	2020-07-14 23:58:50	0.9854322	2257	\N		713	\N	None	1	0.9444444	0.9714286	0.7982388	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 00:01:39	2020-07-15 00:01:39	2020-07-15 00:01:39	2020-07-15 00:01:39	0.97047585	2258	\N		713	\N	None	1	1	1	0.78761977	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.22222222	0.36363637	2020-07-15 00:11:41	2020-07-15 00:11:41	2020-07-15 00:11:41	2020-07-15 00:11:41	0.34885076	2259	\N		713	\N	None	1	0.2264151	0.36923078	0.35793835	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 00:31:05	2020-07-15 00:31:05	2020-07-15 00:31:05	2020-07-15 00:31:05	0.98892844	2260	\N		714	\N	None	1	0.9811321	0.9904762	0.78347576	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 00:32:51	2020-07-15 00:32:51	2020-07-15 00:32:51	2020-07-15 00:32:51	0.98271286	2261	\N		714	\N	None	1	0.9433962	0.9708738	0.7922818	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 00:34:56	2020-07-15 00:34:56	2020-07-15 00:34:56	2020-07-15 00:34:56	0.95869213	2262	\N		714	\N	None	0.9811321	1	0.9904762	0.75524473	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.3148148	0.47887325	2020-07-15 00:43:26	2020-07-15 00:43:26	2020-07-15 00:43:26	2020-07-15 00:43:26	0.41217223	2263	\N		714	\N	None	1	0.26415095	0.41791046	0.4001554	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 01:01:41	2020-07-15 01:01:41	2020-07-15 01:01:41	2020-07-15 01:01:41	0.9907413	2264	\N		715	\N	None	1	0.9433962	0.9708738	0.8111888	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 01:03:06	2020-07-15 01:03:06	2020-07-15 01:03:06	2020-07-15 01:03:06	0.98620915	2265	\N		715	\N	None	1	0.9259259	0.96153843	0.81092983	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 01:06:54	2020-07-15 01:06:54	2020-07-15 01:06:54	2020-07-15 01:06:54	0.9831661	2266	\N		715	\N	None	0.9807692	0.9622642	0.9714286	0.8000518	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.14814815	0.2580645	2020-07-15 01:15:30	2020-07-15 01:15:30	2020-07-15 01:15:30	2020-07-15 01:15:30	0.11324053	2267	\N		715	\N	None	1	0.13207547	0.23333333	0.116809115	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 01:30:27	2020-07-15 01:30:27	2020-07-15 01:30:27	2020-07-15 01:30:27	0.9897702	2268	\N		716	\N	None	0.9807692	0.9622642	0.9714286	0.8080808	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 01:31:48	2020-07-15 01:31:48	2020-07-15 01:31:48	2020-07-15 01:31:48	0.9846552	2269	\N		716	\N	None	1	1	1	0.8233618	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 01:34:49	2020-07-15 01:34:49	2020-07-15 01:34:49	2020-07-15 01:34:49	0.97934604	2270	\N		716	\N	None	0.962963	1	0.9811321	0.8026418	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.16666667	0.2857143	2020-07-15 01:43:11	2020-07-15 01:43:11	2020-07-15 01:43:11	2020-07-15 01:43:11	0.12463581	2271	\N		716	\N	None	1	0.16666667	0.2857143	0.12613313	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 01:58:11	2020-07-15 01:58:11	2020-07-15 01:58:11	2020-07-15 01:58:11	0.98931694	2272	\N		717	\N	None	0.9807692	0.9622642	0.9714286	0.8013468	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 01:59:25	2020-07-15 01:59:25	2020-07-15 01:59:25	2020-07-15 01:59:25	0.97934604	2273	\N		717	\N	None	1	0.9074074	0.9514563	0.8010878	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 02:02:12	2020-07-15 02:02:12	2020-07-15 02:02:12	2020-07-15 02:02:12	0.9738427	2274	\N		717	\N	None	0.9814815	1	0.99065423	0.77984977	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.16666667	0.2857143	2020-07-15 02:09:21	2020-07-15 02:09:21	2020-07-15 02:09:21	2020-07-15 02:09:21	0.121592745	2275	\N		717	\N	None	1	0.1509434	0.26229507	0.12483812	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 02:24:49	2020-07-15 02:24:49	2020-07-15 02:24:49	2020-07-15 02:24:49	0.9907413	2276	\N		718	\N	None	1	0.9423077	0.97029704	0.7912458	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 02:26:28	2020-07-15 02:26:28	2020-07-15 02:26:28	2020-07-15 02:26:28	0.98795724	2277	\N		718	\N	None	1	0.9433962	0.9708738	0.8243978	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 02:30:19	2020-07-15 02:30:19	2020-07-15 02:30:19	2020-07-15 02:30:19	0.98167694	2278	\N		718	\N	None	1	1	1	0.7959078	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.22222222	0.36363637	2020-07-15 02:38:59	2020-07-15 02:38:59	2020-07-15 02:38:59	2020-07-15 02:38:59	0.2887666	2279	\N		718	\N	None	1	0.2264151	0.36923078	0.2846413	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 02:53:56	2020-07-15 02:53:56	2020-07-15 02:53:56	2020-07-15 02:53:56	0.9900939	2280	\N		719	\N	None	1	0.9811321	0.9904762	0.7974618	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 02:55:39	2020-07-15 02:55:39	2020-07-15 02:55:39	2020-07-15 02:55:39	0.9872451	2281	\N		719	\N	None	1	0.9433962	0.9708738	0.8104118	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 02:58:45	2020-07-15 02:58:45	2020-07-15 02:58:45	2020-07-15 02:58:45	0.9796051	2282	\N		719	\N	None	1	1	1	0.79461277	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.22222222	0.36363637	2020-07-15 03:07:24	2020-07-15 03:07:24	2020-07-15 03:07:24	2020-07-15 03:07:24	0.31356427	2283	\N		719	\N	None	1	0.2264151	0.36923078	0.3092463	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 03:22:20	2020-07-15 03:22:20	2020-07-15 03:22:20	2020-07-15 03:22:20	0.98989964	2284	\N		720	\N	None	1	0.9811321	0.9904762	0.7904688	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 03:23:44	2020-07-15 03:23:44	2020-07-15 03:23:44	2020-07-15 03:23:44	0.98582065	2285	\N		720	\N	None	1	0.9245283	0.9607843	0.8062678	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 03:26:32	2020-07-15 03:26:32	2020-07-15 03:26:32	2020-07-15 03:26:32	0.96672064	2286	\N		720	\N	None	0.9811321	0.9811321	0.9811321	0.7754468	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.22222222	0.36363637	2020-07-15 03:33:48	2020-07-15 03:33:48	2020-07-15 03:33:48	2020-07-15 03:33:48	0.32431206	2287	\N		720	\N	None	1	0.23076923	0.375	0.33022532	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 03:48:48	2020-07-15 03:48:48	2020-07-15 03:48:48	2020-07-15 03:48:48	0.9900939	2288	\N		721	\N	None	1	0.9444444	0.9714286	0.8174048	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 03:50:17	2020-07-15 03:50:17	2020-07-15 03:50:17	2020-07-15 03:50:17	0.9865976	2289	\N		721	\N	None	1	0.9259259	0.96153843	0.82128984	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 03:54:46	2020-07-15 03:54:46	2020-07-15 03:54:46	2020-07-15 03:54:46	0.97947556	2290	\N		721	\N	None	0.9622642	0.9807692	0.9714286	0.7938358	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.11111111	0.2	2020-07-15 04:03:47	2020-07-15 04:03:47	2020-07-15 04:03:47	2020-07-15 04:03:47	0.10547103	2291	\N		721	\N	None	1	0.09615385	0.1754386	0.10878011	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 04:18:57	2020-07-15 04:18:57	2020-07-15 04:18:57	2020-07-15 04:18:57	0.99119455	2292	\N		722	\N	None	1	0.9433962	0.9708738	0.7977208	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 04:20:38	2020-07-15 04:20:38	2020-07-15 04:20:38	2020-07-15 04:20:38	0.9886047	2293	\N		722	\N	None	1	0.9811321	0.9904762	0.8067858	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 04:25:18	2020-07-15 04:25:18	2020-07-15 04:25:18	2020-07-15 04:25:18	0.98271286	2294	\N		722	\N	None	1	0.9622642	0.9807692	0.7896918	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.22222222	0.36363637	2020-07-15 04:34:07	2020-07-15 04:34:07	2020-07-15 04:34:07	2020-07-15 04:34:07	0.26209128	2295	\N		722	\N	None	1	0.2264151	0.36923078	0.25666925	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 04:46:38	2020-07-15 04:46:38	2020-07-15 04:46:38	2020-07-15 04:46:38	0.9882163	2296	\N		723	\N	None	1	0.9622642	0.9807692	0.7511008	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 04:47:52	2020-07-15 04:47:52	2020-07-15 04:47:52	2020-07-15 04:47:52	0.98167694	2297	\N		723	\N	None	1	0.9433962	0.9708738	0.78606576	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 04:48:56	2020-07-15 04:48:56	2020-07-15 04:48:56	2020-07-15 04:48:56	0.95713824	2298	\N		723	\N	None	1	0.9811321	0.9904762	0.77130276	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.46296296	0.6329114	2020-07-15 04:54:37	2020-07-15 04:54:37	2020-07-15 04:54:37	2020-07-15 04:54:37	0.5231466	2299	\N		723	\N	None	1	0.3888889	0.56	0.5091945	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 05:07:28	2020-07-15 05:07:28	2020-07-15 05:07:28	2020-07-15 05:07:28	0.99125934	2300	\N		724	\N	None	1	0.9245283	0.9607843	0.8241388	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 05:08:59	2020-07-15 05:08:59	2020-07-15 05:08:59	2020-07-15 05:08:59	0.9895759	2301	\N		724	\N	None	1	0.9259259	0.96153843	0.82310283	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 05:13:30	2020-07-15 05:13:30	2020-07-15 05:13:30	2020-07-15 05:13:30	0.98452574	2302	\N		724	\N	None	1	0.9814815	0.99065423	0.80833983	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.09259259	0.16949153	2020-07-15 05:23:05	2020-07-15 05:23:05	2020-07-15 05:23:05	2020-07-15 05:23:05	0.10702493	2303	\N		724	\N	None	1	0.094339624	0.1724138	0.0984201	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 05:35:58	2020-07-15 05:35:58	2020-07-15 05:35:58	2020-07-15 05:35:58	0.9916478	2304	\N		725	\N	None	0.9807692	0.9807692	0.9807692	0.8233618	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 05:37:38	2020-07-15 05:37:38	2020-07-15 05:37:38	2020-07-15 05:37:38	0.9897054	2305	\N		725	\N	None	1	0.9433962	0.9708738	0.82310283	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 05:46:23	2020-07-15 05:46:23	2020-07-15 05:46:23	2020-07-15 05:46:23	0.9859502	2306	\N		725	\N	None	0.962963	1	0.9811321	0.8192178	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-15 05:56:09	2020-07-15 05:56:09	2020-07-15 05:56:09	2020-07-15 05:56:09	0.099579155	2307	\N		725	\N	None	1	0.03773585	0.07272727	0.09686609	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 06:09:21	2020-07-15 06:09:21	2020-07-15 06:09:21	2020-07-15 06:09:21	0.99119455	2308	\N		726	\N	None	1	0.962963	0.9811321	0.8249158	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 06:11:11	2020-07-15 06:11:11	2020-07-15 06:11:11	2020-07-15 06:11:11	0.99002916	2309	\N		726	\N	None	1	0.9444444	0.9714286	0.82983685	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 06:23:25	2020-07-15 06:23:25	2020-07-15 06:23:25	2020-07-15 06:23:25	0.9875688	2310	\N		726	\N	None	0.9807692	1	0.99029124	0.8098938	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.018518519	0.036363635	2020-07-15 06:33:11	2020-07-15 06:33:11	2020-07-15 06:33:11	2020-07-15 06:33:11	0.09841373	2311	\N		726	\N	None	1	0.018867925	0.037037037	0.0984201	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 06:46:01	2020-07-15 06:46:01	2020-07-15 06:46:01	2020-07-15 06:46:01	0.9904176	2312	\N		727	\N	None	1	0.9622642	0.9807692	0.8073038	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 06:47:53	2020-07-15 06:47:53	2020-07-15 06:47:53	2020-07-15 06:47:53	0.9895112	2313	\N		727	\N	None	1	0.9245283	0.9607843	0.8207718	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 06:52:34	2020-07-15 06:52:34	2020-07-15 06:52:34	2020-07-15 06:52:34	0.98128843	2314	\N		727	\N	None	0.962963	1	0.9811321	0.7961668	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.22222222	0.36363637	2020-07-15 07:02:02	2020-07-15 07:02:02	2020-07-15 07:02:02	2020-07-15 07:02:02	0.26966655	2315	\N		727	\N	None	1	0.2264151	0.36923078	0.26521626	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 07:15:02	2020-07-15 07:15:02	2020-07-15 07:15:02	2020-07-15 07:15:02	0.99158305	2316	\N		728	\N	None	0.96153843	0.98039216	0.9708738	0.8158508	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 07:17:01	2020-07-15 07:17:01	2020-07-15 07:17:01	2020-07-15 07:17:01	0.99132407	2317	\N		728	\N	None	1	0.9622642	0.9807692	0.8275058	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 07:24:49	2020-07-15 07:24:49	2020-07-15 07:24:49	2020-07-15 07:24:49	0.9845905	2318	\N		728	\N	None	1	0.9444444	0.9714286	0.8093758	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.16666667	0.2857143	2020-07-15 07:34:24	2020-07-15 07:34:24	2020-07-15 07:34:24	2020-07-15 07:34:24	0.13227582	2319	\N		728	\N	None	1	0.1509434	0.26229507	0.12561512	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 07:47:24	2020-07-15 07:47:24	2020-07-15 07:47:24	2020-07-15 07:47:24	0.99119455	2320	\N		729	\N	None	1	0.9433962	0.9708738	0.8233618	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 07:49:40	2020-07-15 07:49:40	2020-07-15 07:49:40	2020-07-15 07:49:40	0.9901586	2321	\N		729	\N	None	1	0.9245283	0.9607843	0.8163688	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 08:02:38	2020-07-15 08:02:38	2020-07-15 08:02:38	2020-07-15 08:02:38	0.98607963	2322	\N		729	\N	None	0.9807692	0.9807692	0.9807692	0.8060088	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.09259259	0.16949153	2020-07-15 08:12:22	2020-07-15 08:12:22	2020-07-15 08:12:22	2020-07-15 08:12:22	0.10793137	2323	\N		729	\N	None	1	0.115384616	0.20689656	0.1002331	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 08:25:50	2020-07-15 08:25:50	2020-07-15 08:25:50	2020-07-15 08:25:50	0.9907413	2324	\N		730	\N	None	1	0.9423077	0.97029704	0.82543385	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 08:28:01	2020-07-15 08:28:01	2020-07-15 08:28:01	2020-07-15 08:28:01	0.99022335	2325	\N		730	\N	None	1	0.9074074	0.9514563	0.82646984	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 08:40:46	2020-07-15 08:40:46	2020-07-15 08:40:46	2020-07-15 08:40:46	0.9854322	2326	\N		730	\N	None	1	0.962963	0.9811321	0.81170684	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-15 08:52:42	2020-07-15 08:52:42	2020-07-15 08:52:42	2020-07-15 08:52:42	0.100032374	2327	\N		730	\N	None	1	0.037037037	0.071428575	0.09505309	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 09:06:30	2020-07-15 09:06:30	2020-07-15 09:06:30	2020-07-15 09:06:30	0.99048233	2328	\N		731	\N	None	1	0.9444444	0.9714286	0.83501685	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 09:08:49	2020-07-15 09:08:49	2020-07-15 09:08:49	2020-07-15 09:08:49	0.9904176	2329	\N		731	\N	None	1	0.9230769	0.96	0.82465684	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 09:24:41	2020-07-15 09:24:41	2020-07-15 09:24:42	2020-07-15 09:24:42	0.9868566	2330	\N		731	\N	None	0.96153843	0.96153843	0.96153843	0.8080808	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-15 09:36:26	2020-07-15 09:36:26	2020-07-15 09:36:26	2020-07-15 09:36:26	0.09899644	2331	\N		731	\N	None	1	0.018867925	0.037037037	0.0963481	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 09:50:29	2020-07-15 09:50:29	2020-07-15 09:50:29	2020-07-15 09:50:29	0.99028814	2332	\N		732	\N	None	1	0.9245283	0.9607843	0.8422688	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 09:53:06	2020-07-15 09:53:06	2020-07-15 09:53:06	2020-07-15 09:53:06	0.99022335	2333	\N		732	\N	None	1	0.9056604	0.95049506	0.8251748	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 10:20:08	2020-07-15 10:20:08	2020-07-15 10:20:08	2020-07-15 10:20:08	0.988022	2334	\N		732	\N	None	0.9814815	1	0.99065423	0.8189588	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.018518519	0.036363635	2020-07-15 10:34:20	2020-07-15 10:34:20	2020-07-15 10:34:20	2020-07-15 10:34:20	0.09970865	2335	\N		732	\N	None	1	0.018867925	0.037037037	0.09324009	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 10:51:00	2020-07-15 10:51:00	2020-07-15 10:51:00	2020-07-15 10:51:00	0.9906766	2336	\N		733	\N	None	1	0.9622642	0.9807692	0.8174048	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 10:54:24	2020-07-15 10:54:24	2020-07-15 10:54:24	2020-07-15 10:54:24	0.99061185	2337	\N		733	\N	None	0.9791667	0.92156863	0.94949496	0.8207718	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 11:10:20	2020-07-15 11:10:20	2020-07-15 11:10:20	2020-07-15 11:10:20	0.98582065	2338	\N		733	\N	None	1	0.9433962	0.9708738	0.8078218	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.11111111	0.2	2020-07-15 11:23:54	2020-07-15 11:23:54	2020-07-15 11:23:54	2020-07-15 11:23:54	0.10806086	2339	\N		733	\N	None	1	0.11320755	0.20338982	0.1028231	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 11:38:51	2020-07-15 11:38:51	2020-07-15 11:38:51	2020-07-15 11:38:51	0.9907413	2340	\N		734	\N	None	1	0.9811321	0.9904762	0.8114478	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 11:43:32	2020-07-15 11:43:32	2020-07-15 11:43:32	2020-07-15 11:43:32	0.9907413	2341	\N		734	\N	None	1	0.9622642	0.9807692	0.82724684	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 12:04:05	2020-07-15 12:04:05	2020-07-15 12:04:05	2020-07-15 12:04:05	0.9868566	2342	\N		734	\N	None	1	0.9811321	0.9904762	0.8065268	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.074074075	0.13793103	2020-07-15 12:17:23	2020-07-15 12:17:23	2020-07-15 12:17:23	2020-07-15 12:17:23	0.10236322	2343	\N		734	\N	None	1	0.056603774	0.10714286	0.10670811	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 12:32:44	2020-07-15 12:32:44	2020-07-15 12:32:44	2020-07-15 12:32:44	0.9910651	2344	\N		735	\N	None	1	0.9259259	0.96153843	0.82310283	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 12:35:40	2020-07-15 12:35:40	2020-07-15 12:35:40	2020-07-15 12:35:40	0.99158305	2345	\N		735	\N	None	1	0.9230769	0.96	0.81610984	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 12:57:03	2020-07-15 12:57:03	2020-07-15 12:57:03	2020-07-15 12:57:03	0.98866946	2346	\N		735	\N	None	1	0.9807692	0.99029124	0.7995338	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.055555556	0.10526316	2020-07-15 13:09:55	2020-07-15 13:09:55	2020-07-15 13:09:55	2020-07-15 13:09:55	0.103593394	2347	\N		735	\N	None	1	0.03773585	0.07272727	0.09246309	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 13:24:31	2020-07-15 13:24:31	2020-07-15 13:24:31	2020-07-15 13:24:31	0.9910003	2348	\N		736	\N	None	1	0.96153843	0.98039216	0.8275058	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 13:27:51	2020-07-15 13:27:51	2020-07-15 13:27:51	2020-07-15 13:27:51	0.99048233	2349	\N		736	\N	None	1	0.9056604	0.95049506	0.82724684	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 13:49:40	2020-07-15 13:49:40	2020-07-15 13:49:40	2020-07-15 13:49:40	0.98582065	2350	\N		736	\N	None	0.9811321	1	0.9904762	0.8093758	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.018518519	0.036363635	2020-07-15 14:04:03	2020-07-15 14:04:03	2020-07-15 14:04:03	2020-07-15 14:04:03	0.099320166	2351	\N		736	\N	None	1	0.018867925	0.037037037	0.094794095	\N	15445	3861	None
Linear SVC	\N	5	15448	3862	1	1	1	2020-07-15 14:18:09	2020-07-15 14:18:09	2020-07-15 14:18:09	2020-07-15 14:18:09	0.9915183	2352	\N		737	\N	None	0.9811321	0.9811321	0.9811321	0.83346283	\N	15445	3861	None
Logistic Regression	\N	5	15448	3862	1	1	1	2020-07-15 14:21:49	2020-07-15 14:21:49	2020-07-15 14:21:49	2020-07-15 14:21:49	0.99132407	2353	\N		737	\N	None	1	0.9056604	0.95049506	0.8166278	\N	15445	3861	None
SGDC	\N	5	15448	3862	1	1	1	2020-07-15 14:43:45	2020-07-15 14:43:45	2020-07-15 14:43:45	2020-07-15 14:43:45	0.97254777	2354	\N		737	\N	None	0.96153843	0.96153843	0.96153843	0.7909868	\N	15445	3861	None
SVC	\N	5	15448	3862	1	0.037037037	0.071428575	2020-07-15 14:58:06	2020-07-15 14:58:06	2020-07-15 14:58:06	2020-07-15 14:58:06	0.10100356	2355	\N		737	\N	None	1	0.03773585	0.07272727	0.1012691	\N	15445	3861	None
\.


--
-- TOC entry 2877 (class 0 OID 16385)
-- Dependencies: 202
-- Data for Name: preprocessing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.preprocessing (preprocessing_start, sample_file_path, preprocessing_end, id, stop_word_removed, stemming, embedding_method, strigent_topic, exclude_contracts, input_format, ngram, sample_count, multiple_paragraphs, ngram_mixed, pos, ngram_literated, semantic_analysis, ngram_list) FROM stdin;
2020-03-12 23:02:51	20200312230255.txt	2020-03-12 23:02:55	177	True	True	count_occurence	True		rtf	3	\N	\N	\N	\N	\N	\N	\N
2020-03-12 23:07:08	20200312230806.txt	2020-03-12 23:08:06	181	True	True	count_occurence	True		rtf	3	\N	\N	\N	\N	\N	\N	\N
2020-03-12 22:52:06	20200312225239.txt	2020-03-12 22:52:40	173	True	True	count_occurence	True		rtf	\N	\N	\N	\N	\N	\N	\N	\N
2020-03-16 16:54:24	20200316171827.txt	2020-03-16 17:18:27	185	True	False	count_occurence	True		rtf	1	0	False	\N	\N	\N	\N	\N
2020-03-17 13:38:27	20200317133859.txt	2020-03-17 13:38:59	189	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-17 13:40:59	20200317134116.txt	2020-03-17 13:41:16	192	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-17 13:42:15	20200317134216.txt	2020-03-17 13:42:16	195	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-17 13:43:21	20200317134617.txt	2020-03-17 13:46:17	198	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-17 13:48:04	20200317134844.txt	2020-03-17 13:48:44	201	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-17 13:49:57	20200317135229.txt	2020-03-17 13:52:29	204	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-17 13:53:38	20200317135339.txt	2020-03-17 13:53:39	207	True	False	count_occurence	True		rtf	1	1	True	\N	\N	\N	\N	\N
2020-03-17 13:54:52	20200317135551.txt	2020-03-17 13:55:51	210	True	False	count_occurence	True		rtf	1	1	True	\N	\N	\N	\N	\N
2020-03-17 14:58:02	20200317150747.txt	2020-03-17 15:07:50	213	True	False	count_occurence	True		rtf	1	1815	True	\N	\N	\N	\N	\N
2020-03-18 14:56:34	20200318150349.txt	2020-03-18 15:03:53	216	True	False	count_occurence	True		rtf	4	1815	True	True	\N	\N	\N	\N
2020-03-18 16:06:24	20200318161330.txt	2020-03-18 16:13:33	219	False	False	count_occurence	True		rtf	1	1815	True	True	\N	\N	\N	\N
2020-03-18 16:58:52	20200318170742.txt	2020-03-18 17:07:48	222	False	False	count_occurence	True		rtf	4	1815	True	True	\N	\N	\N	\N
2020-03-24 13:00:31	20200324130703.txt	2020-03-24 13:07:05	228	False	False	count_occurence	True		rtf	3	1817	True	False	\N	\N	\N	\N
2020-03-24 13:39:32	20200324134556.txt	2020-03-24 13:45:59	231	False	False	count_occurence	True		rtf	6	1809	True	False	\N	\N	\N	\N
2020-05-26 12:11:26	20200526121233.txt	2020-05-26 12:12:36	239	True	False	count_occurence	True		rtf	4	0	True	True	\N	\N	\N	\N
2019-12-03 12:54:55	\N	2019-12-03 12:54:55	3	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 22:54:24	20200312225424.txt	2020-03-12 22:54:24	174	True	True	count_occurence	True		rtf	3	\N	\N	\N	\N	\N	\N	\N
2020-03-12 23:03:06	20200312230555.txt	2020-03-12 23:05:55	178	True	True	count_occurence	True		rtf	3	\N	\N	\N	\N	\N	\N	\N
2020-03-12 23:08:11	20200312230816.txt	2020-03-12 23:08:16	182	True	True	count_occurence	True		rtf	3	\N	\N	\N	\N	\N	\N	\N
2020-03-17 13:32:27	20200317133229.txt	2020-03-17 13:32:29	186	True	False	count_occurence	True		rtf	1	101	False	\N	\N	\N	\N	\N
2020-03-17 13:39:23	20200317134042.txt	2020-03-17 13:40:42	190	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-17 13:41:20	20200317134122.txt	2020-03-17 13:41:22	193	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-17 13:42:36	20200317134304.txt	2020-03-17 13:43:04	196	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-17 13:46:20	20200317134623.txt	2020-03-17 13:46:23	199	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-17 13:48:47	20200317134849.txt	2020-03-17 13:48:49	202	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-17 13:52:33	20200317135236.txt	2020-03-17 13:52:36	205	True	False	count_occurence	True		rtf	1	1	True	\N	\N	\N	\N	\N
2020-03-17 13:53:59	20200317135427.txt	2020-03-17 13:54:27	208	True	False	count_occurence	True		rtf	1	1	True	\N	\N	\N	\N	\N
2020-03-17 13:55:55	20200317135556.txt	2020-03-17 13:55:56	211	True	False	count_occurence	True		rtf	1	12	True	\N	\N	\N	\N	\N
2020-03-18 14:10:46	20200318141919.txt	2020-03-18 14:19:22	214	True	False	count_occurence	True		rtf	2	1815	True	True	\N	\N	\N	\N
2020-03-18 15:10:25	20200318151808.txt	2020-03-18 15:18:13	217	True	False	count_occurence	True		rtf	5	1815	True	True	\N	\N	\N	\N
2020-03-18 16:19:00	20200318162659.txt	2020-03-18 16:27:02	220	False	False	count_occurence	True		rtf	2	1815	True	True	\N	\N	\N	\N
2020-03-18 17:18:17	20200318172529.txt	2020-03-18 17:25:36	223	False	False	count_occurence	True		rtf	5	1815	True	True	\N	\N	\N	\N
2020-03-20 12:44:46	20200320125538.txt	2020-03-20 12:55:41	225	True	False	count_occurence	True		rtf	1	23435	False	True	\N	\N	\N	\N
2020-03-24 12:27:47	20200324122821.txt	2020-03-24 12:28:23	226	False	False	count_occurence	True		rtf	2	0	True	False	\N	\N	\N	\N
2020-03-24 13:12:55	20200324131855.txt	2020-03-24 13:18:57	229	False	False	count_occurence	True		rtf	4	1812	True	False	\N	\N	\N	\N
2020-03-24 14:09:54	20200324142514.txt	2020-03-24 14:25:30	232	False	False	count_occurence	True		rtf	4	23460	False	True	\N	\N	\N	\N
2020-05-26 11:20:19	20200526112118.txt	2020-05-26 11:21:21	237	True	True	count_occurence	True		rtf	1	0	True	True	\N	\N	\N	\N
2019-12-11 15:08:34	20191211150851.txt	2019-12-11 15:08:51	61	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 22:55:28	20200312225537.txt	2020-03-12 22:55:37	175	True	True	count_occurence	True		rtf	3	\N	\N	\N	\N	\N	\N	\N
2020-01-09 16:16:36	20200109161845.txt	2020-01-09 16:18:46	143	True	True	boolean_occurence	True	Cont_0357.rtf,Cont_0114.rtf,Cont_0344.rtf,Cont_0345.rtf,Cont_0062.rtf	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-05-26 09:38:16	20200526093818.txt	2020-05-26 09:38:21	234	True	True	count_occurence	True		rtf	1	1792	True	True	V	\N	\N	\N
2020-05-26 11:08:43	20200526111729.txt	2020-05-26 11:17:32	236	True	True	count_occurence	True		rtf	1	1632	True	True	J	\N	\N	\N
2020-05-26 12:15:49	20200526122553.txt	2020-05-26 12:25:59	240	True	False	count_occurence	True		rtf	4	1794	True	True	None	\N	\N	\N
2020-03-12 23:05:59	20200312230652.txt	2020-03-12 23:06:52	179	True	True	count_occurence	True		rtf	3	\N	\N	\N	\N	\N	\N	\N
2020-03-12 23:08:43	20200312232137.txt	2020-03-12 23:21:42	183	True	True	count_occurence	True		rtf	3	\N	\N	\N	\N	\N	\N	\N
2020-03-17 13:33:11	20200317133328.txt	2020-03-17 13:33:28	187	True	False	count_occurence	True		rtf	1	0	False	\N	\N	\N	\N	\N
2020-03-17 13:40:46	20200317134053.txt	2020-03-17 13:40:53	191	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-17 13:41:38	20200317134212.txt	2020-03-17 13:42:12	194	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-17 13:43:07	20200317134309.txt	2020-03-17 13:43:09	197	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-17 13:46:31	20200317134800.txt	2020-03-17 13:48:00	200	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-17 13:49:28	20200317134954.txt	2020-03-17 13:49:54	203	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-17 13:53:04	20200317135325.txt	2020-03-17 13:53:25	206	True	False	count_occurence	True		rtf	1	1	True	\N	\N	\N	\N	\N
2020-03-17 13:54:43	20200317135448.txt	2020-03-17 13:54:48	209	True	False	count_occurence	True		rtf	1	1	True	\N	\N	\N	\N	\N
2020-03-17 14:56:57	20200317145657.txt	2020-03-17 14:56:57	212	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-03-18 14:39:03	20200318144722.txt	2020-03-18 14:47:25	215	True	False	count_occurence	True		rtf	3	1815	True	True	\N	\N	\N	\N
2020-03-18 15:36:49	20200318154435.txt	2020-03-18 15:44:40	218	True	False	count_occurence	True		rtf	6	1815	True	True	\N	\N	\N	\N
2020-03-18 16:33:08	20200318164105.txt	2020-03-18 16:41:09	221	False	False	count_occurence	True		rtf	3	1815	True	True	\N	\N	\N	\N
2020-03-18 17:56:29	20200318180800.txt	2020-03-18 18:08:12	224	False	False	count_occurence	True		rtf	6	1815	True	True	\N	\N	\N	\N
2020-03-24 12:48:24	20200324125444.txt	2020-03-24 12:54:47	227	False	False	count_occurence	True		rtf	2	1805	True	False	\N	\N	\N	\N
2020-03-24 13:28:45	20200324133512.txt	2020-03-24 13:35:15	230	False	False	count_occurence	True		rtf	5	1812	True	False	\N	\N	\N	\N
2019-12-03 12:58:45	\N	2019-12-03 12:58:45	4	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-17 14:37:11	20191217144158.txt	2019-12-17 14:41:58	92	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-17 14:43:17	20191217144418.txt	2019-12-17 14:44:18	93	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-17 14:56:11	20191217145657.txt	2019-12-17 14:56:57	94	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-17 15:29:09	20191217153339.txt	2019-12-17 15:33:40	95	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-17 17:07:52	20191217170950.txt	2019-12-17 17:09:51	96	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-18 13:59:11	20191218135912.txt	2019-12-18 13:59:12	97	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-18 16:18:02	20191218161955.txt	2019-12-18 16:19:56	98	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-18 16:29:55	20191218162956.txt	2019-12-18 16:29:56	99	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-18 17:05:44	20191218170547.txt	2019-12-18 17:05:49	100	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-18 17:06:02	20191218170619.txt	2019-12-18 17:06:20	101	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-18 17:08:09	20191218170812.txt	2019-12-18 17:08:13	102	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-04 13:51:02	\N	2019-12-04 15:45:25	5	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-06 17:41:16	\N	2019-12-06 17:41:17	6	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-06 17:51:52	\N	2019-12-06 17:51:52	7	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-10 14:53:31	\N	2019-12-10 14:53:31	8	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-10 15:03:57	\N	2019-12-10 15:03:58	9	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-10 15:05:20	\N	2019-12-10 15:05:21	10	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-10 19:41:01	20191210194300.txt	2019-12-10 19:43:00	12	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 11:41:21	20191211114306.txt	2019-12-11 11:43:06	13	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 11:50:24	20191211123520.txt	2019-12-11 12:35:21	14	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 12:35:44	20191211123545.txt	2019-12-11 12:35:45	15	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 12:37:28	20191211123729.txt	2019-12-11 12:37:29	16	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 12:39:18	20191211123929.txt	2019-12-11 12:39:29	17	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 12:39:59	20191211124148.txt	2019-12-11 12:41:49	18	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 12:42:36	20191211124237.txt	2019-12-11 12:42:38	19	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 12:42:56	20191211124324.txt	2019-12-11 12:43:25	20	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 12:43:35	20191211124337.txt	2019-12-11 12:43:37	21	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 12:44:05	20191211124939.txt	2019-12-11 12:49:39	22	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 12:50:21	20191211125059.txt	2019-12-11 12:50:59	23	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-14 12:37:54	20200114124002.txt	2020-01-14 12:40:03	144	True	True	count_occurence	True	Cont_0357.rtf,Cont_0114.rtf,Cont_0344.rtf,Cont_0345.rtf,Cont_0062.rtf	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-08 18:00:58	20200108180330.txt	2020-01-08 18:03:31	139	True	True	count_occurence		\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-08 15:30:56	20200109153849.txt	2020-01-08 15:45:56	141	True	True	boolean_occurence	False	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-05-26 11:38:50	20200526114641.txt	2020-05-26 11:46:43	238	True	True	count_occurence	True		rtf	1	1113	True	True	R	\N	\N	\N
2020-03-04 13:37:45	20200304134000.txt	2020-03-04 13:40:01	145	True	True	count_occurence	True		\N	1	\N	\N	\N	\N	\N	\N	\N
2020-03-04 18:12:03	20200304181217.txt	2020-03-04 18:12:19	146	True	True	count_occurence	True		docx	1	\N	\N	\N	\N	\N	\N	\N
2019-12-18 17:10:30	20191218171033.txt	2019-12-18 17:10:35	103	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-19 20:16:13	20191219202300.txt	2019-12-19 20:23:02	104	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-03 11:46:26	\N	2019-12-03 11:46:27	1	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 12:51:15	20191211125116.txt	2019-12-11 12:51:16	24	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 12:51:49	20191211125150.txt	2019-12-11 12:51:50	25	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 12:52:51	20191211125252.txt	2019-12-11 12:52:52	26	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 12:53:22	20191211125324.txt	2019-12-11 12:53:25	27	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 12:54:54	20191211125456.txt	2019-12-11 12:54:56	28	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 12:55:34	20191211125535.txt	2019-12-11 12:55:36	29	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 12:57:34	20191211125848.txt	2019-12-11 12:58:49	30	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 13:00:23	20191211130046.txt	2019-12-11 13:00:46	31	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 13:00:49	20191211130101.txt	2019-12-11 13:01:02	32	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 13:02:42	20191211130250.txt	2019-12-11 13:02:50	33	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 13:03:07	20191211130314.txt	2019-12-11 13:03:14	34	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 13:04:33	20191211130439.txt	2019-12-11 13:04:39	35	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 13:05:21	20191211130529.txt	2019-12-11 13:05:30	36	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 13:05:51	20191211130553.txt	2019-12-11 13:05:53	37	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 13:38:59	20191211134058.txt	2019-12-11 13:40:58	38	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:08:48	20191211141658.txt	2019-12-11 14:16:58	39	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:17:00	20191211141908.txt	2019-12-11 14:19:08	40	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:19:10	20191211141911.txt	2019-12-11 14:19:12	41	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:20:16	20191211142213.txt	2019-12-11 14:22:13	42	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:25:07	20191211142628.txt	2019-12-11 14:26:28	43	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:26:30	20191211142631.txt	2019-12-11 14:26:31	44	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:27:10	20191211142711.txt	2019-12-11 14:27:12	45	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:28:03	20191211142804.txt	2019-12-11 14:28:04	46	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:28:19	20191211142854.txt	2019-12-11 14:28:54	47	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:29:00	20191211142936.txt	2019-12-11 14:29:36	48	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:29:45	20191211143052.txt	2019-12-11 14:30:52	49	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:31:10	20191211143132.txt	2019-12-11 14:31:32	50	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:31:46	20191211143155.txt	2019-12-11 14:31:55	51	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:32:12	20191211143420.txt	2019-12-11 14:34:20	52	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:34:45	20191211143654.txt	2019-12-11 14:36:54	53	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:48:09	20191211144817.txt	2019-12-11 14:48:17	54	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:48:58	20191211144859.txt	2019-12-11 14:48:59	55	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:59:07	20191211145908.txt	2019-12-11 14:59:08	56	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 14:59:53	20191211145953.txt	2019-12-11 14:59:54	57	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 15:00:39	20191211150501.txt	2019-12-11 15:05:01	58	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 15:07:52	20191211150753.txt	2019-12-11 15:07:53	59	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 15:08:05	20191211150806.txt	2019-12-11 15:08:06	60	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 15:08:57	20191211151024.txt	2019-12-11 15:10:24	62	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 15:10:26	20191211160634.txt	2019-12-11 16:06:34	63	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 16:06:38	20191211160708.txt	2019-12-11 16:07:09	64	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 16:07:15	20191211160716.txt	2019-12-11 16:07:16	65	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-11 16:07:23	20191211175316.txt	2019-12-11 17:53:16	66	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-13 11:36:48	20191213135825.txt	2019-12-13 13:58:25	67	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-13 14:01:18	20191213182539.txt	2019-12-13 18:25:40	68	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-13 19:12:19	20191213191550.txt	2019-12-13 19:15:50	69	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-13 19:26:32	20191213192721.txt	2019-12-13 19:27:21	70	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-13 19:27:29	20191213193024.txt	2019-12-13 19:30:24	71	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-13 19:30:26	20191213193027.txt	2019-12-13 19:30:27	72	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-13 19:30:56	20191213193057.txt	2019-12-13 19:30:57	73	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-13 19:31:10	20191213193111.txt	2019-12-13 19:31:11	74	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-13 19:31:26	20191213193126.txt	2019-12-13 19:31:27	75	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-13 19:37:41	20191213193843.txt	2019-12-13 19:38:43	76	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-13 19:43:06	20191213194307.txt	2019-12-13 19:43:08	77	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-13 20:04:46	20191213200447.txt	2019-12-13 20:04:48	78	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-13 21:28:45	20191214202536.txt	2019-12-14 20:25:37	79	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-16 16:03:41	20191216160501.txt	2019-12-16 16:05:01	80	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-16 16:12:26	20191216161317.txt	2019-12-16 16:13:18	81	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-16 17:41:19	20191216174120.txt	2019-12-16 17:41:20	82	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-16 17:57:20	20191216175845.txt	2019-12-16 17:58:45	83	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-16 18:43:08	20191216184808.txt	2019-12-16 18:48:08	84	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-16 19:02:46	20191216190247.txt	2019-12-16 19:02:47	85	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-16 19:30:09	20191216193025.txt	2019-12-16 19:30:25	86	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-16 20:30:30	20191216203037.txt	2019-12-16 20:30:38	87	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-16 20:32:58	20191216203304.txt	2019-12-16 20:33:05	88	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-16 20:33:17	20191216203322.txt	2019-12-16 20:33:22	89	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-16 20:33:42	20191216203351.txt	2019-12-16 20:33:51	90	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-17 09:44:07	20191217094823.txt	2019-12-17 09:48:23	91	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-03 12:49:28	\N	2019-12-03 12:49:28	2	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2019-12-10 19:00:08	20191210190008.txt	2019-12-10 19:00:09	11	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 16:50:11	20200103165050.txt	2020-01-03 16:50:50	105	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 16:54:42	20200103165632.txt	2020-01-03 16:56:33	106	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 17:33:32	20200103173334.txt	2020-01-03 17:33:34	107	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 17:37:48	20200103173749.txt	2020-01-03 17:37:49	108	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 17:55:40	20200103175541.txt	2020-01-03 17:55:41	109	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:02:38	20200103180239.txt	2020-01-03 18:02:40	110	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:02:54	20200103180255.txt	2020-01-03 18:02:56	111	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:09:06	20200103180908.txt	2020-01-03 18:09:09	112	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:07:35	20200103181216.txt	2020-01-03 18:12:17	113	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:14:25	20200103181427.txt	2020-01-03 18:14:27	114	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:16:35	20200103181636.txt	2020-01-03 18:16:36	115	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:17:30	20200103181731.txt	2020-01-03 18:17:32	116	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:21:47	20200103182148.txt	2020-01-03 18:21:49	117	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:22:39	20200103182312.txt	2020-01-03 18:23:13	118	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:29:37	20200103182938.txt	2020-01-03 18:29:38	119	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:30:10	20200103183020.txt	2020-01-03 18:30:20	120	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:37:00	20200103183702.txt	2020-01-03 18:37:02	121	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:37:32	20200103183733.txt	2020-01-03 18:37:34	122	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:38:28	20200103183829.txt	2020-01-03 18:38:30	123	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:42:19	20200103184220.txt	2020-01-03 18:42:21	124	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:44:40	20200103184442.txt	2020-01-03 18:44:42	125	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:45:22	20200103184523.txt	2020-01-03 18:45:24	126	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:45:55	20200103184557.txt	2020-01-03 18:45:57	127	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-03 18:47:51	20200103185210.txt	2020-01-03 18:52:11	128	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-06 12:48:46	20200106125246.txt	2020-01-06 12:52:48	129	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-06 13:46:26	20200106135046.txt	2020-01-06 13:50:48	130	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-06 18:25:36	20200106183023.txt	2020-01-06 18:30:26	131	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-06 18:59:48	20200106190531.txt	2020-01-06 19:05:33	132	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-06 19:33:44	20200106193849.txt	2020-01-06 19:38:52	133	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-07 10:05:45	20200107100628.txt	2020-01-07 10:06:28	134	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-07 12:05:03	20200107120539.txt	2020-01-07 12:05:40	135	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-07 12:10:41	20200107121125.txt	2020-01-07 12:11:26	136	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-07 17:56:27	20200107175847.txt	2020-01-07 17:58:48	137	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-08 16:35:06	20200108163729.txt	2020-01-08 16:37:30	138	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-09 15:45:56	20200109155444.txt	2020-01-09 16:05:56	142	True	True	boolean_occurence	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-01-08 18:23:56	20200108183635.txt	2020-01-08 18:36:37	140	True	True	count_occurence	False	\N	\N	1	\N	\N	\N	\N	\N	\N	\N
2020-03-04 18:16:04	20200304181620.txt	2020-03-04 18:16:21	147	True	True	count_occurence	True		docx	1	\N	\N	\N	\N	\N	\N	\N
2020-03-04 18:17:44	20200304181800.txt	2020-03-04 18:18:01	148	True	True	count_occurence	True		docx	1	\N	\N	\N	\N	\N	\N	\N
2020-03-04 18:37:06	20200304183721.txt	2020-03-04 18:37:23	149	True	True	count_occurence	True		docx	1	\N	\N	\N	\N	\N	\N	\N
2020-03-04 18:41:15	20200304184128.txt	2020-03-04 18:41:28	150	True	True	count_occurence	True		docx	1	\N	\N	\N	\N	\N	\N	\N
2020-03-04 18:42:09	20200304184221.txt	2020-03-04 18:42:21	151	True	True	count_occurence	True		docx	1	\N	\N	\N	\N	\N	\N	\N
2020-03-04 19:01:56	20200304190208.txt	2020-03-04 19:02:08	152	True	True	count_occurence	True		docx	1	\N	\N	\N	\N	\N	\N	\N
2020-03-04 19:03:06	20200304190317.txt	2020-03-04 19:03:17	153	True	True	count_occurence	True		docx	1	\N	\N	\N	\N	\N	\N	\N
2020-03-04 19:04:50	20200304190501.txt	2020-03-04 19:05:01	154	True	True	count_occurence	True		docx	1	\N	\N	\N	\N	\N	\N	\N
2020-03-04 19:20:37	20200304193113.txt	2020-03-04 19:31:16	155	True	False	count_occurence	True		docx	1	\N	\N	\N	\N	\N	\N	\N
2020-03-06 12:27:20	20200306122927.txt	2020-03-06 12:29:30	156	True	True	count_occurence	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-06 12:32:08	20200306124345.txt	2020-03-06 12:43:49	157	True	True	count_occurence	False		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-10 13:08:18	20200310131035.txt	2020-03-10 13:10:38	158	True	False	count_occurence	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 20:19:39	20200312202014	2020-03-12 20:20:17	159	True	True	tfidf	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 20:21:01	20200312202133	2020-03-12 20:21:35	160	True	True	tfidf	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 20:36:25	20200312203638	2020-03-12 20:36:40	161	True	True	tfidf	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 20:37:09	20200312203713	2020-03-12 20:37:16	162	True	True	tfidf	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 20:38:03	20200312203805	2020-03-12 20:38:07	163	True	True	tfidf	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 20:39:05	20200312203909	2020-03-12 20:39:11	164	True	True	tfidf	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 20:42:34	20200312204243	2020-03-12 20:42:45	165	True	True	tfidf	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 20:44:16	20200312204419	2020-03-12 20:44:21	166	True	True	count_occurence	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 20:46:23	20200312204728	2020-03-12 20:47:31	167	True	True	count_occurence	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 20:56:33	20200312205639	2020-03-12 20:56:41	168	True	True	count_occurence	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 20:57:57	20200312205809	2020-03-12 20:58:12	169	True	True	count_occurence	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 21:43:57	20200312215524.txt	2020-03-12 21:55:43	171	True	True	tfidf	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 21:35:05	20200312213513.txt	2020-03-12 21:35:16	170	True	True	tfidf	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 22:32:31	20200312224453.txt	2020-03-12 22:45:08	172	True	True	tfidf	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-12 22:56:12	20200312230246.txt	2020-03-12 23:02:46	176	True	True	count_occurence	True		rtf	3	\N	\N	\N	\N	\N	\N	\N
2020-03-12 23:06:57	20200312230700.txt	2020-03-12 23:07:00	180	True	True	count_occurence	True		rtf	3	\N	\N	\N	\N	\N	\N	\N
2020-03-13 11:16:00	20200313111614.txt	2020-03-13 11:16:14	184	True	True	count_occurence	True		rtf	1	\N	\N	\N	\N	\N	\N	\N
2020-03-17 13:38:05	20200317133807.txt	2020-03-17 13:38:07	188	True	False	count_occurence	True		rtf	1	0	True	\N	\N	\N	\N	\N
2020-05-29 11:39:22	20200529113925.txt	2020-05-29 11:39:28	241	True	True	count_occurence	True		rtf	1	1815	True	True	N,V	\N	\N	\N
2020-05-22 12:49:19	20200522124920.txt	2020-05-22 12:49:22	233	True	True	count_occurence	True		rtf	1	20478	False	True	V	\N	\N	\N
2020-05-26 10:43:15	20200526104318.txt	2020-05-26 10:43:21	235	True	True	count_occurence	True		rtf	1	1828	True	True	N	\N	\N	\N
2020-05-29 11:46:11	20200529115920.txt	2020-05-29 11:59:23	242	True	True	count_occurence	True		rtf	1	1829	True	True	N,J	\N	\N	\N
2020-05-29 12:02:48	20200529121558.txt	2020-05-29 12:16:00	243	True	True	count_occurence	True		rtf	1	1815	True	True	N,R	\N	\N	\N
2020-05-29 12:21:43	20200529123451.txt	2020-05-29 12:34:55	244	True	True	count_occurence	True		rtf	1	1808	True	True	V,J	\N	\N	\N
2020-05-29 12:37:08	20200529124856.txt	2020-05-29 12:49:00	245	True	True	count_occurence	True		rtf	1	1792	True	True	V,R	\N	\N	\N
2020-05-29 12:59:36	20200529131436.txt	2020-05-29 13:14:40	246	True	True	count_occurence	True		rtf	1	1518	True	True	J,R	\N	\N	\N
2020-06-16 09:40:51	20200616095553.txt	2020-06-16 09:55:55	247	True	True	count_occurence	True		rtf	1	1825	True	True	None	\N	\N	\N
2020-06-16 11:54:19	20200616122637.txt	2020-06-16 12:26:41	248	True	True	count_occurence	True		rtf	1	18662	False	True	None	\N	\N	\N
2020-06-16 12:45:21	20200616131258.txt	2020-06-16 13:13:08	249	True	True	count_occurence	True		rtf	1	1775	True	True	None	\N	\N	\N
2020-06-16 14:00:15	20200616145538.txt	2020-06-16 14:55:41	250	True	True	count_occurence	True		rtf	1	1775	True	True	None	\N	\N	\N
2020-06-19 10:31:08	20200619105315.txt	2020-06-19 10:53:19	251	True	True	count_occurence	True		rtf	1	1775	True	True	None	\N	\N	\N
2020-06-19 11:51:23	20200619115256.txt	2020-06-19 11:52:59	252	True	True	count_occurence	True		rtf	4	0	True	True	None	True	True	\N
2020-06-19 11:55:50	20200619115701.txt	2020-06-19 11:57:04	253	True	True	count_occurence	True		rtf	4	0	True	True	None	True	True	\N
2020-06-19 12:00:26	20200619121108.txt	2020-06-19 12:11:11	254	True	True	count_occurence	True		rtf	4	614	True	True	None	True	True	\N
2020-06-23 12:21:02	20200623124732.txt	2020-06-23 12:47:39	255	True	True	count_occurence	True		rtf	4	3938	True	True	None	True	True	\N
2020-06-30 16:43:09	20200630170546.txt	2020-06-30 17:05:49	256	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1
2020-06-30 17:07:12	20200630182619.txt	2020-06-30 18:26:22	257	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2
2020-06-30 18:32:01	20200630185656.txt	2020-06-30 18:56:59	258	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1
2020-06-30 19:02:25	20200630192714.txt	2020-06-30 19:27:17	259	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2
2020-06-30 19:35:40	20200630200040.txt	2020-06-30 20:00:44	260	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	3
2020-06-30 20:08:59	20200630203137.txt	2020-06-30 20:31:39	261	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	4
2020-06-30 20:39:23	20200630210046.txt	2020-06-30 21:00:49	262	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,2
2020-06-30 21:07:42	20200630233201.txt	2020-06-30 23:32:04	263	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,3
2020-06-30 23:39:37	20200701000114.txt	2020-07-01 00:01:17	264	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,4
2020-07-01 00:08:31	20200701003017.txt	2020-07-01 00:30:20	265	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2,3
2020-07-01 00:41:35	20200701010319.txt	2020-07-01 01:03:23	266	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2,4
2020-07-01 01:13:45	20200701013528.txt	2020-07-01 01:35:32	267	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	3,4
2020-07-01 01:46:56	20200701020853.txt	2020-07-01 02:08:56	268	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,2,3
2020-07-01 02:19:55	20200701024140.txt	2020-07-01 02:41:44	269	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,2,4
2020-07-01 02:52:03	20200701031400.txt	2020-07-01 03:14:03	270	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,3,4
2020-07-01 03:25:36	20200701034751.txt	2020-07-01 03:47:55	271	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2,3,4
2020-07-01 03:57:19	20200701041912.txt	2020-07-01 04:19:16	272	True	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,2,3,4
2020-07-01 06:41:59	20200701070143.txt	2020-07-01 07:01:45	273	True	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1
2020-07-01 07:05:11	20200701072507.txt	2020-07-01 07:25:10	274	True	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	2
2020-07-01 07:33:14	20200701075254.txt	2020-07-01 07:52:58	275	True	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	3
2020-07-01 08:03:09	20200701082300.txt	2020-07-01 08:23:04	276	True	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	4
2020-07-01 08:34:27	20200701085413.txt	2020-07-01 08:54:16	277	True	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,2
2020-07-01 09:02:46	20200701092238.txt	2020-07-01 09:22:41	278	True	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,3
2020-07-01 09:33:16	20200701095310.txt	2020-07-01 09:53:13	279	True	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,4
2020-07-01 10:04:52	20200701102719.txt	2020-07-01 10:27:25	280	True	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	2,3
2020-07-01 12:49:13	20200701131151.txt	2020-07-01 13:11:57	281	True	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	2,4
2020-07-01 13:22:08	20200701134345.txt	2020-07-01 13:43:49	282	True	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	3,4
2020-07-01 13:54:06	20200701141944.txt	2020-07-01 14:19:50	283	True	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,2,3
2020-07-01 14:51:55	20200701151855.txt	2020-07-01 15:19:04	284	True	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,2,4
2020-07-01 15:47:16	20200701161142.txt	2020-07-01 16:11:48	285	True	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,3,4
2020-07-01 16:25:07	20200701164859.txt	2020-07-01 16:49:06	286	True	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	2,3,4
2020-07-01 18:09:58	20200701183327.txt	2020-07-01 18:33:32	287	True	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,2,3,4
2020-07-01 20:24:24	20200701203809.txt	2020-07-01 20:38:11	288	True	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1
2020-07-01 20:41:13	20200701205442.txt	2020-07-01 20:54:45	289	True	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	2
2020-07-01 21:01:34	20200701211628.txt	2020-07-01 21:16:31	290	True	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	3
2020-07-01 21:23:33	20200701213638.txt	2020-07-01 21:36:40	291	True	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	4
2020-07-01 21:43:22	20200701215627.txt	2020-07-01 21:56:30	292	True	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,2
2020-07-01 22:03:17	20200701221910.txt	2020-07-01 22:19:14	293	True	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,3
2020-07-01 22:27:40	20200701224352.txt	2020-07-01 22:43:55	294	True	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,4
2020-07-01 22:51:53	20200701230756.txt	2020-07-01 23:08:00	295	True	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	2,3
2020-07-01 23:20:32	20200701233652.txt	2020-07-01 23:36:56	296	True	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	2,4
2020-07-01 23:49:06	20200702000414.txt	2020-07-02 00:04:18	297	True	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	3,4
2020-07-02 00:14:54	20200702002809.txt	2020-07-02 00:28:12	298	True	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,2,3
2020-07-02 00:38:29	20200702005138.txt	2020-07-02 00:51:41	299	True	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,2,4
2020-07-02 01:01:52	20200702011506.txt	2020-07-02 01:15:09	300	True	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,3,4
2020-07-02 01:25:32	20200702013843.txt	2020-07-02 01:38:46	301	True	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	2,3,4
2020-07-02 02:50:36	20200702030349.txt	2020-07-02 03:03:52	302	True	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,2,3,4
2020-07-02 03:13:53	20200702032502.txt	2020-07-02 03:25:04	303	True	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1
2020-07-02 03:28:02	20200702033913.txt	2020-07-02 03:39:16	304	True	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	2
2020-07-02 03:46:52	20200702035804.txt	2020-07-02 03:58:07	305	True	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	3
2020-07-02 04:07:49	20200702041903.txt	2020-07-02 04:19:06	306	True	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	4
2020-07-02 04:29:31	20200702044041.txt	2020-07-02 04:40:44	307	True	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,2
2020-07-02 04:48:16	20200702045924.txt	2020-07-02 04:59:27	308	True	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,3
2020-07-02 05:09:04	20200702052039.txt	2020-07-02 05:20:42	309	True	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,4
2020-07-02 05:30:59	20200702054218.txt	2020-07-02 05:42:22	310	True	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	2,3
2020-07-02 07:56:44	20200702080759.txt	2020-07-02 08:08:03	311	True	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	2,4
2020-07-02 09:21:43	20200702093632.txt	2020-07-02 09:36:38	312	True	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	3,4
2020-07-02 09:52:06	20200702100409.txt	2020-07-02 10:04:13	313	True	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,2,3
2020-07-02 10:26:25	20200702103842.txt	2020-07-02 10:38:47	314	True	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,2,4
2020-07-02 10:48:44	20200702110042.txt	2020-07-02 11:00:47	315	True	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,3,4
2020-07-02 12:29:20	20200702124428.txt	2020-07-02 12:44:34	316	True	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	2,3,4
2020-07-02 15:47:17	20200702160130.txt	2020-07-02 16:01:38	317	True	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,2,3,4
2020-07-02 17:38:48	20200702180703.txt	2020-07-02 18:07:07	318	True	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1
2020-07-02 18:20:41	20200702184709.txt	2020-07-02 18:47:15	319	True	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	2
2020-07-02 19:06:49	20200702192924.txt	2020-07-02 19:29:28	320	True	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	3
2020-07-02 19:49:07	20200702201728.txt	2020-07-02 20:17:34	321	True	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	4
2020-07-02 20:43:10	20200702210554.txt	2020-07-02 21:05:59	322	True	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,2
2020-07-02 21:24:44	20200702214732.txt	2020-07-02 21:47:36	323	True	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,3
2020-07-02 22:08:24	20200702223621.txt	2020-07-02 22:36:27	324	True	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,4
2020-07-02 22:59:39	20200702233131.txt	2020-07-02 23:31:38	325	True	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	2,3
2020-07-03 00:15:17	20200703003831.txt	2020-07-03 00:38:36	326	True	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	2,4
2020-07-03 01:03:04	20200703012510.txt	2020-07-03 01:25:15	327	True	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	3,4
2020-07-03 01:51:15	20200703021321.txt	2020-07-03 02:13:26	328	True	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,2,3
2020-07-03 02:39:04	20200703030133.txt	2020-07-03 03:01:37	329	True	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,2,4
2020-07-03 03:26:04	20200703034800.txt	2020-07-03 03:48:05	330	True	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,3,4
2020-07-03 04:14:18	20200703043624.txt	2020-07-03 04:36:29	331	True	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	2,3,4
2020-07-03 08:19:35	20200703084142.txt	2020-07-03 08:41:48	332	True	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,2,3,4
2020-07-03 10:02:16	20200703102358.txt	2020-07-03 10:24:01	333	True	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1
2020-07-03 10:35:09	20200703105813.txt	2020-07-03 10:58:18	334	True	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	2
2020-07-03 11:25:02	20200703115321.txt	2020-07-03 11:53:27	335	True	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	3
2020-07-03 12:22:39	20200703124538.txt	2020-07-03 12:45:43	336	True	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	4
2020-07-03 13:27:01	20200703135216.txt	2020-07-03 13:52:21	337	True	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,2
2020-07-03 14:17:07	20200703144524.txt	2020-07-03 14:45:31	338	True	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,3
2020-07-03 15:20:44	20200703154959.txt	2020-07-03 15:50:04	339	True	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,4
2020-07-03 16:24:08	20200703164519.txt	2020-07-03 16:45:24	340	True	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	2,3
2020-07-03 18:19:14	20200703183941.txt	2020-07-03 18:39:46	341	True	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	2,4
2020-07-03 20:02:43	20200703202430.txt	2020-07-03 20:24:36	342	True	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	3,4
2020-07-03 21:56:04	20200703221919.txt	2020-07-03 22:19:25	343	True	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,2,3
2020-07-04 03:07:08	20200704033152.txt	2020-07-04 03:31:59	344	True	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,2,4
2020-07-04 06:00:32	20200704062109.txt	2020-07-04 06:21:15	345	True	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,3,4
2020-07-04 08:59:16	20200704092434.txt	2020-07-04 09:24:42	346	True	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	2,3,4
2020-07-04 10:48:32	20200704111239.txt	2020-07-04 11:12:47	347	True	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,2,3,4
2020-07-04 13:27:48	20200704134532.txt	2020-07-04 13:45:36	348	True	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1
2020-07-04 13:57:22	20200704141400.txt	2020-07-04 14:14:05	349	True	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	2
2020-07-04 14:34:57	20200704145151.txt	2020-07-04 14:51:56	350	True	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	3
2020-07-04 15:18:58	20200704153605.txt	2020-07-04 15:36:09	351	True	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	4
2020-07-04 16:02:15	20200704161924.txt	2020-07-04 16:19:28	352	True	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,2
2020-07-04 16:45:14	20200704170226.txt	2020-07-04 17:02:30	353	True	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,3
2020-07-04 17:30:37	20200704174745.txt	2020-07-04 17:47:49	354	True	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,4
2020-07-04 18:14:51	20200704183205.txt	2020-07-04 18:32:10	355	True	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	2,3
2020-07-04 19:08:43	20200704192601.txt	2020-07-04 19:26:07	356	True	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	2,4
2020-07-04 20:01:04	20200704201812.txt	2020-07-04 20:18:17	357	True	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	3,4
2020-07-04 20:54:46	20200704211156.txt	2020-07-04 21:12:01	358	True	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,2,3
2020-07-04 21:49:02	20200704220716.txt	2020-07-04 22:07:22	359	True	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,2,4
2020-07-04 22:50:00	20200704231200.txt	2020-07-04 23:12:06	360	True	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,3,4
2020-07-04 23:57:53	20200705001946.txt	2020-07-05 00:19:53	361	True	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	2,3,4
2020-07-05 02:42:22	20200705030015.txt	2020-07-05 03:00:21	362	True	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,2,3,4
2020-07-05 06:29:10	20200705064418.txt	2020-07-05 06:44:21	363	True	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1
2020-07-05 07:00:46	20200705071556.txt	2020-07-05 07:16:02	364	True	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	2
2020-07-05 07:46:14	20200705080121.txt	2020-07-05 08:01:27	365	True	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	3
2020-07-05 08:37:17	20200705085230.txt	2020-07-05 08:52:36	366	True	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	4
2020-07-05 09:28:06	20200705094116.txt	2020-07-05 09:41:21	367	True	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,2
2020-07-05 10:04:14	20200705101735.txt	2020-07-05 10:17:40	368	True	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,3
2020-07-05 10:44:47	20200705105734.txt	2020-07-05 10:57:39	369	True	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,4
2020-07-05 11:26:03	20200705113913.txt	2020-07-05 11:39:18	370	True	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	2,3
2020-07-05 13:12:49	20200705132545.txt	2020-07-05 13:25:50	371	True	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	2,4
2020-07-05 14:35:39	20200705145624.txt	2020-07-05 14:56:31	372	True	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	3,4
2020-07-05 22:36:43	20200705225240.txt	2020-07-05 22:52:47	373	True	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,2,3
2020-07-05 23:23:48	20200705233947.txt	2020-07-05 23:39:53	374	True	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,2,4
2020-07-06 00:11:53	20200706002647.txt	2020-07-06 00:26:53	375	True	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,3,4
2020-07-06 00:56:20	20200706010936.txt	2020-07-06 01:09:43	376	True	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	2,3,4
2020-07-06 01:45:11	20200706015829.txt	2020-07-06 01:58:36	377	True	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,2,3,4
2020-07-06 02:33:06	20200706025736.txt	2020-07-06 02:57:38	378	True	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1
2020-07-06 03:02:57	20200706032700.txt	2020-07-06 03:27:03	379	True	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2
2020-07-06 03:33:24	20200706035727.txt	2020-07-06 03:57:30	380	True	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	3
2020-07-06 04:03:44	20200706042807.txt	2020-07-06 04:28:10	381	True	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	4
2020-07-06 04:34:12	20200706045816.txt	2020-07-06 04:58:19	382	True	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,2
2020-07-06 05:04:43	20200706052839.txt	2020-07-06 05:28:42	383	True	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,3
2020-07-06 05:35:02	20200706055903.txt	2020-07-06 05:59:06	384	True	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,4
2020-07-06 06:05:14	20200706062929.txt	2020-07-06 06:29:33	385	True	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2,3
2020-07-06 06:36:53	20200706070054.txt	2020-07-06 07:00:58	386	True	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2,4
2020-07-06 07:08:08	20200706073207.txt	2020-07-06 07:32:10	387	True	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	3,4
2020-07-06 07:39:09	20200706080311.txt	2020-07-06 08:03:15	388	True	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,2,3
2020-07-06 08:10:45	20200706083540.txt	2020-07-06 08:35:44	389	True	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,2,4
2020-07-06 08:40:47	20200706090950.txt	2020-07-06 09:09:55	390	True	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,3,4
2020-07-06 09:16:34	20200706095022.txt	2020-07-06 09:50:29	391	True	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2,3,4
2020-07-06 09:56:22	20200706102149.txt	2020-07-06 10:21:54	392	True	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,2,3,4
2020-07-06 10:27:51	20200706110308.txt	2020-07-06 11:03:12	393	True	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1
2020-07-06 11:07:23	20200706113147.txt	2020-07-06 11:31:51	394	True	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	2
2020-07-06 11:36:20	20200706115932.txt	2020-07-06 11:59:35	395	True	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	3
2020-07-06 12:05:07	20200706123104.txt	2020-07-06 12:31:08	396	True	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	4
2020-07-06 12:36:45	20200706130100.txt	2020-07-06 13:01:04	397	True	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,2
2020-07-06 13:05:09	20200706133437.txt	2020-07-06 13:34:41	398	True	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,3
2020-07-06 13:39:06	20200706140113.txt	2020-07-06 14:01:16	399	True	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,4
2020-07-06 14:06:45	20200706143420.txt	2020-07-06 14:34:25	400	True	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	2,3
2020-07-06 14:40:20	20200706150159.txt	2020-07-06 15:02:04	401	True	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	2,4
2020-07-06 15:08:48	20200706153701.txt	2020-07-06 15:37:06	402	True	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	3,4
2020-07-06 15:44:05	20200706160755.txt	2020-07-06 16:08:02	403	True	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,2,3
2020-07-06 16:16:32	20200706164515.txt	2020-07-06 16:45:23	404	True	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,2,4
2020-07-06 16:52:43	20200706171355.txt	2020-07-06 17:14:01	405	True	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,3,4
2020-07-06 17:21:17	20200706174255.txt	2020-07-06 17:43:01	406	True	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	2,3,4
2020-07-06 17:51:27	20200706181230.txt	2020-07-06 18:12:36	407	True	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,2,3,4
2020-07-06 18:21:11	20200706183446.txt	2020-07-06 18:34:49	408	True	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1
2020-07-06 18:36:44	20200706185020.txt	2020-07-06 18:50:23	409	True	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	2
2020-07-06 18:53:21	20200706190701.txt	2020-07-06 19:07:05	410	True	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	3
2020-07-06 19:10:01	20200706192345.txt	2020-07-06 19:23:48	411	True	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	4
2020-07-06 19:26:29	20200706194008.txt	2020-07-06 19:40:10	412	True	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,2
2020-07-06 19:43:07	20200706195646.txt	2020-07-06 19:56:49	413	True	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,3
2020-07-06 19:59:42	20200706201341.txt	2020-07-06 20:13:43	414	True	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,4
2020-07-06 20:16:23	20200706203047.txt	2020-07-06 20:30:51	415	True	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	2,3
2020-07-06 20:34:42	20200706204821.txt	2020-07-06 20:48:24	416	True	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	2,4
2020-07-06 20:52:29	20200706210621.txt	2020-07-06 21:06:25	417	True	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	3,4
2020-07-06 21:10:04	20200706212400.txt	2020-07-06 21:24:05	418	True	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,2,3
2020-07-06 21:27:54	20200706214140.txt	2020-07-06 21:41:43	419	True	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,2,4
2020-07-06 21:45:32	20200706215915.txt	2020-07-06 21:59:18	420	True	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,3,4
2020-07-06 22:03:10	20200706221939.txt	2020-07-06 22:19:44	421	True	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	2,3,4
2020-07-06 22:25:12	20200706224155.txt	2020-07-06 22:42:00	422	True	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,2,3,4
2020-07-06 22:47:24	20200706230146.txt	2020-07-06 23:01:48	423	True	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1
2020-07-06 23:04:11	20200706231820.txt	2020-07-06 23:18:24	424	True	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	2
2020-07-06 23:22:45	20200706233703.txt	2020-07-06 23:37:08	425	True	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	3
2020-07-06 23:42:13	20200706235635.txt	2020-07-06 23:56:40	426	True	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	4
2020-07-07 00:01:58	20200707001620.txt	2020-07-07 00:16:23	427	True	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,2
2020-07-07 00:19:57	20200707003143.txt	2020-07-07 00:31:47	428	True	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,3
2020-07-07 00:36:05	20200707004754.txt	2020-07-07 00:47:58	429	True	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,4
2020-07-07 00:52:27	20200707010418.txt	2020-07-07 01:04:23	430	True	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	2,3
2020-07-07 01:10:01	20200707012148.txt	2020-07-07 01:21:53	431	True	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	2,4
2020-07-07 01:27:45	20200707013934.txt	2020-07-07 01:39:39	432	True	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	3,4
2020-07-07 01:46:50	20200707015845.txt	2020-07-07 01:58:49	433	True	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,2,3
2020-07-07 02:04:39	20200707021645.txt	2020-07-07 02:16:50	434	True	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,2,4
2020-07-07 02:22:50	20200707023449.txt	2020-07-07 02:34:55	435	True	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,3,4
2020-07-07 02:41:42	20200707025341.txt	2020-07-07 02:53:48	436	True	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	2,3,4
2020-07-07 03:02:02	20200707031413.txt	2020-07-07 03:14:20	437	True	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,2,3,4
2020-07-07 03:22:09	20200707034437.txt	2020-07-07 03:44:40	438	True	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1
2020-07-07 03:53:04	20200707041613.txt	2020-07-07 04:16:16	439	True	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	2
2020-07-07 04:29:03	20200707045130.txt	2020-07-07 04:51:34	440	True	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	3
2020-07-07 05:03:59	20200707052639.txt	2020-07-07 05:26:42	441	True	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	4
2020-07-07 05:38:08	20200707060045.txt	2020-07-07 06:00:48	442	True	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,2
2020-07-07 06:13:54	20200707063633.txt	2020-07-07 06:36:37	443	True	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,3
2020-07-07 06:49:33	20200707071225.txt	2020-07-07 07:12:29	444	True	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,4
2020-07-07 07:24:07	20200707074646.txt	2020-07-07 07:46:50	445	True	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	2,3
2020-07-07 08:03:32	20200707082611.txt	2020-07-07 08:26:15	446	True	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	2,4
2020-07-07 08:45:01	20200707091126.txt	2020-07-07 09:11:31	447	True	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	3,4
2020-07-07 09:28:44	20200707095811.txt	2020-07-07 09:58:16	448	True	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,2,3
2020-07-07 10:19:19	20200707104603.txt	2020-07-07 10:46:07	449	True	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,2,4
2020-07-07 11:03:12	20200707112715.txt	2020-07-07 11:27:19	450	True	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,3,4
2020-07-07 11:46:05	20200707121237.txt	2020-07-07 12:12:42	451	True	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	2,3,4
2020-07-07 12:32:44	20200707130123.txt	2020-07-07 13:01:32	452	True	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,2,3,4
2020-07-07 13:49:28	20200707142408.txt	2020-07-07 14:24:12	453	True	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1
2020-07-07 14:40:10	20200707151018.txt	2020-07-07 15:10:23	454	True	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	2
2020-07-07 15:27:21	20200707155037.txt	2020-07-07 15:50:42	455	True	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	3
2020-07-07 16:09:40	20200707163105.txt	2020-07-07 16:31:10	456	True	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	4
2020-07-07 16:54:13	20200707171546.txt	2020-07-07 17:15:51	457	True	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,2
2020-07-07 17:35:06	20200707175648.txt	2020-07-07 17:56:53	458	True	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,3
2020-07-07 18:19:03	20200707184035.txt	2020-07-07 18:40:40	459	True	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,4
2020-07-07 19:05:58	20200707192916.txt	2020-07-07 19:29:23	460	True	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	2,3
2020-07-07 19:57:07	20200707202029.txt	2020-07-07 20:20:35	461	True	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	2,4
2020-07-07 20:46:09	20200707210720.txt	2020-07-07 21:07:26	462	True	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	3,4
2020-07-07 21:37:55	20200707215900.txt	2020-07-07 21:59:06	463	True	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,2,3
2020-07-07 22:30:29	20200707225617.txt	2020-07-07 22:56:24	464	True	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,2,4
2020-07-07 23:30:27	20200707235630.txt	2020-07-07 23:56:38	465	True	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,3,4
2020-07-08 00:32:05	20200708005326.txt	2020-07-08 00:53:35	466	True	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	2,3,4
2020-07-08 01:29:55	20200708015120.txt	2020-07-08 01:51:29	467	True	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,2,3,4
2020-07-08 02:40:30	20200708031044.txt	2020-07-08 03:10:51	468	True	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1
2020-07-08 03:28:06	20200708035042.txt	2020-07-08 03:50:46	469	True	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	2
2020-07-08 04:15:22	20200708042846.txt	2020-07-08 04:28:49	470	True	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	3
2020-07-08 04:40:21	20200708045337.txt	2020-07-08 04:53:40	471	True	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	4
2020-07-08 05:04:24	20200708051749.txt	2020-07-08 05:17:52	472	True	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,2
2020-07-08 05:29:51	20200708054315.txt	2020-07-08 05:43:19	473	True	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,3
2020-07-08 05:55:25	20200708060845.txt	2020-07-08 06:08:49	474	True	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,4
2020-07-08 06:19:43	20200708063317.txt	2020-07-08 06:33:21	475	True	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	2,3
2020-07-08 06:48:55	20200708070215.txt	2020-07-08 07:02:19	476	True	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	2,4
2020-07-08 07:17:14	20200708073035.txt	2020-07-08 07:30:39	477	True	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	3,4
2020-07-08 07:44:56	20200708075817.txt	2020-07-08 07:58:21	478	True	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,2,3
2020-07-08 08:14:24	20200708082746.txt	2020-07-08 08:27:50	479	True	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,2,4
2020-07-08 08:42:37	20200708085602.txt	2020-07-08 08:56:05	480	True	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,3,4
2020-07-08 09:11:29	20200708092501.txt	2020-07-08 09:25:06	481	True	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	2,3,4
2020-07-08 09:46:51	20200708101515.txt	2020-07-08 10:15:29	482	True	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,2,3,4
2020-07-08 11:02:13	20200708112206.txt	2020-07-08 11:22:11	483	True	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1
2020-07-08 11:36:42	20200708115651.txt	2020-07-08 11:57:00	484	True	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	2
2020-07-08 12:22:31	20200708124052.txt	2020-07-08 12:40:59	485	True	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	3
2020-07-08 13:06:30	20200708132327.txt	2020-07-08 13:23:34	486	True	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	4
2020-07-08 13:49:15	20200708140711.txt	2020-07-08 14:07:18	487	True	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,2
2020-07-08 14:31:25	20200708145027.txt	2020-07-08 14:50:35	488	True	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,3
2020-07-08 15:19:00	20200708153639.txt	2020-07-08 15:36:46	489	True	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,4
2020-07-08 16:03:30	20200708162353.txt	2020-07-08 16:24:04	490	True	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	2,3
2020-07-08 17:01:17	20200708172041.txt	2020-07-08 17:20:50	491	True	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	2,4
2020-07-08 17:58:25	20200708181708.txt	2020-07-08 18:17:18	492	True	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	3,4
2020-07-08 18:50:54	20200708191014.txt	2020-07-08 19:10:24	493	True	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,2,3
2020-07-08 19:45:06	20200708200236.txt	2020-07-08 20:02:45	494	True	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,2,4
2020-07-08 20:41:11	20200708205804.txt	2020-07-08 20:58:13	495	True	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,3,4
2020-07-08 21:33:17	20200708214942.txt	2020-07-08 21:49:51	496	True	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	2,3,4
2020-07-08 22:35:57	20200708225532.txt	2020-07-08 22:55:45	497	True	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,2,3,4
2020-07-08 23:48:19	20200709002922.txt	2020-07-09 00:29:26	498	False	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1
2020-07-09 00:33:12	20200709010910.txt	2020-07-09 01:09:15	499	False	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2
2020-07-09 01:13:43	20200709014714.txt	2020-07-09 01:47:19	500	False	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	3
2020-07-09 01:50:57	20200709022411.txt	2020-07-09 02:24:15	501	False	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	4
2020-07-09 02:27:28	20200709030024.txt	2020-07-09 03:00:28	502	False	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,2
2020-07-09 03:05:06	20200709033828.txt	2020-07-09 03:38:33	503	False	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,3
2020-07-09 03:42:10	20200709041843.txt	2020-07-09 04:18:47	504	False	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,4
2020-07-09 04:22:20	20200709045852.txt	2020-07-09 04:58:58	505	False	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2,3
2020-07-09 05:04:06	20200709054035.txt	2020-07-09 05:40:41	506	False	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2,4
2020-07-09 05:45:33	20200709062244.txt	2020-07-09 06:22:49	507	False	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	3,4
2020-07-09 06:27:26	20200709070436.txt	2020-07-09 07:04:42	508	False	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,2,3
2020-07-09 07:09:48	20200709074720.txt	2020-07-09 07:47:25	509	False	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,2,4
2020-07-09 07:52:13	20200709082935.txt	2020-07-09 08:29:40	510	False	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,3,4
2020-07-09 08:34:10	20200709091448.txt	2020-07-09 09:14:55	511	False	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2,3,4
2020-07-09 09:21:29	20200709095609.txt	2020-07-09 09:56:15	512	False	True	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,2,3,4
2020-07-09 10:01:40	20200709103948.txt	2020-07-09 10:39:52	513	False	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1
2020-07-09 10:44:18	20200709112234.txt	2020-07-09 11:22:41	514	False	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	2
2020-07-09 11:28:29	20200709120234.txt	2020-07-09 12:02:42	515	False	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	3
2020-07-09 12:11:05	20200709124615.txt	2020-07-09 12:46:23	516	False	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	4
2020-07-09 12:55:47	20200709133206.txt	2020-07-09 13:32:14	517	False	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,2
2020-07-09 13:37:47	20200709141325.txt	2020-07-09 14:13:32	518	False	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,3
2020-07-09 14:21:18	20200709145750.txt	2020-07-09 14:58:00	519	False	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,4
2020-07-09 15:10:32	20200709154738.txt	2020-07-09 15:47:47	520	False	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	2,3
2020-07-09 16:00:32	20200709163320.txt	2020-07-09 16:33:31	521	False	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	2,4
2020-07-09 16:44:17	20200709171617.txt	2020-07-09 17:16:29	522	False	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	3,4
2020-07-09 17:29:00	20200709180034.txt	2020-07-09 18:00:44	523	False	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,2,3
2020-07-09 18:10:34	20200709184145.txt	2020-07-09 18:41:55	524	False	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,2,4
2020-07-09 18:52:40	20200709192430.txt	2020-07-09 19:24:41	525	False	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,3,4
2020-07-09 19:37:14	20200709200857.txt	2020-07-09 20:09:11	526	False	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	2,3,4
2020-07-09 20:24:53	20200709205624.txt	2020-07-09 20:56:37	527	False	True	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,2,3,4
2020-07-09 21:10:42	20200709213223.txt	2020-07-09 21:32:27	528	False	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1
2020-07-09 21:35:13	20200709215638.txt	2020-07-09 21:56:42	529	False	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	2
2020-07-09 22:00:35	20200709222631.txt	2020-07-09 22:26:37	530	False	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	3
2020-07-09 22:31:08	20200709225814.txt	2020-07-09 22:58:19	531	False	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	4
2020-07-09 23:02:18	20200709232950.txt	2020-07-09 23:29:57	532	False	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,2
2020-07-09 23:35:36	20200710000329.txt	2020-07-10 00:03:35	533	False	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,3
2020-07-10 00:08:08	20200710003604.txt	2020-07-10 00:36:09	534	False	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,4
2020-07-10 00:40:15	20200710010628.txt	2020-07-10 01:06:34	535	False	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	2,3
2020-07-10 01:11:27	20200710013310.txt	2020-07-10 01:33:15	536	False	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	2,4
2020-07-10 01:37:28	20200710015909.txt	2020-07-10 01:59:13	537	False	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	3,4
2020-07-10 02:03:11	20200710022532.txt	2020-07-10 02:25:39	538	False	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,2,3
2020-07-10 02:30:16	20200710025228.txt	2020-07-10 02:52:33	539	False	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,2,4
2020-07-10 02:56:48	20200710031847.txt	2020-07-10 03:18:52	540	False	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,3,4
2020-07-10 03:23:11	20200710034544.txt	2020-07-10 03:45:50	541	False	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	2,3,4
2020-07-10 03:51:04	20200710041318.txt	2020-07-10 04:13:25	542	False	True	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,2,3,4
2020-07-10 04:18:28	20200710043640.txt	2020-07-10 04:36:43	543	False	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1
2020-07-10 04:39:33	20200710045741.txt	2020-07-10 04:57:48	544	False	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	2
2020-07-10 05:02:44	20200710052102.txt	2020-07-10 05:21:08	545	False	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	3
2020-07-10 05:28:04	20200710054627.txt	2020-07-10 05:46:34	546	False	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	4
2020-07-10 05:54:31	20200710061305.txt	2020-07-10 06:13:11	547	False	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,2
2020-07-10 06:18:14	20200710063622.txt	2020-07-10 06:36:29	548	False	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,3
2020-07-10 06:43:13	20200710070104.txt	2020-07-10 07:01:11	549	False	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,4
2020-07-10 07:09:04	20200710072713.txt	2020-07-10 07:27:22	550	False	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	2,3
2020-07-10 07:36:01	20200710075350.txt	2020-07-10 07:54:00	551	False	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	2,4
2020-07-10 08:03:25	20200710082201.txt	2020-07-10 08:22:11	552	False	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	3,4
2020-07-10 08:33:23	20200710085159.txt	2020-07-10 08:52:08	553	False	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,2,3
2020-07-10 09:01:06	20200710092134.txt	2020-07-10 09:21:44	554	False	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,2,4
2020-07-10 09:33:47	20200710100036.txt	2020-07-10 10:00:50	555	False	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,3,4
2020-07-10 10:24:02	20200710105221.txt	2020-07-10 10:52:45	556	False	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	2,3,4
2020-07-10 11:13:23	20200710113618.txt	2020-07-10 11:36:31	557	False	True	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,2,3,4
2020-07-10 11:52:43	20200710123404.txt	2020-07-10 12:34:13	558	False	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1
2020-07-10 12:53:37	20200710134440.txt	2020-07-10 13:44:52	559	False	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	2
2020-07-10 14:07:58	20200710144652.txt	2020-07-10 14:47:08	560	False	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	3
2020-07-10 15:07:24	20200710154403.txt	2020-07-10 15:44:11	561	False	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	4
2020-07-10 16:05:51	20200710164421.txt	2020-07-10 16:44:29	562	False	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,2
2020-07-10 17:07:37	20200710175405.txt	2020-07-10 17:54:13	563	False	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,3
2020-07-10 18:20:02	20200710190658.txt	2020-07-10 19:07:05	564	False	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,4
2020-07-10 19:30:47	20200710210306.txt	2020-07-10 21:03:14	565	False	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	2,3
2020-07-10 21:25:34	20200710220456.txt	2020-07-10 22:05:05	566	False	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	2,4
2020-07-10 22:33:56	20200710230816.txt	2020-07-10 23:08:21	567	False	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	3,4
2020-07-10 23:30:32	20200711000535.txt	2020-07-11 00:05:41	568	False	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,2,3
2020-07-11 00:32:20	20200711010548.txt	2020-07-11 01:05:53	569	False	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,2,4
2020-07-11 01:27:35	20200711015705.txt	2020-07-11 01:57:10	570	False	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,3,4
2020-07-11 02:17:35	20200711024731.txt	2020-07-11 02:47:38	571	False	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	2,3,4
2020-07-11 03:12:46	20200711034311.txt	2020-07-11 03:43:17	572	False	True	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,2,3,4
2020-07-11 04:09:41	20200711043646.txt	2020-07-11 04:36:50	573	False	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1
2020-07-11 04:52:02	20200711051938.txt	2020-07-11 05:19:46	574	False	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	2
2020-07-11 05:44:47	20200711061237.txt	2020-07-11 06:12:45	575	False	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	3
2020-07-11 06:45:49	20200711071419.txt	2020-07-11 07:14:27	576	False	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	4
2020-07-11 07:52:34	20200711082501.txt	2020-07-11 08:25:10	577	False	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,2
2020-07-11 08:55:38	20200711092443.txt	2020-07-11 09:24:52	578	False	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,3
2020-07-11 09:55:19	20200711102146.txt	2020-07-11 10:21:54	579	False	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,4
2020-07-11 10:55:18	20200711111735.txt	2020-07-11 11:17:44	580	False	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	2,3
2020-07-11 11:50:29	20200711121314.txt	2020-07-11 12:13:22	581	False	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	2,4
2020-07-11 12:53:13	20200711131646.txt	2020-07-11 13:16:56	582	False	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	3,4
2020-07-11 13:55:47	20200711141722.txt	2020-07-11 14:17:31	583	False	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,2,3
2020-07-11 14:47:11	20200711150905.txt	2020-07-11 15:09:14	584	False	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,2,4
2020-07-11 15:42:12	20200711160416.txt	2020-07-11 16:04:26	585	False	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,3,4
2020-07-11 16:47:13	20200711170905.txt	2020-07-11 17:09:17	586	False	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	2,3,4
2020-07-11 17:54:55	20200711181641.txt	2020-07-11 18:16:53	587	False	True	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,2,3,4
2020-07-11 19:03:22	20200711191849.txt	2020-07-11 19:18:53	588	False	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1
2020-07-11 19:27:55	20200711194313.txt	2020-07-11 19:43:17	589	False	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	2
2020-07-11 19:57:01	20200711201226.txt	2020-07-11 20:12:30	590	False	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	3
2020-07-11 20:24:23	20200711203957.txt	2020-07-11 20:40:00	591	False	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	4
2020-07-11 20:50:42	20200711210649.txt	2020-07-11 21:06:54	592	False	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,2
2020-07-11 21:20:38	20200711213610.txt	2020-07-11 21:36:14	593	False	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,3
2020-07-11 21:48:25	20200711220434.txt	2020-07-11 22:04:38	594	False	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,4
2020-07-11 22:17:20	20200711223601.txt	2020-07-11 22:36:07	595	False	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	2,3
2020-07-11 22:55:01	20200711231410.txt	2020-07-11 23:14:16	596	False	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	2,4
2020-07-11 23:31:23	20200711235018.txt	2020-07-11 23:50:22	597	False	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	3,4
2020-07-12 00:06:19	20200712002522.txt	2020-07-12 00:25:28	598	False	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,2,3
2020-07-12 00:41:21	20200712005713.txt	2020-07-12 00:57:17	599	False	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,2,4
2020-07-12 01:12:07	20200712012736.txt	2020-07-12 01:27:40	600	False	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,3,4
2020-07-12 01:40:45	20200712015624.txt	2020-07-12 01:56:29	601	False	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	2,3,4
2020-07-12 02:13:42	20200712022917.txt	2020-07-12 02:29:22	602	False	True	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,2,3,4
2020-07-12 02:46:34	20200712025920.txt	2020-07-12 02:59:23	603	False	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1
2020-07-12 03:08:19	20200712032058.txt	2020-07-12 03:21:04	604	False	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	2
2020-07-12 03:37:33	20200712035037.txt	2020-07-12 03:50:43	605	False	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	3
2020-07-12 04:12:23	20200712042501.txt	2020-07-12 04:25:07	606	False	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	4
2020-07-12 04:50:21	20200712050306.txt	2020-07-12 05:03:12	607	False	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,2
2020-07-12 05:19:47	20200712053223.txt	2020-07-12 05:32:29	608	False	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,3
2020-07-12 05:55:06	20200712060744.txt	2020-07-12 06:07:51	609	False	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,4
2020-07-12 06:33:27	20200712064609.txt	2020-07-12 06:46:17	610	False	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	2,3
2020-07-12 07:15:01	20200712072739.txt	2020-07-12 07:27:47	611	False	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	2,4
2020-07-12 08:00:03	20200712081244.txt	2020-07-12 08:12:52	612	False	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	3,4
2020-07-12 08:50:33	20200712090339.txt	2020-07-12 09:03:48	613	False	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,2,3
2020-07-12 09:32:40	20200712094527.txt	2020-07-12 09:45:36	614	False	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,2,4
2020-07-12 10:19:04	20200712103149.txt	2020-07-12 10:31:58	615	False	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,3,4
2020-07-12 11:08:08	20200712112036.txt	2020-07-12 11:20:47	616	False	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	2,3,4
2020-07-12 12:10:25	20200712122850.txt	2020-07-12 12:29:14	617	False	True	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,2,3,4
2020-07-12 13:51:33	20200712141933.txt	2020-07-12 14:19:36	618	False	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1
2020-07-12 14:22:00	20200712145037.txt	2020-07-12 14:50:42	619	False	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2
2020-07-12 14:54:42	20200712151826.txt	2020-07-12 15:18:30	620	False	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	3
2020-07-12 15:21:13	20200712154410.txt	2020-07-12 15:44:13	621	False	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	4
2020-07-12 15:46:40	20200712160947.txt	2020-07-12 16:09:51	622	False	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,2
2020-07-12 16:12:57	20200712163549.txt	2020-07-12 16:35:51	623	False	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,3
2020-07-12 16:38:36	20200712170137.txt	2020-07-12 17:01:40	624	False	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,4
2020-07-12 17:04:12	20200712172713.txt	2020-07-12 17:27:17	625	False	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2,3
2020-07-12 17:30:55	20200712175411.txt	2020-07-12 17:54:15	626	False	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2,4
2020-07-12 17:57:38	20200712182032.txt	2020-07-12 18:20:35	627	False	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	3,4
2020-07-12 18:23:35	20200712184712.txt	2020-07-12 18:47:16	628	False	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,2,3
2020-07-12 18:51:03	20200712192053.txt	2020-07-12 19:20:58	629	False	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,2,4
2020-07-12 19:24:59	20200712195021.txt	2020-07-12 19:50:24	630	False	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,3,4
2020-07-12 19:53:28	20200712201950.txt	2020-07-12 20:19:54	631	False	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	2,3,4
2020-07-12 20:24:18	20200712205116.txt	2020-07-12 20:51:21	632	False	False	count_occurence	True		rtf	\N	3938	True	True	None	True	True	1,2,3,4
2020-07-12 20:56:10	20200712212206.txt	2020-07-12 21:22:09	633	False	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1
2020-07-12 21:25:04	20200712214910.txt	2020-07-12 21:49:16	634	False	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	2
2020-07-12 21:54:36	20200712222434.txt	2020-07-12 22:24:41	635	False	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	3
2020-07-12 22:32:06	20200712230234.txt	2020-07-12 23:02:41	636	False	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	4
2020-07-12 23:11:33	20200712234017.txt	2020-07-12 23:40:22	637	False	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,2
2020-07-12 23:45:47	20200713001237.txt	2020-07-13 00:12:44	638	False	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,3
2020-07-13 00:20:29	20200713004602.txt	2020-07-13 00:46:08	639	False	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,4
2020-07-13 00:53:08	20200713011456.txt	2020-07-13 01:15:04	640	False	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	2,3
2020-07-13 01:23:14	20200713014449.txt	2020-07-13 01:44:58	641	False	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	2,4
2020-07-13 01:53:25	20200713021517.txt	2020-07-13 02:15:25	642	False	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	3,4
2020-07-13 02:25:43	20200713024739.txt	2020-07-13 02:47:46	643	False	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,2,3
2020-07-13 02:55:49	20200713031747.txt	2020-07-13 03:17:55	644	False	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,2,4
2020-07-13 03:27:05	20200713034847.txt	2020-07-13 03:48:54	645	False	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,3,4
2020-07-13 04:00:16	20200713042151.txt	2020-07-13 04:22:01	646	False	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	2,3,4
2020-07-13 04:34:19	20200713045610.txt	2020-07-13 04:56:21	647	False	False	count_occurence	True		rtf	\N	3938	True	True	None	False	True	1,2,3,4
2020-07-13 05:08:56	20200713052325.txt	2020-07-13 05:23:28	648	False	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1
2020-07-13 05:25:41	20200713054006.txt	2020-07-13 05:40:09	649	False	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	2
2020-07-13 05:43:18	20200713055759.txt	2020-07-13 05:58:02	650	False	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	3
2020-07-13 06:00:49	20200713061518.txt	2020-07-13 06:15:21	651	False	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	4
2020-07-13 06:17:50	20200713063233.txt	2020-07-13 06:32:37	652	False	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,2
2020-07-13 06:36:23	20200713065055.txt	2020-07-13 06:50:58	653	False	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,3
2020-07-13 06:53:46	20200713070828.txt	2020-07-13 07:08:31	654	False	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,4
2020-07-13 07:11:04	20200713072534.txt	2020-07-13 07:25:38	655	False	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	2,3
2020-07-13 07:29:14	20200713074351.txt	2020-07-13 07:43:54	656	False	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	2,4
2020-07-13 07:47:12	20200713080147.txt	2020-07-13 08:01:50	657	False	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	3,4
2020-07-13 08:04:57	20200713081937.txt	2020-07-13 08:19:42	658	False	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,2,3
2020-07-13 08:23:19	20200713084026.txt	2020-07-13 08:40:31	659	False	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,2,4
2020-07-13 08:45:12	20200713090503.txt	2020-07-13 09:05:08	660	False	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,3,4
2020-07-13 09:09:02	20200713092722.txt	2020-07-13 09:27:26	661	False	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	2,3,4
2020-07-13 09:32:53	20200713095128.txt	2020-07-13 09:51:33	662	False	False	count_occurence	True		rtf	\N	3970	True	True	None	True	False	1,2,3,4
2020-07-13 09:56:40	20200713101019.txt	2020-07-13 10:10:22	663	False	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1
2020-07-13 10:12:58	20200713102645.txt	2020-07-13 10:26:49	664	False	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	2
2020-07-13 10:31:21	20200713105313.txt	2020-07-13 10:53:19	665	False	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	3
2020-07-13 11:00:17	20200713111428.txt	2020-07-13 11:14:34	666	False	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	4
2020-07-13 11:21:54	20200713113632.txt	2020-07-13 11:36:38	667	False	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,2
2020-07-13 11:41:27	20200713115352.txt	2020-07-13 11:53:57	668	False	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,3
2020-07-13 12:00:03	20200713121233.txt	2020-07-13 12:12:39	669	False	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,4
2020-07-13 12:19:08	20200713123152.txt	2020-07-13 12:32:00	670	False	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	2,3
2020-07-13 12:39:18	20200713125259.txt	2020-07-13 12:53:09	671	False	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	2,4
2020-07-13 13:03:13	20200713131614.txt	2020-07-13 13:16:22	672	False	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	3,4
2020-07-13 13:30:57	20200713134821.txt	2020-07-13 13:48:31	673	False	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,2,3
2020-07-13 13:57:56	20200713141143.txt	2020-07-13 14:11:51	674	False	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,2,4
2020-07-13 14:21:11	20200713143437.txt	2020-07-13 14:34:46	675	False	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,3,4
2020-07-13 14:45:53	20200713150029.txt	2020-07-13 15:00:40	676	False	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	2,3,4
2020-07-13 15:14:26	20200713152754.txt	2020-07-13 15:28:05	677	False	False	count_occurence	True		rtf	\N	3970	True	True	None	False	False	1,2,3,4
2020-07-13 15:42:17	20200713161111.txt	2020-07-13 16:11:18	678	False	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1
2020-07-13 16:29:01	20200713165857.txt	2020-07-13 16:59:03	679	False	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	2
2020-07-13 17:16:36	20200713174355.txt	2020-07-13 17:44:00	680	False	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	3
2020-07-13 17:59:34	20200713182626.txt	2020-07-13 18:26:30	681	False	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	4
2020-07-13 18:40:28	20200713191102.txt	2020-07-13 19:11:09	682	False	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,2
2020-07-13 19:30:52	20200713195959.txt	2020-07-13 20:00:05	683	False	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,3
2020-07-13 20:16:42	20200713204602.txt	2020-07-13 20:46:07	684	False	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,4
2020-07-13 21:05:11	20200713214752.txt	2020-07-13 21:48:05	685	False	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	2,3
2020-07-13 22:12:12	20200713224844.txt	2020-07-13 22:48:53	686	False	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	2,4
2020-07-13 23:14:18	20200713235200.txt	2020-07-13 23:52:07	687	False	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	3,4
2020-07-14 00:14:43	20200714005235.txt	2020-07-14 00:52:44	688	False	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,2,3
2020-07-14 01:19:59	20200714015655.txt	2020-07-14 01:57:02	689	False	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,2,4
2020-07-14 02:19:32	20200714024921.txt	2020-07-14 02:49:26	690	False	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,3,4
2020-07-14 03:07:33	20200714033710.txt	2020-07-14 03:37:17	691	False	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	2,3,4
2020-07-14 04:01:17	20200714043137.txt	2020-07-14 04:31:45	692	False	False	count_occurence	True		rtf	\N	19106	False	True	None	True	True	1,2,3,4
2020-07-14 04:55:40	20200714052224.txt	2020-07-14 05:22:29	693	False	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1
2020-07-14 05:35:44	20200714060309.txt	2020-07-14 06:03:17	694	False	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	2
2020-07-14 06:28:15	20200714065556.txt	2020-07-14 06:56:04	695	False	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	3
2020-07-14 07:28:46	20200714075704.txt	2020-07-14 07:57:13	696	False	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	4
2020-07-14 08:37:11	20200714090523.txt	2020-07-14 09:05:37	697	False	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,2
2020-07-14 09:50:14	20200714101426.txt	2020-07-14 10:14:33	698	False	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,3
2020-07-14 10:43:07	20200714111336.txt	2020-07-14 11:13:47	699	False	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,4
2020-07-14 11:44:29	20200714120909.txt	2020-07-14 12:09:21	700	False	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	2,3
2020-07-14 12:49:38	20200714132038.txt	2020-07-14 13:20:52	701	False	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	2,4
2020-07-14 14:03:50	20200714144520.txt	2020-07-14 14:45:34	702	False	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	3,4
2020-07-14 15:32:21	20200714155507.txt	2020-07-14 15:55:18	703	False	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,2,3
2020-07-14 16:29:27	20200714165443.txt	2020-07-14 16:54:55	704	False	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,2,4
2020-07-14 17:38:46	20200714180126.txt	2020-07-14 18:01:36	705	False	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,3,4
2020-07-14 18:44:56	20200714190827.txt	2020-07-14 19:08:41	706	False	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	2,3,4
2020-07-14 19:58:26	20200714201927.txt	2020-07-14 20:19:40	707	False	False	count_occurence	True		rtf	\N	19106	False	True	None	False	True	1,2,3,4
2020-07-14 21:07:54	20200714212157.txt	2020-07-14 21:22:00	708	False	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1
2020-07-14 21:31:38	20200714214538.txt	2020-07-14 21:45:42	709	False	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	2
2020-07-14 21:59:56	20200714221630.txt	2020-07-14 22:16:35	710	False	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	3
2020-07-14 22:31:08	20200714224823.txt	2020-07-14 22:48:28	711	False	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	4
2020-07-14 23:03:53	20200714232140.txt	2020-07-14 23:21:46	712	False	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,2
2020-07-14 23:38:41	20200714235555.txt	2020-07-14 23:56:00	713	False	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,3
2020-07-15 00:12:12	20200715002951.txt	2020-07-15 00:29:55	714	False	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,4
2020-07-15 00:43:54	20200715010039.txt	2020-07-15 01:00:44	715	False	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	2,3
2020-07-15 01:15:50	20200715012924.txt	2020-07-15 01:29:29	716	False	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	2,4
2020-07-15 01:43:32	20200715015716.txt	2020-07-15 01:57:19	717	False	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	3,4
2020-07-15 02:09:44	20200715022343.txt	2020-07-15 02:23:48	718	False	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,2,3
2020-07-15 02:39:19	20200715025252.txt	2020-07-15 02:52:57	719	False	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,2,4
2020-07-15 03:07:44	20200715032122.txt	2020-07-15 03:21:26	720	False	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,3,4
2020-07-15 03:34:09	20200715034743.txt	2020-07-15 03:47:48	721	False	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	2,3,4
2020-07-15 04:04:08	20200715041751.txt	2020-07-15 04:17:57	722	False	False	count_occurence	True		rtf	\N	19310	False	True	None	True	False	1,2,3,4
2020-07-15 04:34:26	20200715044546.txt	2020-07-15 04:45:49	723	False	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1
2020-07-15 04:54:58	20200715050615.txt	2020-07-15 05:06:21	724	False	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	2
2020-07-15 05:23:25	20200715053436.txt	2020-07-15 05:34:42	725	False	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	3
2020-07-15 05:56:29	20200715060753.txt	2020-07-15 06:07:59	726	False	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	4
2020-07-15 06:33:32	20200715064449.txt	2020-07-15 06:44:55	727	False	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,2
2020-07-15 07:02:21	20200715071342.txt	2020-07-15 07:13:48	728	False	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,3
2020-07-15 07:34:44	20200715074601.txt	2020-07-15 07:46:07	729	False	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,4
2020-07-15 08:12:42	20200715082404.txt	2020-07-15 08:24:12	730	False	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	2,3
2020-07-15 08:53:02	20200715090434.txt	2020-07-15 09:04:43	731	False	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	2,4
2020-07-15 09:36:46	20200715094818.txt	2020-07-15 09:48:27	732	False	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	3,4
2020-07-15 10:34:45	20200715104856.txt	2020-07-15 10:49:06	733	False	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,2,3
2020-07-15 11:24:15	20200715113653.txt	2020-07-15 11:37:02	734	False	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,2,4
2020-07-15 12:17:45	20200715123030.txt	2020-07-15 12:30:42	735	False	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,3,4
2020-07-15 13:10:16	20200715132150.txt	2020-07-15 13:22:02	736	False	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	2,3,4
2020-07-15 14:04:23	20200715141548.txt	2020-07-15 14:15:59	737	False	False	count_occurence	True		rtf	\N	19310	False	True	None	False	False	1,2,3,4
\.


--
-- TOC entry 2879 (class 0 OID 16393)
-- Dependencies: 204
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test (id, comment) FROM stdin;
11	alright
12	not right
\.


--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 206
-- Name: evaluation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evaluation_id_seq', 2358, true);


--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 205
-- Name: results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.results_id_seq', 737, true);


--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 203
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.test_id_seq', 12, true);


--
-- TOC entry 2749 (class 2606 OID 24712)
-- Name: evaluation evaluation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_pk PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 24819)
-- Name: preprocessing preprocessing_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preprocessing
    ADD CONSTRAINT preprocessing_pk PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 24820)
-- Name: evaluation evaluation_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_fk FOREIGN KEY (preprocessing_id) REFERENCES public.preprocessing(id);


-- Completed on 2020-07-23 12:45:20 UTC

--
-- PostgreSQL database dump complete
--

