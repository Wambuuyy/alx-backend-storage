-- 7-average_score.sql
-- Creates a stored procedure to compute and store the average score for a student
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(IN in_user_id INT)
BEGIN
    DECLARE avg_score FLOAT;

    SELECT AVG(score) INTO avg_score
    FROM corrections
    WHERE user_id = in_user_id;

    UPDATE users
    SET average_score = IFNULL(avg_score, 0)
    WHERE id = in_user_id;
END$$
DELIMITER ;
