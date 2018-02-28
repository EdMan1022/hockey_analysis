# Create a view that returns the number of awards every player received every year
USE hockey;
DROP VIEW IF EXISTS hockey_view_c;
CREATE VIEW hockey_view_c AS
SELECT award_player.player_id, award_player.year, COUNT(award_player.award) as award_count FROM award_player
GROUP BY award_player.player_id, award_player.year
ORDER BY COUNT(award_player.award) DESC;

# Combine the counts of how many awards a player won in a year with the player's team id,
# grabbed from the scoring table
DROP VIEW IF EXISTS player_award_tm;
CREATE View player_award_tm AS
SELECT hockey_view_c.*, scoring.tm_id
  from hockey_view_c
  LEFT JOIN (scoring)
  ON (hockey_view_c.player_id=scoring.player_id)
GROUP BY hockey_view_c.player_id, hockey_view_c.year
ORDER BY hockey_view_c.award_count DESC;

SELECT * from hockey_view_c;

# Select all of the players whose award count is equal to the max number of awards of that year
DROP VIEW IF EXISTS max_player_award_per_year;
CREATE View max_player_award_per_year AS
SELECT play_a.* FROM player_award_tm play_a
  LEFT JOIN player_award_tm play_b
  ON play_a.year = play_b.year AND play_a.award_count < play_b.award_count
WHERE play_b.award_count is NULL;

# Select all of the coaches whose win count is equal to the max number of wins of that year
DROP VIEW IF EXISTS max_coach_wins_per_year;
CREATE View max_coach_wins_per_year AS
SELECT coach_a.* FROM coach coach_a
  LEFT JOIN coach coach_b
  ON coach_a.year = coach_b.year AND coach_a.w < coach_b.w
WHERE coach_b.w is NULL;

# Select the players whose coaches had the max number of wins during the same year that they had the max n of awards
DROP VIEW IF EXISTS player_coach_max;
CREATE View player_coach_max AS
SELECT max_player_award_per_year.* from max_player_award_per_year
INNER JOIN max_coach_wins_per_year
  ON max_player_award_per_year.tm_id = max_coach_wins_per_year.tm_id AND max_player_award_per_year.year = max_coach_wins_per_year.year
;

# Join the master info with the list of players from player_coach_max
SELECT master.*, player_coach_max.year as max_year, player_coach_max.award_count FROM master
INNER JOIN player_coach_max
ON master.player_id = player_coach_max.player_id;



