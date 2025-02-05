# Step 1: Build the Java application using Maven
FROM maven:3.8.6-openjdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean install -DskipTests

# Step 2: Create a lightweight Java runtime container
FROM openjdk:11-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
