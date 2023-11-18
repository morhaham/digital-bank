# Digital Bank

## Functional Requirements

1. Currently a user associates with exactly one account.
2. Users can use the account management app securly.
3. Users can transfer money from their account to other accounts through the web app.
4. Currently the bank supports only one currency and it is USD.
5. The bank manager can log in to the admin panel the view transactions filtered by account and date.
6. The bank grows rapidly and has to support approx 1M accounts.

## Technical Requirements

- 2FA login with email/phone OTP and account number. User session is managed with JWT stored in an HTTP only cookie. The website traffic is TLS encrypted.
- ACID transactions for realible money transfer using PostgreSQL.
- Multi region data centers and API servers (hight availability and reduced latency coast to coast)
- Scales up to 1M transactions per seconds - containarized servers on VMs using cloud provider for auto scaling.

## Prerequisites

- docker client `^20.10.22`

## Installation

1. `pnpm install`
2. `pnpm services:up`
3. `pnpm db:migrate-up`

## Database guide

- Use the follwing commands to trace the current running database:
  - `docker exec -it simple-bank-db-1 bash` (replace `simple-bank-db-1` with the conatiner name)
  - `cc9fed6203e8:/# psql -U postgres` - connects to the postgres server
  - `postgres=# \l` - list all the databases
  - `\postgres=# \c digital_bank` - switch to the desired database
  - `digital_bank=# \dt` - list tables
- Now you can run queries for example:
  `SELECT * FROM "Accounts" LIMIT 10;`

```
 number | balance | is_active | created_at | user_id
--------+---------+-----------+------------+---------
(0 rows)
```
