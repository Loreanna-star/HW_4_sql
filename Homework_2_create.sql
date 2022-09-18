CREATE TABLE IF NOT EXISTS Genres (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Singers (
	singer_id SERIAL PRIMARY KEY,
	singer_stage_name VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(80) NOT NULL,
	album_year DATE
);

CREATE TABLE IF NOT EXISTS Tracks (
	track_id SERIAL PRIMARY KEY,
	track_name VARCHAR(80) NOT NULL,
	duration INTEGER NOT NULL,
	album_id INTEGER NOT NULL REFERENCES Albums(album_id)
);

CREATE TABLE IF NOT EXISTS Collections (
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(80) NOT NULL,
	collection_year DATE
);

CREATE TABLE IF NOT EXISTS GenresSingers (
	singer_id INTEGER REFERENCES Singers(singer_id),
	genre_id INTEGER REFERENCES Genres(genre_id),
	CONSTRAINT pk1 PRIMARY KEY (singer_id, genre_id)
);

CREATE TABLE IF NOT EXISTS AlbumsSingers (
	album_id INTEGER REFERENCES Albums(album_id),
	singer_id INTEGER REFERENCES Singers(singer_id),
	CONSTRAINT pk2 PRIMARY KEY (album_id, singer_id)
);

CREATE TABLE IF NOT EXISTS CollectionsTracks (
	collection_id INTEGER REFERENCES Collections(collection_id),
	track_id INTEGER REFERENCES Tracks(track_id),
	CONSTRAINT pk3 PRIMARY KEY (collection_id, track_id)
);
