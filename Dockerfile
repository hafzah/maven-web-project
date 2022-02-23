#FROM tomcat:8-jdk11-openjdk
#ADD target/*.war /usr/local/tomcat/webapps/
FROM tomcat:8
ADD C:/Windows/System32/config/systemprofile/AppData/Local/Jenkins/.jenkins/workspace/Jenkins-Maven-Web-Project/target/*.war /usr/local/tomcat/webapps/

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
#CMD ["catalina.sh","run"]
