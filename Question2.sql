SELECT 
	t1.invoice_id, 
	line_no, 
	--sum(tax) OVER (PARTITION BY invoice_id) as sum_tax,
	--avg(tax) OVER (PARTITION BY invoice_id) as avg_tax,
	zip_code
	FROM invoice_line t1
	JOIN address on (address.invoice_id = t1.invoice_id),
	invoice
	ORDER BY line_no
;