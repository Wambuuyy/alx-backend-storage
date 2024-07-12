-- 100-average_weighted_score.sql

-- Create stored procedure ComputeAverageWeightedScoreForUser
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN in_user_id INT)
BEGIN
    DECLARE weighted_avg FLOAT;
    
    SELECT SUM(c.score * p.weight) / SUM(p.weight) INTO weighted_avg
    FROM corrections c
    INNER JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = in_user_id;
    
    UPDATE users
    SET average_score = IFNULL(weighted_avg, 0)
    WHERE id = in_user_id;
END //

DELIMITER ;
