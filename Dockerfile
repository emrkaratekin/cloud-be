# Step 1: Use Maven to build the application
FROM maven:3.8.6-openjdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean install -DskipTests

# Step 2: Use OpenJDK runtime to run the built JAR
FROM openjdk:11-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
