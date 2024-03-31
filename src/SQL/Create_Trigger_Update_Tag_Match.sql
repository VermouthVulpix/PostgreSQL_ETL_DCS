CREATE TRIGGER trigger_update_tag_match
	AFTER UPDATE
		ON ip
	FOR EACH ROW
	EXECUTE PROCEDURE update_tag_match();