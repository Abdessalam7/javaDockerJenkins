# docker-Java-example
# Use Docker to run Jenkins and create pipelines to build Java application

1- get image from dockerhub 
	-> docker search jenkins
	-> docker pull jenkins/jenkins:lts (latest support release)
	-> run the container based on that image: docker run -p 2119:8080 -p 5000:5000 --name jenkins-master jenkins/jenkins:lts
	-> add volume : docker run -p 2119:8080 -p 5000:5000 -v D://mylocalpath:/var/jenkins_home --name jenkins-master jenkins/jenkins:lts


2- for each build => create new container 
	-> make sure to Expose daemon on tcp://localhost:2375 without TLS
	this will allow you to talk to the Docker API, you can see the containers and so on
