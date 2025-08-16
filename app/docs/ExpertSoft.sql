DROP DATABASE IF EXISTS ExpertSoftDB;

CREATE DATABASE ExpertSoftDB;
USE ExpertSoftDB;

DROP TABLE IF EXISTS customers;
-- create customers table
CREATE TABLE customers (
    customer_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(50),
    address VARCHAR(255)
);

DROP TABLE IF EXISTS invoices;
-- create invoices table
CREATE TABLE invoices (
    invoice_id VARCHAR(20) PRIMARY KEY,
    billing_period DATE NOT NULL,
    billed_amount INT NOT NULL,
    amount_paid INT NOT NULL,
    customer_id BIGINT ,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

DROP TABLE IF EXISTS platforms;
-- create platforms table
CREATE TABLE platforms (
    platform_id INT PRIMARY KEY AUTO_INCREMENT,
    platform_name VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS transactions;
-- create transactions table
CREATE TABLE transactions (
    transaction_id VARCHAR(20) PRIMARY KEY,
    transaction_type VARCHAR(50) NOT NULL,
    transaction_amount DECIMAL(10,2) NOT NULL,
    transaction_status VARCHAR(50) NOT NULL,
    transaction_datetime DATETIME NOT NULL,
    platform_id INT NOT NULL,
    invoice_id VARCHAR(20) NOT NULL,
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id),
    FOREIGN KEY (platform_id) REFERENCES platforms(platform_id)
);

-- insert customers data
INSERT INTO customers (customer_id, customer_name, email, phone, address) VALUES
(149186547, 'Angel Daniel', 'rmiller@boyer.com', '(873)222-2692x09480', 'USNS Davis FPO AP 78518'),
(475925688, 'Matthew Wilson', 'matthew15@ramirez.com', '(264)225-7425', '42023 Barrett Path Suite 281 Jeremyborough, OH 72889'),
(112231541, 'Jennifer Phelps', 'echristian@hotmail.com', '248.695.2117', '392 Smith Corners Apt. 737 East Angeltown, MO 64086'),
(708283326, 'Jonathan Cook', 'zjones@yahoo.com', '0756633727', '657 Landry Way Suite 966 Robinsonfurt, CA 22461'),
(959234562, 'Lindsay Garcia', 'juliamatthews@carpenter.com', '001-158-358-0277', '906 Justin Locks Apt. 838 Port Timothyview, AR 68865'),
(243553915, 'Eric Klein', 'acostajoshua@hotmail.com', '9179003714', '0571 Carroll Cliffs Davisstad, WI 00721'),
(7005498, 'Ashley Adams', 'elambert@cook.info', '(224)273-1751x2329', '660 Marcus Camp Suite 262 Port Stevenmouth, NC 10819'),
(724330039, 'Meghan Nguyen', 'hhughes@randolph-ingram.com', '767.278.8207', '259 Jared Manor Brownville, AZ 52844'),
(643387222, 'Ryan Richards', 'phillipcarter@hotmail.com', '001-398-345-1521x215', '695 Francis Cliffs Port Bryantown, VT 33873'),
(215716832, 'Janice Alexander', 'matthew55@leach-blackburn.com', '+1-411-073-0697x704', '81268 Hamilton Fort Fitzgeraldfort, ID 71489'),
(92651576, 'Katherine Dunn', 'golson@davis.info', '6081126986', '837 Schneider Spur Suite 656 Darrellmouth, WI 33323'),
(724488250, 'Brett Odom', 'colemanjames@chavez.info', '550.725.0901', '952 Barbara Turnpike Jacquelinebury, MO 71346'),
(26588131, 'Jenna Scott', 'rogerseric@hotmail.com', '404-358-1223x371', 'Unit 1694 Box 1865 DPO AE 26667'),
(401149568, 'Andrew Johns', 'lorinelson@hotmail.com', '894-499-5852x2479', '62457 Booth Mews Apt. 453 Lake Vincentport, DE 49208'),
(778029406, 'Christine Curtis', 'christopherferguson@acevedo-robertson.info', '554.861.0493x592', '2480 Jesse Unions Suite 534 East Antonioshire, MS 71510'),
(307805784, 'Madison Jones', 'wattsdavid@morgan-wheeler.com', '149.766.5747', 'USNS Ferguson FPO AP 50263'),
(484837788, 'Tracy Simmons', 'bryan30@williams.com', '0383343588', '76775 Jennifer Orchard Apt. 758 Port Lance, NH 53890'),
(962795476, 'Shelby Wolf', 'daniel46@gmail.com', '7506854443', '613 Billy Radial Suite 171 South Benjamin, WY 15230'),
(965030358, 'Kyle Jackson', 'pwheeler@yahoo.com', '001-392-237-6541x8420', '24896 Helen Rapid Suite 758 New Joseph, MN 97017'),
(644042817, 'Linda Shepard', 'munozcharles@yahoo.com', '2931087130', '4947 Reynolds Islands Kathleenburgh, DE 96988'),
(689720635, 'Kathleen Brady', 'victoria31@gmail.com', '2253893664', 'Unit 6453 Box 5308 DPO AA 48049'),
(800125157, 'Bobby Luna', 'kathryn43@hotmail.com', '001-549-919-1859', '2923 Michael Fords Suite 316 Dustinton, IN 31032'),
(268619593, 'Richard Lopez', 'justinallen@quinn.info', '+1-418-560-8033x44588', '6875 Hill Forks Teresaland, AL 58910'),
(625774276, 'Ralph Bush', 'bradleyamy@doyle.com', '+1-866-778-9252x6524', '03975 Mills Square Apt. 322 Port Claudia, MI 34792'),
(569906245, 'David Webb', 'stevenrodriguez@gmail.com', '993.305.1410', '3613 Laura Ridges Suite 762 South Theresa, VA 98493'),
(328037408, 'Kim Russell', 'cindy11@wood.com', '001-136-251-3102x24346', '887 Kelley Walk Apt. 960 East Martha, CT 59649'),
(969677194, 'Michael Holt', 'rmiller@hubbard-benitez.com', '882-041-3572', '3499 David Lake Suite 745 South Dylan, AK 03041'),
(796337665, 'Mr. Justin Cook', 'ofritz@richards.com', '737.675.5823', 'Unit 9907 Box 4757 DPO AE 46640'),
(636808209, 'Timothy Wood', 'christina78@yahoo.com', '001-948-037-6474', '836 Bates Points Port Andrewshire, GA 83721'),
(975617669, 'Yolanda Hines', 'cscott@hotmail.com', '(659)333-4905', '812 Mccarthy Viaduct Apt. 376 Kristinamouth, AL 43563'),
(569390187, 'Jasmine Kelly', 'fitzgeraldelizabeth@yahoo.com', '843-277-1394', '697 Reynolds Dam Apt. 423 Jacobland, MO 89387'),
(325459789, 'Robert Smith', 'smithtimothy@wallace.com', '001-595-596-1706x9253', 'Unit 2774 Box 4368 DPO AE 01041'),
(325603096, 'Jonathan Smith', 'debragriffin@hotmail.com', '796.397.5185x7448', '322 Smith Pines Suite 052 Lake Scotthaven, NM 11543'),
(819212515, 'Erin Marshall', 'sethsmith@robinson.com', '793.145.6997x893', '04382 Edward Mountains Suite 369 Georgeberg, ME 94518'),
(444056964, 'Mark Ford', 'millerricardo@hotmail.com', '+1-407-009-2402', '07900 Friedman Ferry Suite 170 South Christina, WV 53142'),
(717643055, 'Cynthia Lee', 'christinaflores@jones.org', '+1-822-188-2029x6929', '368 Jones Estates Apt. 059 Jonesstad, NY 59968'),
(30122773, 'Sean Hood', 'cynthiaevans@hernandez.com', '+1-348-069-6954x792', '7426 Middleton Hill Suite 303 Millerview, CO 23232'),
(622536043, 'Kim Stephens', 'karen28@johnson.com', '(092)586-3570x54204', '12967 Ryan Shoals Apt. 994 Port Jesse, MO 86007'),
(747822485, 'Adam Mckinney', 'fwilliams@lewis-wu.org', '813.559.4153x962', '572 Tammy Forest Youngside, SD 92567'),
(857630459, 'Valerie Brown', 'qmcgee@gmail.com', '869.591.7228', '2739 Hood Rest Apt. 962 Johnburgh, UT 27169'),
(204909440, 'Jason Pace', 'tjohnson@yahoo.com', '001-517-371-6236x2223', '19964 Edwards Pines South Jeremystad, AZ 79080'),
(241114561, 'Gregory Anderson', 'julie98@cortez.com', '+1-282-173-3048x555', '5395 Brandon Freeway Apt. 858 North Melissa, OR 60184'),
(494808313, 'Rebecca Avila', 'pwilson@sanchez.com', '773.248.1617', '78969 Mcguire Springs Suite 562 Port Christopher, NJ 29478'),
(315164793, 'Morgan Leon', 'miranda94@yahoo.com', '001-853-081-5933x565', '853 Virginia Cape Suite 757 Wilsonport, SC 89614'),
(505327194, 'Fernando Hunt', 'abigailkelly@johnson.net', '5863279231', '9609 Conner Track Apt. 859 Kristenberg, MD 40765'),
(892962448, 'Jason Luna', 'rodriguezrhonda@yahoo.com', '600.123.2569x570', '204 Laura Hill Craigland, OK 08760'),
(394523505, 'Gregory Howell', 'david12@young.org', '213-496-7129x11054', '036 Tyler Groves Suite 302 Danielsfurt, WV 45483'),
(763963140, 'Miguel Sharp MD', 'sgeorge@ramos-acevedo.net', '001-600-899-5324', '47921 Johnson Expressway Suite 742 Oliviaport, PA 16931'),
(594590875, 'Stephanie Acosta', 'joshuahenderson@pierce-ramos.com', '001-365-629-8075x05840', '7067 Henderson Knoll Joshuashire, NJ 84213'),
(25832528, 'Julia Davis', 'barkerbrent@berg-dougherty.com', '674-440-7862', '0246 Brown Roads Suite 606 North Luisburgh, WI 38462'),
(97866586, 'Amy Woods', 'paul38@byrd.info', '2338512573', '247 Sheila Centers North Troybury, WA 43836'),
(79987146, 'Julie Dunn', 'melissawebb@gmail.com', '883-656-1878x6532', '758 Ruth Mall Briggstown, MA 48538'),
(520620439, 'Nicole Mcdonald', 'frederickmarshall@evans.biz', '+1-692-758-5774x3951', '7229 Michelle Forges Suite 411 Hardyview, VT 06858'),
(260613460, 'Jennifer Mendoza', 'susanchapman@gmail.com', '203-605-2009x1103', '11916 Katherine Creek Kathleenport, ND 68479'),
(511962082, 'Rachel Fisher', 'bgarcia@johnson.org', '650-424-8808', '38507 Newman Loop Suite 268 Tommyberg, UT 25108'),
(527088924, 'Jorge Thomas', 'jason19@yahoo.com', '921-668-1704x3013', '013 Tabitha Cliff Stevenmouth, NJ 04089'),
(181982363, 'Robert Hicks', 'powelllarry@hotmail.com', '(335)290-8992', '1639 Delacruz Park East Linda, DC 18242'),
(87147005, 'Terry Watson', 'kaiserwilliam@hotmail.com', '(426)053-2668', '0047 Lori Square East Josechester, KS 29146'),
(623072602, 'Carlos Wood', 'hillwilliam@hotmail.com', '440-516-4972x0722', '53828 Laura Spurs Lauraville, DE 53316'),
(729577216, 'Richard Weiss', 'carla37@gmail.com', '521-212-3209x2220', '316 Robert Dam North Christina, MA 15552'),
(696739719, 'Sarah Clark', 'wsanchez@christian.com', '853.981.8171', '04967 Nguyen Circle Suite 871 Lake Andrea, NY 87021'),
(520971718, 'Briana Wu', 'rachelsmith@frey.com', '(177)732-3856x95766', '534 Campbell View Sandersland, FL 59798'),
(785949232, 'Raven Jordan', 'rayalexa@yahoo.com', '001-870-036-3211', '6132 Spencer Corner Apt. 383 Lake Loriberg, MA 96874'),
(519768710, 'Angelica Gibbs', 'yarnold@smith-bruce.com', '+1-378-867-9488x99135', '68574 Coleman Villages Suite 522 North Erikaton, CA 83413'),
(64271785, 'Tammy Jacobs', 'scottroger@gmail.com', '227.597.0062', '57458 Collier Junctions Suite 288 Lake Nicholas, CT 00530'),
(357901640, 'Michael Evans', 'steven80@yahoo.com', '6777129275', '921 Ramirez Mount New Anthonyville, ND 52047'),
(830210363, 'Tony Pham', 'kendrapena@yahoo.com', '001-094-782-5703', 'Unit 3715 Box 5620 DPO AA 18266'),
(696962875, 'Miss Carrie Underwood', 'amy45@hotmail.com', '0792914312', 'USNV Morris FPO AA 49085'),
(896950954, 'Ryan Russell', 'michael78@walters.com', '001-266-212-7928x22281', '70003 Tiffany Drives Robertchester, IA 05998'),
(196811583, 'Kimberly Bennett', 'smithmichelle@gmail.com', '(083)724-9058x016', '70851 Daniel Station Apt. 975 Hernandezton, IL 77476'),
(893866597, 'Joshua Neal', 'wheelerbrandon@hotmail.com', '001-256-341-5493x0374', '1324 William Glens New Jenniferland, IL 16679'),
(291010345, 'Robert Rodriguez', 'steven70@gmail.com', '562-175-6225x4306', '9483 Patricia Greens Suite 612 West Daniel, CT 37484'),
(915064128, 'Blake Ford', 'wrightsally@hotmail.com', '276-740-5323x764', '933 Casey Court Apt. 193 Lake Douglas, AL 33325'),
(11426912, 'Chad Garcia', 'john27@schaefer.com', '(530)211-7419', '195 Rollins Land Suite 478 North Angelastad, IN 84674'),
(174039328, 'Autumn Webb', 'davidreed@hotmail.com', '907-357-6151x4325', '198 Frazier Branch Suite 399 South Sharon, AR 75490'),
(565067343, 'Elizabeth Singleton', 'jeffreyhahn@dawson-myers.biz', '173.672.3805', '87020 Horton Valleys Rodriguezfurt, WV 03348'),
(333387701, 'Sarah Thompson', 'williamchavez@yahoo.com', '+1-444-121-3206x307', 'Unit 0218 Box 2805 DPO AA 08015'),
(355405632, 'Sarah Martin', 'earllee@gmail.com', '406-810-6283', '5963 Strong Points Lake Kayla, SC 51830'),
(71585472, 'Pamela Herrera', 'cardenasthomas@yahoo.com', '539.557.9029', '3416 Gregory Rapids Suite 629 North Nicolehaven, IL 93329'),
(708960117, 'Shannon Horn', 'brian88@pitts-bush.com', '(297)388-2854', 'USNS Buchanan FPO AA 82885'),
(626043010, 'Christopher Edwards', 'pmcclain@castro-humphrey.com', '(204)535-1285x920', '32230 Jeffery Via Apt. 616 West Tanya, WA 77567'),
(326481119, 'Brandon Hester', 'huertatracie@yahoo.com', '836.687.2362x166', '0169 Summers Vista West Stuart, UT 98685'),
(599800533, 'Mariah Jackson', 'eperry@wilson.com', '(382)120-4674', '558 Bryan Isle New Raymond, AL 55316'),
(492953650, 'Carol Lawson', 'joneskelsey@hotmail.com', '783.291.2840', '747 Miller Point Georgeton, UT 90920'),
(573712035, 'Heather Collins', 'thomashansen@hotmail.com', '+1-960-564-8502x177', '7878 Nelson Stravenue New Jacob, NE 62801'),
(56103750, 'Joshua Delgado', 'greenbrandon@gmail.com', '101-802-6501x00181', '741 Morgan Underpass South Sheila, IL 16740'),
(867865303, 'Jerry Greene', 'jay56@white-wiggins.com', '(703)649-5080x4789', '60823 Lauren Wall Apt. 074 New Kellyside, MI 21097'),
(355813998, 'Connor Wagner', 'haley03@boyd-harris.com', '0195959907', '506 Brandy Rapid Dawsonberg, RI 42470'),
(118434130, 'Marcia Randolph', 'huntrussell@smith.com', '508.559.9292', '327 Roberts Neck Gonzalezshire, WA 18952'),
(779362405, 'John Price', 'daniel62@powell.com', '546-202-9331x88558', 'PSC 5622, Box 3709 APO AA 38900'),
(499561637, 'Bill Hopkins', 'briannaweeks@gmail.com', '288-662-8572', '54675 Matthew Key Torresstad, ME 64087'),
(179287266, 'Ryan Harrison', 'carrie64@hotmail.com', '001-320-723-6362x5909', '66252 Trevor Harbor Apt. 887 Lake Ambertown, TN 81820'),
(667230218, 'Donald Young', 'stanleyhall@hotmail.com', '929-112-6985x483', '223 Dawson Mall Suite 571 Smithburgh, MS 75952'),
(311310607, 'Louis Gilbert', 'pgreene@hotmail.com', '461.203.7672x451', '530 Brown Corner Thompsontown, WV 70738'),
(319413369, 'Marcus Martin', 'jamesjenkins@harmon-randall.com', '+1-071-678-3536x79738', 'PSC 6227, Box 1600 APO AP 14578'),
(861461933, 'Sharon Ingram', 'seanbishop@yahoo.com', '270.214.8473x8548', '132 Vargas Turnpike Danielbury, DE 40715'),
(61660425, 'Kyle Martinez', 'haleronald@vargas-hernandez.info', '676-110-6562x32575', 'USS Greene FPO AA 26511'),
(603449840, 'Elizabeth Rodriguez', 'kathyrodriguez@thompson.biz', '(677)161-5260x6354', '3551 Rodriguez Port Apt. 808 Lake Charles, WI 24322'),
(917844640, 'Christopher Gomez', 'marcus34@hotmail.com', '001-066-886-7181x1777', '875 Jennifer Oval Suite 067 West Phillipmouth, IL 91337'),
(843106189, 'Brian Morton', 'garnold@bender-caldwell.com', '+1-352-961-6835x0739', '431 Rodriguez Estate Suite 894 New Christopherview, TN 74616');

SET FOREIGN_KEY_CHECKS=0;

-- insert invoices data
INSERT INTO invoices (invoice_id, billing_period, billed_amount, amount_paid, customer_id) VALUES
('FAC7068', '2024-06-00', 39940, 0, 149186547),
('FAC6577', '2024-06-00', 76145, 75145, 475925688),
('FAC5707', '2024-06-00', 179217, 179217, 112231541),
('FAC7188', '2024-07-00', 52267, 51767, 708283326),
('FAC7289', '2024-06-00', 157001, 156501, 959234562),
('FAC2190', '2024-07-00', 33428, 32428, 243553915),
('FAC6207', '2024-07-00', 75801, 0, 7005498),
('FAC1691', '2024-07-00', 17870, 16870, 724330039),
('FAC4680', '2024-06-00', 22294, 21794, 643387222),
('FAC8010', '2024-06-00', 193307, 0, 215716832),
('FAC1328', '2024-07-00', 159093, 0, 92651576),
('FAC8140', '2024-06-00', 175018, 0, 724488250),
('FAC4679', '2024-07-00', 110754, 0, 265881315),
('FAC3589', '2024-06-00', 163283, 0, 401149568),
('FAC6122', '2024-07-00', 22161, 22161, 778029406),
('FAC4870', '2024-07-00', 196275, 195775, 307805784),
('FAC5322', '2024-06-00', 20824, 20824, 484837788),
('FAC8663', '2024-07-00', 191634, 0, 962795476),
('FAC4380', '2024-06-00', 62979, 0, 965030358),
('FAC5128', '2024-06-00', 37472, 0, 644042817),
('FAC7986', '2024-06-00', 128381, 127881, 689720635),
('FAC7543', '2024-06-00', 26817, 0, 800125157),
('FAC7964', '2024-07-00', 147864, 147364, 268619593),
('FAC1309', '2024-06-00', 153404, 153404, 625774276),
('FAC8025', '2024-07-00', 14710, 0, 569906245),
('FAC8943', '2024-06-00', 49512, 49012, 328037408),
('FAC1190', '2024-07-00', 40302, 40302, 969677194),
('FAC4264', '2024-07-00', 27833, 27833, 796337665),
('FAC1462', '2024-07-00', 30813, 0, 636808209),
('FAC6381', '2024-07-00', 134884, 134884, 975617669),
('FAC8571', '2024-07-00', 29482, 28982, 569390187),
('FAC7018', '2024-06-00', 158030, 158030, 325459789),
('FAC4082', '2024-07-00', 196509, 196009, 325603096),
('FAC5756', '2024-06-00', 69026, 68526, 819212515),
('FAC9278', '2024-06-00', 166287, 0, 444056964),
('FAC6223', '2024-06-00', 179265, 178265, 717643055),
('FAC8510', '2024-07-00', 98069, 98069, 30122773),
('FAC4305', '2024-06-00', 153650, 153150, 622536043),
('FAC9358', '2024-06-00', 87402, 0, 747822485),
('FAC1208', '2024-07-00', 97457, 96457, 857630459),
('FAC5492', '2024-07-00', 145586, 0, 204909440),
('FAC6585', '2024-07-00', 163925, 163425, 241114561),
('FAC2187', '2024-07-00', 186218, 186218, 494808313),
('FAC7545', '2024-07-00', 160000, 159000, 315164793),
('FAC9699', '2024-07-00', 94554, 94554, 505327194),
('FAC2512', '2024-07-00', 153659, 0, 892962448),
('FAC1330', '2024-06-00', 165021, 0, 394523505),
('FAC9310', '2024-07-00', 115066, 0, 763963140),
('FAC9524', '2024-06-00', 161529, 0, 594590875),
('FAC7938', '2024-07-00', 167924, 167924, 25832528),
('FAC8649', '2024-06-00', 147991, 0, 97866586),
('FAC4348', '2024-07-00', 124048, 124048, 79987146),
('FAC9905', '2024-07-00', 138162, 0, 520620439),
('FAC5210', '2024-06-00', 161137, 161137, 260613460),
('FAC8033', '2024-06-00', 35669, 0, 511962082),
('FAC7850', '2024-07-00', 68367, 0, 527088924),
('FAC7378', '2024-07-00', 58242, 0, 181982363),
('FAC3104', '2024-07-00', 114319, 113319, 87147005),
('FAC2382', '2024-06-00', 37708, 37708, 623072602),
('FAC6022', '2024-07-00', 54969, 0, 729577216),
('FAC3529', '2024-06-00', 51911, 0, 696739719),
('FAC1856', '2024-06-00', 45733, 45233, 520971718),
('FAC5678', '2024-07-00', 100426, 0, 785949232),
('FAC7474', '2024-07-00', 32072, 31572, 519768710),
('FAC9956', '2024-07-00', 123720, 0, 64271785),
('FAC7570', '2024-06-00', 17171, 0, 357901640),
('FAC2909', '2024-06-00', 57259, 0, 830210363),
('FAC2139', '2024-07-00', 197548, 0, 696962875),
('FAC8752', '2024-06-00', 93635, 0, 896950954),
('FAC8107', '2024-07-00', 58585, 58585, 196811583),
('FAC7475', '2024-06-00', 87244, 0, 893866597),
('FAC3660', '2024-06-00', 55572, 0, 291010345),
('FAC9573', '2024-06-00', 51213, 50713, 915064128),
('FAC2238', '2024-06-00', 129980, 129480, 11426912),
('FAC6979', '2024-06-00', 42157, 41657, 174039328),
('FAC8740', '2024-06-00', 127084, 0, 565067343),
('FAC9872', '2024-06-00', 191436, 0, 333387701),
('FAC9634', '2024-06-00', 78561, 78561, 355405632),
('FAC9210', '2024-06-00', 163844, 162844, 71585472),
('FAC3888', '2024-07-00', 80735, 0, 708960117),
('FAC7110', '2024-06-00', 158138, 0, 626043010),
('FAC5649', '2024-06-00', 102093, 101593, 326481119),
('FAC1490', '2024-07-00', 104241, 103741, 599800533),
('FAC5439', '2024-06-00', 41300, 0, 492953650),
('FAC4962', '2024-06-00', 90456, 0, 573712035),
('FAC8801', '2024-07-00', 165402, 165402, 56103750),
('FAC1904', '2024-06-00', 107189, 106689, 867865303),
('FAC7503', '2024-07-00', 23411, 22411, 355813998),
('FAC7561', '2024-06-00', 11359, 11359, 118434130),
('FAC5390', '2024-06-00', 79808, 0, 779362405),
('FAC1760', '2024-07-00', 43148, 42648, 499561637),
('FAC3395', '2024-06-00', 102468, 0, 179287266),
('FAC1926', '2024-06-00', 116488, 0, 667230218),
('FAC7521', '2024-07-00', 61920, 0, 311310607),
('FAC6693', '2024-07-00', 142010, 141510, 319413369),
('FAC1513', '2024-06-00', 39792, 39792, 861461933),
('FAC3039', '2024-07-00', 88189, 0, 61660425),
('FAC3709', '2024-06-00', 179739, 0, 603449840),
('FAC3914', '2024-06-00', 106611, 0, 917844640),
('FAC8875', '2024-06-00', 142787, 141787, 843106189);

SET FOREIGN_KEY_CHECKS=1;

-- insert platforms data
INSERT INTO platforms (platform_id, platform_name) VALUES
(1,'Nequi'),
(2,'Daviplata');

SET FOREIGN_KEY_CHECKS=0;

-- insert transactions data
INSERT INTO transactions (transaction_id, transaction_type, transaction_amount, transaction_status, transaction_datetime, platform_id, invoice_id) VALUES
('TXN001', 'Pago de Factura', 38940.00, 'Pendiente', '2024-06-01 10:00:00', 1, 'FAC7068'),
('TXN002', 'Pago de Factura', 75145.00, 'Pendiente', '2024-07-09 12:00:00', 2, 'FAC6577'),
('TXN003', 'Pago de Factura', 179217.00, 'Fallida', '2024-06-13 10:00:00', 2, 'FAC5707'),
('TXN004', 'Pago de Factura', 51767.00, 'Fallida', '2024-07-26 13:00:00', 2, 'FAC7188'),
('TXN005', 'Pago de Factura', 156501.00, 'Completada', '2024-07-28 06:00:00', 2, 'FAC7289'),
('TXN006', 'Pago de Factura', 32428.00, 'Completada', '2024-07-16 21:00:00', 1, 'FAC2190'),
('TXN007', 'Pago de Factura', 75301.00, 'Pendiente', '2024-07-26 22:00:00', 2, 'FAC6207'),
('TXN008', 'Pago de Factura', 16870.00, 'Pendiente', '2024-06-17 16:00:00', 1, 'FAC1691'),
('TXN009', 'Pago de Factura', 21794.00, 'Fallida', '2024-07-10 23:00:00', 1, 'FAC4680'),
('TXN010', 'Pago de Factura', 193307.00, 'Completada', '2024-06-19 23:00:00', 2, 'FAC8010'),
('TXN011', 'Pago de Factura', 159093.00, 'Completada', '2024-06-01 06:00:00', 2, 'FAC1328'),
('TXN012', 'Pago de Factura', 174518.00, 'Pendiente', '2024-07-12 19:00:00', 1, 'FAC8140'),
('TXN013', 'Pago de Factura', 110254.00, 'Fallida', '2024-07-04 12:00:00', 2, 'FAC4679'),
('TXN014', 'Pago de Factura', 162283.00, 'Pendiente', '2024-07-12 04:00:00', 1, 'FAC3589'),
('TXN015', 'Pago de Factura', 22161.00, 'Pendiente', '2024-06-21 12:00:00', 2, 'FAC6122'),
('TXN016', 'Pago de Factura', 195775.00, 'Pendiente', '2024-07-08 12:00:00', 2, 'FAC4870'),
('TXN017', 'Pago de Factura', 20824.00, 'Fallida', '2024-06-27 03:00:00', 1, 'FAC5322'),
('TXN018', 'Pago de Factura', 191134.00, 'Completada', '2024-07-09 05:00:00', 1, 'FAC8663'),
('TXN019', 'Pago de Factura', 62979.00, 'Completada', '2024-06-16 20:00:00', 2, 'FAC4380'),
('TXN020', 'Pago de Factura', 36472.00, 'Fallida', '2024-06-08 22:00:00', 2, 'FAC5128'),
('TXN021', 'Pago de Factura', 127881.00, 'Completada', '2024-06-16 06:00:00', 1, 'FAC7986'),
('TXN022', 'Pago de Factura', 26317.00, 'Fallida', '2024-07-30 03:00:00', 2, 'FAC7543'),
('TXN023', 'Pago de Factura', 147364.00, 'Pendiente', '2024-07-27 01:00:00', 1, 'FAC7964'),
('TXN024', 'Pago de Factura', 153404.00, 'Pendiente', '2024-06-26 01:00:00', 2, 'FAC1309'),
('TXN025', 'Pago de Factura', 14210.00, 'Completada', '2024-07-07 10:00:00', 1, 'FAC8025'),
('TXN026', 'Pago de Factura', 49012.00, 'Completada', '2024-06-08 19:00:00', 2, 'FAC8943'),
('TXN027', 'Pago de Factura', 40302.00, 'Fallida', '2024-06-28 06:00:00', 2, 'FAC1190'),
('TXN028', 'Pago de Factura', 27833.00, 'Pendiente', '2024-07-03 01:00:00', 2, 'FAC4264'),
('TXN029', 'Pago de Factura', 30313.00, 'Fallida', '2024-07-29 02:00:00', 1, 'FAC1462'),
('TXN030', 'Pago de Factura', 134884.00, 'Fallida', '2024-07-26 20:00:00', 2, 'FAC6381'),
('TXN031', 'Pago de Factura', 28982.00, 'Completada', '2024-07-03 10:00:00', 1, 'FAC8571'),
('TXN032', 'Pago de Factura', 158030.00, 'Pendiente', '2024-06-15 17:00:00', 1, 'FAC7018'),
('TXN033', 'Pago de Factura', 196009.00, 'Fallida', '2024-06-24 08:00:00', 2, 'FAC4082'),
('TXN034', 'Pago de Factura', 68526.00, 'Pendiente', '2024-06-22 17:00:00', 2, 'FAC5756'),
('TXN035', 'Pago de Factura', 165287.00, 'Completada', '2024-06-23 12:00:00', 1, 'FAC9278'),
('TXN036', 'Pago de Factura', 178265.00, 'Fallida', '2024-06-28 11:00:00', 1, 'FAC6223'),
('TXN037', 'Pago de Factura', 98069.00, 'Completada', '2024-07-23 18:00:00', 1, 'FAC8510'),
('TXN038', 'Pago de Factura', 153150.00, 'Completada', '2024-07-28 00:00:00', 1, 'FAC4305'),
('TXN039', 'Pago de Factura', 86902.00, 'Pendiente', '2024-06-05 12:00:00', 2, 'FAC9358'),
('TXN040', 'Pago de Factura', 96457.00, 'Pendiente', '2024-06-28 04:00:00', 1, 'FAC1208'),
('TXN041', 'Pago de Factura', 145586.00, 'Fallida', '2024-06-07 20:00:00', 2, 'FAC5492'),
('TXN042', 'Pago de Factura', 163425.00, 'Fallida', '2024-07-15 19:00:00', 1, 'FAC6585'),
('TXN043', 'Pago de Factura', 186218.00, 'Pendiente', '2024-07-26 02:00:00', 1, 'FAC2187'),
('TXN044', 'Pago de Factura', 159000.00, 'Fallida', '2024-07-12 01:00:00', 2, 'FAC7545'),
('TXN045', 'Pago de Factura', 94554.00, 'Pendiente', '2024-07-21 21:00:00', 2, 'FAC9699'),
('TXN046', 'Pago de Factura', 152659.00, 'Fallida', '2024-07-26 11:00:00', 2, 'FAC2512'),
('TXN047', 'Pago de Factura', 165021.00, 'Pendiente', '2024-06-05 17:00:00', 2, 'FAC1330'),
('TXN048', 'Pago de Factura', 115066.00, 'Completada', '2024-06-10 10:00:00', 2, 'FAC9310'),
('TXN049', 'Pago de Factura', 161029.00, 'Completada', '2024-06-03 20:00:00', 2, 'FAC9524'),
('TXN050', 'Pago de Factura', 167924.00, 'Completada', '2024-07-29 03:00:00', 1, 'FAC7938'),
('TXN051', 'Pago de Factura', 147991.00, 'Pendiente', '2024-07-24 19:00:00', 2, 'FAC8649'),
('TXN052', 'Pago de Factura', 124048.00, 'Completada', '2024-07-26 11:00:00', 1, 'FAC4348'),
('TXN053', 'Pago de Factura', 138162.00, 'Completada', '2024-07-13 23:00:00', 1, 'FAC9905'),
('TXN054', 'Pago de Factura', 161137.00, 'Fallida', '2024-06-28 00:00:00', 1, 'FAC5210'),
('TXN055', 'Pago de Factura', 35669.00, 'Fallida', '2024-06-17 03:00:00', 2, 'FAC8033'),
('TXN056', 'Pago de Factura', 67867.00, 'Fallida', '2024-07-06 07:00:00', 1, 'FAC7850'),
('TXN057', 'Pago de Factura', 58242.00, 'Fallida', '2024-07-25 20:00:00', 1, 'FAC7378'),
('TXN058', 'Pago de Factura', 113319.00, 'Pendiente', '2024-06-09 20:00:00', 1, 'FAC3104'),
('TXN059', 'Pago de Factura', 37708.00, 'Completada', '2024-07-11 23:00:00', 2, 'FAC2382'),
('TXN060', 'Pago de Factura', 54969.00, 'Pendiente', '2024-07-20 16:00:00', 1, 'FAC6022'),
('TXN061', 'Pago de Factura', 51411.00, 'Completada', '2024-07-08 23:00:00', 2, 'FAC3529'),
('TXN062', 'Pago de Factura', 45233.00, 'Completada', '2024-07-17 05:00:00', 1, 'FAC1856'),
('TXN063', 'Pago de Factura', 99926.00, 'Fallida', '2024-06-10 01:00:00', 1, 'FAC5678'),
('TXN064', 'Pago de Factura', 31572.00, 'Completada', '2024-06-20 12:00:00', 1, 'FAC7474'),
('TXN065', 'Pago de Factura', 123720.00, 'Pendiente', '2024-06-14 03:00:00', 1, 'FAC9956'),
('TXN066', 'Pago de Factura', 17171.00, 'Fallida', '2024-07-29 14:00:00', 2, 'FAC7570'),
('TXN067', 'Pago de Factura', 56259.00, 'Fallida', '2024-07-23 09:00:00', 2, 'FAC2909'),
('TXN068', 'Pago de Factura', 196548.00, 'Fallida', '2024-06-20 22:00:00', 2, 'FAC2139'),
('TXN069', 'Pago de Factura', 93635.00, 'Completada', '2024-06-20 18:00:00', 2, 'FAC8752'),
('TXN070', 'Pago de Factura', 58585.00, 'Completada', '2024-07-15 21:00:00', 2, 'FAC8107'),
('TXN071', 'Pago de Factura', 86244.00, 'Completada', '2024-06-06 18:00:00', 2, 'FAC7475'),
('TXN072', 'Pago de Factura', 55572.00, 'Fallida', '2024-07-18 20:00:00', 1, 'FAC3660'),
('TXN073', 'Pago de Factura', 50713.00, 'Fallida', '2024-06-21 06:00:00', 1, 'FAC9573'),
('TXN074', 'Pago de Factura', 129480.00, 'Completada', '2024-06-29 18:00:00', 1, 'FAC2238'),
('TXN075', 'Pago de Factura', 41657.00, 'Completada', '2024-07-03 20:00:00', 2, 'FAC6979'),
('TXN076', 'Pago de Factura', 126084.00, 'Completada', '2024-06-15 11:00:00', 2, 'FAC8740'),
('TXN077', 'Pago de Factura', 190936.00, 'Fallida', '2024-06-04 07:00:00', 1, 'FAC9872'),
('TXN078', 'Pago de Factura', 78561.00, 'Fallida', '2024-06-21 21:00:00', 1, 'FAC9634'),
('TXN079', 'Pago de Factura', 162844.00, 'Completada', '2024-07-23 11:00:00', 1, 'FAC9210'),
('TXN080', 'Pago de Factura', 80235.00, 'Fallida', '2024-06-29 15:00:00', 1, 'FAC3888'),
('TXN081', 'Pago de Factura', 158138.00, 'Pendiente', '2024-06-18 00:00:00', 2, 'FAC7110'),
('TXN082', 'Pago de Factura', 101593.00, 'Pendiente', '2024-06-06 15:00:00', 2, 'FAC5649'),
('TXN083', 'Pago de Factura', 103741.00, 'Pendiente', '2024-06-22 03:00:00', 2, 'FAC1490'),
('TXN084', 'Pago de Factura', 41300.00, 'Pendiente', '2024-07-04 02:00:00', 2, 'FAC5439'),
('TXN085', 'Pago de Factura', 89956.00, 'Completada', '2024-06-19 11:00:00', 2, 'FAC4962'),
('TXN086', 'Pago de Factura', 165402.00, 'Completada', '2024-07-13 05:00:00', 1, 'FAC8801'),
('TXN087', 'Pago de Factura', 106689.00, 'Pendiente', '2024-07-04 09:00:00', 1, 'FAC1904'),
('TXN088', 'Pago de Factura', 22411.00, 'Completada', '2024-06-14 11:00:00', 1, 'FAC7503'),
('TXN089', 'Pago de Factura', 11359.00, 'Pendiente', '2024-06-27 05:00:00', 2, 'FAC7561'),
('TXN090', 'Pago de Factura', 79808.00, 'Pendiente', '2024-06-08 10:00:00', 1, 'FAC5390'),
('TXN091', 'Pago de Factura', 42648.00, 'Pendiente', '2024-07-05 21:00:00', 1, 'FAC1760'),
('TXN092', 'Pago de Factura', 101468.00, 'Pendiente', '2024-06-03 05:00:00', 2, 'FAC3395'),
('TXN093', 'Pago de Factura', 115488.00, 'Pendiente', '2024-06-21 17:00:00', 2, 'FAC1926'),
('TXN094', 'Pago de Factura', 61920.00, 'Completada', '2024-07-26 00:00:00', 2, 'FAC7521'),
('TXN095', 'Pago de Factura', 141510.00, 'Fallida', '2024-07-23 20:00:00', 1, 'FAC6693'),
('TXN096', 'Pago de Factura', 39792.00, 'Pendiente', '2024-07-08 19:00:00', 2, 'FAC1513'),
('TXN097', 'Pago de Factura', 87689.00, 'Completada', '2024-07-09 05:00:00', 2, 'FAC3039'),
('TXN098', 'Pago de Factura', 178739.00, 'Fallida', '2024-07-06 00:00:00', 1, 'FAC3709'),
('TXN099', 'Pago de Factura', 105611.00, 'Fallida', '2024-07-27 10:00:00', 2, 'FAC3914'),
('TXN100', 'Pago de Factura', 141787.00, 'Fallida', '2024-07-11 07:00:00', 2, 'FAC8875');

SET FOREIGN_KEY_CHECKS=1;

SELECT * FROM customers;
SELECT * FROM invoices;
SELECT * FROM platforms;
SELECT * FROM transactions;
/*
-- postman consult

-- total paid by customer
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(i.amount_paid) AS total_pagado
FROM customers c
JOIN invoices i ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_pagado DESC;

-- Outstanding bills with customer information and associated transaction
SELECT 
    i.invoice_id,
    i.billing_period,
    i.billed_amount,
    i.amount_paid,
    (i.billed_amount - i.amount_paid) AS saldo_pendiente,
    c.customer_name,
    c.email,
    t.transaction_id,
    t.transaction_status
FROM invoices i
JOIN customers c ON i.customer_id = c.customer_id
LEFT JOIN transactions t ON i.invoice_id = t.invoice_id
WHERE i.amount_paid < i.billed_amount
ORDER BY saldo_pendiente DESC;

-- List of transactions by platform
SELECT 
    p.platform_name,
    t.transaction_id,
    t.transaction_type,
    t.transaction_amount,
    t.transaction_status,
    t.transaction_datetime,
    c.customer_name,
    i.invoice_id
FROM transactions t
JOIN platforms p ON t.platform_id = p.platform_id
JOIN invoices i ON t.invoice_id = i.invoice_id
JOIN customers c ON i.customer_id = c.customer_id
WHERE p.platform_name = 'Nequi' -- Cambiar por 'Daviplata' si quieres
ORDER BY t.transaction_datetime DESC;
*/
