import { createHTTPServer } from "@trpc/server/adapters/standalone";
import { router } from "./trpc";
import { accountRouter } from "./routers/account";
import { config } from "./modules/config";

const appRouter = router({
  account: accountRouter,
});

const server = createHTTPServer({
  router: appRouter,
});

listen();

function listen() {
  try {
    const PORT = Number(config.APP_PORT) ?? 3004;
    server.listen(PORT);
    console.log(`listening to http://localhost:${PORT}`);
    console.log("config: ", config);
  } catch (e) {
    console.log(e);
  }
}

export type AppRouter = typeof appRouter;
