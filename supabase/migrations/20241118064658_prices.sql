CREATE TABLE "prices" (
  "id" UUID UNIQUE NOT NULL DEFAULT (gen_random_uuid()),
  "price" INT4 NOT NULL,
  "display" TEXT NOT NULL,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),

  PRIMARY KEY ("id")
);
