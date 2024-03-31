CREATE OR REPLACE FUNCTION update_tag_match()
	RETURNS trigger AS
$$
BEGIN
	IF NEW.ip_address <> OLD.ip_address THEN
		UPDATE tag_match
		SET scada_tag = tmp.dcs_tag
		FROM (
			SELECT 
				sensor_id, dcs_tag
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
				ldt.tag_index = ip_tag.group2
			) AS tmp
			WHERE tag_match.sensor_id = tmp.sensor_id;
		END IF;
		RETURN NEW;
END;
$$ LANGUAGE plpgsql;