USE hockey;
SELECT
  coach.year,
  coach.coach_id,
  SUM(coach.w) -- ANY_VALUE is needed to include non-aggregate columns in a group by statement
FROM coach
GROUP BY coach.year, coach.coach_id
ORDER BY coach.year DESC, SUM(coach.w) DESC;
