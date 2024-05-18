pipeline {
    agent any

    environment {
        // Define environment variables
        DOCKER_IMAGE = 'nginx'
        DOCKER_TAG = 'latest'
        CONTAINER_NAME = 'nginx-container'
        PORT = '8082:80' // Change this if you want a different port mapping
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
                    // Navigate to the repository directory and build the Docker image
                    dir('class') {
                        sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container
                    sh "docker run -d --name ${CONTAINER_NAME} -p ${PORT} ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
    }
    
        post {
            always {
            // Clean up the workspace after the build
            cleanWs()
            }
        }    
}
