-- name: genre-top-n
-- Get the N top tracks by genre

SELECT genre.name AS genre,
       CASE
           WHEN length(ss.name) > 15
           THEN substring(ss.name FROM 1 FOR 15) || '…'
           ELSE ss.name
       END AS track,
       artist.name AS artist
FROM genre
LEFT JOIN LATERAL
(
    SELECT track.name,
           track.albumid,
           count(playlistid)
    FROM track
    LEFT JOIN playlisttrack USING (trackid)
    WHERE track.genreid = genre.genreid
    GROUP BY track.trackid
    ORDER BY count DESC
    LIMIT :n
) ss(name, albumid, count) ON true
JOIN album USING (albumid)
JOIN artist USING (artistid)
ORDER BY genre.name, ss.count DESC;
