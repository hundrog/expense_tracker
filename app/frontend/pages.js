// NOTE: Optimize the SSR bundle by not splitting by page.
import Layout from "./Layouts/default.vue";
const pages = import.meta.env.SSR
  ? import.meta.globEagerDefault("./Pages/**/*.vue", { eager: true })
  : import.meta.glob("./Pages/**/*.vue", { eager: true });

export async function resolvePage(name) {
  const page = pages[`./Pages/${name}.vue`];

  if (!page) {
    throw new Error(
      `Unknown page ${name}. Is it located under Pages with a .vue extension?`
    );
  }

  page.default.layout = page.default.layout || Layout;
  return import.meta.env.SSR ? page : (await page).default;
}
