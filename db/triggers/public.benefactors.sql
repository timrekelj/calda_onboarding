CREATE TRIGGER handle_updated_at BEFORE UPDATE ON "benefactors"
  FOR EACH ROW EXECUTE PROCEDURE moddatetime (updated_at);
