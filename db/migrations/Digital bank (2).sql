CREATE TABLE "Users" (
  "id" SERIAL PRIMARY KEY,
  "first_name" varchar(50) NOT NULL,
  "last_name" varchar(50) NOT NULL,
  "email" varchar(100) NOT NULL,
  "birth_date" date NOT NULL,
  "phone_number" varchar(50) NOT NULL,
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "Accounts" (
  "number" varchar(25) PRIMARY KEY,
  "balance" bigint DEFAULT 0,
  "is_active" boolean DEFAULT TRUE,
  "created_at" timestamptz DEFAULT (now()),
  "user_id" serial NOT NULL
);

CREATE TABLE "Deposits" (
  "id" SERIAL PRIMARY KEY,
  "account_number" varchar(25) NOT NULL,
  "sum" decimal NOT NULL,
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "Withdrawal" (
  "id" SERIAL PRIMARY KEY,
  "account_number" varchar(25) NOT NULL,
  "sum" decimal NOT NULL,
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "Transfers" (
  "confirmation_id" varchar(50) PRIMARY KEY,
  "from_account" varchar(25) NOT NULL,
  "to_account" varchar(25) NOT NULL,
  "sum" decimal,
  "created_at" timestamptz DEFAULT (now())
);

CREATE INDEX ON "Deposits" ("account_number");

CREATE INDEX ON "Withdrawal" ("account_number");

CREATE INDEX ON "Transfers" ("from_account", "to_account");

CREATE INDEX ON "Transfers" ("to_account");

ALTER TABLE "Accounts" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("id");

ALTER TABLE "Deposits" ADD FOREIGN KEY ("account_number") REFERENCES "Accounts" ("number");

ALTER TABLE "Withdrawal" ADD FOREIGN KEY ("account_number") REFERENCES "Accounts" ("number");

ALTER TABLE "Transfers" ADD FOREIGN KEY ("from_account") REFERENCES "Accounts" ("number");

ALTER TABLE "Transfers" ADD FOREIGN KEY ("to_account") REFERENCES "Accounts" ("number");
