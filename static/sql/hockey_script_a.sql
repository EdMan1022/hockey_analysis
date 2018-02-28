USE hockey;
SELECT award_player.player_id, COUNT(award_player.award) FROM award_player
GROUP BY award_player.player_id
ORDER BY COUNT(award_player.award);

