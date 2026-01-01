import dhivehi from "dhivehi";

type ThaanaProps = Parameters<typeof dhivehi>[1];

// Vue 3 plugin (compatible with Vue 2)
const plugin = {
  install(app: any, options: ThaanaProps = { flavor: "phonetic" }) {
    // Vue 3 uses 'mounted', Vue 2 uses 'inserted'
    const hook = app.version?.startsWith("3") ? "mounted" : "inserted";

    app.directive("thaana", {
      [hook](el: HTMLElement) {
        dhivehi(el as HTMLInputElement, options);
      },
    });
  },
};

export default plugin;
