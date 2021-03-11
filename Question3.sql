\COPY authors (id, author_name)
FROM 'midterm.authors.q3.csv'
WITH (FORMAT csv);