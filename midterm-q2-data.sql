
-- 
-- create table if not exists invoice (
-- 	invoice_id serial not null primary key,
-- 	invoice_date timestamp not null default current_timestamp,
-- 	total decimal default 0 not null,
-- 	tax decimal default 0 not null
-- );
-- 
-- create table if not exists address (
-- 	address_id serial not null primary key,
-- 	invoice_id bigint not null,
-- 	addr_type text not null,
-- 	customer_name text not null,
-- 	address_line1 text not null,
-- 	address_line2 text not null,
-- 	address_line3 text not null,
-- 	city text not null,
-- 	state text not null,
-- 	zip_code text not null
-- );
-- 
-- create table if not exists invoice_line (
-- 	invoice_line serial not null primary key,
-- 	line_no int not null check ( line_no >= 1 and line_no < 5000 ),
-- 	invoice_id bigint not null,
-- 	quantity int default 1 not null,
-- 	unit_price decimal default 0 not null,
-- 	description text not null,
-- 	extended_price decimal default 0 not null
-- );
-- 

DO $$
DECLARE
	aid1 uuid;
	aid2 uuid;
	aid3 uuid;
	inv1 uuid;
	inv2 uuid;
BEGIN

	aid1 = uuid_generate_v4();
	aid2 = uuid_generate_v4();
	aid3 = uuid_generate_v4();
	inv1 = uuid_generate_v4();
	inv2 = uuid_generate_v4();

	insert into invoice ( invoice_id, invoice_date, total, tax ) values	
		( inv1, '2020-01-22', 36.00, 36.00*0.07 )
	,	( inv2, '2020-01-23', 90.00, 90.00*0.07 )
	;

	insert into address ( address_id, invoice_id, addr_type, customer_name, address_line1, city, state, zip_code ) values
		( aid1, inv1, 'Billing', 'Mark Devin, LLC', '123 Any Road', 'Laramie', 'WY', '82071' )
	,	( aid2, inv1, 'Shipping', 'Mark Devin, LLC', '123 Any Road', 'Laramie', 'WY', '82071' )
	,	( aid3, inv2, 'Billing', 'Janet Thomas', '12 Main Street', 'Laramie', 'WY', '82071' )
	;

	insert into invoice_line ( line_no, invoice_id, quantity, unit_price, description, extended_price ) values		
		( 1, inv1, 3, 12, 'Widget 1', 36 )
	,   ( 1, inv2, 4, 10, 'Widget 2', 40 )
	,   ( 2, inv2, 4, 12, 'Widget 1', 48 )
	,   ( 3, inv2, 2,  1, 'Widget 4',  2 )
	;
SELECT 
	t1.invoice_id, 
	line_no, 
	sum(tax) OVER (PARTITION BY invoice_id) as sum_tax,
	avg(tax) OVER (PARTITION BY invoice_id) as avg_tax,
	zip_code
	FROM t1 JOIN t2 on (t1.invoice_id = t2.invoice_id) 
	ORDER BY line_no

END

$$ LANGUAGE plpgsql;


