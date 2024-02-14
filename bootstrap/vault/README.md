The k8s cluster is secrets manager agnostic. The external secrets operator can pull secrets from a bunch of different sources. I use local vault running in a container here because its easy and free.

# To run
docker-compose up -d
