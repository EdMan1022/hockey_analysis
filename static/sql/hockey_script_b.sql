USE hockey;
CREATE PROCEDURE hockey_proc_b
  BEGIN
    SELECT award_player.player_id, COUNT(award_player.award) FROM award_player
      GROUP BY award_player.player_id;
  END;
