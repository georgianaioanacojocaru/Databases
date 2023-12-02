--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: cake_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cake_details (
    id integer NOT NULL,
    cake_name character varying(50) NOT NULL,
    cake_image character varying(100) NOT NULL,
    cake_description text NOT NULL
);


ALTER TABLE public.cake_details OWNER TO postgres;

--
-- Name: cake_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cake_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cake_details_id_seq OWNER TO postgres;

--
-- Name: cake_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cake_details_id_seq OWNED BY public.cake_details.id;


--
-- Name: message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message (
    id integer NOT NULL,
    user_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    subject character varying(255) NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.message OWNER TO postgres;

--
-- Name: message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.message_id_seq OWNER TO postgres;

--
-- Name: message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.message_id_seq OWNED BY public.message.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password_hash character varying(128) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: cake_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cake_details ALTER COLUMN id SET DEFAULT nextval('public.cake_details_id_seq'::regclass);


--
-- Name: message id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message ALTER COLUMN id SET DEFAULT nextval('public.message_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: cake_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cake_details (id, cake_name, cake_image, cake_description) FROM stdin;
6	Special Milk Cake	cake10.jpg	Immerse yourself in the luscious luxury of our Special Milk Cake, a divine creation that elevates the classic vanilla sponge to new heights of indulgence. This cake is a celebration of texture and flavor, as each delicate layer of sponge is generously soaked in a trio of milks—whole milk, evaporated milk, and condensed milk. The result is a harmonious symphony of moistness and richness, where the sponge becomes a decadent canvas for the velvety embrace of these three milks. With each forkful, you'll experience the perfect balance of sweetness and creaminess, as the cake literally melts in your mouth. The Three Milk Cake is not just a dessert; it's a celebration of the artistry in baking, where the simplicity of vanilla meets the opulence of three distinct milks, creating a culinary masterpiece that promises to enchant your palate with every sumptuous bite.
7	Cheese Cake	cake7.jpg	Savor the irresistible fusion of velvety indulgence and spiced perfection with our Speculoos-Topped Cheese Cake. This New York City-style cheesecake is a symphony of creamy elegance, baked to perfection, and adorned with a decadent layer of Speculoos spread. The marriage of the rich, dense cheesecake and the aromatic, spiced charm of Speculoos creates a sensational dance of flavors on your palate. But the delight doesn't stop there; our cheesecake boasts another layer of Speculoos spread delicately infused over the buttery crust, adding a crunchy, sweet depth to each heavenly bite. This cheesecake is not just a dessert; it's an exquisite journey where the classic sophistication of New York cheesecake meets the enchanting allure of Speculoos, resulting in a dessert that is both timeless and tantalizing. Elevate your indulgence with this culinary masterpiece that promises to redefine your cheesecake experience.
2	Kit Kat Cake	cake6.jpg	Dive into the irresistible allure of our Kit Kat Cake, a celebration of indulgence and delight. This exquisite creation features a velvety soft vanilla cake sponge, the perfect canvas for our finest creamy milk chocolate. What sets this cake apart is the delectable surprise within—layers adorned with a luscious, crunchy KitKat frosting. The juxtaposition of the smooth vanilla cake against the satisfying crunch of KitKat creates a symphony of textures that dance on the palate. Each slice offers a harmonious blend of rich chocolate and the iconic crispy wafer layers, ensuring a decadent experience with every forkful. Elevate your dessert indulgence with our Kit Kat Cake, where the classic combination of creamy and crunchy takes center stage in a deliciously memorable performance.
3	Raffaello Cake	cake9.jpg	Embark on a journey of sublime sweetness with our Raffaello Cake—an enchanting creation that redefines the art of dessert. Immerse yourself in the luxuriously moist embrace of our vanilla sponge, a canvas for an abundance of Raffaello and white chocolate treasures. Each bite is a symphony of textures and flavors, as the velvety softness of the sponge meets the delicate crunch of Raffaello's crispy wafer and nutty layers. The marriage of these exquisite elements is further heightened by the inclusion of decadent white chocolate, adding a creamy richness that elevates the indulgence to new heights. This cake is not merely a dessert; it's a celebration of opulence, where the essence of Raffaello and white chocolate converges to create a truly unforgettable experience for your taste buds. Imbibe in the magic of our Raffaello Cake, where every slice is a moment of pure bliss.
4	Ferrero Rocher Cake	cake5.jpg	Indulge in the divine allure of our Ferrero Rocher Cake, a masterpiece crafted from the finest 100% Ferrero hazelnut chocolate and roasted nuts. Immerse yourself in the rich, nutty essence of every layer as the velvety chocolate caresses your palate. The cake is adorned with the crowning jewel—luscious Ferrero Rochers artfully placed on top, adding an extra layer of decadence to this symphony of flavors. With each indulgent bite, you'll experience the perfect harmony of smooth chocolate, crunchy hazelnuts, and the delightful surprise of Ferrero Rocher's golden, nutty center. This cake is not just a dessert; it's a celebration of opulence and sophistication, where the essence of Ferrero Rocher transforms into a heavenly treat for your senses. Elevate your dessert experience with our Ferrero Rocher Cake, a confectionery masterpiece that promises pure bliss with every slice.
5	Chocolate Hazelnut Cupcake	cake4.jpg	Delight your senses with our Chocolate Hazelnut Cupcakes, a petite indulgence that packs a punch of rich flavors. These delectable cupcakes are a celebration of milk chocolate, ensuring each bite is a symphony of velvety sweetness. What sets these treats apart is the lavish hazelnut chocolate drippings that cascade down each cupcake, adding an extra layer of indulgence and a delightful crunch. The marriage of smooth milk chocolate and the nutty essence of hazelnuts creates a heavenly combination, delivering a sensory experience that is both decadent and comforting. These Chocolate Hazelnut Cupcakes are not just desserts; they are a miniature masterpiece that brings joy to your taste buds. Whether for a special occasion or a simple craving, these cupcakes are a delightful way to savor the harmonious blend of chocolate and hazelnut in every bite.
9	Nutella Filled Cookie	cake8.jpg	Indulge in the divine pleasure of our Nutella-filled Cookies, where every bite is a journey into soft, gooey decadence. Crafted with an authentic touch, these cookies are a testament to the artistry of baking, offering a delightful contrast of textures. The heart of each cookie reveals a generous filling of velvety Nutella, creating a luxurious surprise that oozes with rich hazelnut chocolate goodness. To enhance the experience, we use 100% imported chocolate chunks, ensuring that each bite is a symphony of smooth chocolate decadence and the perfect chewiness of the cookie. Whether enjoyed with a warm cup of milk or as a sweet treat on its own, our Nutella-filled Cookies are a celebration of comfort and indulgence, inviting you to savor the exquisite blend of authentic flavors in every delightful moment.
10	Lotus Three Milk Cake	cake3.jpeg	Indulge in the sumptuous delight of our Lotus Three Milk Cake, a culinary masterpiece that redefines dessert elegance. This sensation boasts a velvety vanilla milky sponge soaked in a divine trio of whole milk, evaporated milk, and condensed milk, ensuring a decadent moistness in every bite. Crowned with a generous layer of luscious Lotus Biscoff spread and cream cheese, the cake tantalizes the taste buds with a perfect balance of creaminess and spiced richness. As a finishing touch, Lotus crumbs adorn the sides, delivering a delightful crunch. This cake transcends ordinary sweetness, inviting you to savor the opulent fusion of textures and flavors in each unforgettable slice.
11	Peanut Butter Brownie	cake2.jpg	Experience the ultimate indulgence with our Peanut Butter Stack Brownie, a symphony of flavors and textures that takes brownies to new heights. This decadent treat features layers of light milk chocolate, buttery caramel, and a rich chocolate brownie, creating a harmonious blend of sweetness and richness in every bite. What sets this brownie apart is the irresistible peanut butter crunch, adding a delightful contrast that elevates the sensory experience. The fudgy richness of the chocolate brownie is perfectly complemented by the smooth caramel and light milk chocolate, while the peanut butter crunch adds a satisfyingly nutty and crispy note. The Peanut Butter Stack Brownie is a true delight for your taste buds, offering a perfect balance of sweet, salty, and crunchy elements in each delectable square.
1	Honey Cake	cake1.jpg	7 layers of soft, Caramelized honey cakes sandwiched between a cloud like burnt honey & Dulce De Leche whipped cream!\\nThis sumptuous masterpiece boasts seven layers of irresistibly soft, caramelized honey cakes, each a testament to the sweet harmony of premium ingredients. Nestled between these golden layers is a heavenly blend of burnt honey and Dulce De Leche whipped cream, creating a luscious and ethereal filling that transcends ordinary dessert experiences. The result is a cake that not only tantalizes the taste buds but also captivates with its light, cloud-like texture. Savor the richness of honey and the velvety embrace of Dulce De Leche in every decadent bite, as this Honey Cake promises to be a symphony of flavors that lingers on the palate long after the last forkful. 
16	aa	cake1.jpg	wefef
\.


--
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message (id, user_name, email, subject, message) FROM stdin;
1	user1	user@gmail.com	custom cake	Can you make a custom cake of 10 pounds for me!
2	Xaibi	test@gmail.com	test	hey how are you
3	dsf	fdgds	fdgds	fdgs
4	fdg	gfhfd	gfh	gfhfd
5	test	test	test	test
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, username, email, password_hash) FROM stdin;
1	admin	aa@a.com	pbkdf2:sha256:260000$j4V4Y3NS0dyiLokG$7dc5027759647ff11c3f143a50a4c4bce0a060a5bfdd768b69f15436036f87af
2	aa 	aa@b.com	pbkdf2:sha256:260000$mTvzvwA3WeAqTjgP$3f88957367531520bfd91e3c55d183711873ad73392d155543a87d2d955187de
3	gc	user@gmail.com	pbkdf2:sha256:260000$e1x20ltIOO8ByCXq$34a0871c5a03cb468b847c8cd4ff5391277288a30a26fb521dee953c88958468
5	gc	user123@gmail.com	pbkdf2:sha256:260000$fOcwUFb5Bn6Jw2WR$d8af97127f1fda3f767f62ee7e80f38520be0cc98fa6534abb7df367cfdb94ad
\.


--
-- Name: cake_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cake_details_id_seq', 18, true);


--
-- Name: message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_id_seq', 5, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 5, true);


--
-- Name: cake_details cake_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cake_details
    ADD CONSTRAINT cake_details_pkey PRIMARY KEY (id);


--
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

