CREATE TRIGGER handle_updated_at BEFORE UPDATE ON "deathwish_default"
  FOR EACH ROW EXECUTE PROCEDURE moddatetime (updated_at);
