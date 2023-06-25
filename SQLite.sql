SELECT * from Expanded_data_with_more_features1

/*What is the total number of records in the dataset?*/
SELECT COUNT(*) as totalrecords from Expanded_data_with_more_features1

/*How many females and males are present in the dataset?*/
SELECT
    COUNT(CASE WHEN c2 = 'female' THEN 1 END) AS FemaleCount,
    COUNT(CASE WHEN c2 = 'male' THEN 1 END) AS MaleCount
FROM Expanded_data_with_more_features1;

 /*What is the distribution of students across different groups */
 SELECT count (case when c3= 'group A' then 1 end) as totalstudentgpA,
 count (case when c3= 'group B' then 1 end) as totalstudentgpB
 from Expanded_data_with_more_features1;
 
 /*What is the highest level of education achieved by the students?*/
 SELECT max(case c4 when "bachelor's degree" then 4
            when "high school" then 1
            ELSE 0 end) as higheducation
 from Expanded_data_with_more_features1;
 
 /*How many students have completed their education? */
 select count (c1) as student from Expanded_data_with_more_features1
 where c6 = 'completed' 
 GROUP by c6;
 
 /*What is the average score in each subject (math, reading, writing)?*/
 SELECT round(avg(c13),0) as AvgMathscore , round(avg(c14),0) AS AvgReadingscore , round(avg(c15),0) as AvgWritingscore
 from Expanded_data_with_more_features1;
 
 /*What is the overall average score of the students?*/
 select round(avg(c13)+avg(c14)+avg(c15)/3) as Avgscore 
 from Expanded_data_with_more_features1;
 
 /*How many students have free/reduced lunch?*/
 
SELECT COUNT(c5) as studentsfreereducedlunch
from Expanded_data_with_more_features1
where c5 ='free/reduced' ;

/*What is the average score of students with free/reduced lunch compared to those with a standard lunch?*/
SELECT
c5, round(avg(c13)) as Mathscore, round(avg(c14)) as Readingscore, round(avg(c15)) as writingscore
from Expanded_data_with_more_features1
GROUP by c5;

/*Are there any significant differences in scores between males and females?*/
SELECT c2 as Gender,
    round(AVG(c13)) AS AvgMathScore,
    round(AVG(c14)) AS AvgReadingScore,
    round(AVG(c15)) AS AvgWritingScore
FROM
    Expanded_data_with_more_features1
WHERE
    c2 = 'male' OR c2 = 'female'
GROUP BY
    c2; 
    
 /*Is there a relationship between the parental level of education and student performance?*/
 
SELECT c4, round(avg(c13)) as Mathscore, round(avg(c14)) as Readingscore, round(avg(c15)) as wringingscore
from Expanded_data_with_more_features1
group by c4;

/*What is the average score for each mode of transportation to school (school bus, private, etc.)?*/
select c11, round(avg(c13)) as Mathscore, round(avg(c14)) as Readingscore, round(avg(c15))
from Expanded_data_with_more_features1
group by c11;

/* Is there a difference in scores based on the frequency of going out with friends?*/
select c8 as frequency , round(avg(c13)) as Mathscore, round(avg(c14)) as Readingscore, round(avg(c15))
from Expanded_data_with_more_features1
group by c8;

/*How many students are married, single, or in other marital statuses?*/
SELECT count
(case when c7 = 'married' then 1
when c7= 'single' then 1 end ) as maritalstatues
from Expanded_data_with_more_features1
group by c7
order by c7 DESC
limit 2;

/*What is the average score for students from different ethnic groups?*/
SELECT c3, round(avg(c13)) as Mathscore, round(avg(c14)) as Readingscore, round(avg(c15)) as writingscore
FROM Expanded_data_with_more_features1
group by c3
order by c3 DESC
limit 2;

/*How does the type of lunch (standard, free/reduced) affect the performance of different ethnic groups?*/
SELECT c3 as grouptype, c5 as lunchtype, round(avg(c13)) as Mathscore, round(avg(c14)) as Readingscore, round(avg(c15)) as writingscore
from Expanded_data_with_more_features1
group by c3, c5
ORDER by c3 DESC
limit 4;

/*What is the relationship between the number of absences and student performance?*/
SELECT c9 as nubofabsence, count(case when c9 = 'no' then 1  
             when c9 = 'yes' then 1 end), round(avg(c13)) as Mathscore, round(avg(c14)) as Readingscore, round(avg(c15)) as writingscore
from Expanded_data_with_more_features1
group by c9
order by c9 desc
LIMIT 2;
