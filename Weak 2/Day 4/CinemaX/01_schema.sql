CREATE DATABASE CinemaxDB;
USE CinemaxDB;
create  table genres
(
    genre_id   INT PRIMARY KEY,
    genre_name VARCHAR(50) not null

);

create  table movies
(
    movie_id     INT PRIMARY KEY,
    title        VARCHAR(150) not null,
    duration     INT          NOT NULL not null,
    release_year INT(4)       not null,
    genre_id     INT          not null,
    foreign key (genre_id) references genres (genre_id)
);
create table cinemas(
    cinema_id int primary key ,
    cinema_name varchar(100) not null ,
    city varchar(50) not null
);
create table halls(
    hall_id int primary key ,
    hall_name varchar(50) not null ,
    hall_type varchar(20) not null ,
    cinema_id int not null ,
    foreign key (cinema_id)references cinemas(cinema_id)
);
create table screenings
(
    screening_id   int primary key,
    movie_id       int            not null,
    foreign key (movie_id) references movies (movie_id),
    hall_id        int            not null,
    foreign key (hall_id) references halls (hall_id),
    screening_data date           not null,
    screening_time varchar(5)     not null,
    ticket_price   decimal(10, 2) not null
);
CREATE TABLE customers
(
    customer_id INT PRIMARY KEY,
    full_name   VARCHAR(100) NOT NULL,
    email       VARCHAR(100) NULL,
    phone       VARCHAR(20)  NULL
);
CREATE TABLE bookings
(
    booking_id   INT PRIMARY KEY,
    customer_id  INT  NOT NULL,
    screening_id INT  NOT NULL,
    booking_date DATE NOT NULL,
    num_tickets  INT  NOT NULL,

    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (screening_id) REFERENCES screenings (screening_id)
);
CREATE TABLE employees
(
    employee_id   INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    manager_id    INT          NOT NULL,

    FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);