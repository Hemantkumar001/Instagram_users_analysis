show databases;


use ig_clone;


Select * from users;

-- Loyal users 

Select id, username 
from users
order by created_at asc
limit 5;

-- Users who never posted anything on the platform 

select users.id, users.username, photos.id as post_ID, photos.user_id as Users 
from users
left join photos
on users.id = photos.user_id
where user_id is null;




-- Photo with max like 

select users.id, users.username, photos.id, count(likes.photo_id) as total_like 
from users
inner join photos on photos.user_id = users.id
inner join likes on likes.photo_id = photos.id
group by photos.id
order by total_like desc
limit 3;



-- Hashtags Reasearch for most used hashtag


select tags.id, tags.tag_name as Hashtags, count(photo_tags.tag_id) as total_use
from tags
inner join photo_tags on photo_tags.tag_id = tags.id
group by tags.id
order by total_use desc
limit 5;





-- Find day on which max users registered

Select dayname(created_at) as Name_of_day, count(created_at) as num
from users
group by name_of_day
order by num desc;

-- Investor Matrix

-- Average post per user with total users and posts

With total_photo as (
select count(photos.id) as Total_post
from photos),
total_user as (
select count(users.id) as total_user
from users)
select total_user, total_post, total_post / total_user
from total_photo, total_user;


-- Users liked every photo


select users.username, likes.user_id, count(likes.photo_id) as total_like
from users
inner join likes on likes.user_id = users.id
group by username
having total_like = 257;

