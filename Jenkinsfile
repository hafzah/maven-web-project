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
           
           stage('Test'){
              steps{
                 script{
                    bat 'mvn -f pom.xml test'  
                 }
                
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
                        bat 'docker build -t haffydockerid/tomcat-project -f Dockerfile .'
                       
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
                            bat 'docker push haffydockerid/tomcat-project'
                    }
                }
            }       
           
        }
        stage('Docker Deploy'){
           steps{
              script{
                     echo 'deploy later'
              }

           }
        }
           
           
           
    
   }
   
   
    post {
        failure {
    // One or more steps need to be included within each condition's block.
           emailext attachLog: true, body: 'this is an error build failure event by jenkins', subject: 'This is the Failure build email', to: 'schoolpurpoze@gmail.com'
        }
    }
}
