INSERT INTO "prices" ("price", "display") VALUES (5000, '5000€');
INSERT INTO "prices" ("price", "display") VALUES (10000, '10000€');
INSERT INTO "prices" ("price", "display") VALUES (20000, '20000€');
INSERT INTO "prices" ("price", "display") VALUES (50000, '50000€');

INSERT INTO "deathwish_default" ("name") VALUES ('Buy a car');
INSERT INTO "deathwish_default" ("name") VALUES ('Pay for college');
INSERT INTO "deathwish_default" ("name") VALUES ('Trip to USA');

INSERT INTO "deathwish_custom" ("user_id", "deathwish_id", "price")
VALUES ('06477904-7969-4225-9d78-b06aeeb712f3', 'b0b20f52-03e8-495a-b7f1-1249efe5924b', 50000);
INSERT INTO "deathwish_custom" ("user_id", "name", "personal_note", "price")
VALUES ('aae0036d-c262-4620-82e5-20d627ff4f69', 'Anything', 'Buy anything with this money', 20000);
INSERT INTO "deathwish_custom" ("user_id", "deathwish_id", "personal_note", "price")
VALUES ('06477904-7969-4225-9d78-b06aeeb712f3', '61271f60-ce37-4f41-824d-39cedd5c748b', 'Please buy a japanese car', 10000);

INSERT INTO "benefactors" ("deathwish_id", "name", "kinship")
VALUES ('06b15bcb-2b10-4251-bad6-94c6d3885901', 'Miha Novak', 'CHILD');
INSERT INTO "benefactors" ("deathwish_id", "name", "kinship")
VALUES ('56c038ed-3912-4ffd-bb48-9426bdc3f107', 'Marko Mark', 'SIBLING');
INSERT INTO "benefactors" ("deathwish_id", "name", "kinship")
VALUES ('7848017c-e7de-4a1c-bd83-28c0bf74f551', 'Jana Novak', 'PARTNER');

INSERT INTO "questions" ("question") VALUES ('What is your full name?');
INSERT INTO "questions" ("question", "comment") VALUES ('What is your height?', 'Only number, in centimeters');
INSERT INTO "questions" ("question", "comment") VALUES ('What is your weight?', 'Only number, in kilograms');
INSERT INTO "questions" ("question", "comment") VALUES ('Did you smoke cigaretes in last year?', 'Yes or no');

INSERT INTO "answers" ("user_id", "question_id", "answer")
VALUES ('06477904-7969-4225-9d78-b06aeeb712f3', 'c73a0ea8-8d42-4e0e-8812-637801d0b727', 'Janez Novak');
INSERT INTO "answers" ("user_id", "question_id", "answer")
VALUES ('06477904-7969-4225-9d78-b06aeeb712f3', '1c20539f-aca0-4713-bede-31ed7b9faa60', '180');
INSERT INTO "answers" ("user_id", "question_id", "answer")
VALUES ('06477904-7969-4225-9d78-b06aeeb712f3', '7be44312-94ea-48e0-b889-451e2ed66e19', '90');
INSERT INTO "answers" ("user_id", "question_id", "answer")
VALUES ('06477904-7969-4225-9d78-b06aeeb712f3', '4a043a04-8a08-4252-9a6b-4b4f19add81e', 'Yes');

INSERT INTO "answers" ("user_id", "question_id", "answer")
VALUES ('aae0036d-c262-4620-82e5-20d627ff4f69', 'c73a0ea8-8d42-4e0e-8812-637801d0b727', 'Jan Novak');
INSERT INTO "answers" ("user_id", "question_id", "answer")
VALUES ('aae0036d-c262-4620-82e5-20d627ff4f69', '1c20539f-aca0-4713-bede-31ed7b9faa60', '193');
INSERT INTO "answers" ("user_id", "question_id", "answer")
VALUES ('aae0036d-c262-4620-82e5-20d627ff4f69', '7be44312-94ea-48e0-b889-451e2ed66e19', '79');
INSERT INTO "answers" ("user_id", "question_id", "answer")
VALUES ('aae0036d-c262-4620-82e5-20d627ff4f69', '4a043a04-8a08-4252-9a6b-4b4f19add81e', 'No');
