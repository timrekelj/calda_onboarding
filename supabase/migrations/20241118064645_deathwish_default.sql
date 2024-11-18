CREATE TABLE "deathwish_default" (
  "id" UUID UNIQUE NOT NULL DEFAULT (gen_random_uuid()),
  "name" TEXT NOT NULL,
  "price" INT4 NOT NULL,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),

  PRIMARY KEY ("id")
);
