#! /bin/sh

source /secrets.env

set -e

export VAULT_ADDR=http://vault:8200

# give some time for Vault to start and be ready
sleep 10

# login with root token at $VAULT_ADDR
vault login root

vault kv put secret/oauth/github dex.github.clientSecret=$OAUTH_GITHUB_ARGOCD
vault kv put secret/apikey/cloudflare api-token=$CLOUDFLARE_API_KEY
vault kv put secret/apikey/argocd server-key=jwlkdjalkjfealkjlkajcle