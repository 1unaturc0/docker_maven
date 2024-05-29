FROM maven:3.8.1-openjdk-17-slim as build
WORKDIR /usr/src/app
COPY . .
RUN mvn clean package
FROM openjdk:17-jdk-slim
WORKDIR /usr/src/app
COPY target/classes/com/example/docker_maven/DockerMavenApplication.class .
COPY --from=build /usr/src/app/target/main-1.0-SNAPSHOT.jar ./app.jar
CMD ["java", "-jar", "app.jar"]