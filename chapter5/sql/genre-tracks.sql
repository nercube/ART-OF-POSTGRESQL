-- name: tracks-by-genre

SELECT genre.name, count(*) AS count
FROM genre
LEFT JOIN track USING (genreid)
GROUP BY genre.name
ORDER BY count DESC;
