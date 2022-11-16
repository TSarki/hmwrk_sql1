CREATE TABLE IF NOT EXISTS Album(
	id SERIAL PRIMARY KEY,
	album_name VARCHAR(60) NOT NULL,
	release_date date	
);

CREATE TABLE IF NOT EXISTS Track(
	id SERIAL PRIMARY KEY,
	duration INTEGER NOT NULL,
	album_name VARCHAR(60) NOT NULL,
	album_of_track INTEGER NOT NULL REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Jenre(
	id SERIAL PRIMARY KEY,
	jenre_name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artist(
	id SERIAL PRIMARY KEY,
	artist_name VARCHAR(60) NOT NULL,
	jenre INTEGER NOT NULL REFERENCES Jenre(id),
	album VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS Artists_Albums(
	artist_id INTEGER REFERENCES Artist(id),
	album_id INTEGER REFERENCES Album(id),
	CONSTRAINT pk PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS Digest(
	id SERIAL PRIMARY KEY,
	digest_name VARCHAR(50) NOT NULL,
	release_date date NOT NULL,
	track_id INTEGER NOT NULL REFERENCES TracK(id)
);

CREATE TABLE IF NOT EXISTS Artist_Jenres(
	artist_id INTEGER REFERENCES Artist(id),
	jenre_id INTEGER REFERENCES Jenre(id),
	CONSTRAINT ajpk PRIMARY KEY (artist_id, jenre_id)
);

CREATE TABLE IF NOT EXISTS Digest_Tracks(
	digest_id INTEGER REFERENCES Digest(id),
	track_id INTEGER REFERENCES Track(id),
	CONSTRAINT dtpk PRIMARY KEY (digest_id, track_id)
);
	