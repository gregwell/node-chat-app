pipeline {

  agent {
    docker {
      image 'node:latest' 
      args '-p 3000:3000' 
    }
  }
  
  environment {
    CI = 'true' 
  }

  stages {
    stage('Build') {
      steps {
        sh "npm install"
      }
      post {
        success {
          echo 'Build success!'
          slackSend (color: '#00FF00', message: "SUCCESSFUL BUILD: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
        failure {
          echo 'Build failure!'
          slackSend (color: '#FF0000', message: "BUILD FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
      } 
    }

    stage('Test') {
      steps {
        sh 'npm test'
      }  
      post {
        success {
          echo 'Tests passed!'
          slackSend (color: '#00FF00', message: "TESTS SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
        failure {
          echo 'Tests failure!'
          slackSend (color: '#FF0000', message: "TESTS FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
      }
    }
  }
}