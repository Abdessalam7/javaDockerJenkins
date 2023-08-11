# Use a base image with Java and Maven installed
FROM maven:3.8.1-openjdk-11

# Set working directory
WORKDIR /app

# Copy your application code into the container
COPY . /app

# Build the application
RUN mvn clean package

# Command to run the application
CMD ["java", "-jar", "javaDockerJenkins-1.0-SNAPSHOT.jar"]