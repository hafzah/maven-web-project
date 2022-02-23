#FROM tomcat:8-jdk11-openjdk
#ADD target/*.war /usr/local/tomcat/webapps/
FROM tomcat:8
ADD target/*.war /usr/local/tomcat/webapps/

CMD ["startup.bat", "run"]
#CMD ["catalina.sh","run"]
