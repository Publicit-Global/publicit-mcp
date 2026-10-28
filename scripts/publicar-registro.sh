#!/usr/bin/env bash
# Publica el MCP de Publicit en el registro oficial de MCP. Lo ejecuta Joan, en su Mac.
#
#   bash scripts/publicar-registro.sh txt       → muestra el registro TXT que hay que poner en el DNS
#   bash scripts/publicar-registro.sh comprobar → mira si el TXT ya se ve
#   bash scripts/publicar-registro.sh publicar  → guarda la clave como secreto del repo y lanza la publicación
#
# La clave privada Ed25519 está en ~/.config/publicit/mcp-registry-ed25519.pem (solo en
# ese Mac, permisos 600). Nunca se sube a este repo: el script la pasa directamente a
# los secretos de GitHub Actions.
set -euo pipefail

KEY="${MCP_REGISTRY_KEY:-$HOME/.config/publicit/mcp-registry-ed25519.pem}"
REPO="Publicit-Global/publicit-mcp"
OPENSSL="$(command -v /opt/homebrew/opt/openssl@3/bin/openssl || command -v /usr/local/opt/openssl@3/bin/openssl || command -v openssl)"

[ -f "$KEY" ] || { echo "No encuentro la clave en $KEY"; exit 1; }
public_key() { "$OPENSSL" pkey -in "$KEY" -pubout -outform DER | tail -c 32 | base64; }
expected() { echo "v=MCPv1; k=ed25519; p=$(public_key)"; }

case "${1:-}" in
  txt)
    echo "Tipo: TXT    Nombre: @ (publicit.com, el dominio raíz)    TTL: automático"
    echo "Valor: $(expected)"
    ;;
  comprobar)
    if dig TXT publicit.com +short | tr -d '"' | grep -qF "$(expected)"; then
      echo "✓ El TXT ya está publicado."
    else
      echo "✗ Aún no se ve. Lo que hay ahora en publicit.com:"; dig TXT publicit.com +short
      exit 1
    fi
    ;;
  publicar)
    "$0" comprobar
    "$OPENSSL" pkey -in "$KEY" -noout -text | grep -A3 "priv:" | tail -n +2 | tr -d ' :\n' \
      | gh secret set MCP_PRIVATE_KEY --repo "$REPO"
    gh workflow run publish-registry.yml --repo "$REPO"
    echo "Lanzado. Sigue el progreso con: gh run watch --repo $REPO \$(gh run list --repo $REPO -w publish-registry.yml -L1 --json databaseId -q '.[0].databaseId')"
    ;;
  *)
    sed -n '2,10p' "$0"; exit 1
    ;;
esac
