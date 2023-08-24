node('agent-java'){
    stages {
        stage('Checkout') {
                    steps {
                        // Clone the GitHub repository
                        sh 'git clone https://github.com/Abdessalam7/javaDockerJenkins.git'
                    }
                }
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                // Run tests using Maven
                sh 'mvn test'
            }
        }
    }
}
