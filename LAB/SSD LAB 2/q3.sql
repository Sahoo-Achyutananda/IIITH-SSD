-- AddSubscriberIfNotExists(IN subName VARCHAR(100)) – Adds a new subscriber
-- into the Subscribers table, checking if the subscriber name already exists.

USE SSDLAB2;

DELIMITER //

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
	-- 1. check if name is already existing
    -- 2. get the max of the subscriber Id and increment it to assign it to the new person
    -- 3. update the table if subscriber doesnt exists already
    -- 4. show a message 
    
	DECLARE subExists INT DEFAULT 0;
    DECLARE subIdNew INT;
    
    SELECT COUNT(*) INTO subExists FROM Subscribers WHERE SubscriberName = subName;
    
    SELECT MAX(SubscriberID) + 1 INTO subIdNew FROM Subscribers;
    
	IF subExists = 0 THEN
		INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate)
        VALUES (subIdNew, subName, CURDATE());
        -- display message : SUCCESS
        SELECT subIdNew AS NewSubscriberID, subName AS NewSubscriberName, 'Inserted' AS Status;
    ELSE
		-- display message : FAILURE
		SELECT subName AS NewSubscriberName, 'Already Exists' AS Status;
	END IF;
END //

DELIMITER ;

CALL AddSubscriberIfNotExists('Achyutananda Sahoo'); -- first call -> inserted successfully
CALL AddSubscriberIfNotExists('Achyutananda Sahoo'); -- second call with same name -> shows "Already Exists"