-- -- NOTE: For some reason this SQL file imports into phpmyadmin with errors. However, all the statements work perfectly if you copy and paste them individually into the sql text box. 

--
-- view all equipment rented in year
--
	CREATE VIEW Rented_equipment_2018 AS
SELECT type AS ItemRented ,member_id ,date_taken, date_returned
FROM rented_equipment_log
WHERE date_taken BETWEEN '2018-01-01' AND '2018-12-31'
GROUP BY date_taken

--
-- View members who haven’t rented any equipment in the year 
--
 	CREATE VIEW non_active_members_2018 AS
SELECT firstname, lastname
FROM members
WHERE member_id  NOT IN (SELECT member_id
           FROM rented_equipment_2018);

--	
-- View list of life jackets by size and quantity
--
	CREATE VIEW Life_Jacket_List AS
SELECT size,SUM(quantity) AS Quantity
FROM life_jackets LEFT JOIN equipment USING(model)
GROUP BY size with ROLLUP

--
-- As well as these 3 views, we created some more for the imaginary software system.
--

--
-- COMMITTEE LIST
--
CREATE VIEW committee_list AS
SELECT firstname, lastname, position
FROM members
WHERE position != “basic member”

--
-- Members Email List
--
CREATE VIEW members_email_list AS
SELECT firstname , lastname, email 
FROM members

--
-- Members List
--
CREATE VIEW members_email_list AS
SELECT firstname , lastname
FROM members

--
-- Kayak List
--
CREATE VIEW Kayak_List AS
SELECT maker,model,SUM(quantity) AS Quantity
FROM kayaks LEFT JOIN equipment USING(model)
GROUP BY quantity

--
-- Oar List
--
CREATE VIEW Oar_List AS
SELECT maker,model,length_in_cm,SUM(quantity) AS Quantity
FROM oars LEFT JOIN equipment USING(model)
GROUP BY quantity

--
-- View rented equipment
--
CREATE VIEW Rented_equipment_2018 AS
SELECT type AS ItemRented ,member_id ,date_taken, date_returned
FROM rented_equipment_log
WHERE date_taken BETWEEN '2018-01-01' AND '2018-12-31'
GROUP BY date_taken

--
-- View rented equipment
--
CREATE VIEW Rented_equipment_2017 AS
SELECT type AS ItemRented ,member_id ,date_taken, date_returned
FROM rented_equipment_log
WHERE date_taken BETWEEN '2017-01-01' AND '2017-12-31'
GROUP BY date_taken

--
-- Email list of members who haven’t returned equipment
--
CREATE VIEW rented_equipment_to_be_returned AS
SELECT firstname , lastname, email , date_taken , type
FROM members JOIN rented_equipment_log USING(member_id)
WHERE date_returned IS NULL

--
-- Non active members 
--
CREATE VIEW non_active_members_2018 AS
SELECT firstname, lastname
FROM members
WHERE member_id  NOT IN (SELECT member_id FROM rented_equipment_2018);


-- Indexes
-- The indexes used for each of these queries were the primary keys and in the case where the member table was called the unique key was also used as an index to speed up the time taken to carry out the query. Having these indexes meant that all our queries were able to be executed in under 0.001 of a second.
