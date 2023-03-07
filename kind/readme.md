Docs https://kind.sigs.k8s.io/

```

kind create cluster --name clusterName --image kindest/node:v1.21.1 --config kind.yaml
add ingress NHINX 
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
```
