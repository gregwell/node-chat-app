pipeline {

    agent any
	tools{nodejs "NodeJS"}
    stages {
        
        stage('Test') {
            steps {
                echo 'Testing...'
		        sh 'npm install'
                sh 'npm run test'
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