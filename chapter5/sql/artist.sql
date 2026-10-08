-- name: top-artists-by-album
-- Get the list of the N artists with the most albums

SELECT artist.name, count(*) AS albums
FROM artist
LEFT JOIN album USING(artistid)
GROUP BY artist.name
ORDER BY albums DESC
LIMIT :n;
