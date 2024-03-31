INSERT INTO tag_match
SELECT 
	sensor_id, scada_tag
FROM ldt, (
	SELECT 
		sensor.sensor_id,
		'IP' || SPLIT_PART(ip.ip_address,'.',3) AS group1,
		SPLIT_PART(ip.ip_address,'.',4) AS group2
	FROM sensor, ip
	WHERE sensor.sensor_id = ip.item_id) AS ip_tag
WHERE 
	ldt.tag = ip_tag.group1
	AND
	ldt.tag_index = ip_tag.group2::int;

INSERT INTO tag_match
SELECT 
	di.tool_id || '_' || di.di_type, scada_tag
FROM ldt, di
WHERE 
	ldt.tag = di.di_type
	AND
	ldt.tag_index = di.tag_index; 