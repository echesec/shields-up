There is a chicken and egg problem with this kustomization. Kustomize does not let you specify the order that resources are deployed. So you may see Kustomize try and deploy the ClusterSecretStore in secretstore-vault.yaml before the CRD is created. If that happens, just run the kustomize command again.

kustomize build . --enable-helm | kubectl create -f-

You need to update the secret-store-vault.yaml file with your external Vault IP address and token.
