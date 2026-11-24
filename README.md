# blinko-tema

Tema "Raspberry Pi" para o [Blinko](https://github.com/blinkospace/blinko), como plugin — mesma paleta do
Cockpit, Duplicati, Pi Paste e Clipboard Bridge: vinho `#c51a4a` no claro, rosa `#ef7295` no escuro,
neutros grafite-vinho. Vale nos dois temas do Blinko (Preferências → tema claro/escuro/sistema).

| Modo | Fundo | Cards / barra lateral | Texto | Acento (texto sobre ele) |
|---|---|---|---|---|
| Escuro | `#191216` | `#261b21` | `#faf0f4` | rosa `#ef7295` (`#2b0713`) |
| Claro | `#faf5f6` | `#ffffff` | `#291c22` | vinho `#c51a4a` (`#fff`) |

## Instalar

No Blinko (como superadmin): **Configurações → Plugin → Install from GitHub** →
`https://github.com/rtavares-g/blinko-tema` → Install. Recarregue a página.

O repositório precisa ser **público**: o Blinko baixa o `release.zip` do último release sem login.

O tema ignora a "cor do tema" escolhida em Preferências (passa por cima com `!important`).
Para desligar: Plugin → Instalados → desativar ou desinstalar.

## Atualizar o tema

1. Edite `tema.css`.
2. Suba a versão em `plugin.json` (o Blinko só reinstala se a versão mudar).
3. `./empacotar.sh --publicar` — gera `release.zip` e cria o release `vX.Y.Z` no GitHub.
4. No Blinko: Plugin → Instalados → atualizar (ou desinstalar e instalar de novo).

## Como funciona

O Blinko carrega sozinho todo `.css` que estiver na pasta de um plugin e remove quando o plugin é
desativado; por isso o `index.js` é um módulo SystemJS vazio, sem build. O `tema.css` só redefine as
variáveis de cor em `html.dark` / `html.light`:

- `--background`, `--secondbackground`, `--primary`, `--card`, `--desc`… — do próprio Blinko;
- `--heroui-*` — dos componentes HeroUI (botões, menus, campos), no formato `matiz saturação% luz%`.

Nada do Blinko é copiado.
