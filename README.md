# Spring PetClinic Sample Application [![Build Status](https://github.com/rktsani/spring-petclinic-dso/actions/workflows/maven-build.yml/badge.svg)](https://github.com/rktsani/spring-petclinic-dso/actions/workflows/maven-build.yml)

### Building and running this project using Github Actions + Docker + JFrog Artifactory 

- Create a remote and virtual repository on JFrog to point to official Maven Central repository
- Configure Maven settings.xml repositories section to use the repository configured in previous step.
- Configure Git Actions workflow with the following steps
  - We use ubuntu-latest with Java 17 running on it for this build
  - Checkout the source code from the repo
  - Setup the JDK environment
  - Write maven settings file to disk.
  - Next, build the jar file and run tests using `./mvnw -B clean verify` command
  - Setup QEMU and buildx as we need these packages to make our docker container multi-platform compatible (ARM64 and AMD64)
  - Next setup JFrog CLI and configure it to use the correct platform url and access-key (stored in Github settings)
  - Authenticate with JFrog Docker repository using username and access token.
  - Use `jf docker build` command to build for multi-platform and push the docker image to the JFrog artifactory
  - We use the built-in github run-number as unique tag for our docker build
  - Next we publish build information to JFrog using CLI.
 
Next we are going to pull this image to a local machine and run.

1. Make sure you have docker installed.
2. Authenticare local docker client with JFrog artifactory
```
docker login -uUSERNAME xxxx.jfrog.io
```
3. Next, pull the docker container to local machine and provide the docker image name and build number
```
docker pull xxxx.jfrog.io/xxx-docker/example-image:6
```
4. Run the docker container and map the host port 8000 to docker port 8080
```
docker run -d --name my-dso-test2 -p 8000:8080 xxxx.jfrog.io/xxx-docker/example-image:6
```
5. Open localhost:8000 on host web browser to access the application
