def dockerImage;

node('docker'){
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

                    // Assign the selected branch to a variable
                    env.SELECTED_BRANCH = selectedBranch
                }
            }
            stage('Checkout') {
                    // Clone the GitHub repository
                    script {
                        def projectUrl = 'https://github.com/Abdessalam7/javaDockerJenkins.git'
                        checkout([$class: 'GitSCM', branches: [[name: "refs/heads/${env.SELECTED_BRANCH}"]], userRemoteConfigs: [[url: projectUrl]]])
                    }
            }
            stage ('Build the Image'){
            dockerImage = docker.build('mohammedbenkahoul/agent-java:v' + env.BUILD_NUMBER, '.');
            }
            stage('Push the image'){
            //docker.withRegistry('', ) => dockerhub
            docker.withRegistry('', 'dockerhubcreds'){
                dockerImage.push();
            }
            }
}