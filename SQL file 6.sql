-- 1. List all users subscribed to the Premium plan.
SELECT name, email
FROM users
WHERE plan = 'Premium';
-- 2. Retrive all movies in the Drama genre with a rating higher than 8.5.
SELECT title, genre, rating
FROM movies
WHERE genre = 'Drama' AND rating > 8.5;
-- 3. Find the average rating of all movies released after 2015
SELECT AVG(rating) AS average_rating
FROM movies
WHERE release_year > 2015 ;
 
-- 4. List the names of users who have watched the movie Stranger Things along with their completion percentage .
SELECT U. name,  W. completion_percentage
FROM users U
JOIN watchhistory W ON U.user_id = W. user_id
JOIN movies ON M.movie_id = M.movie_id
WHERE M.title = 'Stranger Things';

-- 5. Find the name of the user(s) who rated a movie the highest among all reviews.
SELECT U. name
FROM users U 
JOIN reviews R ON U. user_id = R. user_id
WHERE R.rating = (SELECT MAX(rating) FROM reviews);



-- 6. Calculate the number  of movies watched by each user and sort by the highest count;
SELECT U.name, COUNT (W.watch_id) AS movies_watched
FROM users U 
JOIN watchhistory W ON U.users_id = w.user_id
Group By U.user_id
ORDER BY movies_watched DESC;
-- 7. List all movies watched by John Doe. including their genre, rating, and his completion percentage:
SELECT M.title, M.genre, M.rating, W.completion_percentage 
FROM Movies movies
JOIN Watchhistory W ON M.movie_id = W.movie_id
JOIN users U ON W. user_id = U.user_id
WHERE U.name = 'John Doe';
-- 8. Update the movie 's rating for Stranger Things;
UPDATE movies
SET  rating = 8.9
WHERE title = 'Stranger Things' ;
-- 9. Remove all reviews for movies with a rating below 4.0:
DELETE FROM reviews
WHERE movie_id IN (SELECT movie_id FROM movies WHERE rating < 4.0);

-- 10. Fetch all users who have reviewed a movie but have not watched it completely (completion percentage < 100):
SELECT U.name, M.title, R.review_text
FROM users U 
JOIN reviews R ON U.user_id = R.user_id
JOIN movies M ON R.movie_id = M.movie_id
LEFT JOIN watchhistory W ON U.user_id = W.user_id AND M.movie_id = W.movie_id
WHERE (W.completion_percentage IS NULL OR W.completion_percentage < 100);

-- 11. List all movies watched by John Doe along with their genre and his completion percentage:
SELECT M.title, M.genre, W.completion_percentage
FROM movies M 
JOIN watchhistory W ON N.movie_id = W.movie_id
JOIN users U ON W.user_id = U.user_id
WHERE U.name = 'John Doe';

-- 12. Retrieve all users who have reviewed the movie Stranger Things, including their review text and rating;
SELECT U.name,  R.review_text, R.rating
FROM users U  
JOIN reviews R ON U.user_id =  R.user_id
JOIN movies M ON R.movie_id = M.movie_id
WHERE M.title = 'Stranger Things';

-- 13. Fetch the watch history of all users, including their name, email, movie title, genre, watched date, and completion percentgae;
SELECT U.name, U.email, M.title, M.genre, W.watched_date, W.completion_percentage
FROM users U  
JOIN watchhistory W ON U.user_id = W.user_id
JOIN movies M ON W.movie_id = M.movie_id;

-- 14. List all movies along with the total number of reviews and average rating for each movie , including only movies with at least two reviews;
SELECT M.title, COUNT(R.review_id) AS total_reviews,
AVG(R. rating) AS average_rating
FROM movies M
JOIN reviews R ON M. movie_id = R . movie_id
GROUP BY M.movie_id
Having COUNT (R. review_id) >= 2;
COMMIT;