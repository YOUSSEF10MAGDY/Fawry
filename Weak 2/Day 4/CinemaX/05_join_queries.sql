SELECT m.title, g.genre_name
FROM movies m
         JOIN genres g ON m.genre_id = g.genre_id;


SELECT h.hall_name, c.cinema_name
FROM halls h
         JOIN cinemas c ON h.cinema_id = c.cinema_id;


SELECT s.screening_id, m.title
FROM screenings s
         JOIN movies m ON s.movie_id = m.movie_id;


SELECT b.booking_id, c.full_name
FROM bookings b
         JOIN customers c ON b.customer_id = c.customer_id;


SELECT m.title, s.screening_id
FROM movies m
         LEFT JOIN screenings s ON m.movie_id = s.movie_id;


SELECT c.full_name, b.booking_id
FROM customers c
         LEFT JOIN bookings b ON c.customer_id = b.customer_id;


SELECT g.genre_name, m.title
FROM genres g
         LEFT JOIN movies m ON g.genre_id = m.genre_id;



SELECT c.full_name, b.booking_id
FROM customers c
    left join bookings b ON c.customer_id = b.customer_id
union
SELECT c.full_name, b.booking_id
FROM customers c
         right join bookings b ON c.customer_id = b.customer_id ;



SELECT e.employee_name AS Employee, m.employee_name AS Manager
FROM employees e
         LEFT JOIN employees m ON e.manager_id = m.employee_id;

SELECT DISTINCT g.genre_name, h.hall_type
FROM genres g
         CROSS JOIN halls h;