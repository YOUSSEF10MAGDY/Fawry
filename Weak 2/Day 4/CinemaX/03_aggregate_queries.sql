select count(movie_id) as movies_number
    from movies;

select count(customer_id) customer_number
    from customers;

SELECT COUNT(booking_id) booking_number
FROM bookings;

select s.ticket_price highest_price
    from screenings s
order by s.ticket_price desc
limit 1;

select s.ticket_price highest_price
from screenings s
order by s.ticket_price asc
limit 1;

select avg(s.ticket_price) avg_price
from screenings s;

select genre_id ,count(*)movies_count
    from movies
group by genre_id;

select c.cinema_name ,count(*) as halls_count
    from halls
    join cinemas c
        on halls.cinema_id = c.cinema_id
group by c.cinema_name;


select m.title  movie_name, count(*) booking_number
    from bookings b
join screenings s
on b.screening_id =s.screening_id
join movies m
on m.movie_id = s.movie_id
group by m.title;


select cinema_name ,avg(s.ticket_price) avg_price
    from screenings s
join halls h
on s.hall_id=h.hall_id
join cinemas c
on h.cinema_id=c.cinema_id
group by cinema_name;


select genre_name genre ,count(m.movie_id)movie_count
    from genres g
join movies m
on g.genre_id=m.genre_id
group by genre_name
having count(*)>2;


SELECT c.cinema_name, COUNT(*) AS halls_count
FROM halls h
join cinemas c
on h.cinema_id=c.cinema_id
GROUP BY cinema_name
HAVING COUNT(*) > 2;


SELECT m.title, COUNT(b.booking_id) AS bookings_count
FROM screenings s
    join movies m
    on s.movie_id = m.movie_id
         JOIN bookings b ON b.screening_id = s.screening_id
GROUP BY m.title
HAVING COUNT(b.booking_id) > 3;

