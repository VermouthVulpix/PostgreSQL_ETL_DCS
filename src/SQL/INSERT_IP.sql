INSERT INTO IP 
SELECT 
	item,
	ip_address,
	(regexp_matches(description,'([0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2})'))[1]
FROM
	temporary_ip
WHERE 
	description IS NOT NULL;
INSERT INTO IP
SELECT 
	item,
	ip_address,
	description
FROM
	temporary_ip
WHERE 
	description='Sensor';

DROP TABLE temporary_ip;

 

