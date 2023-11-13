pipeline {
    agent any

      stages {
         stage("Git") {
      
             steps{ 
              sh 'git checkout main'
              sh 'git pull origin main'      
            }
          }

  stage("MVN Clean") {
      
             steps{
             sh 'mvn clean'

            }
        }


 stage("Testing Stage") {
            steps {
                    sh "mvn test"
            }
        }

           stage('SonarQube Stage') {
            steps {
             withSonarQubeEnv(installationName: 'sonarqube') {
      sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
    }
            }
        }

          stage("Building Stage") {
            steps {
                    sh "mvn package"
            }
        }
          
           stage("Nexus Stage") {
            steps {
                sh 'mvn deploy -DskipTests'
            }
        }
          
        stage('Docker Build Stage') {
            steps {
                script { 
                    sh 'docker build -t ahmedmissaoui/ahmed_img .'
                }
            }
        }
              stage('Push Image To Hub') {
            steps {
                script { 
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                     sh 'docker login -u ahmed026 -p ${dockerhubpwd}'
}
                    sh 'docker push ahmedmissaoui/ahmed_img '
                }
            }
        }
    }
}
