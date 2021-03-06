-- CREATE DATABASE
DROP DATABASE IF EXISTS mrs_project1;
CREATE DATABASE mrs_project1;

-- SELECT DATABASE
USE mrs_project1;

-- CREATE TABLES
CREATE TABLE customer_info
(
	customer_id					INT					PRIMARY KEY					AUTO_INCREMENT,
    first_name					VARCHAR(45)			NOT NULL,
    last_name					VARCHAR(45)			NOT NULL,
    address						VARCHAR(45)			NOT NULL,
    city						VARCHAR(45)			NOT NULL,
    state						VARCHAR(45)			NOT NULL,
    zip							INT					NOT NULL,
    phone_number				VARCHAR(45)			NOT NULL,
    email						VARCHAR(45)			NOT NULL
);
CREATE TABLE product_type
(
	product_id					INT					PRIMARY KEY					AUTO_INCREMENT,
    product_name				VARCHAR(45)			NOT NULL,
    product_description			VARCHAR(45)			NOT NULL
);
CREATE TABLE recall_notices
(
	notice_id					INT					PRIMARY KEY					AUTO_INCREMENT,
    product_id					INT					NOT NULL,
    affected_start_date			DATE				NOT NULL,
    affected_end_date			DATE				NOT NULL,
    issue_description			VARCHAR(45)			NOT NULL,
    CONSTRAINT recall_notice_fk_product_type
		FOREIGN KEY (product_id)
        REFERENCES product_type (product_id)
);
CREATE TABLE products
(
	serial_number				INT					PRIMARY KEY					AUTO_INCREMENT,
    product_id					INT					NOT NULL,
    manufactured_date			DATE				NOT NULL,
    CONSTRAINT products_fk_product_type
		FOREIGN KEY (product_id)
        REFERENCES product_type (product_id)
);
CREATE TABLE customer_purchases
(
	invoice_number				INT					AUTO_INCREMENT,
    sale_date					DATE				NOT NULL,
    customer_id					INT					NOT NULL,
    serial_number				INT					NOT NULL					UNIQUE,
    CONSTRAINT customer_purchases_pk
    PRIMARY KEY (invoice_number, serial_number),
    CONSTRAINT customer_purchases_fk_customer_info
		FOREIGN KEY (customer_id)
        REFERENCES customer_info (customer_id),
	CONSTRAINT customer_purchases_fk_products
		FOREIGN KEY (serial_number)
        REFERENCES products (serial_number)
);

-- FILL TABLES WITH VALUES
INSERT INTO customer_info VALUES
	(DEFAULT,'Fenelia','Harm','6430 Barnett Avenue','Charlotte','North Carolina',32309,'510-520-5925','fharm0@cbsnews.com'),
	(DEFAULT,'Bethena','Lye','5 Jay Center','Fort Lauderdale','Florida',13224,'513-802-1444','blye1@marketwatch.com'),
	(DEFAULT,'Killy','Rotge','63298 Loomis Terrace','Richmond','Virginia',67210,'321-384-5948','krotge2@chicagotribune.com'),
	(DEFAULT,'Iosep','Hinchon','39444 Tony Crossing','Saint Louis','Missouri',46015,'504-631-3408','ihinchon3@google.de'),
	(DEFAULT,'Reinwald','Canner','89 Walton Hill','Roanoke','Virginia',55598,'360-413-5823','rcanner4@gov.uk'),
	(DEFAULT,'Elwyn','Mingaye','8473 Birchwood Court','Springfield','Illinois',19104,'304-521-7079','emingaye5@fema.gov'),
	(DEFAULT,'Gale','Lehrmann','0346 Continental Park','San Jose','California',90605,'512-487-7768','glehrmann6@harvard.edu'),
	(DEFAULT,'Tulley','Tattersdill','7 Glacier Hill Trail','Santa Fe','New Mexico',27610,'626-140-6841','ttattersdill7@hexun.com'),
	(DEFAULT,'Annmaria','Bettley','3765 Stephen Way','Glendale','Arizona',80255,'202-620-8271','abettley8@aboutads.info'),
	(DEFAULT,'Crawford','Pourveer','997 Lukken Park','Everett','Washington',20016,'804-305-3261','cpourveer9@webmd.com'),
	(DEFAULT,'Helenka','Bissex','88 Porter Trail','Chattanooga','Tennessee',64136,'203-784-4939','hbissexa@live.com'),
	(DEFAULT,'Janice','Chastelain','31699 Westerfield Point','San Luis Obispo','California',98516,'214-873-9689','jchastelainb@wikimedia.org'),
	(DEFAULT,'Vinnie','Woodburn','04060 Nancy Terrace','Brooklyn','New York',78759,'302-749-1198','vwoodburnc@networkadvertising.org'),
	(DEFAULT,'Midge','Morson','2 Clyde Gallagher Terrace','Monticello','Minnesota',85045,'714-403-1513','mmorsond@ibm.com'),
	(DEFAULT,'Geno','Whetton','56 Longview Junction','Baltimore','Maryland',28289,'504-820-9530','gwhettone@livejournal.com'),
	(DEFAULT,'Adrianna','Nelthropp','4771 Randy Road','Cincinnati','Ohio',78225,'816-388-7968','anelthroppf@oracle.com'),
	(DEFAULT,'Janot','Lockhead','5 Raven Alley','Kansas City','Missouri',50369,'805-720-8032','jlockheadg@bloomberg.com'),
	(DEFAULT,'Bea','Caville','8 Johnson Trail','Colorado Springs','Colorado',85720,'601-691-7084','bcavilleh@w3.org'),
	(DEFAULT,'Nil','Robelin','197 Autumn Leaf Center','San Jose','California',85754,'915-793-2810','nrobelini@kickstarter.com'),
	(DEFAULT,'Tallie','Itzhak','1392 Morning Place','Salt Lake City','Utah',14646,'339-124-7836','titzhakj@qq.com'),
	(DEFAULT,'Filmer','Bird','2316 Lunder Center','Shawnee Mission','Kansas',85743,'616-497-8131','fbirdk@homestead.com'),
	(DEFAULT,'Kyrstin','Bisiker','7174 Northport Trail','Carson City','Nevada',10557,'415-612-0125','kbisikerl@epa.gov'),
	(DEFAULT,'Bernete','Cathro','59085 Katie Street','Baton Rouge','Louisiana',33462,'614-895-0374','bcathrom@geocities.jp'),
	(DEFAULT,'Ephrayim','Moutray Read','662 Anzinger Crossing','Fort Wayne','Indiana',2124,'917-178-0650','emoutrayreadn@bizjournals.com'),
	(DEFAULT,'Leonore','Idale','0967 Westend Pass','Richmond','Virginia',7522,'254-601-0633','lidaleo@csmonitor.com'),
	(DEFAULT,'Broddie','Tuddall','9 Continental Trail','Arlington','Texas',62723,'336-512-0114','btuddallp@biblegateway.com'),
	(DEFAULT,'Ali','Braiden','7 Eastlawn Crossing','New York City','New York',27150,'617-906-2987','abraidenq@telegraph.co.uk'),
	(DEFAULT,'Jillene','Jedrasik','777 8th Center','Flint','Michigan',94230,'360-246-5899','jjedrasikr@si.edu'),
	(DEFAULT,'Conan','Pottinger','07934 5th Crossing','Louisville','Kentucky',20456,'971-289-6333','cpottingers@hibu.com'),
	(DEFAULT,'Gherardo','Shoebotham','9 Derek Plaza','Honolulu','Hawaii',79171,'914-164-5149','gshoebothamt@sohu.com'),
	(DEFAULT,'Tessie','Narrie','63379 Sloan Pass','Dallas','Texas',78235,'618-946-6677','tnarrieu@g.co'),
	(DEFAULT,'Zaria','Elcock','1 Sullivan Center','Kalamazoo','Michigan',33731,'865-973-6593','zelcockv@europa.eu'),
	(DEFAULT,'Dominic','Foggarty','3 Claremont Place','Albany','New York',2216,'330-625-6478','dfoggartyw@sun.com'),
	(DEFAULT,'Tania','Godar','5385 Texas Drive','Grand Rapids','Michigan',36125,'202-923-4759','tgodarx@craigslist.org'),
	(DEFAULT,'Hedy','Oakton','9 Duke Pass','Sparks','Nevada',10009,'303-122-6791','hoaktony@gmpg.org'),
	(DEFAULT,'Anneliese','Danielot','0 Chive Avenue','Albany','New York',28289,'763-633-3222','adanielotz@netlog.com'),
	(DEFAULT,'Cyrillus','Clancy','311 Luster Parkway','Fayetteville','North Carolina',37131,'678-894-9731','cclancy10@un.org'),
	(DEFAULT,'Rafaela','Hutten','4107 Merrick Parkway','Long Beach','California',18768,'334-450-3605','rhutten11@whitehouse.gov'),
	(DEFAULT,'Shirl','Januszewicz','3597 Sunnyside Place','Huntsville','Alabama',77095,'972-193-4539','sjanuszewicz12@craigslist.org'),
	(DEFAULT,'Walden','Patley','75353 Morrow Alley','Long Beach','California',19136,'239-804-1790','wpatley13@google.ca'),
	(DEFAULT,'Elston','Sansom','615 Mcguire Parkway','Washington','District of Columbia',20918,'808-222-7041','esansom14@opensource.org'),
	(DEFAULT,'Anthea','Plimmer','1 Ohio Park','Washington','District of Columbia',85743,'304-378-4769','aplimmer15@ucsd.edu'),
	(DEFAULT,'Lock','Lethardy','34157 Mcbride Hill','Denver','Colorado',94280,'816-670-8254','llethardy16@bloglovin.com'),
	(DEFAULT,'Guendolen','Gooder','41 Northwestern Crossing','Shreveport','Louisiana',93005,'615-255-7519','ggooder17@sciencedirect.com'),
	(DEFAULT,'Stoddard','Ilott','297 Bartillon Point','Roanoke','Virginia',98687,'917-638-7540','silott18@whitehouse.gov'),
	(DEFAULT,'Tabina','Janway','2243 Village Way','Saint Paul','Minnesota',79118,'919-961-4549','tjanway19@histats.com'),
	(DEFAULT,'Bryan','Bladen','788 Stuart Lane','Mobile','Alabama',34276,'352-905-9001','bbladen1a@youtube.com'),
	(DEFAULT,'Genna','Aronowicz','9 Manitowish Trail','Corpus Christi','Texas',14225,'415-764-7821','garonowicz1b@biglobe.ne.jp'),
	(DEFAULT,'Aryn','Eilles','724 Utah Pass','Fort Worth','Texas',97286,'559-462-2703','aeilles1c@forbes.com'),
	(DEFAULT,'Shermie','Braxay','5 Maryland Alley','Littleton','Colorado',20088,'619-471-2164','sbraxay1d@ucla.edu'),
	(DEFAULT,'Berne','Cater','6 Ramsey Alley','Dayton','Ohio',52410,'312-935-1884','bcater1e@ibm.com'),
	(DEFAULT,'Lynnell','Stable','203 Northfield Alley','New Orleans','Louisiana',33158,'202-619-5404','lstable1f@photobucket.com'),
	(DEFAULT,'Roxane','Campagne','99965 Hansons Junction','Albuquerque','New Mexico',10203,'559-319-4930','rcampagne1g@360.cn'),
	(DEFAULT,'Holmes','Muzzillo','3766 Westport Hill','Alexandria','Virginia',27717,'309-421-0375','hmuzzillo1h@xinhuanet.com'),
	(DEFAULT,'Reggy','Shakesbye','4 Merchant Junction','Waco','Texas',68117,'312-769-8625','rshakesbye1i@home.pl'),
	(DEFAULT,'Regina','Scurrell','835 Ryan Hill','Appleton','Wisconsin',1605,'503-410-3143','rscurrell1j@irs.gov'),
	(DEFAULT,'Inesita','Wofenden','89500 Talisman Place','Pompano Beach','Florida',92153,'260-283-2702','iwofenden1k@businessinsider.com'),
	(DEFAULT,'Falito','Essberger','219 Center Pass','Houston','Texas',91103,'865-753-3342','fessberger1l@github.com'),
	(DEFAULT,'Timoteo','Sorro','9598 Karstens Place','Austin','Texas',30375,'805-444-8674','tsorro1m@pbs.org'),
	(DEFAULT,'Gherardo','Dawidman','73086 Trailsway Drive','Corpus Christi','Texas',68197,'801-876-3494','gdawidman1n@tripadvisor.com'),
	(DEFAULT,'Bradney','Cape','212 Sheridan Street','San Diego','California',72222,'704-756-3061','bcape1o@surveymonkey.com'),
	(DEFAULT,'Eldon','Brezlaw','0 Amoth Place','West Palm Beach','Florida',45243,'713-181-0067','ebrezlaw1p@uol.com.br'),
	(DEFAULT,'Farlie','Burchill','39727 Esch Plaza','Chattanooga','Tennessee',55564,'512-483-8624','fburchill1q@networksolutions.com'),
	(DEFAULT,'Melloney','Kilalea','862 Delladonna Hill','Akron','Ohio',95210,'402-990-4770','mkilalea1r@hhs.gov'),
	(DEFAULT,'Francklin','Najera','6 Manufacturers Alley','Pasadena','California',31416,'512-703-2290','fnajera1s@bloomberg.com'),
	(DEFAULT,'Debor','Hast','37 Aberg Terrace','Newark','Delaware',22036,'971-314-8787','dhast1t@wordpress.com'),
	(DEFAULT,'Sol','Statton','029 Lake View Trail','Detroit','Michigan',85705,'503-619-7312','sstatton1u@salon.com'),
	(DEFAULT,'Olivier','Fausch','2 Park Meadow Drive','Fort Lauderdale','Florida',20851,'701-986-9513','ofausch1v@deviantart.com'),
	(DEFAULT,'Mitch','Saffran','6 Fordem Circle','Pinellas Park','Florida',94280,'770-763-3663','msaffran1w@themeforest.net'),
	(DEFAULT,'Charlena','Mochan','8 Scoville Court','Shreveport','Louisiana',46221,'812-728-8384','cmochan1x@bing.com'),
	(DEFAULT,'Britt','Tayler','9032 Calypso Junction','Oklahoma City','Oklahoma',72118,'404-515-7987','btayler1y@washingtonpost.com'),
	(DEFAULT,'Teriann','Vaggs','34462 Huxley Avenue','Pittsburgh','Pennsylvania',94913,'505-581-2204','tvaggs1z@taobao.com'),
	(DEFAULT,'Franz','Zuppa','53331 Beilfuss Pass','Toledo','Ohio',88530,'616-669-9173','fzuppa20@msu.edu'),
	(DEFAULT,'Trisha','Lequeux','7505 Summer Ridge Circle','El Paso','Texas',95865,'540-446-0583','tlequeux21@digg.com'),
	(DEFAULT,'Sibby','Bolstridge','6784 Morning Park','Birmingham','Alabama',60604,'502-446-1032','sbolstridge22@netvibes.com'),
	(DEFAULT,'Norton','Ervin','2053 Lakeland Park','Gainesville','Florida',20226,'754-123-3980','nervin23@webs.com'),
	(DEFAULT,'Arlette','Telfer','04228 La Follette Plaza','Las Vegas','Nevada',20566,'312-102-4412','atelfer24@gizmodo.com'),
	(DEFAULT,'Celie','Musgrove','9 Mandrake Court','Portland','Oregon',48901,'814-851-5829','cmusgrove25@businessinsider.com'),
	(DEFAULT,'Guenna','Tallyn','22 Rusk Terrace','Louisville','Kentucky',15134,'918-424-4081','gtallyn26@arstechnica.com'),
	(DEFAULT,'Kris','Huton','0 Gerald Court','Chicago','Illinois',93715,'859-863-2934','khuton27@amazon.com'),
	(DEFAULT,'Augustine','Jolin','2676 Troy Terrace','Minneapolis','Minnesota',85383,'915-116-4730','ajolin28@answers.com'),
	(DEFAULT,'Herminia','Doxsey','85 Lindbergh Trail','Knoxville','Tennessee',45233,'661-803-3232','hdoxsey29@timesonline.co.uk'),
	(DEFAULT,'Eugen','Burghall','8 Autumn Leaf Court','San Angelo','Texas',78764,'334-754-5743','eburghall2a@google.it'),
	(DEFAULT,'Dixie','Cartmail','11223 Badeau Park','Minneapolis','Minnesota',62776,'714-400-5922','dcartmail2b@rediff.com'),
	(DEFAULT,'Peadar','Hambric','13730 Ridge Oak Alley','Charlotte','North Carolina',2216,'814-584-6749','phambric2c@cyberchimps.com'),
	(DEFAULT,'Zachariah','Lethbridge','3782 Declaration Way','New Orleans','Louisiana',53277,'914-747-1693','zlethbridge2d@people.com.cn'),
	(DEFAULT,'Lotti','Harradine','895 Lakewood Gardens Road','Jacksonville','Florida',92662,'916-923-7623','lharradine2e@eventbrite.com'),
	(DEFAULT,'Gibby','Pietesch','4 Schmedeman Drive','Houston','Texas',29424,'786-102-0587','gpietesch2f@adobe.com'),
	(DEFAULT,'Tish','Tille','923 Rutledge Way','Denton','Texas',94286,'210-272-2219','ttille2g@printfriendly.com'),
	(DEFAULT,'Ophelia','Ackeroyd','72 Talmadge Circle','Miami','Florida',20226,'614-563-8764','oackeroyd2h@nih.gov'),
	(DEFAULT,'Mathew','Bissill','5926 Almo Plaza','Lancaster','California',80291,'941-880-6227','mbissill2i@deviantart.com'),
	(DEFAULT,'Ange','Paten','49 Declaration Plaza','New York City','New York',44105,'757-218-4381','apaten2j@opensource.org'),
	(DEFAULT,'Flor','Roddy','7776 Victoria Hill','Charleston','South Carolina',95054,'937-600-5568','froddy2k@digg.com'),
	(DEFAULT,'Mano','Puttrell','59 Service Center','New York City','New York',62756,'910-974-1287','mputtrell2l@jalbum.net'),
	(DEFAULT,'Arin','Snel','95 Florence Center','Saint Louis','Missouri',48930,'352-569-7671','asnel2m@apache.org'),
	(DEFAULT,'Chiarra','Swendell','717 Mayfield Court','Phoenix','Arizona',63136,'414-865-2214','cswendell2n@newsvine.com'),
	(DEFAULT,'Dorie','Simeone','310 Eagan Drive','Annapolis','Maryland',33811,'775-976-7012','dsimeone2o@omniture.com'),
	(DEFAULT,'Ashlee','Stede','1 Shoshone Circle','Washington','District of Columbia',66105,'816-372-1259','astede2p@prnewswire.com'),
	(DEFAULT,'Thornie','Gammage','85242 Pankratz Plaza','New Orleans','Louisiana',10045,'850-183-5645','tgammage2q@narod.ru'),
	(DEFAULT,'Courtenay','Atling','214 Karstens Trail','Chicago','Illinois',32255,'503-283-5261','catling2r@pbs.org');

INSERT INTO product_type VALUES
	(DEFAULT,'Gran Torino','Mid-size Car'),
	(DEFAULT,'Galaxie','Full-size Car'),
	(DEFAULT,'Maverick','Compact Car'),
	(DEFAULT,'F250','Super Duty Truck'),
	(DEFAULT,'Country','Sedan'),
	(DEFAULT,'Mustang','Muscle Car'),
	(DEFAULT,'Pinto','Subcompact Car'),
	(DEFAULT,'LTD','Full-size Car'),
	(DEFAULT,'Granada','Compact Car'),
	(DEFAULT,'Thunderbird','luxury Car'),
	(DEFAULT,'Fiesta','Subcompact Car'),
	(DEFAULT,'Fairmont ','Compact Car'),
	(DEFAULT,'Escort ','Compact Car'),
	(DEFAULT,'Ranger','Light Duty Truck');

INSERT INTO recall_notices VALUES
	(DEFAULT,1,'2018-10-19','2018-12-03','Breaks catch fire '),
	(DEFAULT,5,'2000-02-16','2000-06-15','Air bags explode'),
	(DEFAULT,10,'2014-09-10','2016-08-30','Bumper falls off'),
	(DEFAULT,6,'2004-12-28','2005-03-28','Tires fall off'),
	(DEFAULT,2,'2002-07-13','2003-08-17','Radio catches fire'),
	(DEFAULT,13,'2010-09-15','2011-09-10','Seatbelt comes loose'),
	(DEFAULT,8,'2016-05-25','2018-10-16','Exhaust explodes'),
	(DEFAULT,3,'2010-10-03','2011-01-10','Steer wheel comes loose'),
	(DEFAULT,2,'2016-03-27','2016-09-23','Break pedal snaps'),
	(DEFAULT,5,'2018-09-03','2019-01-22','Hood open while driving'),
	(DEFAULT,7,'2016-12-01','2017-08-08','Transmission failure'),
	(DEFAULT,9,'2012-04-08','2012-06-22','Exhaust vented to cab');

INSERT INTO products VALUES
	(DEFAULT,5,'2008-08-14'),
	(DEFAULT,10,'1999-02-11'),
	(DEFAULT,11,'2000-09-10'),
	(DEFAULT,8,'2006-08-05'),
	(DEFAULT,13,'2003-11-23'),
	(DEFAULT,7,'1989-07-21'),
	(DEFAULT,9,'1996-01-31'),
	(DEFAULT,4,'2000-11-26'),
	(DEFAULT,1,'1985-06-01'),
	(DEFAULT,8,'2016-01-31'),
	(DEFAULT,2,'2015-08-17'),
	(DEFAULT,2,'1988-02-13'),
	(DEFAULT,1,'1995-05-15'),
	(DEFAULT,11,'2012-05-22'),
	(DEFAULT,4,'2009-12-05'),
	(DEFAULT,7,'1999-12-14'),
	(DEFAULT,3,'1996-10-30'),
	(DEFAULT,14,'1999-06-13'),
	(DEFAULT,1,'2013-03-31'),
	(DEFAULT,10,'2013-03-16'),
	(DEFAULT,7,'1988-03-17'),
	(DEFAULT,6,'1997-04-20'),
	(DEFAULT,14,'1980-03-21'),
	(DEFAULT,1,'2007-10-29'),
	(DEFAULT,12,'2005-05-06'),
	(DEFAULT,3,'2005-09-29'),
	(DEFAULT,8,'2018-02-15'),
	(DEFAULT,9,'2015-10-13'),
	(DEFAULT,8,'1999-12-30'),
	(DEFAULT,7,'1985-02-06'),
	(DEFAULT,7,'2001-10-20'),
	(DEFAULT,9,'1992-11-15'),
	(DEFAULT,9,'2006-02-22'),
	(DEFAULT,1,'1981-05-26'),
	(DEFAULT,5,'1992-01-07'),
	(DEFAULT,9,'1981-07-23'),
	(DEFAULT,3,'2000-06-11'),
	(DEFAULT,8,'2006-05-23'),
	(DEFAULT,14,'2004-09-28'),
	(DEFAULT,8,'1987-01-21'),
	(DEFAULT,8,'2002-11-29'),
	(DEFAULT,8,'2002-12-19'),
	(DEFAULT,9,'1984-12-20'),
	(DEFAULT,11,'2016-10-12'),
	(DEFAULT,11,'2016-10-03'),
	(DEFAULT,5,'1982-09-22'),
	(DEFAULT,14,'2014-02-26'),
	(DEFAULT,13,'2007-01-23'),
	(DEFAULT,12,'1985-01-15'),
	(DEFAULT,9,'2015-06-15'),
	(DEFAULT,3,'1987-02-17'),
	(DEFAULT,11,'1995-07-08'),
	(DEFAULT,7,'1995-10-21'),
	(DEFAULT,3,'1988-06-20'),
	(DEFAULT,12,'2000-02-09'),
	(DEFAULT,2,'2013-01-09'),
	(DEFAULT,7,'1995-12-23'),
	(DEFAULT,13,'1993-03-21'),
	(DEFAULT,11,'2001-08-01'),
	(DEFAULT,4,'1986-09-04'),
	(DEFAULT,11,'1984-03-12'),
	(DEFAULT,2,'1988-08-31'),
	(DEFAULT,1,'1991-05-26'),
	(DEFAULT,7,'2007-01-09'),
	(DEFAULT,2,'2002-08-08'),
	(DEFAULT,5,'1999-05-09'),
	(DEFAULT,8,'1980-01-10'),
	(DEFAULT,11,'1987-08-27'),
	(DEFAULT,6,'1997-04-28'),
	(DEFAULT,1,'2013-11-01'),
	(DEFAULT,7,'2016-11-03'),
	(DEFAULT,1,'2018-11-20'),
	(DEFAULT,7,'2004-09-11'),
	(DEFAULT,10,'1986-08-06'),
	(DEFAULT,10,'2004-11-13'),
	(DEFAULT,4,'2004-07-21'),
	(DEFAULT,7,'1989-11-10'),
	(DEFAULT,4,'1987-08-14'),
	(DEFAULT,12,'1988-01-20'),
	(DEFAULT,2,'2017-07-17'),
	(DEFAULT,2,'1993-07-28'),
	(DEFAULT,11,'2005-05-18'),
	(DEFAULT,3,'1992-08-19'),
	(DEFAULT,6,'1994-09-23'),
	(DEFAULT,4,'2016-12-09'),
	(DEFAULT,7,'2002-10-06'),
	(DEFAULT,12,'2010-09-20'),
	(DEFAULT,11,'1985-12-05'),
	(DEFAULT,12,'1994-05-15'),
	(DEFAULT,8,'2000-07-01'),
	(DEFAULT,2,'1983-12-17'),
	(DEFAULT,10,'2001-11-10'),
	(DEFAULT,6,'1999-09-27'),
	(DEFAULT,4,'1992-09-06'),
	(DEFAULT,3,'1998-11-23'),
	(DEFAULT,2,'2017-01-26'),
	(DEFAULT,7,'1988-04-15'),
	(DEFAULT,8,'2012-12-20'),
	(DEFAULT,11,'2007-05-13'),
	(DEFAULT,13,'2006-01-21');
	
INSERT INTO customer_purchases VALUES
	(DEFAULT,'2019-01-04',57,1),
	(DEFAULT,'2017-01-03',84,2),
	(DEFAULT,'2016-01-08',79,3),
	(DEFAULT,'2014-01-05',92,4),
	(DEFAULT,'2010-08-21',87,5),
	(DEFAULT,'2009-03-01',96,6),
	(DEFAULT,'2012-02-18',3,7),
	(DEFAULT,'2003-07-11',35,8),
	(DEFAULT,'2006-11-27',83,9),
	(DEFAULT,'2018-08-25',21,10),
	(DEFAULT,'2015-08-23',24,11),
	(DEFAULT,'2011-02-22',59,12),
	(DEFAULT,'2009-07-23',5,13),
	(DEFAULT,'2014-06-26',87,14),
	(DEFAULT,'2013-12-13',22,15),
	(DEFAULT,'2005-05-07',64,16),
	(DEFAULT,'2016-05-20',32,17),
	(DEFAULT,'2011-02-22',29,18),
	(DEFAULT,'2015-03-15',54,19),
	(DEFAULT,'2017-05-13',93,20),
	(DEFAULT,'2012-05-19',80,21),
	(DEFAULT,'2001-06-06',19,22),
	(DEFAULT,'1985-11-08',96,23),
	(DEFAULT,'2012-06-13',32,24),
	(DEFAULT,'2010-04-18',24,25),
	(DEFAULT,'2010-11-09',80,26),
	(DEFAULT,'2019-01-21',39,27),
	(DEFAULT,'2018-04-14',37,28),
	(DEFAULT,'2000-10-31',70,29),
	(DEFAULT,'1991-09-14',91,30),
	(DEFAULT,'2015-08-22',80,31),
	(DEFAULT,'1994-12-29',42,32),
	(DEFAULT,'2009-03-21',18,33),
	(DEFAULT,'2004-11-26',68,34),
	(DEFAULT,'1993-10-29',25,35),
	(DEFAULT,'1993-05-27',66,36),
	(DEFAULT,'2009-03-19',98,37),
	(DEFAULT,'2008-03-09',43,38),
	(DEFAULT,'2011-08-05',39,39),
	(DEFAULT,'2017-09-06',53,40),
	(DEFAULT,'2016-02-13',18,41),
	(DEFAULT,'2014-03-14',48,42),
	(DEFAULT,'2001-08-18',49,43),
	(DEFAULT,'2017-04-17',81,44),
	(DEFAULT,'2018-10-29',44,45),
	(DEFAULT,'2001-04-22',18,46),
	(DEFAULT,'2015-07-30',25,47),
	(DEFAULT,'2012-07-25',9,48),
	(DEFAULT,'1989-04-02',85,49),
	(DEFAULT,'2017-10-26',65,50),
	(DEFAULT,'1991-04-28',96,51),
	(DEFAULT,'2007-08-01',29,52),
	(DEFAULT,'2013-06-18',27,53),
	(DEFAULT,'1999-04-13',57,54),
	(DEFAULT,'2015-07-19',39,55),
	(DEFAULT,'2014-08-27',41,56),
	(DEFAULT,'2007-02-23',25,57),
	(DEFAULT,'2017-05-26',12,58),
	(DEFAULT,'2003-09-14',17,59),
	(DEFAULT,'1999-03-25',9,60),
	(DEFAULT,'2015-06-01',87,61),
	(DEFAULT,'2013-03-23',55,62),
	(DEFAULT,'2017-02-12',95,63),
	(DEFAULT,'2015-11-01',73,64),
	(DEFAULT,'2013-09-08',37,65),
	(DEFAULT,'2003-11-03',33,66),
	(DEFAULT,'1984-03-16',5,67),
	(DEFAULT,'2006-12-27',18,68),
	(DEFAULT,'2015-05-14',23,69),
	(DEFAULT,'2015-09-03',35,70),
	(DEFAULT,'2017-02-05',85,71),
	(DEFAULT,'2018-12-16',80,72),
	(DEFAULT,'2012-09-11',48,73),
	(DEFAULT,'2007-10-03',9,74),
	(DEFAULT,'2014-07-23',75,75),
	(DEFAULT,'2017-05-28',39,76),
	(DEFAULT,'2009-12-28',100,77),
	(DEFAULT,'1994-08-31',61,78),
	(DEFAULT,'2009-07-04',21,79),
	(DEFAULT,'2018-11-08',90,80),
	(DEFAULT,'2004-08-07',68,81),
	(DEFAULT,'2015-10-30',50,82),
	(DEFAULT,'2017-03-02',100,83),
	(DEFAULT,'2003-06-10',10,84),
	(DEFAULT,'2017-10-12',32,85),
	(DEFAULT,'2006-05-07',41,86),
	(DEFAULT,'2017-12-16',15,87),
	(DEFAULT,'2007-09-13',81,88),
	(DEFAULT,'2014-07-18',52,89),
	(DEFAULT,'2008-11-17',19,90),
	(DEFAULT,'1993-10-05',88,91),
	(DEFAULT,'2011-08-22',87,92),
	(DEFAULT,'2011-12-22',100,93),
	(DEFAULT,'2013-05-13',46,94),
	(DEFAULT,'2014-06-10',75,95),
	(DEFAULT,'2017-03-20',75,96),
	(DEFAULT,'2015-08-26',100,97),
	(DEFAULT,'2016-12-19',72,98),
	(DEFAULT,'2008-02-22',38,99),
	(DEFAULT,'2014-05-15',1,100);