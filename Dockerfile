FROM maven:latest AS build
WORKDIR /usr/src/app
COPY . .
RUN mvn clean package
FROM openjdk:21-slim
WORKDIR /usr/src/app
COPY target/classes/com/example/docker_maven/DockerMavenApplication.class .
COPY --from=build /usr/src/app/target/docker_maven-0.0.1-SNAPSHOT.jar ./app.jar
CMD ["java", "-jar", "app.jar"]
