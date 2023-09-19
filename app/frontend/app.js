import { createApp, h } from "vue";
import { createInertiaApp, Head, Link } from "@inertiajs/vue3";
import { vuetifyPlugin } from "./vuetify";
import { resolvePage } from "./pages";

export default function () {
  createInertiaApp({
    resolve: resolvePage,
    progress: {
      // The delay after which the progress bar will appear, in milliseconds...
      delay: 50,

      // The color of the progress bar...
    //   color: "#c62828",

      // Whether to include the default NProgress styles...
      includeCSS: true,

      // Whether the NProgress spinner will be shown...
      showSpinner: true,
    },
    setup({ el, App, props, plugin }) {
      const app = createApp({ render: () => h(App, props) });
      app.use(plugin);
      app.use(vuetifyPlugin);

      app.component("iHead", Head);
      app.component("iLink", Link);

      app.mount(el);
    },
  });
}
