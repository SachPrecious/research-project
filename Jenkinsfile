pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Checkout the code from the version control system
                checkout scm
                
                // Build your project (replace this with your actual build commands)
                sh 'mvn clean install'
            }
        }

        stage('Deploy') {
            steps {
                // Deploy your application (replace this with your actual deployment commands)
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        success {
            // This block will be executed if the pipeline is successful
            echo 'Pipeline successfully completed. Trigger further actions if needed.'
        }

        failure {
            // This block will be executed if the pipeline fails
            echo 'Pipeline failed. Notify or take corrective actions if needed.'
        }
    }
}
