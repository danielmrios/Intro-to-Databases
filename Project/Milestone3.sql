-- Daniel Rios
-- CPSC 2300, Milestone 3


-- Part 1, Write SQL statements to create tables for the music database

# Artist table
CREATE TABLE Artist (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(50)
);

# Albums table
CREATE TABLE Albums (
    album_id INT PRIMARY KEY,
    album_name VARCHAR(50),
    release_date DATE,
    album_rating DECIMAL(2, 1),
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

# Tracks table
CREATE TABLE Tracks (
    track_id INT PRIMARY KEY,
    track_name VARCHAR(50),
    release_date DATE,
    track_rating DECIMAL(2, 1),
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);

# Artist_Tracks table
CREATE TABLE Artist_Tracks (
    track_id INT,
    artist_id INT,
    PRIMARY KEY (track_id, artist_id),
    FOREIGN KEY (track_id) REFERENCES Tracks(track_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

# Song_Reviews table 
CREATE TABLE Song_Reviews (
    username VARCHAR(50),
    track_id INT,
    track_rating DECIMAL(2, 1),
    written_review TEXT,
    PRIMARY KEY (username, track_id),
    FOREIGN KEY (track_id) REFERENCES Tracks(track_id)
);

# Album_Reviews table
CREATE TABLE Album_Reviews (
    username VARCHAR(50),
    album_id INT,
    album_rating DECIMAL(2, 1),
    written_review TEXT,
    PRIMARY KEY (username, album_id),
    FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);

# Users table
CREATE TABLE Users (
    username VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    password VARCHAR(50),
    favorite_artist INT,
    FOREIGN KEY (favorite_artist) REFERENCES Artist(artist_id)
);


-- Part 2, write SQL statements to populate each table

# Insert data into Artist table
INSERT INTO Artist (artist_id, artist_name) VALUES
(1, 'The Strokes'),
(2, 'Mac Miller'),
(3, 'Lana Del Rey'),
(4, 'Tyler, The Creator'),
(5, 'The Smiths'),
(6, 'Drake'),
(7, 'Rihanna'),
(8, 'Mac Demarco'),
(9, 'Steve Lacy'),
(10, 'The Avalanches');

# Insert data into Albums table
INSERT INTO Albums (album_id, album_name, release_date, album_rating, artist_id) VALUES
(1, 'Is This It', '2001-07-01', 9.1, 1),
(2, 'Swimming', '2018-08-03', 7.5, 2),
(3, 'Born To Die', '2012-01-27', 5.5, 3),
(4, 'Flower Boy', '2017-07-21', 8.5, 4),
(5, 'The Queen Is Dead', '1986-06-16', 9.9, 5),
(6, 'IYRTITL', '2015-02-13', 8.3, 6),
(7, 'Anti', '2016-01-28', 7.7, 7),
(8, 'This Old Dog', '2017-05-05', 7.9, 8),
(9, 'Apollo XXI', '2019-05-24', 7.0, 9),
(10, 'Since I Left You', '2000-11-27', 9.5, 10);

# Insert Track data for Is This It album
INSERT INTO Tracks (track_id, track_name, release_date, track_rating, album_id) VALUES
(1, 'Is This It', '2001-07-01', 8.2, 1),
(2, 'The Modern Age', '2001-07-01', 9.0, 1),
(3, 'Soma', '2001-07-01', 8.5, 1),
(4, 'Barely Legal', '2001-07-01', 7.8, 1),
(5, 'Someday', '2001-07-01', 9.2, 1),
(6, 'Alone, Together', '2001-07-01', 8.7, 1),
(7, 'Last Nite', '2001-07-01', 9.5, 1),
(8, 'Hard to Explain', '2001-07-01', 8.0, 1),
(9, 'When It Started', '2001-07-01', 7.2, 1),
(10, 'Trying Your Luck', '2001-07-01', 8.9, 1),
(11, 'Take It or Leave It', '2001-07-01', 7.5, 1);

# Insert Track data for Swimming album
INSERT INTO Tracks (track_id, track_name, release_date, track_rating, album_id) VALUES
(12, 'Come Back to Earth', '2018-08-03', 8.0, 2),
(13, 'Hurt Feelings', '2018-08-03', 8.5, 2),
(14, 'What’s the Use?', '2018-08-03', 9.2, 2),
(15, 'Perfecto', '2018-08-03', 7.8, 2),
(16, 'Self Care', '2018-08-03', 9.5, 2),
(17, 'Wings', '2018-08-03', 8.3, 2),
(18, 'Ladders', '2018-08-03', 8.7, 2),
(19, 'Small Worlds', '2018-08-03', 7.2, 2),
(20, 'Conversation, Pt. 1', '2018-08-03', 8.9, 2),
(21, 'Dunno', '2018-08-03', 7.5, 2),
(22, 'Jet Fuel', '2018-08-03', 9.0, 2),
(23, '2009', '2018-08-03', 8.2, 2),
(24, 'So It Goes', '2018-08-03', 8.5, 2);

# Insert Track data for Born To Die album
INSERT INTO Tracks (track_id, track_name, release_date, track_rating, album_id) VALUES
(25, 'Born To Die', '2012-01-27', 7.5, 3),
(26, 'Off To The Races', '2012-01-27', 8.0, 3),
(27, 'Blue Jeans (Album Version - Remastered)', '2012-01-27', 6.8, 3),
(28, 'Video Games', '2012-01-27', 8.5, 3),
(29, 'Diet Mountain Dew', '2012-01-27', 7.2, 3),
(30, 'National Anthem', '2012-01-27', 9.0, 3),
(31, 'Dark Paradise', '2012-01-27', 8.3, 3),
(32, 'Radio [Explicit]', '2012-01-27', 7.7, 3),
(33, 'Carmen', '2012-01-27', 8.9, 3),
(34, 'Million Dollar Man', '2012-01-27', 8.2, 3),
(35, 'Summertime Sadness', '2012-01-27', 9.5, 3);

# Insert Track data for Flower Boy album
INSERT INTO Tracks (track_id, track_name, release_date, track_rating, album_id) VALUES
(36, 'Foreword', '2017-07-21', 7.8, 4),
(37, 'Where This Flower Blooms', '2017-07-21', 8.5, 4),
(38, 'Sometimes…', '2017-07-21', 6.2, 4),
(39, 'See You Again', '2017-07-21', 9.0, 4),
(40, 'Who Dat Boy', '2017-07-21', 8.2, 4),
(41, 'Pothole', '2017-07-21', 7.5, 4),
(42, 'Garden Shed', '2017-07-21', 8.7, 4),
(43, 'Boredom', '2017-07-21', 9.2, 4),
(44, 'I Ain’t Got Time!', '2017-07-21', 8.0, 4),
(45, '911 / Mr. Lonely', '2017-07-21', 9.5, 4),
(46, 'Droppin’ Seeds', '2017-07-21', 7.3, 4),
(47, 'November', '2017-07-21', 8.9, 4),
(48, 'Glitter', '2017-07-21', 8.4, 4),
(49, 'Enjoy Right Now, Today', '2017-07-21', 7.7, 4);

# Insert Track data for The Queen Is Dead album
INSERT INTO Tracks (track_id, track_name, release_date, track_rating, album_id) VALUES
(50, 'The Queen Is Dead', '1986-06-16', 9.0, 5),
(51, 'Frankly Mr. Shankly', '1986-06-16', 7.8, 5),
(52, 'I Know It’s Over', '1986-06-16', 9.5, 5),
(53, 'Never Had No One Ever', '1986-06-16', 8.2, 5),
(54, 'Cemetary Gates', '1986-06-16', 8.7, 5),
(55, 'Bigmouth Strikes Again', '1986-06-16', 9.2, 5),
(56, 'The Boy With the Thorn in His Side', '1986-06-16', 8.5, 5),
(57, 'Vicar in a Tutu', '1986-06-16', 7.5, 5),
(58, 'There Is a Light That Never Goes Out', '1986-06-16', 9.8, 5),
(59, 'Some Girls Are Bigger Than Others', '1986-06-16', 8.0, 5);

# Insert Track data for IYRTITL album
INSERT INTO Tracks (track_id, track_name, release_date, track_rating, album_id) VALUES
(60, 'Legend', '2015-02-13', 8.5, 6),
(61, 'Energy', '2015-02-13', 9.0, 6),
(62, '10 Bands', '2015-02-13', 7.5, 6),
(63, 'Know Yourself', '2015-02-13', 8.2, 6),
(64, 'No Tellin''', '2015-02-13', 7.8, 6),
(65, 'Madonna', '2015-02-13', 8.7, 6),
(66, '6 God', '2015-02-13', 9.5, 6),
(67, 'Star67', '2015-02-13', 8.0, 6),
(68, 'Preach', '2015-02-13', 7.2, 6),
(69, 'Wednesday Night Interlude', '2015-02-13', 8.9, 6),
(70, 'Used To', '2015-02-13', 7.0, 6),
(71, '6 Man', '2015-02-13', 8.4, 6),
(72, 'Now & Forever', '2015-02-13', 9.2, 6),
(73, 'Company', '2015-02-13', 8.7, 6),
(74, 'You & The 6', '2015-02-13', 9.0, 6),
(75, 'Jungle', '2015-02-13', 8.3, 6),
(76, '6PM In New York', '2015-02-13', 9.5, 6);

# Insert Track data for Anti album
INSERT INTO Tracks (track_id, track_name, release_date, track_rating, album_id) VALUES
(77, 'Consideration', '2016-01-28', 8.2, 7),
(78, 'James Joint', '2016-01-28', 7.5, 7),
(79, 'Kiss It Better', '2016-01-28', 9.0, 7),
(80, 'Work', '2016-01-28', 9.2, 7),
(81, 'Desperado', '2016-01-28', 8.7, 7),
(82, 'Woo', '2016-01-28', 8.0, 7),
(83, 'Needed Me', '2016-01-28', 9.5, 7),
(84, 'Yeah, I Said It', '2016-01-28', 7.8, 7),
(85, 'Same Ol’ Mistakes', '2016-01-28', 9.8, 7),
(86, 'Never Ending', '2016-01-28', 8.5, 7),
(87, 'Love on the Brain', '2016-01-28', 9.7, 7),
(88, 'Higher', '2016-01-28', 7.2, 7),
(89, 'Close to You', '2016-01-28', 8.9, 7),
(90, 'Goodnight Gotham', '2016-01-28', 7.0, 7),
(91, 'Pose [Explicit]', '2016-01-28', 8.3, 7),
(92, 'Sex With Me [Explicit]', '2016-01-28', 9.4, 7);

# Insert Track data for This Old Dog album
INSERT INTO Tracks (track_id, track_name, release_date, track_rating, album_id) VALUES
(93, 'My Old Man', '2017-05-05', 8.5, 8),
(94, 'This Old Dog', '2017-05-05', 7.8, 8),
(95, 'Baby You’re Out', '2017-05-05', 8.2, 8),
(96, 'For the First Time', '2017-05-05', 9.0, 8),
(97, 'One Another', '2017-05-05', 8.7, 8),
(98, 'Still Beating', '2017-05-05', 9.2, 8),
(99, 'Sister', '2017-05-05', 7.5, 8),
(100, 'Dreams From Yesterday', '2017-05-05', 9.5, 8),
(101, 'A Wolf Who Wears Sheeps Clothes', '2017-05-05', 8.0, 8),
(102, 'One More Love Song', '2017-05-05', 9.8, 8),
(103, 'On the Level', '2017-05-05', 8.3, 8),
(104, 'Moonlight on the River', '2017-05-05', 9.7, 8),
(105, 'Watching Him Fade Away', '2017-05-05', 8.9, 8);

# Insert Track data for Apollo XXI album
INSERT INTO Tracks (track_id, track_name, release_date, track_rating, album_id) VALUES
(106, 'Only If', '2019-05-24', 7.5, 9),
(107, 'Like Me', '2019-05-24', 8.8, 9),
(108, 'Playground', '2019-05-24', 9.2, 9),
(109, 'Basement Jack', '2019-05-24', 7.2, 9),
(110, 'Guide', '2019-05-24', 8.0, 9),
(111, 'Lay Me Down', '2019-05-24', 8.5, 9),
(112, 'Hate CD', '2019-05-24', 7.8, 9),
(113, 'In Lust We Trust', '2019-05-24', 8.9, 9),
(114, 'Love 2 Fast', '2019-05-24', 9.5, 9),
(115, 'Amandla\'s Interlude', '2019-05-24', 8.2, 9),
(116, 'N Side', '2019-05-24', 9.0, 9);

# Insert Track data for Since I Left You album
INSERT INTO Tracks (track_id, track_name, release_date, track_rating, album_id) VALUES
(117, 'Since I Left You', '2000-11-27', 8.5, 10),
(118, 'Stay Another Season', '2000-11-27', 7.8, 10),
(119, 'Radio', '2000-11-27', 9.2, 10),
(120, 'Two Hearts in 3/4 Time', '2000-11-27', 8.7, 10),
(121, 'Avalanche Rock', '2000-11-27', 7.5, 10),
(122, 'Flight Tonight', '2000-11-27', 9.0, 10),
(123, 'Close to You', '2000-11-27', 8.0, 10),
(124, 'Diners Only', '2000-11-27', 7.2, 10),
(125, 'A Different Feeling', '2000-11-27', 9.8, 10),
(126, 'Electricity', '2000-11-27', 8.3, 10),
(127, 'Tonight', '2000-11-27', 7.0, 10),
(128, 'Pablo\'s Cruise', '2000-11-27', 8.9, 10),
(129, 'Frontier Psychiatrist', '2000-11-27', 9.5, 10),
(130, 'Etoh', '2000-11-27', 8.7, 10),
(131, 'Summer Crane', '2000-11-27', 9.7, 10),
(132, 'Little Journey', '2000-11-27', 8.2, 10),
(133, 'Live at Dominoes', '2000-11-27', 9.4, 10);

# Insert data into Artist_Tracks table
INSERT INTO Artist_Tracks (track_id, artist_id) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 4),
(37, 4),
(38, 4),
(39, 4),
(40, 4),
(41, 4),
(42, 4),
(43, 4),
(44, 4),
(45, 4),
(46, 4),
(47, 4),
(48, 4),
(49, 4),
(50, 5),
(51, 5),
(52, 5),
(53, 5),
(54, 5),
(55, 5),
(56, 5),
(57, 5),
(58, 5),
(59, 5),
(60, 6),
(61, 6),
(62, 6),
(63, 6),
(64, 6),
(65, 6),
(66, 6),
(67, 6),
(68, 6),
(69, 6),
(70, 6),
(71, 6),
(72, 6),
(73, 6),
(74, 6),
(75, 6),
(76, 6),
(77, 7),
(78, 7),
(79, 7),
(80, 7),
(81, 7),
(82, 7),
(83, 7),
(84, 7),
(85, 7),
(86, 7),
(87, 7),
(88, 7),
(89, 7),
(90, 7),
(91, 7),
(92, 7),
(93, 8),
(94, 8),
(95, 8),
(96, 8),
(97, 8),
(98, 8),
(99, 8),
(100, 8),
(101, 8),
(102, 8),
(103, 8),
(104, 8),
(105, 8),
(106, 9),
(107, 9),
(108, 9),
(109, 9),
(110, 9),
(111, 9),
(112, 9),
(113, 9),
(114, 9),
(115, 9),
(116, 9),
(117, 10),
(118, 10),
(119, 10),
(120, 10),
(121, 10),
(122, 10),
(123, 10),
(124, 10),
(125, 10),
(126, 10),
(127, 10),
(128, 10),
(129, 10),
(130, 10),
(131, 10),
(132, 10),
(133, 10);

# Insert data into Song_Reviews table
INSERT INTO Song_Reviews (username, track_id, track_rating, written_review) VALUES
('user1', 8, 7.5, 'Good track'),
('user2', 12, 8.0, 'Awesome song'),
('user3', 3, 6.2, 'Not my favorite'),
('user4', 25, 7.8, 'Great insturmental'),
('user5', 55, 9.0, 'Superb performance'),
('user6', 61, 5.5, 'Could be better'),
('user7', 133, 8.5, 'Loved it'),
('user8', 14, 9.2, 'Amazing'),
('user9', 30, 7.0, 'Decent track'),
('user10', 82, 9.8, 'Outstanding');

# Insert data into Album_Reviews table
INSERT INTO Album_Reviews (username, album_id, album_rating, written_review) VALUES
('user1', 2, 8.0, 'Solid album'),
('user2', 1, 9.5, 'Masterpiece'),
('user3', 7, 7.2, 'Good effort'),
('user4', 6, 8.8, 'Impressive work'),
('user5', 5, 9.7, 'Must listen'),
('user6', 4, 6.5, 'Average'),
('user7', 9, 9.0, 'Exceptional'),
('user8', 8, 9.3, 'Brilliant'),
('user9', 2, 8.5, 'Enjoyable'),
('user10', 10, 9.5, 'Perfection');

# Insert data into Users table
INSERT INTO Users (username, name, email, password, favorite_artist) VALUES
('user1', 'User One', 'user1@gmail.com', 'password1', 1),
('user2', 'User Two', 'user2@gmail.com', 'password2', 2),
('user3', 'User Three', 'user3@gmail.com', 'password3', 3),
('user4', 'User Four', 'user4@gmail.com', 'password4', 4),
('user5', 'User Five', 'user5@gmail.com', 'password5', 5),
('user6', 'User Six', 'user6@gmail.com', 'password6', 6),
('user7', 'User Seven', 'user7@gmail.com', 'password7', 7),
('user8', 'User Eight', 'user8@gmail.com', 'password8', 8),
('user9', 'User Nine', 'user9@gmail.com', 'password9', 9),
('user10', 'User Ten', 'user10@gmail.com', 'password10', 10);


-- Part 3, write different queries on the database
 
 -- Find the name of user 4's favorite artist
 # contains inner join on 2 tables
 SELECT username, artist_name
 FROM Users u
 JOIN Artist a ON a.artist_id = u.favorite_artist
 WHERE username = 'user4';
 
 -- Find album(s) with the most number of tracks
 # contains subquery
 SELECT COUNT(*) AS song_count, album_name
 FROM Tracks t
 JOIN Albums a ON a.album_id = t.album_id
 GROUP BY t.album_id
 HAVING song_count = (SELECT MAX(song_count) FROM (
					  SELECT COUNT(*) AS song_count 
                      FROM Tracks
                      GROUP BY album_id) AS subq);
                    
-- Find the average track rating for each album, only show those with a greater than 8.5 average
# contains GROUP BY, HAVING clause 
SELECT a.album_id, a.album_name, AVG(t.track_rating) AS avg_rating
FROM Albums a
JOIN Tracks t ON a.album_id = t.album_id
GROUP BY a.album_id, a.album_name
HAVING AVG(t.track_rating) > 8.5;


-- Find 'The Smiths' average track rating
# contains aggregate function 'AVG'
SELECT a.artist_name, AVG(track_rating) AS avg_rating
FROM Tracks t
JOIN Artist_Tracks s ON s.track_id = t.track_id
JOIN Artist a ON a.artist_id = s.artist_id
WHERE a.artist_name = 'The Smiths';

-- Find info on all tracks by 'Mac Miller' and the average user rating if reviews have been made
# contains left outer join
SELECT t.track_name, t.release_date, t.album_id, AVG(s.track_rating) AS avg_user_rating
FROM Tracks t
JOIN Artist_Tracks j ON j.track_id = t.track_id
JOIN Artist a ON a.artist_id = j.artist_id
LEFT JOIN Song_Reviews s ON s.track_id = t.track_id
WHERE a.artist_name = 'Mac Miller'
GROUP BY t.track_name, t.release_date, t.album_id;
