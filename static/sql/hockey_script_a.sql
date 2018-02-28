USE hockey;
SELECT
  coach.year,
  coach.coach_id,
  ANY_VALUE(coach.w)
FROM coach
GROUP BY coach.year, coach.coach_id
ORDER BY coach.year DESC, coach.w DESC;
