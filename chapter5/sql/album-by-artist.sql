-- name: list-albums-by-artist
-- List albums and their total duration for an artist

SELECT album.title AS album,
       SUM(milliseconds) * interval '1 ms' AS duration
FROM album
JOIN artist USING(artistid)
LEFT JOIN track USING(albumid)
WHERE artist.name = :name
GROUP BY album
ORDER BY album;

