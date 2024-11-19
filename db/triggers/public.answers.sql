CREATE TRIGGER handle_updated_at BEFORE UPDATE ON "answers"
  FOR EACH ROW EXECUTE PROCEDURE moddatetime (updated_at);
