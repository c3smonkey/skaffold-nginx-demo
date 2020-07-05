# Start Minikube
```
minikube start
```

# Deploy Application
```
skaffold run
```

# Test Application
```
minikube service hello-world 
```



# OpenShift
```
skaffold run -f skaffold-dev.yaml -p monkey
```

Check WebSite : http://nginx-skaffold-dev.apps.c3smonkey.ch


## Development Mode
```
skaffold dev -f skaffold-dev.yaml -p monkey
```
