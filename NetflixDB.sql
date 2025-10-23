CREATE DATABASE NetflixDB;
USE NetflixDB;
SHOW DATABASES;
SELECT * from users;
CREATE TABLE users(
user_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
email VARCHAR(150) UNIQUE NOT NULL,
registration_date DATE NOT NULL,
plan ENUM('Basic', 'Standard', 'Premium') DEFAULT 'Basic'
);
SELECT * from movies;
CREATE TABLE movies (
movie_id  INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(200) NOT NULL,
genere VARCHAR(100) NOT NULL,
release_year YEAR NOT NULL,
rating DECIMAL(3, 1) NOT NULL
);
SELECT * from watchhistory;
CREATE TABLE watchhistory (
watch_id  INT PRIMARY KEY AUTO_INCREMENT,
user_id INT,
movie_id INT,
watched_date DATE NOT NULL,
completion_percentage  INT CHECK(completion_percentage >= 0  AND  completion_percentage <= 100),
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);
SELECT * from reviews;
CREATE TABLE reviews (
review_id INT PRIMARY KEY AUTO_INCREMENT,
movie_id INT,
user_id INT,
review_text TEXT,
rating DECIMAL(2, 1) CHECK (rating >= 0 AND rating <= 5),
review_date DATE NOT NULL,
FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
FOREIGN KEY (user_id) REFERENCES users(user_id)
);
INSERT INTO users (name, email, registration_data, plan)
VALUES
('John Doe', 'john. doe@example.com', '2024-01-10','Premium'),
('Jane Smith', 'jane. bmith@example', '2024-01-15','Standard'),
('Alice Johnson', 'alice. johnson@example.com', '2024-02-01', 'Basic'),
('Bob Brown', 'bob.brown@example.com', '2024-02-20', 'Premium');

SELECT * from  movies;
INSERT INTO movies (title, genere, release_year, rating)
VALUES
('Stranger Things', 'Drama', 2016, 8, 7),
('Breaking Bad', 'Crime', 2008, 9, 5),
('The Crown', 'History', 2016, 8, 6),
('The Witcher', 'Fantasy', 2010, 8, 2),
('Black Mirror', 'Sci-Fi', 2011, 8, 6);

INSERT INTO watchhistory (user_id, movie_id, watched_date, completion_percentage)
VALUES
(1, 1,  '2024-02--05' , 100),
(2, 2,  '2024-02-06'  , 80),
(3, 3,  '2024-02-10'  , 50),
(4, 4,  '2024-02-15'  , 100),
(1, 5,  '2024-02-18'  , 90);


INSERT INTO reviews (movie_id, user_id, review_text,rating, review_date)
VALUES
(1, 1,  'Amazing storyline and great characters!', 4.5, ' 2024-02-07' ),
(2, 2,  'Intense and thrilling!', 5.0, '2024-02-08'),
(3, 3,  'Good show, but slow at times.', 3.5,  '2024-02-12' ),
(4, 4,  'Fantastic visuals and acting.', 4.8,  '2024-02-16');






