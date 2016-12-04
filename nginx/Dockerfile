FROM nginx

RUN rm /etc/nginx/conf.d/default.conf
ADD ./jenkins.conf /etc/nginx/conf.d/jenkins.conf

# Document that the service listens on port 80
EXPOSE 80
