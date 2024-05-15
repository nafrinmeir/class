pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                // Checkout repository
                git branch: 'main', url: 'https://github.com/nafrinmeir/class.git'
                
                // Build Docker image
                script {
                    docker.build('nginx', '.')
                }
            }
        }
    }
}
