CREATE TABLE "benefactors" (
  "id" UUID UNIQUE NOT NULL DEFAULT (gen_random_uuid()),
  "deathwish_id" UUID NOT NULL REFERENCES deathwish_default,
  "name" TEXT NOT NULL,
  "kinship" kinship NOT NULL,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),

  PRIMARY KEY ("id")
);
