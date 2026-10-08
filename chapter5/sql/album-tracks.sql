-- name: list-tracks-by-albumid

SELECT track.name AS track,
       track.milliseconds * interval '1 ms' AS duration
FROM track
WHERE albumid = :id
ORDER BY track;