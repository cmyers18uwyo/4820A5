
DROP TABLE if exists authors cascade ;
DROP TABLE if exists books cascade ;

CREATE TABLE if not exists authors (
	id    			serial not null PRIMARY KEY,
	author_name  	text
);

CREATE TABLE if not exists books (
	id          serial not null PRIMARY KEY,
	author_id   int4 not null,
	title       varchar not null, 
	year         int not null default 2021
);

ALTER TABLE books
	ADD CONSTRAINT books_author_id_fk1
	FOREIGN KEY (author_id)
	REFERENCES authors (id)
;



