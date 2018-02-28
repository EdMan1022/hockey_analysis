USE hockey;
DELIMITER $$
DROP PROCEDURE  IF EXISTS hockey_proc_b$$
CREATE PROCEDURE hockey_proc_b()
  BEGIN
    SELECT award_player.player_id, award_player.year, COUNT(award_player.award) FROM award_player
    GROUP BY award_player.player_id, award_player.year
    ORDER BY COUNT(award_player.award) DESC;
  END$$

DELIMITER $$
