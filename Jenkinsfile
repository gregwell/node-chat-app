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
        slackSend (color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        sh "npm install"
      }
    }

    stage('Test') {
      steps {
        slackSend (color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        sh 'npm test'
      }
    }
  }
    post {
    
    	always {
    	    echo 'Finished!'
    	}
    	
    	success {
            slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            echo 'Success!'
    	}
    	
        failure {
            echo 'Failure!'
            slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
    }
}