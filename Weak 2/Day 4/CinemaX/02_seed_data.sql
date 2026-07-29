INSERT INTO genres (genre_id, genre_name) VALUES
                                              (1, 'Action'),
                                              (2, 'Comedy'),
                                              (3, 'Drama'),
                                              (4, 'Horror'),
                                              (5, 'Animation');

INSERT INTO movies (movie_id, title, duration, release_year, genre_id) VALUES
                                                                           (201, 'Explosive Pursuit', 120, 2022, 1),
                                                                           (202, 'Iron Fist', 110, 2023, 1),
                                                                           (203, 'Night Raid', 130, 2021, 1),
                                                                           (204, 'Laugh Out Loud', 95, 2022, 2),
                                                                           (205, 'Silly Days', 100, 2023, 2),
                                                                           (206, 'Silent Tears', 140, 2020, 3),
                                                                           (207, 'Dark Basement', 105, 2023, 4),
                                                                           (208, 'Whispering Halls', 115, 2022, 4),
                                                                           (209, 'Toy Kingdom', 90, 2021, 5);

INSERT INTO cinemas (cinema_id, cinema_name, city) VALUES
                                                       (301, 'Cinemax Downtown', 'Cairo'),
                                                       (302, 'CinemaX Mall', 'Giza'),
                                                       (303, 'Cinemax Nasr City', 'Cairo');

INSERT INTO halls (hall_id, hall_name, hall_type, cinema_id) VALUES
                                                                 (401, 'Hall A', 'Standard', 301),
                                                                 (402, 'Hall B', 'VIP', 301),
                                                                 (403, 'Hall C', 'IMAX', 301),
                                                                 (404, 'Hall A', 'Standard', 302),
                                                                 (405, 'Hall B', 'VIP', 302),
                                                                 (406, 'Hall A', 'Standard', 303),
                                                                 (407, 'Hall B', 'IMAX', 303);

INSERT INTO screenings (screening_id, movie_id, hall_id, screening_date, screening_time, ticket_price) VALUES
                                                                                                           (501, 201, 401, DATE '2025-04-01', '18:00', 120.00),
                                                                                                           (502, 201, 402, DATE '2025-04-01', '20:00', 180.00),
                                                                                                           (503, 202, 403, DATE '2025-04-02', '19:00', 200.00),
                                                                                                           (504, 203, 401, DATE '2025-04-02', '21:00', 120.00),
                                                                                                           (505, 204, 404, DATE '2025-04-03', '17:00', 100.00),
                                                                                                           (506, 205, 405, DATE '2025-04-03', '19:00', 150.00),
                                                                                                           (507, 207, 406, DATE '2025-04-04', '18:00', 130.00),
                                                                                                           (508, 208, 407, DATE '2025-04-04', '20:00', 220.00),
                                                                                                           (509, 201, 406, DATE '2025-04-05', '18:00', 120.00),
                                                                                                           (510, 202, 401, DATE '2025-04-05', '20:00', 120.00);

INSERT INTO customers (customer_id, full_name, email, phone) VALUES
                                                                 (601, 'Youssef Adel', 'youssef.adel@cinemax.com', '0100000001'),
                                                                 (602, 'Nour Ibrahim', 'nour.ibrahim@cinemax.com', '0100000002'),
                                                                 (603, 'Hana Tarek', 'hana.tarek@cinemax.com', '0100000003'),
                                                                 (604, 'Mostafa Reda', 'mostafa.reda@cinemax.com', '0100000004'),
                                                                 (605, 'Salma Fathy', 'salma.fathy@cinemax.com', '0100000005'),
                                                                 (606, 'Kareem Sami', NULL, NULL);

INSERT INTO bookings (booking_id, customer_id, screening_id, booking_date, num_tickets) VALUES
                                                                                            (701, 601, 501, DATE '2025-03-25', 2),
                                                                                            (702, 602, 501, DATE '2025-03-26', 1),
                                                                                            (703, 603, 502, DATE '2025-03-26', 3),
                                                                                            (704, 604, 509, DATE '2025-03-28', 2),
                                                                                            (705, 601, 509, DATE '2025-03-29', 1),
                                                                                            (706, 602, 503, DATE '2025-03-27', 2),
                                                                                            (707, 605, 510, DATE '2025-03-30', 1),
                                                                                            (708, 603, 504, DATE '2025-03-27', 2),
                                                                                            (709, 604, 505, DATE '2025-03-28', 4),
                                                                                            (710, 605, 506, DATE '2025-03-29', 2),
                                                                                            (711, 601, 507, DATE '2025-03-30', 3),
                                                                                            (712, 602, 508, DATE '2025-03-31', 2);

INSERT INTO employees (employee_id, employee_name, manager_id) VALUES
                                                                   (801, 'Sherif Mostafa', 801),
                                                                   (802, 'Aya Khaled', 801),
                                                                   (803, 'Tamer Nabil', 801),
                                                                   (804, 'Rania Adel', 802),
                                                                   (805, 'Omar Fathy', 802);