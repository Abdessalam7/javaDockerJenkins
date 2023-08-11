node('AgentJava'){
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Abdessalam7/javaDockerJenkins']]])
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
    post {
        success {
            // This block will be executed if the pipeline is successful
            echo 'Build and test successful!'
        }

        failure {
            // This block will be executed if the pipeline fails
            echo 'Build or test failed!'
        }
    }
}
