\COPY authors FROM 'midterm.authors.q3.csv' DELIMITER ',' CSV HEADER;
\COPY books FROM 'midterm.books.q3.csv' DELIMITER ',' CSV HEADER;


SELECT
	* FROM authors
	FULL OUTER JOIN on (authors.id = books.author_id);

;
