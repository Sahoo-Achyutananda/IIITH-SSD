-- Write a procedure GetWatchHistoryBySubscriber(IN sub_id INT) that returns all
-- shows watched by the subscriber along with watch time.

USE SSDLAB2;

DELIMITER //
CREATE PROCEDURE GetWatchHistoryBySubscriber(IN subId INT)
BEGIN
	-- join the result with the shows table to get the show names and filter it based on the subId passed
    SELECT s.Title, w.WatchTime
    FROM 
    WatchHistory w JOIN Shows s ON w.ShowID = s.ShowID
    WHERE w.SubscriberID = subId;
END // 

DELIMITER ;

CALL GetWatchHistoryBySubscriber(1);
CALL GetWatchHistoryBySubscriber(2);
CALL GetWatchHistoryBySubscriber(3);


