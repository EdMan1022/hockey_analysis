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



-- Select all of the players whose award count is equal to the max award of that year
DROP VIEW IF EXISTS max_player_award_per_year;
CREATE View max_player_award_per_year AS
SELECT o.* FROM `player_award_tm` o
  LEFT JOIN `player_award_tm` b
  ON o.year = b.year AND o.award_count < b.award_count
WHERE b.award_count is NULL;

DROP VIEW IF EXISTS max_coach_wins_per_year;
CREATE View max_coach_wins_per_year AS
SELECT o.* FROM `coach` o
  LEFT JOIN `coach` b
  ON o.year = b.year AND o.w < b.w
WHERE b.w is NULL;

DROP VIEW IF EXISTS player_coach_max;
CREATE View player_coach_max AS
SELECT max_player_award_per_year.* from max_player_award_per_year
INNER JOIN max_coach_wins_per_year
  ON max_player_award_per_year.tm_id = max_coach_wins_per_year.tm_id AND max_player_award_per_year.year = max_coach_wins_per_year.year
;

SELECT master.* FROM master
INNER JOIN player_coach_max
ON master.player_id = player_coach_max.player_id;



