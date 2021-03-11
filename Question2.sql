SELECT 
	t0.invoice_id,
	t2.line_no,
	sum(tax) OVER (PARTITION BY t0.invoice_id) as sum_tax,
	avg(tax) OVER (PARTITION BY t0.invoice_id) as avg_tax,
	t1.zip_code
	FROM invoice t0
	INNER JOIN address t1 on (t1.invoice_id = t0.invoice_id)
	INNER JOIN invoice_line t2 on (t1.invoice_id = t2.invoice_id)
	ORDER BY line_no
;