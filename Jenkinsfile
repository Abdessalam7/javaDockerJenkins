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
           stage('Test Coverage') {
                   script {
                       // Run tests with coverage analysis
                       sh 'mvn jacoco:prepare-agent test jacoco:report'
                   }

                   post {
                       always {
                           // Archive the generated coverage reports
                           archiveArtifacts artifacts: '**/target/site/jacoco/index.html', allowEmptyArchive: true
                       }
                   }
           }
}
