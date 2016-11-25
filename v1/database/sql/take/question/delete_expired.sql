#QUERY OK

DELETE
FROM
	questions
WHERE
date !=(
  CASE
  WHEN `meal` = 'B' THEN
  IF (TIMEDIFF('09:30:00.0', CURRENT_TIME) <= 0, ADDDATE(CURRENT_DATE, INTERVAL 1 DAY), CURRENT_DATE)
  WHEN `meal` = 'L' THEN
  IF (TIMEDIFF('15:30:00.0', CURRENT_TIME) <= 0, ADDDATE(CURRENT_DATE, INTERVAL 1 DAY), CURRENT_DATE)
  WHEN `meal` = 'D' THEN
    IF (TIMEDIFF('20:15:00.0', CURRENT_TIME) <= 0, ADDDATE(CURRENT_DATE, INTERVAL 1 DAY), CURRENT_DATE)
  END
)
AND q_username = ?
AND meal = ?
