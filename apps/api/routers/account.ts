import { publicProcedure, router } from "../trpc";

export const accountRouter = router({
  list: publicProcedure.query(() => {
    return [1, 2, 3];
  }),
});
