USE hockey;
DROP VIEW IF EXISTS hockey_view_c;
CREATE VIEW hockey_view_c AS
SELECT award_player.player_id, award_player.year, COUNT(award_player.award) FROM award_player
GROUP BY award_player.player_id, award_player.year
ORDER BY COUNT(award_player.award) DESC;

SELECT * FROM hockey_view_c LEFT JOIN (master)
  ON (hockey_view_c.player_id=master.player_id)
;