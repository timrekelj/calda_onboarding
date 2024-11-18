CREATE TABLE "questions" (
  "id" UUID UNIQUE NOT NULL DEFAULT (gen_random_uuid()),
  "question" TEXT NOT NULL,
  "comment" TEXT,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),

  PRIMARY KEY ("id")
);
