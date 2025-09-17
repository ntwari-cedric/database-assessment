--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-09-17 18:09:53

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
-- TOC entry 220 (class 1259 OID 25220)
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course_name character varying(100) NOT NULL,
    credits integer,
    CONSTRAINT courses_credits_check CHECK ((credits > 0))
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25219)
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_course_id_seq OWNER TO postgres;

--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 219
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- TOC entry 222 (class 1259 OID 25228)
-- Name: enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollments (
    enrollment_id integer NOT NULL,
    student_id integer,
    course_id integer,
    enrollment_date date NOT NULL
);


ALTER TABLE public.enrollments OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25227)
-- Name: enrollments_enrollment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enrollments_enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.enrollments_enrollment_id_seq OWNER TO postgres;

--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 221
-- Name: enrollments_enrollment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enrollments_enrollment_id_seq OWNED BY public.enrollments.enrollment_id;


--
-- TOC entry 218 (class 1259 OID 25211)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25246)
-- Name: student_courses; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.student_courses AS
 SELECT s.first_name,
    s.last_name,
    c.course_name,
    e.enrollment_date
   FROM ((public.students s
     JOIN public.enrollments e ON ((s.student_id = e.student_id)))
     JOIN public.courses c ON ((e.course_id = c.course_id)));


ALTER VIEW public.student_courses OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25210)
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_student_id_seq OWNER TO postgres;

--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 217
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- TOC entry 4757 (class 2604 OID 25223)
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 25231)
-- Name: enrollments enrollment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments ALTER COLUMN enrollment_id SET DEFAULT nextval('public.enrollments_enrollment_id_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 25214)
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- TOC entry 4921 (class 0 OID 25220)
-- Dependencies: 220
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (course_id, course_name, credits) FROM stdin;
1	Database Systems	4
2	Web Development	3
3	Computer Networks	3
4	Operating Systems	4
5	Software Engineering	3
6	Cybersecurity Fundamentals	2
7	Mobile App Development	3
8	Cloud Computing	4
9	Data Structures	3
10	Artificial Intelligence	4
\.


--
-- TOC entry 4923 (class 0 OID 25228)
-- Dependencies: 222
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enrollments (enrollment_id, student_id, course_id, enrollment_date) FROM stdin;
1	1	1	2025-09-01
2	2	2	2025-09-01
3	3	3	2025-09-02
4	4	4	2025-09-02
5	5	5	2025-09-03
6	6	6	2025-09-03
7	7	7	2025-09-04
8	8	8	2025-09-04
9	9	9	2025-09-05
10	10	10	2025-09-05
\.


--
-- TOC entry 4919 (class 0 OID 25211)
-- Dependencies: 218
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (student_id, first_name, last_name, email) FROM stdin;
1	Alice	Mukamana	alice.mukamana@example.com
2	Jean	Niyonzima	jean.niyonzima@example.com
3	Claudine	Uwase	claudine.uwase@example.com
4	Eric	Habimana	eric.habimana@example.com
5	Sandrine	Iradukunda	sandrine.iradukunda@example.com
6	Patrick	Mugisha	patrick.mugisha@example.com
7	Diane	Nshimiyimana	diane.nshimiyimana@example.com
8	Kevin	Twagirayezu	kevin.twagirayezu@example.com
9	Josiane	Mutoni	josiane.mutoni@example.com
10	Emmanuel	Rugamba	emmanuel.rugamba@example.com
\.


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 219
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 10, true);


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 221
-- Name: enrollments_enrollment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enrollments_enrollment_id_seq', 10, true);


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 217
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_student_id_seq', 10, true);


--
-- TOC entry 4765 (class 2606 OID 25226)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- TOC entry 4767 (class 2606 OID 25233)
-- Name: enrollments enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (enrollment_id);


--
-- TOC entry 4761 (class 2606 OID 25218)
-- Name: students students_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_email_key UNIQUE (email);


--
-- TOC entry 4763 (class 2606 OID 25216)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- TOC entry 4768 (class 1259 OID 25245)
-- Name: idx_course_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_course_id ON public.enrollments USING btree (course_id);


--
-- TOC entry 4769 (class 1259 OID 25244)
-- Name: idx_student_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_student_id ON public.enrollments USING btree (student_id);


--
-- TOC entry 4770 (class 2606 OID 25239)
-- Name: enrollments enrollments_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id) ON DELETE CASCADE;


--
-- TOC entry 4771 (class 2606 OID 25234)
-- Name: enrollments enrollments_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(student_id) ON DELETE CASCADE;


-- Completed on 2025-09-17 18:09:53

--
-- PostgreSQL database dump complete
--


--NOW WE ARE GOING TO PERFORM DIFFERENT QUERRIES USING DIFFERENT JOIN.

--USING INNER JOIN TO SEE STUDENTS ENROLLED IN COURSE 
SELECT s.first_name, s.last_name, c.course_name
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id;

--USING LEFT JOIN TO SEE ALL STUDENTS AND THEIR COURSES EVEN IF NOT ENROLLED 

SELECT s.first_name, s.last_name, c.course_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id;

--USIND RIGTH JOIN TO SEE ALL STUDENTS AND THEIR COURSES EVEN IF NO STUDENTS ENROLLED 
SELECT s.first_name, s.last_name, c.course_name
FROM students s
RIGHT JOIN enrollments e ON s.student_id = e.student_id
RIGHT JOIN courses c ON e.course_id = c.course_id;

--USING FULL JOIN TO SEE ALL  STUDENTS AND ALL COURSES MATCH WHERE POSSIBLE 

SELECT s.first_name, s.last_name, c.course_name
FROM students s
FULL JOIN enrollments e ON s.student_id = e.student_id
FULL JOIN courses c ON e.course_id = c.course_id;

--NOW WE ARE GOING TO CREATE INDEX 
CREATE INDEX idx_student_id ON enrollments(student_id);
CREATE INDEX idx_course_id ON enrollments(course_id);

--NOW WE ARE GOING TO CREATE VIEW 

CREATE VIEW student_courses AS
SELECT s.first_name, s.last_name, c.course_name, e.enrollment_date
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

--NOW WE ARE GOING TO CREATE A SIMPLE REPORT REFERING ON VIEW WE CREATED 
SELECT * FROM student_courses ORDER BY enrollment_date;
--OR WE CAN CREATE A SIMPLE REPORT BY COUNTING ENROLLMENT PER COURSE 
SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;
