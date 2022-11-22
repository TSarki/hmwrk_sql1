INSERT INTO Digest_Tracks (digest_id, track_id)
VALUES('13', '18')

alter table track  
drop constraint track_id_fkey

ALTER TABLE Digest 
DROP COLUMN track_id;

UPDATE album SET release_date = '01.09.2018' WHERE id=8

DELETE FROM digest 
WHERE id = 8;

drop table artistjenres