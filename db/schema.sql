CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA EXTENSIONS;

CREATE TABLE "user_data" (
  "id" UUID UNIQUE NOT NULL REFERENCES auth.users ON DELETE CASCADE,
  "name" TEXT,
  "profile_picture_url" TEXT,
  "status" user_status NOT NULL DEFAULT('NOT_SUBMITTED'),
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),

  PRIMARY KEY ("id")
);

CREATE TABLE "deathwish_default" (
  "id" UUID UNIQUE NOT NULL DEFAULT (gen_random_uuid()),
  "thumbnail_url" TEXT,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),

  PRIMARY KEY ("id")
);

CREATE TABLE "deathwish_custom" (
  "id" UUID UNIQUE NOT NULL DEFAULT (gen_random_uuid()),
  "user_id" UUID REFERENCES USER_DATA ON DELETE CASCADE,
  "deathwish_id" UUID REFERENCES deathwish_default,
  "name" TEXT,
  "price" INT4 NOT NULL,
  "personal_note" TEXT,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),

  PRIMARY KEY ("id")
);

CREATE TABLE "prices" (
  "id" UUID UNIQUE NOT NULL DEFAULT (gen_random_uuid()),
  "price" INT4 NOT NULL,
  "display" TEXT NOT NULL,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),

  PRIMARY KEY ("id")
);

CREATE TABLE "benefactors" (
  "id" UUID UNIQUE NOT NULL DEFAULT (gen_random_uuid()),
  "deathwish_id" UUID NOT NULL REFERENCES deathwish_custom,
  "name" TEXT NOT NULL,
  "kinship" kinship NOT NULL,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),

  PRIMARY KEY ("id")
);

CREATE TABLE "questions" (
  "id" UUID UNIQUE NOT NULL DEFAULT (gen_random_uuid()),
  "question" TEXT NOT NULL,
  "comment" TEXT,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),

  PRIMARY KEY ("id")
);

CREATE TABLE "answers" (
  "user_id" UUID NOT NULL REFERENCES user_data ON DELETE CASCADE,
  "question_id" UUID NOT NULL REFERENCES questions ON DELETE CASCADE,
  "answer" TEXT NOT NULL,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),

  PRIMARY KEY ("user_id", "question_id")
);
