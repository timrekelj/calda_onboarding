-- Enable MODDATETIME extension
CREATE EXTENSION IF NOT EXISTS moddatetime SCHEMA EXTENSIONS;

-- Update `updated_at` at every update
CREATE TRIGGER handle_updated_at BEFORE UPDATE ON "user_data"
  FOR EACH ROW EXECUTE PROCEDURE moddatetime (updated_at);
CREATE TRIGGER handle_updated_at BEFORE UPDATE ON "deathwish_default"
  FOR EACH ROW EXECUTE PROCEDURE moddatetime (updated_at);
CREATE TRIGGER handle_updated_at BEFORE UPDATE ON "deathwish_custom"
  FOR EACH ROW EXECUTE PROCEDURE moddatetime (updated_at);
CREATE TRIGGER handle_updated_at BEFORE UPDATE ON "prices"
  FOR EACH ROW EXECUTE PROCEDURE moddatetime (updated_at);
CREATE TRIGGER handle_updated_at BEFORE UPDATE ON "benefactors"
  FOR EACH ROW EXECUTE PROCEDURE moddatetime (updated_at);
CREATE TRIGGER handle_updated_at BEFORE UPDATE ON "answers"
  FOR EACH ROW EXECUTE PROCEDURE moddatetime (updated_at);
CREATE TRIGGER handle_updated_at BEFORE UPDATE ON "insurance_status_changes"
  FOR EACH ROW EXECUTE PROCEDURE moddatetime (updated_at);

-- Trigger "handle_new_user" function every time a user is created
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE PROCEDURE handle_new_user();

CREATE TRIGGER track_insurance_status_change
  AFTER UPDATE ON user_data
  FOR EACH ROW EXECUTE FUNCTION log_insurance_status_change();
