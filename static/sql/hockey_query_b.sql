USE hockey;
SELECT year, coach_id, ANY_VALUE(w) from coach GROUP BY coach.year, coach.coach_id;

