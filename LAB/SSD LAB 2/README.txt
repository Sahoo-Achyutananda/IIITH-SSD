Lab 2: SQL - Stored Procedures and Cursors

----------------------------------------------------
1. Files in this ZIP:
----------------------------------------------------
q1.sql - Stored procedure ListAllSubscribers() that uses a cursor to iterate through all subscribers and print their names.
q2.sql - Stored procedure GetWatchHistoryBySubscriber(IN sub_id INT) that returns all shows watched by the subscriber along with watch time.
q3.sql - Stored procedure AddSubscriberIfNotExists(IN subName VARCHAR(100)) that adds a subscriber if they don't already exist.
q4.sql - Stored procedure SendWatchTimeReport() that loops over subscribers who have watched something and calls GetWatchHistoryBySubscriber().
q5.sql - Stored procedure ListAllSubscribersWatchHistory() that loops over ALL subscribers and calls GetWatchHistoryBySubscriber().

README.txt - This file containing execution steps and repository link.

----------------------------------------------------
2. Steps to Execute in MySQL Workbench:
----------------------------------------------------
1. Open MySQL Workbench and connect to your database server.
2. Create the required tables and insert sample data as given in the lab PDF:
   <The Github repo consists of an init.sql file that creates and inserts the following sample data> 
   CREATE TABLE Shows (
       ShowID INT PRIMARY KEY,
       Title VARCHAR(100),
       Genre VARCHAR(50),
       ReleaseYear INT
   );

   CREATE TABLE Subscribers (
       SubscriberID INT PRIMARY KEY,
       SubscriberName VARCHAR(100),
       SubscriptionDate DATE
   );

   CREATE TABLE WatchHistory (
       HistoryID INT PRIMARY KEY,
       ShowID INT,
       SubscriberID INT,
       WatchTime INT,
       FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
       FOREIGN KEY (SubscriberID) REFERENCES Subscribers(SubscriberID)
   );

   INSERT INTO Shows (ShowID, Title, Genre, ReleaseYear) VALUES
   (1, 'Stranger Things', 'Sci-Fi', 2016),
   (2, 'The Crown', 'Drama', 2016),
   (3, 'The Witcher', 'Fantasy', 2019);

   INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate) VALUES
   (1, 'Emily Clark', '2023-01-10'),
   (2, 'Chris Adams', '2023-02-15'),
   (3, 'Jordan Smith', '2023-03-05');

   INSERT INTO WatchHistory (HistoryID, SubscriberID, ShowID, WatchTime) VALUES
   (1, 1, 1, 100),
   (2, 1, 2, 10),
   (3, 2, 1, 20),
   (4, 2, 2, 40),
   (5, 2, 3, 10),
   (6, 3, 2, 10),
   (7, 3, 1, 10);

3. Execute each `.sql` file in order (q1.sql to q5.sql) to create the stored procedures.

4. Test each stored procedure:
   - Q1:
     CALL ListAllSubscribers();
   - Q2:
     CALL GetWatchHistoryBySubscriber(1);
   - Q3:
     CALL AddSubscriberIfNotExists('New Name');
   - Q4:
     CALL SendWatchTimeReport();
   - Q5:
     CALL SendWatchTimeReportAllSubscribers();

5. Verify output in MySQL Workbench "result" tabs.

----------------------------------------------------
3. Git Repository Link:
----------------------------------------------------
<Insert your GitHub / GitLab repository link here>
