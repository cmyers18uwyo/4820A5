DROP TABLE if exists name_list ;

CREATE TABLE name_list (
	real_name text,	
	age int,	
	state varchar(2)
);

INSERT INTO name_list values
	( 'Bob True',            22, 'WY' ),
	( 'Jane True',           20, 'WY' ),
	( 'Jane True',           20, 'WY' ),
	( 'Jane True',           20, 'WY' ),
	( 'Jane True',           20, 'WY' ),
	( 'Jane True',           20, 'WY' ),
	( 'Tom Ace',             31, 'NJ' ),
	( 'Steve Pen',           33, 'NJ' ),
	( 'Laura Jean Alkinoos', 34, 'PA' )
;
