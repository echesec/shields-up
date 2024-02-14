case $1 in
install|i)
    cd external-secrets-operator
    kustomize build . --enable-helm | kubectl create -f-
    sleep 5
    # This is due to a deployment bug where there is a resource ordering problem in Kustomize.
    # running this twice fixes it.
    kustomize build . --enable-helm | kubectl create -f-
    cd ..

    cd argocd
    kustomize build . --enable-helm | kubectl create -f-
    sleep 40
    # This is due to a deployment bug where there is a resource ordering problem in Kustomize.
    # running this twice fixes it.
    kustomize build . --enable-helm | kubectl create -f-
    cd ..
    ;;
delete|d)
    cd external-secrets-operator
    kustomize build . --enable-helm | kubectl delete -f-
    cd ..

    cd argocd
    kustomize build . | kubectl delete -f-
    cd ..
    ;;
esac