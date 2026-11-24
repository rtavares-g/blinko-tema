#!/bin/sh
# Gera release.zip (index.js + tema.css + plugin.json) com a versão do plugin.json.
#   ./empacotar.sh             só gera o zip
#   ./empacotar.sh --publicar  gera e publica o release vX.Y.Z no GitHub (gh)
# O Blinko instala de https://github.com/<dono>/<repo>/releases/download/v<versão>/release.zip,
# pegando a versão do último release — então cada mudança no tema precisa de versão nova.
set -e
cd "$(dirname "$0")"
V=$(python3 -c 'import json;print(json.load(open("plugin.json"))["version"])')
T=$(mktemp -d)
sed "s/__VERSAO__/$V/" index.js > "$T/index.js"
cp tema.css plugin.json "$T/"
rm -f release.zip
python3 - "$T" <<'EOF'
import sys, zipfile, os
d = sys.argv[1]
with zipfile.ZipFile('release.zip', 'w', zipfile.ZIP_DEFLATED) as z:
    for f in ('index.js', 'tema.css', 'plugin.json'):
        z.write(os.path.join(d, f), f)
EOF
rm -rf "$T"
echo "release.zip v$V"
if [ "$1" = --publicar ]; then
  gh release create "v$V" release.zip --title "v$V" --notes "Tema Raspberry Pi para o Blinko, v$V"
fi
