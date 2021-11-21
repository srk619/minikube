curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
sudo install minikube-darwin-amd64 /usr/local/bin/minikube

docker-env
# Configure environment to use minikube’s Docker daemon

# minikube with a single node

minikube start --driver=docker

minikube status
minikube profile list

kubectl cluster-info
kubectl get nodes

minikube delete

# minikube with a two nodes node

minikube start --driver=docker --nodes=2
minikube status
minikube profile list

kubectl get nodes

minikube delete

# add a node to the minikube cluster

minikube node add --worker
# -p to specify the cluster
minikube node add --control-plane


# set the config for defaults : driver cpus and memory
minikube config view
minikube config set driver docker
minikube config view

#  set two different clusters

minikube start --profile=cluster1

minikube start --profile=cluster2

minikube profile list
# select cluster
minikube profile cluster1
or
kubectl config get-clusters
kubectl config get-context
kubectl config set-context cluster1

# run a cluster with a specific version of kubernetes
# minikube get-k8s-versions  no longer a valid command
minikube start --kubernetes-version '1.14.0' --profile=cluster3

#logging into the node
minikube ssh -n cluster1 -p cluster3


# delete all clusters
minikube delete --all