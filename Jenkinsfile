pipeline{
   
        agent any
        tools{
            maven 'maven 3.8.2'
            jdk 'JDK 1.8'
        }
        
        stages{
            stage('Build Maven'){
                steps{
                    checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'b99ebde0-6b1f-45c0-86c3-f668f74f7bb9', url: 'https://github.com/hafzah/maven-web-project.git']]])
                    bat 'mvn -f pom.xml clean install test'
                }
            }
            
            //assuming startup.bat is running
            stage('Deploy To Tomcat'){
                steps{
                    script{ 
                       deploy adapters: [tomcat9(credentialsId: 'f7add778-3ac8-40fb-a07a-bc52030d335d', path: '', url: 'http://localhost:8090')], contextPath: 'jenkins-docker', onFailure: false, war: '**/*.war'       
                    }
                }
            }
     
            stage('Build Docker Image'){
                steps{
                    script{
                        bat 'docker build -t haffydockerid/maven-web-project -f Dockerfile .'
                       
                    }
                }
            }
            
            stage('Login & Push Image to Docker Hub'){
                steps{
                    script{
                        //docker login
                        // wanted to use withCredentials with access token - secret text but not working
                        //this method below is not so advisable.
                        withDockerRegistry(credentialsId: 'credentials') {
                            //push image into repo
                            bat 'docker push haffydockerid/maven-web-project'
                    }
                }
            }       
           
        }
        stage('Deploy to Kubernetes'){
           steps{
              script{
                     echo 'deploy later'
              }

           }
        }
           
    
   }
}
