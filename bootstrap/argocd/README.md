This installation uses Github authentication.

Make sure there is a valid credential in the Vault secret in the path. You need to set this up in Github and copy a valid secretoken.

secret/data/prod/github/oauth
secret/data/prod/argo/server

The clientSecret should come from Github, the secretkey can be anything. Just type some gibberish.

vault kv put secret/prod/github/oauth clientSecret=<YOUR TOKEN>
vault kv put secret/prod/argo/server secretkey=jalkejtao3uoiajfela

you need to manually edit the generated secret or argo won't be able to read it

kubectl -n argocd edit secret github-oauth

apiVersion: v1
kind: Secret
metadata:
  name: github-oauth
  namespace: argocd
  labels:
    app.kubernetes.io/part-of: argocd
