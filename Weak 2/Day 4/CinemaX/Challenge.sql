select m.title movie_name ,count(booking_id) booking_number
    from movies m
join screenings s on m.movie_id = s.movie_id
join bookings b on s.screening_id = b.screening_id
group by movie_name
order by booking_number desc
limit 1;


select c.cinema_name as CINEMA_NAME,count(s.screening_id) NUM_OF_SCREENING
    from cinemas c
join halls h on c.cinema_id = h.cinema_id
join screenings s on h.hall_id = s.hall_id
GROUP BY CINEMA_NAME
ORDER BY NUM_OF_SCREENING DESC
LIMIT 1;


select c.full_name  customer_name, SUM(b.num_tickets)  TOTAL_TICKETS_BOUGHT
from customers c
         join bookings b ON c.customer_id = b.customer_id
group by  c.full_name
order by TOTAL_TICKETS_BOUGHT DESC
LIMIT 1;

select  g.genre_name  GENRE_NAME, COUNT(b.booking_id) AS TOTAL_BOOKINGS
FROM genres g
         JOIN movies m ON g.genre_id = m.genre_id
         JOIN screenings s ON m.movie_id = s.movie_id
         JOIN bookings b ON s.screening_id = b.screening_id
group by g.genre_name
order by TOTAL_BOOKINGS DESC
LIMIT 1;





