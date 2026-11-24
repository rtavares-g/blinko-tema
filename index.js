// Plugin do Blinko: só existe para o Blinko carregar o tema.css que vem junto no release.zip.
// O Blinko injeta sozinho todo .css da pasta do plugin (getPluginCssContents) e remove ao desativar;
// este módulo SystemJS não precisa fazer nada além de existir.
System.register([], function (exports) {
  return {
    execute: function () {
      exports('default', class BlinkoTema {
        constructor() {
          this.name = 'blinko-tema';
          this.version = '__VERSAO__';
          this.withSettingPanel = false;
        }
        init() {}
        destroy() {}
      });
    }
  };
});
