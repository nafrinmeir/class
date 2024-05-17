pipeline {
    agent any

    environment {
        // Define environment variables
        DOCKER_IMAGE = 'nginx'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    // Clone the public repository
                    sh 'git clone https://github.com/nafrinmeir/class.git'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    // Clean up the local Docker environment
                    // sh 'docker rmi ${DOCKER_IMAGE}:${DOCKER_TAG}'
                    echo Cleanup
                }
            }
        }
    }

    post {
        always {
            // Clean up the workspace after the build
            // cleanWs()
            echo always
        }
    }
}
