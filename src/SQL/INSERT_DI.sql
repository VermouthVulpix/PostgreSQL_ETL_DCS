INSERT INTO DI
SELECT 
	*
FROM
	temporary_di
WHERE 
	tool_id IS NOT NULL;

DROP TABLE temporary_di;

 

