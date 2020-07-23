--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-2.pgdg16.04+1)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-2.pgdg16.04+1)

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
-- Name: evaluation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evaluation_id_seq OWNED BY public.evaluation.id;


--
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
    ngram_mixed character varying
);


ALTER TABLE public.preprocessing OWNER TO postgres;

--
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
-- Name: results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.results_id_seq OWNED BY public.preprocessing.id;


--
-- Name: test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test (
    id integer NOT NULL,
    comment character varying
);


ALTER TABLE public.test OWNER TO postgres;

--
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
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.test_id_seq OWNED BY public.test.id;


--
-- Name: evaluation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation ALTER COLUMN id SET DEFAULT nextval('public.evaluation_id_seq'::regclass);


--
-- Name: preprocessing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preprocessing ALTER COLUMN id SET DEFAULT nextval('public.results_id_seq'::regclass);


--
-- Name: test id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test ALTER COLUMN id SET DEFAULT nextval('public.test_id_seq'::regclass);


--
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
\.


--
-- Data for Name: preprocessing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.preprocessing (preprocessing_start, sample_file_path, preprocessing_end, id, stop_word_removed, stemming, embedding_method, strigent_topic, exclude_contracts, input_format, ngram, sample_count, multiple_paragraphs, ngram_mixed) FROM stdin;
2020-03-12 23:02:51	20200312230255.txt	2020-03-12 23:02:55	177	True	True	count_occurence	True		rtf	3	\N	\N	\N
2020-03-12 23:07:08	20200312230806.txt	2020-03-12 23:08:06	181	True	True	count_occurence	True		rtf	3	\N	\N	\N
2020-03-12 22:52:06	20200312225239.txt	2020-03-12 22:52:40	173	True	True	count_occurence	True		rtf	\N	\N	\N	\N
2020-03-16 16:54:24	20200316171827.txt	2020-03-16 17:18:27	185	True	False	count_occurence	True		rtf	1	0	False	\N
2020-03-17 13:38:27	20200317133859.txt	2020-03-17 13:38:59	189	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-17 13:40:59	20200317134116.txt	2020-03-17 13:41:16	192	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-17 13:42:15	20200317134216.txt	2020-03-17 13:42:16	195	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-17 13:43:21	20200317134617.txt	2020-03-17 13:46:17	198	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-17 13:48:04	20200317134844.txt	2020-03-17 13:48:44	201	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-17 13:49:57	20200317135229.txt	2020-03-17 13:52:29	204	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-17 13:53:38	20200317135339.txt	2020-03-17 13:53:39	207	True	False	count_occurence	True		rtf	1	1	True	\N
2020-03-17 13:54:52	20200317135551.txt	2020-03-17 13:55:51	210	True	False	count_occurence	True		rtf	1	1	True	\N
2020-03-17 14:58:02	20200317150747.txt	2020-03-17 15:07:50	213	True	False	count_occurence	True		rtf	1	1815	True	\N
2020-03-18 14:56:34	20200318150349.txt	2020-03-18 15:03:53	216	True	False	count_occurence	True		rtf	4	1815	True	True
2020-03-18 16:06:24	20200318161330.txt	2020-03-18 16:13:33	219	False	False	count_occurence	True		rtf	1	1815	True	True
2020-03-18 16:58:52	20200318170742.txt	2020-03-18 17:07:48	222	False	False	count_occurence	True		rtf	4	1815	True	True
2020-03-24 13:00:31	20200324130703.txt	2020-03-24 13:07:05	228	False	False	count_occurence	True		rtf	3	1817	True	False
2020-03-24 13:39:32	20200324134556.txt	2020-03-24 13:45:59	231	False	False	count_occurence	True		rtf	6	1809	True	False
2019-12-03 12:54:55	\N	2019-12-03 12:54:55	3	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-03-12 22:54:24	20200312225424.txt	2020-03-12 22:54:24	174	True	True	count_occurence	True		rtf	3	\N	\N	\N
2020-03-12 23:03:06	20200312230555.txt	2020-03-12 23:05:55	178	True	True	count_occurence	True		rtf	3	\N	\N	\N
2020-03-12 23:08:11	20200312230816.txt	2020-03-12 23:08:16	182	True	True	count_occurence	True		rtf	3	\N	\N	\N
2020-03-17 13:32:27	20200317133229.txt	2020-03-17 13:32:29	186	True	False	count_occurence	True		rtf	1	101	False	\N
2020-03-17 13:39:23	20200317134042.txt	2020-03-17 13:40:42	190	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-17 13:41:20	20200317134122.txt	2020-03-17 13:41:22	193	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-17 13:42:36	20200317134304.txt	2020-03-17 13:43:04	196	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-17 13:46:20	20200317134623.txt	2020-03-17 13:46:23	199	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-17 13:48:47	20200317134849.txt	2020-03-17 13:48:49	202	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-17 13:52:33	20200317135236.txt	2020-03-17 13:52:36	205	True	False	count_occurence	True		rtf	1	1	True	\N
2020-03-17 13:53:59	20200317135427.txt	2020-03-17 13:54:27	208	True	False	count_occurence	True		rtf	1	1	True	\N
2020-03-17 13:55:55	20200317135556.txt	2020-03-17 13:55:56	211	True	False	count_occurence	True		rtf	1	12	True	\N
2020-03-18 14:10:46	20200318141919.txt	2020-03-18 14:19:22	214	True	False	count_occurence	True		rtf	2	1815	True	True
2020-03-18 15:10:25	20200318151808.txt	2020-03-18 15:18:13	217	True	False	count_occurence	True		rtf	5	1815	True	True
2020-03-18 16:19:00	20200318162659.txt	2020-03-18 16:27:02	220	False	False	count_occurence	True		rtf	2	1815	True	True
2020-03-18 17:18:17	20200318172529.txt	2020-03-18 17:25:36	223	False	False	count_occurence	True		rtf	5	1815	True	True
2020-03-20 12:44:46	20200320125538.txt	2020-03-20 12:55:41	225	True	False	count_occurence	True		rtf	1	23435	False	True
2020-03-24 12:27:47	20200324122821.txt	2020-03-24 12:28:23	226	False	False	count_occurence	True		rtf	2	0	True	False
2020-03-24 13:12:55	20200324131855.txt	2020-03-24 13:18:57	229	False	False	count_occurence	True		rtf	4	1812	True	False
2020-03-24 14:09:54	20200324142514.txt	2020-03-24 14:25:30	232	False	False	count_occurence	True		rtf	4	23460	False	True
2019-12-11 15:08:34	20191211150851.txt	2019-12-11 15:08:51	61	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-03-12 22:55:28	20200312225537.txt	2020-03-12 22:55:37	175	True	True	count_occurence	True		rtf	3	\N	\N	\N
2020-01-09 16:16:36	20200109161845.txt	2020-01-09 16:18:46	143	True	True	boolean_occurence	True	Cont_0357.rtf,Cont_0114.rtf,Cont_0344.rtf,Cont_0345.rtf,Cont_0062.rtf	\N	1	\N	\N	\N
2020-03-12 23:05:59	20200312230652.txt	2020-03-12 23:06:52	179	True	True	count_occurence	True		rtf	3	\N	\N	\N
2020-03-12 23:08:43	20200312232137.txt	2020-03-12 23:21:42	183	True	True	count_occurence	True		rtf	3	\N	\N	\N
2020-03-17 13:33:11	20200317133328.txt	2020-03-17 13:33:28	187	True	False	count_occurence	True		rtf	1	0	False	\N
2020-03-17 13:40:46	20200317134053.txt	2020-03-17 13:40:53	191	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-17 13:41:38	20200317134212.txt	2020-03-17 13:42:12	194	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-17 13:43:07	20200317134309.txt	2020-03-17 13:43:09	197	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-17 13:46:31	20200317134800.txt	2020-03-17 13:48:00	200	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-17 13:49:28	20200317134954.txt	2020-03-17 13:49:54	203	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-17 13:53:04	20200317135325.txt	2020-03-17 13:53:25	206	True	False	count_occurence	True		rtf	1	1	True	\N
2020-03-17 13:54:43	20200317135448.txt	2020-03-17 13:54:48	209	True	False	count_occurence	True		rtf	1	1	True	\N
2020-03-17 14:56:57	20200317145657.txt	2020-03-17 14:56:57	212	True	False	count_occurence	True		rtf	1	0	True	\N
2020-03-18 14:39:03	20200318144722.txt	2020-03-18 14:47:25	215	True	False	count_occurence	True		rtf	3	1815	True	True
2020-03-18 15:36:49	20200318154435.txt	2020-03-18 15:44:40	218	True	False	count_occurence	True		rtf	6	1815	True	True
2020-03-18 16:33:08	20200318164105.txt	2020-03-18 16:41:09	221	False	False	count_occurence	True		rtf	3	1815	True	True
2020-03-18 17:56:29	20200318180800.txt	2020-03-18 18:08:12	224	False	False	count_occurence	True		rtf	6	1815	True	True
2020-03-24 12:48:24	20200324125444.txt	2020-03-24 12:54:47	227	False	False	count_occurence	True		rtf	2	1805	True	False
2020-03-24 13:28:45	20200324133512.txt	2020-03-24 13:35:15	230	False	False	count_occurence	True		rtf	5	1812	True	False
2019-12-03 12:58:45	\N	2019-12-03 12:58:45	4	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-17 14:37:11	20191217144158.txt	2019-12-17 14:41:58	92	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-17 14:43:17	20191217144418.txt	2019-12-17 14:44:18	93	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-17 14:56:11	20191217145657.txt	2019-12-17 14:56:57	94	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-17 15:29:09	20191217153339.txt	2019-12-17 15:33:40	95	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-17 17:07:52	20191217170950.txt	2019-12-17 17:09:51	96	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-18 13:59:11	20191218135912.txt	2019-12-18 13:59:12	97	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-18 16:18:02	20191218161955.txt	2019-12-18 16:19:56	98	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-18 16:29:55	20191218162956.txt	2019-12-18 16:29:56	99	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-18 17:05:44	20191218170547.txt	2019-12-18 17:05:49	100	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-18 17:06:02	20191218170619.txt	2019-12-18 17:06:20	101	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-18 17:08:09	20191218170812.txt	2019-12-18 17:08:13	102	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-04 13:51:02	\N	2019-12-04 15:45:25	5	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-06 17:41:16	\N	2019-12-06 17:41:17	6	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-06 17:51:52	\N	2019-12-06 17:51:52	7	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-10 14:53:31	\N	2019-12-10 14:53:31	8	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-10 15:03:57	\N	2019-12-10 15:03:58	9	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-10 15:05:20	\N	2019-12-10 15:05:21	10	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-10 19:41:01	20191210194300.txt	2019-12-10 19:43:00	12	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 11:41:21	20191211114306.txt	2019-12-11 11:43:06	13	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 11:50:24	20191211123520.txt	2019-12-11 12:35:21	14	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 12:35:44	20191211123545.txt	2019-12-11 12:35:45	15	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 12:37:28	20191211123729.txt	2019-12-11 12:37:29	16	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 12:39:18	20191211123929.txt	2019-12-11 12:39:29	17	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 12:39:59	20191211124148.txt	2019-12-11 12:41:49	18	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 12:42:36	20191211124237.txt	2019-12-11 12:42:38	19	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 12:42:56	20191211124324.txt	2019-12-11 12:43:25	20	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 12:43:35	20191211124337.txt	2019-12-11 12:43:37	21	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 12:44:05	20191211124939.txt	2019-12-11 12:49:39	22	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 12:50:21	20191211125059.txt	2019-12-11 12:50:59	23	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-14 12:37:54	20200114124002.txt	2020-01-14 12:40:03	144	True	True	count_occurence	True	Cont_0357.rtf,Cont_0114.rtf,Cont_0344.rtf,Cont_0345.rtf,Cont_0062.rtf	\N	1	\N	\N	\N
2020-01-08 18:00:58	20200108180330.txt	2020-01-08 18:03:31	139	True	True	count_occurence		\N	\N	1	\N	\N	\N
2020-01-08 15:30:56	20200109153849.txt	2020-01-08 15:45:56	141	True	True	boolean_occurence	False	\N	\N	1	\N	\N	\N
2020-03-04 13:37:45	20200304134000.txt	2020-03-04 13:40:01	145	True	True	count_occurence	True		\N	1	\N	\N	\N
2020-03-04 18:12:03	20200304181217.txt	2020-03-04 18:12:19	146	True	True	count_occurence	True		docx	1	\N	\N	\N
2019-12-18 17:10:30	20191218171033.txt	2019-12-18 17:10:35	103	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-19 20:16:13	20191219202300.txt	2019-12-19 20:23:02	104	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-03 11:46:26	\N	2019-12-03 11:46:27	1	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 12:51:15	20191211125116.txt	2019-12-11 12:51:16	24	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 12:51:49	20191211125150.txt	2019-12-11 12:51:50	25	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 12:52:51	20191211125252.txt	2019-12-11 12:52:52	26	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 12:53:22	20191211125324.txt	2019-12-11 12:53:25	27	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 12:54:54	20191211125456.txt	2019-12-11 12:54:56	28	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 12:55:34	20191211125535.txt	2019-12-11 12:55:36	29	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 12:57:34	20191211125848.txt	2019-12-11 12:58:49	30	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 13:00:23	20191211130046.txt	2019-12-11 13:00:46	31	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 13:00:49	20191211130101.txt	2019-12-11 13:01:02	32	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 13:02:42	20191211130250.txt	2019-12-11 13:02:50	33	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 13:03:07	20191211130314.txt	2019-12-11 13:03:14	34	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 13:04:33	20191211130439.txt	2019-12-11 13:04:39	35	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 13:05:21	20191211130529.txt	2019-12-11 13:05:30	36	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 13:05:51	20191211130553.txt	2019-12-11 13:05:53	37	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 13:38:59	20191211134058.txt	2019-12-11 13:40:58	38	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:08:48	20191211141658.txt	2019-12-11 14:16:58	39	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:17:00	20191211141908.txt	2019-12-11 14:19:08	40	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:19:10	20191211141911.txt	2019-12-11 14:19:12	41	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:20:16	20191211142213.txt	2019-12-11 14:22:13	42	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:25:07	20191211142628.txt	2019-12-11 14:26:28	43	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:26:30	20191211142631.txt	2019-12-11 14:26:31	44	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:27:10	20191211142711.txt	2019-12-11 14:27:12	45	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:28:03	20191211142804.txt	2019-12-11 14:28:04	46	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:28:19	20191211142854.txt	2019-12-11 14:28:54	47	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:29:00	20191211142936.txt	2019-12-11 14:29:36	48	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:29:45	20191211143052.txt	2019-12-11 14:30:52	49	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:31:10	20191211143132.txt	2019-12-11 14:31:32	50	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:31:46	20191211143155.txt	2019-12-11 14:31:55	51	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:32:12	20191211143420.txt	2019-12-11 14:34:20	52	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:34:45	20191211143654.txt	2019-12-11 14:36:54	53	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:48:09	20191211144817.txt	2019-12-11 14:48:17	54	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:48:58	20191211144859.txt	2019-12-11 14:48:59	55	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:59:07	20191211145908.txt	2019-12-11 14:59:08	56	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 14:59:53	20191211145953.txt	2019-12-11 14:59:54	57	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 15:00:39	20191211150501.txt	2019-12-11 15:05:01	58	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 15:07:52	20191211150753.txt	2019-12-11 15:07:53	59	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 15:08:05	20191211150806.txt	2019-12-11 15:08:06	60	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 15:08:57	20191211151024.txt	2019-12-11 15:10:24	62	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 15:10:26	20191211160634.txt	2019-12-11 16:06:34	63	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 16:06:38	20191211160708.txt	2019-12-11 16:07:09	64	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 16:07:15	20191211160716.txt	2019-12-11 16:07:16	65	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-11 16:07:23	20191211175316.txt	2019-12-11 17:53:16	66	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-13 11:36:48	20191213135825.txt	2019-12-13 13:58:25	67	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-13 14:01:18	20191213182539.txt	2019-12-13 18:25:40	68	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-13 19:12:19	20191213191550.txt	2019-12-13 19:15:50	69	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-13 19:26:32	20191213192721.txt	2019-12-13 19:27:21	70	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-13 19:27:29	20191213193024.txt	2019-12-13 19:30:24	71	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-13 19:30:26	20191213193027.txt	2019-12-13 19:30:27	72	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-13 19:30:56	20191213193057.txt	2019-12-13 19:30:57	73	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-13 19:31:10	20191213193111.txt	2019-12-13 19:31:11	74	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-13 19:31:26	20191213193126.txt	2019-12-13 19:31:27	75	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-13 19:37:41	20191213193843.txt	2019-12-13 19:38:43	76	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-13 19:43:06	20191213194307.txt	2019-12-13 19:43:08	77	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-13 20:04:46	20191213200447.txt	2019-12-13 20:04:48	78	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-13 21:28:45	20191214202536.txt	2019-12-14 20:25:37	79	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-16 16:03:41	20191216160501.txt	2019-12-16 16:05:01	80	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-16 16:12:26	20191216161317.txt	2019-12-16 16:13:18	81	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-16 17:41:19	20191216174120.txt	2019-12-16 17:41:20	82	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-16 17:57:20	20191216175845.txt	2019-12-16 17:58:45	83	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-16 18:43:08	20191216184808.txt	2019-12-16 18:48:08	84	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-16 19:02:46	20191216190247.txt	2019-12-16 19:02:47	85	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-16 19:30:09	20191216193025.txt	2019-12-16 19:30:25	86	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-16 20:30:30	20191216203037.txt	2019-12-16 20:30:38	87	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-16 20:32:58	20191216203304.txt	2019-12-16 20:33:05	88	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-16 20:33:17	20191216203322.txt	2019-12-16 20:33:22	89	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-16 20:33:42	20191216203351.txt	2019-12-16 20:33:51	90	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-17 09:44:07	20191217094823.txt	2019-12-17 09:48:23	91	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-03 12:49:28	\N	2019-12-03 12:49:28	2	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2019-12-10 19:00:08	20191210190008.txt	2019-12-10 19:00:09	11	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 16:50:11	20200103165050.txt	2020-01-03 16:50:50	105	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 16:54:42	20200103165632.txt	2020-01-03 16:56:33	106	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 17:33:32	20200103173334.txt	2020-01-03 17:33:34	107	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 17:37:48	20200103173749.txt	2020-01-03 17:37:49	108	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 17:55:40	20200103175541.txt	2020-01-03 17:55:41	109	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:02:38	20200103180239.txt	2020-01-03 18:02:40	110	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:02:54	20200103180255.txt	2020-01-03 18:02:56	111	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:09:06	20200103180908.txt	2020-01-03 18:09:09	112	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:07:35	20200103181216.txt	2020-01-03 18:12:17	113	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:14:25	20200103181427.txt	2020-01-03 18:14:27	114	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:16:35	20200103181636.txt	2020-01-03 18:16:36	115	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:17:30	20200103181731.txt	2020-01-03 18:17:32	116	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:21:47	20200103182148.txt	2020-01-03 18:21:49	117	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:22:39	20200103182312.txt	2020-01-03 18:23:13	118	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:29:37	20200103182938.txt	2020-01-03 18:29:38	119	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:30:10	20200103183020.txt	2020-01-03 18:30:20	120	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:37:00	20200103183702.txt	2020-01-03 18:37:02	121	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:37:32	20200103183733.txt	2020-01-03 18:37:34	122	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:38:28	20200103183829.txt	2020-01-03 18:38:30	123	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:42:19	20200103184220.txt	2020-01-03 18:42:21	124	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:44:40	20200103184442.txt	2020-01-03 18:44:42	125	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:45:22	20200103184523.txt	2020-01-03 18:45:24	126	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:45:55	20200103184557.txt	2020-01-03 18:45:57	127	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-03 18:47:51	20200103185210.txt	2020-01-03 18:52:11	128	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-06 12:48:46	20200106125246.txt	2020-01-06 12:52:48	129	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-06 13:46:26	20200106135046.txt	2020-01-06 13:50:48	130	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-06 18:25:36	20200106183023.txt	2020-01-06 18:30:26	131	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-06 18:59:48	20200106190531.txt	2020-01-06 19:05:33	132	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-06 19:33:44	20200106193849.txt	2020-01-06 19:38:52	133	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-07 10:05:45	20200107100628.txt	2020-01-07 10:06:28	134	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-07 12:05:03	20200107120539.txt	2020-01-07 12:05:40	135	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-07 12:10:41	20200107121125.txt	2020-01-07 12:11:26	136	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-07 17:56:27	20200107175847.txt	2020-01-07 17:58:48	137	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-08 16:35:06	20200108163729.txt	2020-01-08 16:37:30	138	True	True	count_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-09 15:45:56	20200109155444.txt	2020-01-09 16:05:56	142	True	True	boolean_occurence	\N	\N	\N	1	\N	\N	\N
2020-01-08 18:23:56	20200108183635.txt	2020-01-08 18:36:37	140	True	True	count_occurence	False	\N	\N	1	\N	\N	\N
2020-03-04 18:16:04	20200304181620.txt	2020-03-04 18:16:21	147	True	True	count_occurence	True		docx	1	\N	\N	\N
2020-03-04 18:17:44	20200304181800.txt	2020-03-04 18:18:01	148	True	True	count_occurence	True		docx	1	\N	\N	\N
2020-03-04 18:37:06	20200304183721.txt	2020-03-04 18:37:23	149	True	True	count_occurence	True		docx	1	\N	\N	\N
2020-03-04 18:41:15	20200304184128.txt	2020-03-04 18:41:28	150	True	True	count_occurence	True		docx	1	\N	\N	\N
2020-03-04 18:42:09	20200304184221.txt	2020-03-04 18:42:21	151	True	True	count_occurence	True		docx	1	\N	\N	\N
2020-03-04 19:01:56	20200304190208.txt	2020-03-04 19:02:08	152	True	True	count_occurence	True		docx	1	\N	\N	\N
2020-03-04 19:03:06	20200304190317.txt	2020-03-04 19:03:17	153	True	True	count_occurence	True		docx	1	\N	\N	\N
2020-03-04 19:04:50	20200304190501.txt	2020-03-04 19:05:01	154	True	True	count_occurence	True		docx	1	\N	\N	\N
2020-03-04 19:20:37	20200304193113.txt	2020-03-04 19:31:16	155	True	False	count_occurence	True		docx	1	\N	\N	\N
2020-03-06 12:27:20	20200306122927.txt	2020-03-06 12:29:30	156	True	True	count_occurence	True		rtf	1	\N	\N	\N
2020-03-06 12:32:08	20200306124345.txt	2020-03-06 12:43:49	157	True	True	count_occurence	False		rtf	1	\N	\N	\N
2020-03-10 13:08:18	20200310131035.txt	2020-03-10 13:10:38	158	True	False	count_occurence	True		rtf	1	\N	\N	\N
2020-03-12 20:19:39	20200312202014	2020-03-12 20:20:17	159	True	True	tfidf	True		rtf	1	\N	\N	\N
2020-03-12 20:21:01	20200312202133	2020-03-12 20:21:35	160	True	True	tfidf	True		rtf	1	\N	\N	\N
2020-03-12 20:36:25	20200312203638	2020-03-12 20:36:40	161	True	True	tfidf	True		rtf	1	\N	\N	\N
2020-03-12 20:37:09	20200312203713	2020-03-12 20:37:16	162	True	True	tfidf	True		rtf	1	\N	\N	\N
2020-03-12 20:38:03	20200312203805	2020-03-12 20:38:07	163	True	True	tfidf	True		rtf	1	\N	\N	\N
2020-03-12 20:39:05	20200312203909	2020-03-12 20:39:11	164	True	True	tfidf	True		rtf	1	\N	\N	\N
2020-03-12 20:42:34	20200312204243	2020-03-12 20:42:45	165	True	True	tfidf	True		rtf	1	\N	\N	\N
2020-03-12 20:44:16	20200312204419	2020-03-12 20:44:21	166	True	True	count_occurence	True		rtf	1	\N	\N	\N
2020-03-12 20:46:23	20200312204728	2020-03-12 20:47:31	167	True	True	count_occurence	True		rtf	1	\N	\N	\N
2020-03-12 20:56:33	20200312205639	2020-03-12 20:56:41	168	True	True	count_occurence	True		rtf	1	\N	\N	\N
2020-03-12 20:57:57	20200312205809	2020-03-12 20:58:12	169	True	True	count_occurence	True		rtf	1	\N	\N	\N
2020-03-12 21:43:57	20200312215524.txt	2020-03-12 21:55:43	171	True	True	tfidf	True		rtf	1	\N	\N	\N
2020-03-12 21:35:05	20200312213513.txt	2020-03-12 21:35:16	170	True	True	tfidf	True		rtf	1	\N	\N	\N
2020-03-12 22:32:31	20200312224453.txt	2020-03-12 22:45:08	172	True	True	tfidf	True		rtf	1	\N	\N	\N
2020-03-12 22:56:12	20200312230246.txt	2020-03-12 23:02:46	176	True	True	count_occurence	True		rtf	3	\N	\N	\N
2020-03-12 23:06:57	20200312230700.txt	2020-03-12 23:07:00	180	True	True	count_occurence	True		rtf	3	\N	\N	\N
2020-03-13 11:16:00	20200313111614.txt	2020-03-13 11:16:14	184	True	True	count_occurence	True		rtf	1	\N	\N	\N
2020-03-17 13:38:05	20200317133807.txt	2020-03-17 13:38:07	188	True	False	count_occurence	True		rtf	1	0	True	\N
\.


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test (id, comment) FROM stdin;
5	alright
6	alright
7	alright
8	alright
10	alright
11	alright
\.


--
-- Name: evaluation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evaluation_id_seq', 331, true);


--
-- Name: results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.results_id_seq', 232, true);


--
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.test_id_seq', 11, true);


--
-- Name: evaluation evaluation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_pk PRIMARY KEY (id);


--
-- Name: preprocessing preprocessing_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preprocessing
    ADD CONSTRAINT preprocessing_pk PRIMARY KEY (id);


--
-- Name: evaluation evaluation_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_fk FOREIGN KEY (preprocessing_id) REFERENCES public.preprocessing(id);


--
-- PostgreSQL database dump complete
--

