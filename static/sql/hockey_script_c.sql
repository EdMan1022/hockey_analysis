USE hockey;
DROP VIEW IF EXISTS hockey_view_c;
CREATE VIEW hockey_view_c AS
SELECT award_player.player_id, award_player.year, COUNT(award_player.award) as award_count FROM award_player
GROUP BY award_player.player_id, award_player.year
ORDER BY COUNT(award_player.award) DESC;

DROP VIEW IF EXISTS player_award_tm;
CREATE View player_award_tm AS
SELECT hockey_view_c.*, scoring.tm_id
  from hockey_view_c
  LEFT JOIN (scoring)
  ON (hockey_view_c.player_id=scoring.player_id)
GROUP BY hockey_view_c.player_id, hockey_view_c.year
ORDER BY hockey_view_c.award_count DESC;

DROP VIEW IF EXISTS max_award_per_year;
CREATE VIEW max_award_per_year AS
Select player_award_tm.year, ANY_VALUE(player_award_tm.player_id), ANY_VALUE(player_award_tm.tm_id),
  MAX(player_award_tm.award_count) as award_count_per_year FROM player_award_tm
GROUP BY player_award_tm.year
;


-- Select all of the players whose award count is equal to the max award
SELECT o.* FROM `player_award_tm` o
  LEFT JOIN `player_award_tm` b
  ON o.year = b.year AND o.award_count < b.award_count
WHERE b.award_count is NULL;



Select player_award_tm.year, ANY_VALUE(player_award_tm.player_id), ANY_VALUE(player_award_tm.tm_id),
  ANY_VALUE(player_award_tm.award_count) FROM player_award_tm
  LEFT JOIN (max_award_per_year)
  ON (player_award_tm.year=max_award_per_year.year)
  WHERE ANY_VALUE(player_award_tm.award_count)= get_year_max(player_award_tm.year)
  GROUP BY player_award_tm.year
;

SELECT * from max_award_per_year;