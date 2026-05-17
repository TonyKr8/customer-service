FROM nginx:alpine

# העתקת קוד האתר
COPY index.html /usr/share/nginx/html/

# פקודת קסם המשנה את הגדרות Nginx מפורט 80 לפורט 8080
RUN sed -i 's/listen[[:space:]]*80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# התאמת הרשאות לכל התיקיות ש-Nginx צריך לכתוב אליהן בזמן ריצה
RUN chmod -R 777 /var/cache/nginx /var/run /var/log/nginx /etc/nginx/conf.d

# חשיפת פורט 8080 (מתאים לחוקי האבטחה של OpenShift)
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]