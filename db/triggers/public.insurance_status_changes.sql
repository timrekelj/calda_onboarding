CREATE TRIGGER handle_updated_at BEFORE UPDATE ON "insurance_status_changes"
  FOR EACH ROW EXECUTE PROCEDURE moddatetime (updated_at);
