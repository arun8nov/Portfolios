use Projects

select * from [Forgoten Florida 50mile marathon Data cleaned] 

-- How many States were represented in the race 

select count(distinct States) as States_represented from [Forgoten Florida 50mile marathon Data cleaned]

--What was the average time of men vs women

select Gender,avg(Total_minute) as Avg_Time_by_Gender from [Forgoten Florida 50mile marathon Data cleaned] 
group by Gender

--What were the youngest and oldest ages in the race 

select min(Age) as Y_Age,max(Age) as O_Age from [Forgoten Florida 50mile marathon Data cleaned]

--What were the youngest and oldest ages in the race by gender wise

select Gender, min(Age) as Y_Age,max(Age) as O_Age from [Forgoten Florida 50mile marathon Data cleaned]
group by Gender

--What was the average time for each age group

select age,avg(Total_minute) as Avg_Time_by_Age_Wise from [Forgoten Florida 50mile marathon Data cleaned]
group by age

--What was the average time for each age group also Gender Wise

select Gender,age,avg(Total_minute) as Avg_Time_by_Age_Wise from [Forgoten Florida 50mile marathon Data cleaned]
group by age,Gender

--Make age group as eassy to call--What was the average time for each age group?


with age_buckets as (
select Place, Total_minute,
	case when age < 30 then 'age_20-29'
		 When age < 40 then 'age_30-39'
		 When age < 50 then 'age_40-49'
		 When age < 60 then 'age_50-59'
	else 'age_60+' end as age_group
from [Forgoten Florida 50mile marathon Data cleaned])
select age_group,avg(Total_minute) as Avg_Time from age_buckets 
group by age_group

--What was the average time for each age group and count of runners? in age group column

with age_buckets as (
select Place, Total_minute,
	case when age < 30 then 'age_20-29'
		 When age < 40 then 'age_30-39'
		 When age < 50 then 'age_40-49'
		 When age < 60 then 'age_50-59'
	else 'age_60+' end as age_group
from [Forgoten Florida 50mile marathon Data cleaned])
select age_group,avg(Total_minute) as Avg_Time,count(Place) as Runners_count from age_buckets 
group by age_group

--Top 3 males and Females

Select Full_Name, Gender, Gender_Wise_Places,Total_minute from [Forgoten Florida 50mile marathon Data cleaned]
Where Gender_Wise_Places < 4

--Create View 

select * from [Forgoten Florida 50mile marathon Data cleaned]






