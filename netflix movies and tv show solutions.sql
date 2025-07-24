create table netflix
(
show_id VARCHAR(6),
type	VARCHAR(10),
title	VARCHAR(150),
director VARCHAR(210),	
casts	VARCHAR(1000),
country	VARCHAR(150),
date_added	VARCHAR(50),
release_year INT,	
rating	VARCHAR(10),
duration	VARCHAR(20),
listed_in	VARCHAR(100),
description  VARCHAR(250)
);
select * from netflix

select count(*) as total_content from netflix

select * from netflix
 
select type, 
count(*) as total_content 
from netflix 
group by type

select * from netflix
select * from netflix
where 
     type = 'Movie'
	 and
	 release_year = 2020

select 
     unnest(string_to_array(country,',')) as new_country,
	 count(show_id) as total_content
from netflix 
group by 1 
order by 2 desc
limit 5


select * from netflix
where
     type = 'Movie'
	 and
	 duration = (select max(duration) from netflix)

select * from netflix
where To_date(date_added,'Month DD, YYYY')>= CURRENT_DATE - INTERVAL '5 years'


select * from netflix
where
     director like '%Rajiv Chilaka%'

select * from netflix
where 
    type = 'TV Show'
	and
	duration >= '5 Seasons' 


select
     unnest (string_to_array (listed_in,',')) as genre,
     count(show_id)
from netflix
group by 1


select 
      Extract(Year from To_date(date_added,'Month DD, YYYY'))as year,
	  count(*) as yearly_content,
	  round(
	  count(*)::numeric/(select count(*)from netflix where country = 'India')::numeric * 100
	  ,2) as avg_content_per_year
	  from  netflix
	  where country = 'India'
	  Group by 1


select * from netflix
where listed_in like '%Documentaries%'

select * from netflix
where director is null

select * from netflix 
where casts ILIKE '%Salman khan%'
and 
release_year > extract(year from current_date) - 10
     
SELECT
unnest (string_to_array(casts,',')) as actors,
count(*) as total_content
from netflix
where country ILIKE '%india%'
group by 1
order by 2 desc
limit 10


with new_table
as 
(
select *,
case 
when 
    description ILIKE '%kill%'
	or
	description ILIKE '%violence%' then 'Bad_content'
	else 'Good_content'
	end category
	from netflix
)
select category,
count(*) as total_content
from new_table
group by 1
