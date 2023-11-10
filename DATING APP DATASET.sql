CREATE database SchMg;
DROP database SchMg;
CREATE database DatingData;
USE DatingData;
SELECT * FROM dating_app;
SELECT DISTINCT Interests FROM dating_app;
ALTER TABLE dating_app
RENAME Column `Looking For` TO Aim; -- To Rename I had to lock in backticks
SELECT DISTINCT Children FROM dating_app;
SELECT DISTINCT Gender FROM dating_app;
SELECT DISTINCT `Education Level` FROM dating_app; -- To check for unique values 
SELECT DISTINCT Occupation FROM dating_app; -- To check for unique values 
SELECT DISTINCT `Frequency of Usage` FROM dating_app; -- To check for unique values


-- Questions to answer 
-- 1. All Male that visited the site
SELECT * FROM dating_app WHERE gender = "Male";

-- 2. All Female that visited the site
SELECT * FROM dating_app WHERE gender = "Female";

-- 3. Those below 18 and group based on what they are looking for
SELECT Aim, count(gender) FROM dating_app GROUP BY Aim ORDER BY count(gender);

-- 4. Those above 20 and group based on what they are looking for
SELECT Gender, Age, Aim, Children, `Frequency of Usage` FROM dating_app WHERE Age > 20 ORDER BY Aim;
SELECT count(gender), `Education Level`  FROM dating_app WHERE Age > 20 GROUP BY `Education Level`; -- This is to check the Education level of majority that visits the site

-- 5. Those who are female, above 20 and 5' feet and above
SELECT gender, `Education Level`, Aim, Children, `Frequency of Usage`, Age, Height FROM dating_app WHERE  Age > 20 AND Height > 5.0;

-- 6. Those who are females and have children
SELECT gender, count(gender) FROM dating_app GROUP BY gender; -- The count of the gender of the Individuals who visits the site
SELECT count(gender), Children FROM dating_app WHERE gender = "Female" AND Children = "Yes"; -- 87 Females have children

-- 7. Those who are males and have children
SELECT gender, Children FROM dating_app WHERE gender = "Male" AND Children = "Yes";
SELECT gender, count(gender) FROM dating_app WHERE gender = "Male" AND Children = "Yes" GROUP BY Children;
SELECT count(Children), gender FROM dating_app WHERE Children = "Yes" GROUP BY gender; -- 83 Males have children

-- 8. Group by Education Level and Occupation
SELECT `Education Level`, count(Age) FROM dating_app GROUP BY `Education Level` order by count(Age);
SELECT `Occupation`, count(Age) FROM dating_app GROUP BY Occupation order by count(Age);

-- 9. Show Individuals who are not Students
SELECT Age, Gender, Aim, Children, Occupation FROM dating_app WHERE Occupation <> "Student";
SELECT Age, Gender, Aim, Children, Occupation FROM dating_app WHERE Occupation = "Student";

-- 10. THe highest frequency of Usage
SELECT count(`Frequency of Usage`) , `Frequency of Usage` FROM dating_app GROUP BY `Frequency of Usage`;

-- 11. A Case Expression of Children
SELECT 
    gender,
    Age,
    Aim,
    CASE (Children)
        WHEN "No" THEN 'There is every tendency for you to get a partner very soon'
        WHEN "Yes" THEN 'It might be a bit tough but still be sincere and inform whoever shows interest'
        ELSE 'I guess you do not want to inform us, try your luck!'
    END Tendency_to_get_a_partner
FROM
    dating_app;