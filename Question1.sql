CREATE EXTENSION IF NOT EXISTS "uuid-ossp"; 


DROP TABLE if exists invoice cascade ;
DROP TABLE if exists address cascade ;
DROP TABLE if exists invoice_line cascade ;

CREATE TABLE if not exists invoice (
	invoice_id UUID NOT NULL DEFAULT uuid_generate_v4() primary key, 
	total decimal,
	tax decimal,
	invoice_date time 
);
CREATE TABLE if not exists address (
	address_id UUID NOT NULL DEFAULT uuid_generate_v4() primary key, 
	addr_type varchar(20),
	customer_name text,
	zip_code text,
	address_line​1 text,
	address_line​2 text,
	address_line​3 text,
	city text,
	stat varchar(2),
	CONSTRAINT fk_invoice
		FOREIGN KEY (invoice_id)  
			REFERENCES invoice(invoice_id) 
	
);
CREATE TABLE if not exists invoice_line (
	invoice_line_id UUID NOT NULL DEFAULT uuid_generate_v4() primary key, 
	line_no int,
	quantity int,
	unit_price decimal,
	description text,
	extended_price decimal,
	CONSTRAINT fk_invoice
		FOREIGN KEY (invoice_id)  
			REFERENCES invoice(invoice_id) 


);
CREATE INDEX invoice_date_idx1 on invoice ( invoice_date ); 
CREATE INDEX customer_name_idx2 on address ( customer_name );
CREATE INDEX invoice_id_idx3 on invoice ( invoice_id );
CREATE INDEX line_no_idx4 on invoice_line ( line_no );


