#FROM tomcat:8-jdk11-openjdk
#ADD target/*.war /usr/local/tomcat/webapps/
FROM tomcat:8
ADD maven-web-project.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]
#CMD ["catalina.sh","run"]
