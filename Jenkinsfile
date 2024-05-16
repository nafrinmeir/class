pipeline {
    agent any

    environment {
        // Define environment variables
        DOCKER_IMAGE = 'my-nginx-image'
        DOCKER_REPO = 'your-dockerhub-username/my-nginx-image'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository containing the Dockerfile and static content
                git 'https://github.com/nafrinmeir/class.git'
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

        stage('Test Docker Image') {
            steps {
                script {
                    // Run the Docker container to test if it builds successfully
                    sh 'docker run --rm -d -p 8082:80 ${DOCKER_IMAGE}:${DOCKER_TAG}'
                    // Add any additional tests as necessary
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub
                    withCredentials([string(credentialsId: 'docker-hub-password', variable: 'DOCKER_HUB_PASSWORD')]) {
                        sh 'echo $DOCKER_HUB_PASSWORD | docker login -u your-dockerhub-username --password-stdin'
                    }

                    // Tag and push the Docker image to Docker Hub
                    sh 'docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_REPO}:${DOCKER_TAG}'
                    sh 'docker push ${DOCKER_REPO}:${DOCKER_TAG}'
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    // Clean up the local Docker environment
                    sh 'docker rmi ${DOCKER_IMAGE}:${DOCKER_TAG}'
                    sh 'docker rmi ${DOCKER_REPO}:${DOCKER_TAG}'
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
