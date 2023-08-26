node('agent-java'){
            stage('Fetch Branches'){
                script {
                    def projectUrl = 'https://github.com/Abdessalam7/javaDockerJenkins.git'

                    // Fetch branch names from GitHub using Git command
                    def branches = sh(script: "git ls-remote --heads ${projectUrl} | cut -f2 | sed 's|refs/heads/||'", returnStdout: true).trim().split('\n')

                    // Trim the branch names and create formatted choices
                    def branchChoices = branches.collect { choice(name: it, value: it) }
                    def formattedBranchNames = branches.collect { it.replaceAll('.*/', '') }

                    // Display branch selection input to the user
                    def selectedBranch = input(
                        id: 'branchInput',
                        message: 'Select the branch to build:',
                        parameters: [choice(choices: formattedBranchNames, description: 'Branch to build', name: 'BRANCH')]
                    )

                      echo "Selected branch: $selectedBranch"
                }
            }
            stage('Checkout') {
                    // Clone the GitHub repository
                    script {
                        def projectUrl = 'https://github.com/Abdessalam7/javaDockerJenkins.git'
                        checkout([$class: 'GitSCM', branches: [[name: "refs/heads/$BRANCH"]], userRemoteConfigs: [[url: projectUrl]]])
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
           }
}