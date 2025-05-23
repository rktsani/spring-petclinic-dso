# Using a JDK image that supports multiple platform (arm64, amd64)
FROM openjdk:17-jdk-slim
# Name of the application archive 
ENV JAR_FILE spring-petclinic-3.4.0-SNAPSHOT.jar

WORKDIR /app

COPY target/${JAR_FILE} /app/

# Command to run the Spring Boot app
CMD java -jar ${JAR_FILE} 
