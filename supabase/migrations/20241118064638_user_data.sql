CREATE TABLE "user_data" (
  "id" UUID UNIQUE NOT NULL REFERENCES auth.users ON DELETE CASCADE,
  "name" TEXT,
  "profile_picture_url" TEXT,
  "status" user_status NOT NULL DEFAULT('NOT_SUBMITTED'),
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),

  PRIMARY KEY ("id")
);
