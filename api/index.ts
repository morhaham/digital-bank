import { createHTTPServer } from "@trpc/server/adapters/standalone";
import { router } from "./trpc";
import { accountRouter } from "./routers/account";

const appRouter = router({
  account: accountRouter,
});

export type AppRouter = typeof appRouter;

const server = createHTTPServer({
  router: appRouter,
});

server.listen(3004);
