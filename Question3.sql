\COPY authors FROM 'midterm.authors.q3.csv' DELIMITER ',' CSV HEADER;
\COPY books FROM 'midterm.books.q3.csv' DELIMITER ',' CSV HEADER;


SELECT
	* FROM authors
	FULL OUTER JOIN books t1 on (authors.id = t1.author_id);

;
