DELETE FROM name_list a USING (
      SELECT MIN(ctid) as ctid, key
        FROM name_list 
        GROUP BY key HAVING COUNT(*) > 1
      ) b
      WHERE a.real_name = b.real_name 
      AND a.ctid <> b.ctid