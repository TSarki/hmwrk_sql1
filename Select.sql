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