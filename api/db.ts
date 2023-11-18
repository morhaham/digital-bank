// db.js
import postgres from "postgres";

const sql = postgres({
  /* options */
  host: "localhost",
  port: 5432,
  username: "postgres",
  password: "secret",
  database: "digital_bank",
}); // will use psql environment variables

export default sql;
