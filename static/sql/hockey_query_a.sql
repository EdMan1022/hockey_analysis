USE hockey;
SELECT
  year,
  coach_id,
  ANY_VALUE(w)
FROM coach
GROUP BY coach.year, coach.coach_id;

