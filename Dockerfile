# Use the official Jenkins LTS image as the base
FROM jenkins/jenkins:lts

# Switch to the root user to install packages
USER root

# Install Maven
RUN apt-get update && apt-get install -y maven

# Switch back to the Jenkins user
USER jenkins