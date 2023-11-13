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
                    sh 'docker build -t ahmed_img .'
                }
            }
        }
    }
}
