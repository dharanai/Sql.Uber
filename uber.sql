show databases;

create database uber;

use uber;

show tables;

select * from rider;

select * from driver;

select * from Passangers p;

# ---------------------------------- Basic

# 1 - What are & how many unique pickhup locations are there in the dataset ?

select distinct (pickup_location) from rider r;

# 2 - What is the total number of rides in the dataset ?

select count(total_rides) from passangers p;

# 3 - Calculate the average ride duration.

select avg(ride_duration) from rider ;

# 4 - List the top 5 drivers based on their total earnings.

select earnings from driver d ;
select driver_id, sum(earnings) from driver d group by driver_id limit 5;

# 5 - Calculate the total number of rides for each payment method.

select payment_method, count(*) from rider group by payment_method;

# 6 - Retrieve rides with a fare amount greater than 20.

select * from rider where fare_amount > 20;

# 7 - Identify the most common pickup location.

select pickup_location from rider r 
 
 select pickup_location,count(*)as total_ride from rider group by pickup_location order by total_ride desc;
 
# 8 - Calculate the average fare amount.

select avg(fare_amount) from rider r 

# 9 - List the TOp 10 drivers with the highest average ratings.

select driver_name, avg(rating) from driver d group by driver_name;

select driver_name, avg(rating) as rating from driver group by driver_name order by rating desc limit 10;

# 10 - Calculate the total earnings for all drivers.

select driver_name, sum(earnings) as total_earning from driver d group by driver_name;

# 11 - How many rides were paid using the "Cash" payment method?

select * from rider r where payment_method = "cash";

# 12 - Calculate the number of rides & avgerage ride distance for rides originating from the 'Dhanbad ' pickup location.

select count(ride_id), avg(ride_distance) from rider r where pickup_location = 'Dhanbad';

# 13 - Retrieve rides with a ride durating less than 10 minutes.

select * from rider r where ride_duration < 10;

# 14 - List the passengers who have taken the most number of rides.

select passenger_name, passenger_id, count(*) as ride_count from passangers p group by passenger_id, passenger_name order by ride_count desc limit 5;

# 15 - Calculate the total number of rides for each driver in desc order.

select driver_id,count(*) as total_ride from rider r group by driver_id order by driver_id desc;

# 16 - Identify the payment methods used by passengers who took rides from the 'Gandhinagar' pickup location.

select pickup_location,passenger_id from rider r where pickup_location  = 'Gandhinagar' group by dropoff_location, passenger_id ;

# 17 Calculate the average fare amount for rides with a ride distance grater than 10.

select avg(fare_amount) from rider r where r.ride_distance > 10;

# 18 - List the drivers in desc order according to their total number of rides.

select driver_name, total_rides from driver d order by total_rides desc;

# 19 - Calculate the percentage distribution of rides for each pickup location.

select count(pickup_location) from rider r ;

# 20 - Retrieve rides where both pickup and dropoff locations are the same .

select * from rider r where pickup_location = dropoff_location ;


# -----------------------------------  Intermedidate Level ----------------------------

alter table rider modify column ride_timestamp datetime;

# 1 - List the passengers who have taken rides from at least 300 different pickup locations.

select passenger_id, count(distinct pickup_location) from rider r group by passenger_id having pickup_location  = 300; 


# 2 - Calculate the average fare amount for rides taken on weekdays.

select ride_stamp, fare_amount, dayofweek(str_to_date(ride_timestamp,)

select avg(fare_amount)
from rider r 
where dayofweek(str_to_date(ride_timestamp, '%m/%d/%Y %H:%i'))>5;

# 3 - Identify the drivers who have taken rides with distances greater than 19.

select ride_distance, driver_id from rider r where ride_distance > 19 group by ride_distance, driver_id;

# 4 - Calculate the total earnings for drivers who have completed more than 100 rides.

select earnings, total_rides, driver_id from driver d where total_rides > 100;

select driver_id, sum(earnings) as total_earnings
from driver d 
where driver_id in (select driver_id from rider group by driver_id having count(*) > 100)
group by driver_id;


# 5  - Retrieve rides where the fare amount is less than the average fare amount.

select * from rider r where fare_amount <(select avg(fare_amount) from rider r2);

select avg(fare_amount) from rider r ;

# 6 - Calculate the average rating of drivers who have driven rides with both 'Credit Card' and 'Cash' payment method.

select driver_id, avg(rating) from driver d where driver_id in 
(select driver_id from rider r where payment_method in ('Credit Card', 'Cash'))
group by driver_id;

# 7 - List the top 3 passengers with the highest total spending.

select driver_id, fare_amount,max(fare_amount) from rider r group by driver_id, fare_amount;

select passenger_id,sum(fare_amount) as fare_amount from rider r group by passenger_id order by fare_amount desc limit 5;

# 8 - Calculate the average fare amount fro rides taken during different months of the year.

select avg(fare_amount) as avg_amt,monthname(ride_timestamp) diff_m from rider r group by diff_m;

# 9 - Identify the most common pair of pickup and dropoff locations.

select pickup_location, dropoff_location, count(*) as rides from rider r group by pickup_location, dropoff_location order by total_rides  desc;

# 10 Calculate the total earnings for each driver and other them by earnings in desc order.

select driver_name, sum(earnings) as total_earnings from driver d group by driver_name order by total_earnings desc;

# 11 - List the passengers who have taken rides on their signup date.

select  signup_date,passenger_name,passenger_id,total_rides from passangers p ;

# 12 - Calculate the avg earnings for each driver and other them by earnings in desc order.

select driver_name, avg(earnings) as avg_earnings from driver d group by driver_name order by avg_earnings desc;

# 13 - Retrieve rides with distances less than the average ride distance.

select avg(ride_distance) from rider r ;

select ride_id, ride_distance from rider r where ride_distance <(select avg(ride_distance) from rider r2) group by ride_id, ride_distance ;

# 14 - List the drivers who have completed the least number of rides.

select driver_id, count(driver_id) as ride from rider r group by driver_id order by ride asc;

# 15 - Calculate the average fare amount for rides taken by passengers who have taken at least 20 rides.

select avg(fare_amount) from rider r where passenger_id in (select passenger_id from rider r2 group by passenger_id having count(passenger_id) >= 20);

select passenger_id, avg(fare_amount) from rider r where passenger_id in (select passenger_id from passangers p where r.total_rides >=20) group by passenger_id ;
select * from passangers p ;

# 16 - Identity the pickup location with the highest avg fare amount.

select pickup_location, avg(fare_amount) as fare_amount from rider r group by pickup_location order by fare_amount desc;

# 17 - Calculate the avgerange rating of drivers who completed at least 100 rides.

select avg(rating) from driver d where driver_id in (select driver_id from rider r group by driver_id having count(driver_id) >=100);

# 18 - List the passengers who have taken rides from at least 5 differnet pickup location.

select distinct (pickup_location) from rider r ;

select passenger_id,count(distinct(pickup_location)) as diffrent_location from rider r group by passenger_id having diffrent_location >=5;

# 19 - Calculate the avg fare amount for rides taken by passengers with ratings above 4.

select * from driver d where rating>4;

select passenger_id, avg(fare_amount) from rider r where passenger_id in (select passenger_id from passangers p where rating>4) group by passenger_id ;

# 20 - Retrieve rides with the shortest ride duration in each pickup location.

select * from rider r ;

select min(ride_duration) from rider r ;

select pickup_location, ride_duration from rider r order by ride_duration asc;


# -------------------------- Advance Level ------------------

# 1 - List the drivers who have driven rides in all pickup locations.

select driver_id from rider r where driver_id not in (select distinct driver_id from rider r2 where pickup_location not in (select distinct pickup_location from rider r2));

# 2 - Calculate the average fare amount for rides taken by passengers who have spent more than 300 in total.

select avg(fare_amount) from rider r where passenger_id in (select passenger_id from passangers p where total_spent >300);

# 3 - List the bottom 5 drivers based on their average earnings.

select driver_name,avg(earnings) as avg_earn from driver d group by driver_name order by avg_earn asc limit 5;

# 4 - Calculate the sum fare amount for rides taken by passengers who have taken rides in different payment methods.

select sum(fare_amount) from rider r ;

select distinct payment_method from rider r ;

select sum(fare_amount) from rider r where passenger_id in (select passenger_id from rider r2 group by passenger_id having count(distinct payment_method) >1);

# 5 - Retrieve rides where the fare amount is signficantly above the avgerage fare amount.

select avg(fare_amount) from rider r;

select ride_id, avg(fare_amount) from rider r where fare_amount>(select avg(fare_amount) from rider r2 ) group by ride_id;

# 6 - List the drivers who have completed rides on the same day they joined.

select d.driver_id, d.driver_name
from driver as d inner join rider as r 
on d.driver_id = r.ride_id
where d.join_date = r.ride_timestamp;

select d.driver_id,d.driver_name  
from driver as d inner join rider as r 
on d.driver_id = r.ride_id 
where d.join_date = r.ride_timestamp;

# 7 - Calculate the avgerage fare amount for rides taken by passengers who have taken rides in diff payment method.

select avg(fare_amount) from rider r where r.passenger_id in (select passenger_id from rider r2 group by passenger_id having count(distinct (payment_method )) >1);

# 8 - Identify the pickup location with the highest percentage increase in average fare amount compared to the overall average fare.

select pickup_location, avg(fare_amount) as fare_amount, avg(fare_amount)*100.0/(select avg(fare_amount) from rider r ) as ps from rider r group by pickup_location order by ps desc;

# 9 - Retrieve rides where the dropoff location is the same as the pickup location.

select * from rider r where dropoff_location = pickup_location ;

# 10 - Calculate the average rating of drivers who have driven rides with varying pikup locations.

select avg(rating) from driver d where driver_id in (select distinct driver_id from rider r group by driver_id having count(distinct pickup_location)>1);
