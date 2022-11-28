SELECT album_name, release_date FROM album
WHERE release_date BETWEEN '01.01.2018' and '31.12.2018';

SELECT track_name, duration FROM track
ORDER BY duration DESC

SELECT track_name, duration FROM track
WHERE duration = 260;

SELECT track_name, duration FROM track
WHERE duration>=210;

SELECT digest_name FROM digest
WHERE release_date BETWEEN '01.01.2018' and '31.12.2020';

SELECT artist_name FROM artist
WHERE artist_name NOT LIKE '%% %%';

SELECT track_name FROM track
WHERE track_name LIKE '%my%';

SELECT COUNT(artist_id), jenre_name FROM artist_jenres aj
JOIN jenre j ON aj.jenre_id = j.id
GROUP BY DISTINCT jenre_name;

SELECT album_name, release_date, album_of_track FROM album a
JOIN track t ON a.id = t.id
WHERE release_date BETWEEN '01.01.2019' and '31.12.2020';
GROUP BY album_name;

SELECT AVG(duration), album_name FROM track t
LEFT JOIN album a ON a.id = t.album_of_track
GROUP BY album_name;

SELECT artist_name, release_date FROM artist a
JOIN album ab ON a.album = ab.album_name
JOIN artists_albums aa ON ab.id = aa.album_id
WHERE release_date NOT BETWEEN '01.01.2020' and '31.12.2020'

SELECT distinct artist_name, digest_name FROM artist a
JOIN album ab ON a.album = ab.album_name
JOIN track t ON t.album_of_track = ab.id 
JOIN digest_tracks dt ON dt.track_id = t.id 
JOIN digest d ON d.id = dt.digest_id 
WHERE artist_name LIKE 'Dua Liipa'

SELECT album_name FROM Album a
JOIN artist at ON at.album = a.album_name
JOIN artist_jenres aj ON aj.artist_id = at.id
GROUP BY at.artist_name, a.album_name
HAVING count(aj.jenre_id) > 1

SELECT track_name FROM track t
LEFT JOIN digest_tracks dt ON t.id = dt.track_id
WHERE dt.track_id IS NULL

SELECT artist_name, duration FROM artist a
JOIN artists_albums aa ON a.id = aa.artist_id
JOIN album ab ON aa.album_id = ab.id
JOIN track t ON ab.id = t.album_of_track
WHERE duration IN (SELECT MIN(duration) FROM track)

SELECT album_name, count(t.id) FROM Album a
JOIN track t  ON a.id = t.album_of_track
GROUP BY a.album_name 
HAVING count(t.id) in (SELECT count(t.id) FROM Album a
	JOIN track t  ON a.id = t.album_of_track
    GROUP BY a.album_name
    ORDER BY count(t.id)
    LIMIT 1)