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
skaffold dev -f skaffold-dev.yaml -p monkey
```



 worker_processes auto;
    error_log /var/opt/rh/rh-nginx116/log/nginx/error.log;
    pid /var/opt/rh/rh-nginx116/run/nginx/nginx.pid;

    # Load dynamic modules. See /opt/rh/rh-nginx116/root/usr/share/doc/README.dynamic.
    include /opt/rh/rh-nginx116/root/usr/share/nginx/modules/*.conf;

    events {
        worker_connections  1024;
    }

    http {
        log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                          '$status $body_bytes_sent "$http_referer" '
                          '"$http_user_agent" "$http_x_forwarded_for"';

        access_log  /var/opt/rh/rh-nginx116/log/nginx/access.log  main;

        sendfile        on;
        tcp_nopush      on;
        tcp_nodelay     on;
        keepalive_timeout  65;
        types_hash_max_size 2048;

        include       /etc/opt/rh/rh-nginx116/nginx/mime.types;
        default_type  application/octet-stream;

        server {
            listen       8080 default_server;
            listen       [::]:8080 default_server;
            server_name  _;
            root         /opt/app-root/src;

            location / {
               try_files $uri /webforms/index.html =404;
            }
        }
    }