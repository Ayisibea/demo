# Use Java 21 instead of Java 17
FROM eclipse-temurin:21-jdk-alpine

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Make the Maven wrapper executable
RUN chmod +x ./mvnw

# Build the project (using Maven wrapper)
RUN ./mvnw clean package -DskipTests

# Run the jar (using a wildcard to match the built JAR)
CMD ["java", "-jar", "target/*.jar"]
