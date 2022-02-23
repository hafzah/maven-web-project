#FROM tomcat:8-jdk11-openjdk
#ADD target/*.war /usr/local/tomcat/webapps/
FROM tomcat:8
ADD target/*.war C:/Windows/System32/config/systemprofile/AppData/Local/Jenkins/.jenkins/workspace/Jenkins-Maven-Web-Project

CMD ["catalina.sh", "run"]
#CMD ["catalina.sh","run"]
