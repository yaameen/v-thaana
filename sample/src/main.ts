import { createApp } from "vue";
import "./style.css";
import App from "./App.vue";
import vThaana from "../../src/index.ts";

const app = createApp(App);
app.use(vThaana);
app.mount("#app");
