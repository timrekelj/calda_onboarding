CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA EXTENSIONS;

CREATE TABLE "user_data" (
  "id" UUID UNIQUE PRIMARY KEY NOT NULL REFERENCES auth.users ON DELETE CASCADE,
  "name" TEXT,
  "profile_picture_url" TEXT,
  "status" user_status NOT NULL DEFAULT('NOT_SUBMITTED'),
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE "deathwish_default" (
  "id" UUID UNIQUE PRIMARY KEY NOT NULL DEFAULT (gen_random_uuid()),
  "name" TEXT NOT NULL,
  "price" UUID NOT NULL,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE "deathwish_custom" (
  "id" UUID UNIQUE PRIMARY KEY NOT NULL DEFAULT (gen_random_uuid()),
  "user_id" UUID REFERENCES USER_DATA ON DELETE CASCADE,
  "deathwish_id" UUID REFERENCES deathwish_default,
  "name" TEXT,
  "personal_note" TEXT,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE "prices" (
  "id" UUID UNIQUE PRIMARY KEY NOT NULL DEFAULT (gen_random_uuid()),
  "price" INT4 NOT NULL,
  "display" TEXT NOT NULL,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE "benefactors" (
  "id" UUID UNIQUE PRIMARY KEY NOT NULL DEFAULT (gen_random_uuid()),
  "deathwish_id" UUID NOT NULL REFERENCES deathwish_default,
  "name" TEXT NOT NULL,
  "kinship" kinship NOT NULL,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE "questions" (
  "id" UUID UNIQUE PRIMARY KEY NOT NULL DEFAULT (gen_random_uuid()),
  "question" TEXT NOT NULL,
  "comment" TEXT,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE "answers" (
  "user_id" UUID NOT NULL REFERENCES user_data ON DELETE CASCADE,
  "question_id" UUID NOT NULL REFERENCES questions ON DELETE CASCADE,
  "answer" TEXT NOT NULL,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),

  PRIMARY KEY ("user_id", "question_id")
);

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
CREATE TRIGGER handle_updated_at BEFORE UPDATE ON "questions"
  FOR EACH ROW EXECUTE PROCEDURE moddatetime (updated_at);
CREATE TRIGGER handle_updated_at BEFORE UPDATE ON "answers"
  FOR EACH ROW EXECUTE PROCEDURE moddatetime (updated_at);

-- Insert a row into public.profiles
CREATE FUNCTION handle_new_user()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER SET search_path = ''
AS $$
BEGIN
  INSERT INTO user_data (id, name)
  VALUES (new.id, new.name);
  RETURN new;
END;
$$;

-- Trigger the previous function every time a user is created
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE PROCEDURE handle_new_user();
