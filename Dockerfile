FROM centos:8
LABEL description="creating custom httpd image"
MAINTAINER "Sachin Kumar <sachin@networknuts.net>
RUN yum install httpd -y && yum clean all
EXPOSE 80
COPY index.html /var/www/html/index.html
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

