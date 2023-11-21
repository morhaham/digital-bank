import postgres from "postgres";
import { config } from "./modules/config";

const sql = postgres({
  host: "localhost",
  port: 5432,
  username: config.POSTGRES_USERNAME,
  password: config.POSTGRES_PASSWORD,
  database: config.POSTGRES_DATABASE,
});

export default sql;
