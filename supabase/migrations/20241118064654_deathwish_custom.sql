CREATE TABLE "deathwish_custom" (
  "id" UUID UNIQUE NOT NULL DEFAULT (gen_random_uuid()),
  "user_id" UUID REFERENCES USER_DATA ON DELETE CASCADE,
  "deathwish_id" UUID REFERENCES deathwish_default,
  "name" TEXT,
  "personal_note" TEXT,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),

  PRIMARY KEY ("id")
);
