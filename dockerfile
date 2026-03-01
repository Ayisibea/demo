# Use the official Eclipse Temurin image for Java 17 on Alpine Linux
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Build the project (using Maven wrapper if available)
RUN ./mvnw clean package -DskipTests || mvn clean package -DskipTests

# Run the jar (using a wildcard to match the built JAR)
CMD ["java", "-jar", "target/*.jar"]
