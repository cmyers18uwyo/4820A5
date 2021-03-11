DELETE FROM name_list 
	WHERE real_name = 'Jane True' 
	  AND real_name::text not in ( 
		SELECT min(real_name::text) 
		FROM name_list  
		WHERE real_name = 'Jane True' 
	) 
; 