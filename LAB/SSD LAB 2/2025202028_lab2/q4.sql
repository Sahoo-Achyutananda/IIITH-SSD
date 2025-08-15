-- Make a procedure SendWatchTimeReport() which internally calls
-- GetWatchHistoryBySubscriber() for all subscribers, but only if they have watched
-- something.

USE SSDLAB2;

DELIMITER //
CREATE PROCEDURE SendWatchTimeReport()
BEGIN
	DECLARE done INT DEFAULT 0;
    DECLARE subId INT;
    
    DECLARE cur CURSOR FOR
    SELECT DISTINCT SubscriberID
    FROM WatchHistory;
    
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

CALL SendWatchTimeReport();
