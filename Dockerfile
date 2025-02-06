
FROM openjdk:11
WORKDIR /app
COPY target/post-sharing-be-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
