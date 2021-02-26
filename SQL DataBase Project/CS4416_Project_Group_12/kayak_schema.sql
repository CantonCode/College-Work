--
-- Database: 'kayakclub'
--
-- --------------------------------------------------------

--
-- Table structure for table 'members'
--

CREATE TABLE IF NOT EXISTS members (
  member_id char(10) NOT NULL,
  firstname varchar(32) default NULL,
  lastname varchar(32) default NULL,
  email varchar(128) default NULL,
  position varchar(60) default NULL,
  PRIMARY KEY (member_id),
  UNIQUE (email)
);

--
-- Dumping data for table 'members'
--

INSERT INTO members (member_id, firstname, lastname, email, position) 
VALUES
  (17232, 'Anne','O''Brien', '17232@ul.ie', 'Basic member'),
  (154423, 'Dan', 'Fitz', '154423@ul.ie', 'Committee member'),
  (123343, 'Sarah', 'Jones', '123343@ul.ie', 'Chairperson'),
  (18123, 'Aisling', 'Dean' ,'18123@ul.ie', 'Basic member'),
  (173455, 'Jack', 'Morrissey', '173455@ul.ie', 'Basic member');

-- --------------------------------------------------------

--
-- Table structure for table 'kayaks'
--

CREATE TABLE IF NOT EXISTS kayaks (
  model varchar(30) NOT NULL default '',
  length_in_feet double default NULL,
  capacity_in_pounds int default NULL,
  best_uses varchar(120) default NULL,
  PRIMARY KEY (model)
);

--
-- Dumping data for table 'kayaks'
--

INSERT INTO kayaks (model, length_in_feet, capacity_in_pounds, best_uses) 
VALUES
  ('Mora MV', 15.6, '220', 'rock gardening, ocean, lake'),
  ('Selki HV', 15.9, '280', 'fishing, ocean, lake'),
  ('Adaro', 12.6, '250', 'recreational'),
  ('Kurki', 17.3, '240', 'windy conditions - ocean'),
  ('Kelpie', 15.9, '190', 'small paddlers');

-- --------------------------------------------------------

--
-- Table structure for table 'oars'
--

CREATE TABLE IF NOT EXISTS oars (
  model varchar(30) NOT NULL default '',
  length_in_cm double default NULL,
  PRIMARY KEY(model)
);

--
-- Dumping data for table 'oars'
--

INSERT INTO oars (model, length_in_cm)
VALUES
  ('1001', 230),
  ('1002', 240),
  ('1003', 210),
  ('1004', 250),
  ('1005', 220),
  ('1006', 260);

-- --------------------------------------------------------

--
-- Table structure for table 'life_jackets'
--

CREATE TABLE IF NOT EXISTS life_jackets (
  model varchar(30) NOT NULL default '',
  size char(1) NOT NULL default '',
  PRIMARY KEY (model)
);

--
-- Dumping data for table 'life_jackets'
--

INSERT INTO life_jackets (model, size)
VALUES
  ('1007', 'M'),
  ('1008', 'S'),
  ('1009', 'L'),
  ('1010', 'M'),
  ('1011', 'S'),
  ('1012', 'L');

-- --------------------------------------------------------

--
-- Table structure for table 'equipment'
--

CREATE TABLE IF NOT EXISTS equipment (
  model varchar(30) NOT NULL default '',
  maker varchar(30) default NULL,
  type varchar(20) default NULL,
  quantity int default NULL,
  PRIMARY KEY (model)
);

--
-- Dumping data for table 'equipment'
--

INSERT INTO equipment (maker, model, type, quantity)
VALUES
  ('Jackson', 'Mora MV', 'kayak', 10),
  ('NuCanoe', 'Selki HV', 'kayak', 14),
  ('Bonafide', 'Adaro', 'kayak', 3),
  ('NuCanoe', 'Kurki', 'kayak', 18),
  ('FeelFree', 'Kelpie', 'kayak', 7), 
  ('Wilderness', '1001', 'oar', 14),
  ('EddyLine', '1002', 'oar', 20),
  ('Jackson', '1003', 'oar', 10),
  ('Native Watercraft', '1004', 'oar', 30),
  ('Bonafide', '1005', 'oar', 22),
  ('EddyLine', '1006', 'oar', 12),
  ('FeelFree', '1007', 'life jacket', 20),
  ('Native Watercraft', '1008', 'life jacket', 14),
  ('OldTown', '1009', 'life jacket', 25),
  ('Jackson', '1010', 'life jacket', 19),
  ('Bonafide', '1011', 'life jacket', 21),
  ('Bonafide', '1012', 'life jacket', 23);

-- --------------------------------------------------------

--
-- Table structure for table 'rented_equipment_log'
--

CREATE TABLE IF NOT EXISTS rented_equipment_log (
  member_id double NOT NULL,
  model varchar(30) NOT NULL default '',
  type varchar(20) default NULL,
  date_taken DATE NOT NULL,
  date_returned DATE default NULL,
  PRIMARY KEY (member_id, date_taken)
);

--
-- Dumping data for table 'rented_equipment_log'
--
  
INSERT INTO rented_equipment_log (model, type, member_id, date_taken, date_returned)
VALUES
 ('1012', 'life jacket', 17232, '2017-03-12', '2017-03-15'),
  ('Mora MV', 'kayak', 18123, '2017-05-22', '2017-04-25'),
  ('1006', 'oar', 154423, '2017-05-30', '2017-06-02'),
  ('Adaro', 'kayak', 173455, '2018-01-09', '2018-01-10'),
  ('1011', 'life jacket',123343 , '2018-01-20', '2018-01-22'),
  ('FeelFree', 'kayak', 18123, '2018-05-22', NULL );
