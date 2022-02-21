FROM tomcat:8-jdk8-openjdk
ADD target/*.war /usr/local/tomcat/webapps/
CMD ["catalina.sh","run"]
