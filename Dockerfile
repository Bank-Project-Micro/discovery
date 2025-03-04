
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:21-jdk-slim
WORKDIR /app
COPY --from=build /app/target/discovery-service.jar app.jar
EXPOSE 8761
ENTRYPOINT ["java", "-jar", "app.jar"]
