pipeline {
    agent {label 'slave'}

    stages {
        stage('Build') {
                steps {
                    sh 'docker build -f dockerfile . -t engy/dajngo_dev:v1.0'
                      }
                   post{
                    success{
                         slackSend(color: '#00FF00',message: "BUILDSTART: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'(${env.BUILD_URL}console)")
                      }
                  }
            }
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId:"docker",usernameVariable:"USERNAME",passwordVariabel:"PASSWORD")]){
                sh 'docker login --username $USERNAME --password $PASSWORD'
                sh 'dock push engy/dajngo_dev:v1.0'
                }
            }
        }
         stage('Deploy') {
            steps {
                sh 'docker run -d -p 4000:3000 engy/dajngo_dev:v1.0'
            }  
    }
  }
}
