# FROM nginx
# COPY index.html /usr/share/nginx/html/
# WORKDIR /usr/share/nginx/html

FROM nginx:1.19
## Copy our nginx config
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/* && chmod -R 777 /var/log/nginx /var/cache/nginx/ && chmod -R 777 /etc/nginx/* && chmod -R 777 /var/run/ && chmod -R 777 /usr/share/nginx/

# comment user directive as master process is run as user in OpenShift anyhow
RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf

## copy over the artifacts in dist folder to default nginx public folder
COPY index.html /usr/share/nginx/html/
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]