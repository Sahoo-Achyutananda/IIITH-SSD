-- Write a procedure with a cursor that loops through each subscriber and for each
-- subscriber GetWatchHistoryBySubscriber() to print their watch history.

USE SSDLAB2;

DELIMITER //
-- the previous question's procedure only loops  through those subscribers that have atleast one entry in the watchHistory table, <i.e. subscribers who've watched atleast one film/series>
-- this one gets the watch history for every subs.
CREATE PROCEDURE SendWatchTimeReportAllSubscribers()
BEGIN
	DECLARE done INT DEFAULT 0;
    DECLARE subId INT;
    
    DECLARE cur CURSOR FOR
    SELECT SubscriberID -- only the cursor's allocation changed !
    FROM Subscribers;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    
    readLoop : LOOP
		FETCH cur INTO subId;
        IF done THEN
			LEAVE readLoop;
        END IF;
        CALL GetWatchHistoryBySubscriber(subId);
	END LOOP;
    CLOSE cur;
END//

DELIMITER ;

CALL SendWatchTimeReportAllSubscribers();