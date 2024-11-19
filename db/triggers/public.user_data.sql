CREATE TRIGGER track_insurance_status_change
  AFTER UPDATE ON user_data
  FOR EACH ROW EXECUTE FUNCTION log_insurance_status_change();

CREATE TRIGGER handle_updated_at BEFORE UPDATE ON "user_data"
  FOR EACH ROW EXECUTE PROCEDURE moddatetime (updated_at);
