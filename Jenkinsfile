node('agent-java'){
            stage('Checkout') {
                    // Clone the GitHub repository
                    script {
                        def repoUrl = 'https://github.com/Abdessalam7/javaDockerJenkins.git'
                        checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: repoUrl]]])
                    }
            }

            stage('Build') {
                    // Run Maven to build the project
                    sh 'mvn clean package'
            }

            stage('Test') {
                    // Run tests using Maven
                    sh 'mvn test'
            }
}
