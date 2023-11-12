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
             withMaven(maven: 'mvn') {
                    withSonarQubeEnv('sonarqube') {
                        sh 'mvn sonar:sonar'
                    }
                }
            }
        }
    }
}
