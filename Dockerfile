# using base image https://hub.docker.com/layers/library/openjdk/17-jdk-alpine/
FROM arm64v8/openjdk:17

ENV JAR_FILE spring-petclinic-3.4.0-SNAPSHOT.jar

WORKDIR /app

COPY target/${JAR_FILE} /app/

# Command to run the Spring Boot app
CMD java -jar ${JAR_FILE} 
