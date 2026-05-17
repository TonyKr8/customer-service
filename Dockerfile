FROM nginx:alpine
COPY index.html /usr/share/nginx/html/
RUN chmod -R 777 /var/cache/nginx /var/run /var/log/nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]