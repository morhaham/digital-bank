-- migrate:up
CREATE TABLE "Users" (
  "id" varchar(25) PRIMARY KEY,
  "first_name" varchar(100) NOT NULL,
  "last_name" varchar(100) NOT NULL,
  "email" varchar(255) NOT NULL,
  "birth_date" date NOT NULL,
  "phone_number" varchar(50) NOT NULL,
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "Accounts" (
  "number" varchar(25) PRIMARY KEY,
  "balance" bigint DEFAULT 0,
  "is_active" boolean DEFAULT TRUE,
  "created_at" timestamptz DEFAULT (now()),
  "user_id" varchar(25) NOT NULL
);

CREATE TABLE "Transfers" (
  "confirmation_id" varchar(50) PRIMARY KEY,
  "from_account" varchar(25) NOT NULL,
  "to_account" varchar(25) NOT NULL,
  "sum" decimal,
  "created_at" timestamptz DEFAULT (now())
);

CREATE INDEX ON "Transfers" ("from_account", "to_account");

CREATE INDEX ON "Transfers" ("to_account");

ALTER TABLE "Accounts" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "Transfers" ADD FOREIGN KEY ("from_account") REFERENCES "Accounts" ("number");

ALTER TABLE "Transfers" ADD FOREIGN KEY ("to_account") REFERENCES "Accounts" ("number");



-- migrate:down

DROP TABLE "Transfers";
DROP TABLE "Accounts";
DROP TABLE "Users";

