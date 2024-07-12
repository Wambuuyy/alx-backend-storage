-- 101-average_weighted_score.sql

-- Create stored procedure ComputeAverageWeightedScoreForUsers
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE user_id INT;
    DECLARE weighted_avg FLOAT;
    
    -- Cursor to iterate through each user
    DECLARE cur_users CURSOR FOR SELECT id FROM users;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur_users;
    
    read_loop: LOOP
        FETCH cur_users INTO user_id;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Calculate weighted average for the user
        SELECT SUM(c.score * p.weight) / SUM(p.weight) INTO weighted_avg
        FROM corrections c
        INNER JOIN projects p ON c.project_id = p.id
        WHERE c.user_id = user_id;
        
        -- Update average_score for the user
        UPDATE users
        SET average_score = IFNULL(weighted_avg, 0)
        WHERE id = user_id;
    END LOOP;
    
    CLOSE cur_users;
    
END //

DELIMITER ;
