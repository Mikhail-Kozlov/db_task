use PharmDB;

/* ==================== purge tables ==================== */
DROP TABLE IF EXISTS cashdesk;
DROP TABLE IF EXISTS drugstores;
DROP TABLE IF EXISTS cities;

/* ==================== cities table ==================== */
CREATE TABLE cities (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(128) NOT NULL
);

CREATE UNIQUE INDEX UIX_cities_name ON cities(name);

/* ==================== drugstores table ==================== */
CREATE TABLE drugstores (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(128) NOT NULL,
	address VARCHAR(128), 
	city_id INT NOT NULL FOREIGN KEY REFERENCES cities(id)
);

CREATE UNIQUE INDEX UIX_drugstores_name ON drugstores(name, city_id);

/* ==================== cashdesk table ==================== */
CREATE TABLE cashdesk (
	id INT IDENTITY(1,1) PRIMARY KEY,
	number INT NOT NULL,
	description VARCHAR(128), 
	drugstore_id INT NOT NULL FOREIGN KEY REFERENCES drugstores(id)
);

--CREATE UNIQUE INDEX UIX_cashdesk_number ON cashdesk(number, drugstore_id);
