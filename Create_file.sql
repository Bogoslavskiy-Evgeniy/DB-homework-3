CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) UNIQUE
);

CREATE TABLE IF NOT EXISTS executor (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_executor (
	genre_id INTEGER NOT NULL REFERENCES genre(id),
	executor_id INTEGER NOT NULL REFERENCES executor(id),
	CONSTRAINT primk PRIMARY KEY (genre_id, executor_id)
);

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	release_date INTEGER CHECK (release_date > 2000)
);

CREATE TABLE IF NOT EXISTS executor_album (
	executor_id INTEGER NOT NULL REFERENCES executor(id),
	album_id INTEGER NOT NULL REFERENCES album(id),
	CONSTRAINT prk PRIMARY KEY (executor_id, album_id)
);

CREATE TABLE IF NOT EXISTS track (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	duration INTEGER check (duration < 420),
	album_id INTEGER NOT NULL REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS compilation (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	release_date INTEGER check (release_date > 2000)
);

CREATE TABLE IF NOT EXISTS compilation_track (
	compilation_id INTEGER NOT NULL REFERENCES compilation(id),
	track_id INTEGER NOT NULL REFERENCES track(id),
	CONSTRAINT pk PRIMARY KEY (compilation_id, track_id)
);
