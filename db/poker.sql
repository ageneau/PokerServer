--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: poker; Type: SCHEMA; Schema: -; Owner: dbuser
--

CREATE SCHEMA poker;


ALTER SCHEMA poker OWNER TO dbuser;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: board; Type: TABLE; Schema: poker; Owner: dbuser
--

CREATE TABLE poker.board (
    board_id bigint NOT NULL,
    flop1 character varying(25) DEFAULT NULL::character varying,
    flop2 character varying(25) DEFAULT NULL::character varying,
    flop3 character varying(25) DEFAULT NULL::character varying,
    turn character varying(25) DEFAULT NULL::character varying,
    river character varying(25) DEFAULT NULL::character varying
);


ALTER TABLE poker.board OWNER TO dbuser;

--
-- Name: board_board_id_seq; Type: SEQUENCE; Schema: poker; Owner: dbuser
--

CREATE SEQUENCE poker.board_board_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poker.board_board_id_seq OWNER TO dbuser;

--
-- Name: board_board_id_seq; Type: SEQUENCE OWNED BY; Schema: poker; Owner: dbuser
--

ALTER SEQUENCE poker.board_board_id_seq OWNED BY poker.board.board_id;


--
-- Name: game; Type: TABLE; Schema: poker; Owner: dbuser
--

CREATE TABLE poker.game (
    game_id bigint NOT NULL,
    players_left bigint NOT NULL,
    game_type character varying(15) NOT NULL,
    name character varying(50) DEFAULT NULL::character varying,
    is_started boolean NOT NULL,
    current_hand_id bigint,
    game_structure_id bigint,
    btn_player_id character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE poker.game OWNER TO dbuser;

--
-- Name: game_blind; Type: TABLE; Schema: poker; Owner: dbuser
--

CREATE TABLE poker.game_blind (
    game_structure_id bigint DEFAULT '0'::bigint NOT NULL,
    blind character varying(25) DEFAULT ''''::character varying NOT NULL
);


ALTER TABLE poker.game_blind OWNER TO dbuser;

--
-- Name: game_game_id_seq; Type: SEQUENCE; Schema: poker; Owner: dbuser
--

CREATE SEQUENCE poker.game_game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poker.game_game_id_seq OWNER TO dbuser;

--
-- Name: game_game_id_seq; Type: SEQUENCE OWNED BY; Schema: poker; Owner: dbuser
--

ALTER SEQUENCE poker.game_game_id_seq OWNED BY poker.game.game_id;


--
-- Name: game_structure; Type: TABLE; Schema: poker; Owner: dbuser
--

CREATE TABLE poker.game_structure (
    game_structure_id bigint NOT NULL,
    current_blind_level character varying(25) DEFAULT NULL::character varying,
    blind_length bigint,
    current_blind_ends timestamp with time zone,
    pause_start_time timestamp with time zone,
    starting_chips bigint
);


ALTER TABLE poker.game_structure OWNER TO dbuser;

--
-- Name: game_structure_game_structure_id_seq; Type: SEQUENCE; Schema: poker; Owner: dbuser
--

CREATE SEQUENCE poker.game_structure_game_structure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poker.game_structure_game_structure_id_seq OWNER TO dbuser;

--
-- Name: game_structure_game_structure_id_seq; Type: SEQUENCE OWNED BY; Schema: poker; Owner: dbuser
--

ALTER SEQUENCE poker.game_structure_game_structure_id_seq OWNED BY poker.game_structure.game_structure_id;


--
-- Name: hand; Type: TABLE; Schema: poker; Owner: dbuser
--

CREATE TABLE poker.hand (
    hand_id bigint NOT NULL,
    board_id bigint,
    game_id bigint NOT NULL,
    player_to_act_id character varying(255) DEFAULT NULL::character varying,
    blind_level character varying(25) NOT NULL,
    pot bigint,
    bet_amount bigint,
    total_bet_amount bigint
);


ALTER TABLE poker.hand OWNER TO dbuser;

--
-- Name: hand_deck; Type: TABLE; Schema: poker; Owner: dbuser
--

CREATE TABLE poker.hand_deck (
    hand_id bigint NOT NULL,
    card character varying(25) NOT NULL
);


ALTER TABLE poker.hand_deck OWNER TO dbuser;

--
-- Name: hand_hand_id_seq; Type: SEQUENCE; Schema: poker; Owner: dbuser
--

CREATE SEQUENCE poker.hand_hand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poker.hand_hand_id_seq OWNER TO dbuser;

--
-- Name: hand_hand_id_seq; Type: SEQUENCE OWNED BY; Schema: poker; Owner: dbuser
--

ALTER SEQUENCE poker.hand_hand_id_seq OWNED BY poker.hand.hand_id;


--
-- Name: hibernate_sequences; Type: TABLE; Schema: poker; Owner: dbuser
--

CREATE TABLE poker.hibernate_sequences (
    sequence_name character varying(255) DEFAULT NULL::character varying,
    sequence_next_hi_value bigint
);


ALTER TABLE poker.hibernate_sequences OWNER TO dbuser;

--
-- Name: player; Type: TABLE; Schema: poker; Owner: dbuser
--

CREATE TABLE poker.player (
    player_id character varying(255) DEFAULT ''''::character varying NOT NULL,
    game_id bigint NOT NULL,
    name character varying(50) DEFAULT NULL::character varying,
    chips bigint,
    game_position bigint NOT NULL,
    finished_place bigint,
    sitting_out boolean DEFAULT false NOT NULL
);


ALTER TABLE poker.player OWNER TO dbuser;

--
-- Name: player_hand; Type: TABLE; Schema: poker; Owner: dbuser
--

CREATE TABLE poker.player_hand (
    player_hand_id bigint NOT NULL,
    player_id character varying(255) NOT NULL,
    hand_id bigint NOT NULL,
    card1 character varying(25) DEFAULT NULL::character varying,
    card2 character varying(25) DEFAULT NULL::character varying,
    bet_amount bigint,
    round_bet_amount bigint
);


ALTER TABLE poker.player_hand OWNER TO dbuser;

--
-- Name: player_hand_player_hand_id_seq; Type: SEQUENCE; Schema: poker; Owner: dbuser
--

CREATE SEQUENCE poker.player_hand_player_hand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poker.player_hand_player_hand_id_seq OWNER TO dbuser;

--
-- Name: player_hand_player_hand_id_seq; Type: SEQUENCE OWNED BY; Schema: poker; Owner: dbuser
--

ALTER SEQUENCE poker.player_hand_player_hand_id_seq OWNED BY poker.player_hand.player_hand_id;


--
-- Name: board; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.board (
    board_id bigint NOT NULL,
    flop1 character varying(25) DEFAULT NULL::character varying,
    flop2 character varying(25) DEFAULT NULL::character varying,
    flop3 character varying(25) DEFAULT NULL::character varying,
    turn character varying(25) DEFAULT NULL::character varying,
    river character varying(25) DEFAULT NULL::character varying
);


ALTER TABLE public.board OWNER TO dbuser;

--
-- Name: board_board_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE public.board_board_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.board_board_id_seq OWNER TO dbuser;

--
-- Name: board_board_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE public.board_board_id_seq OWNED BY public.board.board_id;


--
-- Name: game; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.game (
    game_id bigint NOT NULL,
    players_left bigint NOT NULL,
    game_type character varying(15) NOT NULL,
    name character varying(50) DEFAULT NULL::character varying,
    is_started boolean NOT NULL,
    current_hand_id bigint,
    game_structure_id bigint,
    btn_player_id character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.game OWNER TO dbuser;

--
-- Name: game_blind; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.game_blind (
    game_structure_id bigint DEFAULT '0'::bigint NOT NULL,
    blind character varying(25) DEFAULT ''''::character varying NOT NULL
);


ALTER TABLE public.game_blind OWNER TO dbuser;

--
-- Name: game_game_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE public.game_game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_game_id_seq OWNER TO dbuser;

--
-- Name: game_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE public.game_game_id_seq OWNED BY public.game.game_id;


--
-- Name: game_structure; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.game_structure (
    game_structure_id bigint NOT NULL,
    current_blind_level character varying(25) DEFAULT NULL::character varying,
    blind_length bigint,
    current_blind_ends timestamp with time zone,
    pause_start_time timestamp with time zone,
    starting_chips bigint
);


ALTER TABLE public.game_structure OWNER TO dbuser;

--
-- Name: game_structure_game_structure_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE public.game_structure_game_structure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_structure_game_structure_id_seq OWNER TO dbuser;

--
-- Name: game_structure_game_structure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE public.game_structure_game_structure_id_seq OWNED BY public.game_structure.game_structure_id;


--
-- Name: hand; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.hand (
    hand_id bigint NOT NULL,
    board_id bigint,
    game_id bigint NOT NULL,
    player_to_act_id character varying(255) DEFAULT NULL::character varying,
    blind_level character varying(25) NOT NULL,
    pot bigint,
    bet_amount bigint,
    total_bet_amount bigint
);


ALTER TABLE public.hand OWNER TO dbuser;

--
-- Name: hand_deck; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.hand_deck (
    hand_id bigint NOT NULL,
    card character varying(25) NOT NULL
);


ALTER TABLE public.hand_deck OWNER TO dbuser;

--
-- Name: hand_hand_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE public.hand_hand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hand_hand_id_seq OWNER TO dbuser;

--
-- Name: hand_hand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE public.hand_hand_id_seq OWNED BY public.hand.hand_id;


--
-- Name: hibernate_sequences; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.hibernate_sequences (
    sequence_name character varying(255) DEFAULT NULL::character varying,
    sequence_next_hi_value bigint
);


ALTER TABLE public.hibernate_sequences OWNER TO dbuser;

--
-- Name: player; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.player (
    player_id character varying(255) DEFAULT ''''::character varying NOT NULL,
    game_id bigint NOT NULL,
    name character varying(50) DEFAULT NULL::character varying,
    chips bigint,
    game_position bigint NOT NULL,
    finished_place bigint,
    sitting_out boolean DEFAULT false NOT NULL
);


ALTER TABLE public.player OWNER TO dbuser;

--
-- Name: player_hand; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.player_hand (
    player_hand_id bigint NOT NULL,
    player_id character varying(255) NOT NULL,
    hand_id bigint NOT NULL,
    card1 character varying(25) DEFAULT NULL::character varying,
    card2 character varying(25) DEFAULT NULL::character varying,
    bet_amount bigint,
    round_bet_amount bigint
);


ALTER TABLE public.player_hand OWNER TO dbuser;

--
-- Name: player_hand_player_hand_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE public.player_hand_player_hand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_hand_player_hand_id_seq OWNER TO dbuser;

--
-- Name: player_hand_player_hand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE public.player_hand_player_hand_id_seq OWNED BY public.player_hand.player_hand_id;


--
-- Name: board board_id; Type: DEFAULT; Schema: poker; Owner: dbuser
--

ALTER TABLE ONLY poker.board ALTER COLUMN board_id SET DEFAULT nextval('poker.board_board_id_seq'::regclass);


--
-- Name: game game_id; Type: DEFAULT; Schema: poker; Owner: dbuser
--

ALTER TABLE ONLY poker.game ALTER COLUMN game_id SET DEFAULT nextval('poker.game_game_id_seq'::regclass);


--
-- Name: game_structure game_structure_id; Type: DEFAULT; Schema: poker; Owner: dbuser
--

ALTER TABLE ONLY poker.game_structure ALTER COLUMN game_structure_id SET DEFAULT nextval('poker.game_structure_game_structure_id_seq'::regclass);


--
-- Name: hand hand_id; Type: DEFAULT; Schema: poker; Owner: dbuser
--

ALTER TABLE ONLY poker.hand ALTER COLUMN hand_id SET DEFAULT nextval('poker.hand_hand_id_seq'::regclass);


--
-- Name: player_hand player_hand_id; Type: DEFAULT; Schema: poker; Owner: dbuser
--

ALTER TABLE ONLY poker.player_hand ALTER COLUMN player_hand_id SET DEFAULT nextval('poker.player_hand_player_hand_id_seq'::regclass);


--
-- Name: board board_id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.board ALTER COLUMN board_id SET DEFAULT nextval('public.board_board_id_seq'::regclass);


--
-- Name: game game_id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.game ALTER COLUMN game_id SET DEFAULT nextval('public.game_game_id_seq'::regclass);


--
-- Name: game_structure game_structure_id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.game_structure ALTER COLUMN game_structure_id SET DEFAULT nextval('public.game_structure_game_structure_id_seq'::regclass);


--
-- Name: hand hand_id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.hand ALTER COLUMN hand_id SET DEFAULT nextval('public.hand_hand_id_seq'::regclass);


--
-- Name: player_hand player_hand_id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.player_hand ALTER COLUMN player_hand_id SET DEFAULT nextval('public.player_hand_player_hand_id_seq'::regclass);


--
-- Data for Name: board; Type: TABLE DATA; Schema: poker; Owner: dbuser
--

COPY poker.board (board_id, flop1, flop2, flop3, turn, river) FROM stdin;
\.


--
-- Data for Name: game; Type: TABLE DATA; Schema: poker; Owner: dbuser
--

COPY poker.game (game_id, players_left, game_type, name, is_started, current_hand_id, game_structure_id, btn_player_id) FROM stdin;
\.


--
-- Data for Name: game_blind; Type: TABLE DATA; Schema: poker; Owner: dbuser
--

COPY poker.game_blind (game_structure_id, blind) FROM stdin;
\.


--
-- Data for Name: game_structure; Type: TABLE DATA; Schema: poker; Owner: dbuser
--

COPY poker.game_structure (game_structure_id, current_blind_level, blind_length, current_blind_ends, pause_start_time, starting_chips) FROM stdin;
\.


--
-- Data for Name: hand; Type: TABLE DATA; Schema: poker; Owner: dbuser
--

COPY poker.hand (hand_id, board_id, game_id, player_to_act_id, blind_level, pot, bet_amount, total_bet_amount) FROM stdin;
\.


--
-- Data for Name: hand_deck; Type: TABLE DATA; Schema: poker; Owner: dbuser
--

COPY poker.hand_deck (hand_id, card) FROM stdin;
\.


--
-- Data for Name: hibernate_sequences; Type: TABLE DATA; Schema: poker; Owner: dbuser
--

COPY poker.hibernate_sequences (sequence_name, sequence_next_hi_value) FROM stdin;
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: poker; Owner: dbuser
--

COPY poker.player (player_id, game_id, name, chips, game_position, finished_place, sitting_out) FROM stdin;
\.


--
-- Data for Name: player_hand; Type: TABLE DATA; Schema: poker; Owner: dbuser
--

COPY poker.player_hand (player_hand_id, player_id, hand_id, card1, card2, bet_amount, round_bet_amount) FROM stdin;
\.


--
-- Data for Name: board; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.board (board_id, flop1, flop2, flop3, turn, river) FROM stdin;
\.


--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.game (game_id, players_left, game_type, name, is_started, current_hand_id, game_structure_id, btn_player_id) FROM stdin;
\.


--
-- Data for Name: game_blind; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.game_blind (game_structure_id, blind) FROM stdin;
\.


--
-- Data for Name: game_structure; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.game_structure (game_structure_id, current_blind_level, blind_length, current_blind_ends, pause_start_time, starting_chips) FROM stdin;
\.


--
-- Data for Name: hand; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.hand (hand_id, board_id, game_id, player_to_act_id, blind_level, pot, bet_amount, total_bet_amount) FROM stdin;
\.


--
-- Data for Name: hand_deck; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.hand_deck (hand_id, card) FROM stdin;
\.


--
-- Data for Name: hibernate_sequences; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.hibernate_sequences (sequence_name, sequence_next_hi_value) FROM stdin;
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.player (player_id, game_id, name, chips, game_position, finished_place, sitting_out) FROM stdin;
\.


--
-- Data for Name: player_hand; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.player_hand (player_hand_id, player_id, hand_id, card1, card2, bet_amount, round_bet_amount) FROM stdin;
\.


--
-- Name: board_board_id_seq; Type: SEQUENCE SET; Schema: poker; Owner: dbuser
--

SELECT pg_catalog.setval('poker.board_board_id_seq', 1, true);


--
-- Name: game_game_id_seq; Type: SEQUENCE SET; Schema: poker; Owner: dbuser
--

SELECT pg_catalog.setval('poker.game_game_id_seq', 1, true);


--
-- Name: game_structure_game_structure_id_seq; Type: SEQUENCE SET; Schema: poker; Owner: dbuser
--

SELECT pg_catalog.setval('poker.game_structure_game_structure_id_seq', 1, true);


--
-- Name: hand_hand_id_seq; Type: SEQUENCE SET; Schema: poker; Owner: dbuser
--

SELECT pg_catalog.setval('poker.hand_hand_id_seq', 1, true);


--
-- Name: player_hand_player_hand_id_seq; Type: SEQUENCE SET; Schema: poker; Owner: dbuser
--

SELECT pg_catalog.setval('poker.player_hand_player_hand_id_seq', 1, true);


--
-- Name: board_board_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.board_board_id_seq', 1, true);


--
-- Name: game_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.game_game_id_seq', 1, true);


--
-- Name: game_structure_game_structure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.game_structure_game_structure_id_seq', 1, true);


--
-- Name: hand_hand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.hand_hand_id_seq', 1, true);


--
-- Name: player_hand_player_hand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.player_hand_player_hand_id_seq', 1, true);


--
-- Name: board idx_16388_primary; Type: CONSTRAINT; Schema: poker; Owner: dbuser
--

ALTER TABLE ONLY poker.board
    ADD CONSTRAINT idx_16388_primary PRIMARY KEY (board_id);


--
-- Name: game idx_16399_primary; Type: CONSTRAINT; Schema: poker; Owner: dbuser
--

ALTER TABLE ONLY poker.game
    ADD CONSTRAINT idx_16399_primary PRIMARY KEY (game_id);


--
-- Name: game_blind idx_16405_primary; Type: CONSTRAINT; Schema: poker; Owner: dbuser
--

ALTER TABLE ONLY poker.game_blind
    ADD CONSTRAINT idx_16405_primary PRIMARY KEY (game_structure_id, blind);


--
-- Name: game_structure idx_16412_primary; Type: CONSTRAINT; Schema: poker; Owner: dbuser
--

ALTER TABLE ONLY poker.game_structure
    ADD CONSTRAINT idx_16412_primary PRIMARY KEY (game_structure_id);


--
-- Name: hand idx_16419_primary; Type: CONSTRAINT; Schema: poker; Owner: dbuser
--

ALTER TABLE ONLY poker.hand
    ADD CONSTRAINT idx_16419_primary PRIMARY KEY (hand_id);


--
-- Name: hand_deck idx_16424_primary; Type: CONSTRAINT; Schema: poker; Owner: dbuser
--

ALTER TABLE ONLY poker.hand_deck
    ADD CONSTRAINT idx_16424_primary PRIMARY KEY (hand_id, card);


--
-- Name: player idx_16431_primary; Type: CONSTRAINT; Schema: poker; Owner: dbuser
--

ALTER TABLE ONLY poker.player
    ADD CONSTRAINT idx_16431_primary PRIMARY KEY (player_id);


--
-- Name: player_hand idx_16439_primary; Type: CONSTRAINT; Schema: poker; Owner: dbuser
--

ALTER TABLE ONLY poker.player_hand
    ADD CONSTRAINT idx_16439_primary PRIMARY KEY (player_hand_id);


--
-- Name: board idx_16464_primary; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.board
    ADD CONSTRAINT idx_16464_primary PRIMARY KEY (board_id);


--
-- Name: game idx_16475_primary; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT idx_16475_primary PRIMARY KEY (game_id);


--
-- Name: game_blind idx_16481_primary; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.game_blind
    ADD CONSTRAINT idx_16481_primary PRIMARY KEY (game_structure_id, blind);


--
-- Name: game_structure idx_16488_primary; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.game_structure
    ADD CONSTRAINT idx_16488_primary PRIMARY KEY (game_structure_id);


--
-- Name: hand idx_16495_primary; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.hand
    ADD CONSTRAINT idx_16495_primary PRIMARY KEY (hand_id);


--
-- Name: hand_deck idx_16500_primary; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.hand_deck
    ADD CONSTRAINT idx_16500_primary PRIMARY KEY (hand_id, card);


--
-- Name: player idx_16507_primary; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT idx_16507_primary PRIMARY KEY (player_id);


--
-- Name: player_hand idx_16515_primary; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.player_hand
    ADD CONSTRAINT idx_16515_primary PRIMARY KEY (player_hand_id);


--
-- PostgreSQL database dump complete
--

