CREATE TABLE "answers" (
  "user_id" UUID NOT NULL REFERENCES user_data ON DELETE CASCADE,
  "question_id" UUID NOT NULL REFERENCES questions ON DELETE CASCADE,
  "answer" TEXT NOT NULL,
  "created_at" TIMESTAMPTZ DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ DEFAULT NOW(),

  PRIMARY KEY ("user_id", "question_id")
);
