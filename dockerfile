# Use Java 21
FROM eclipse-temurin:21-jdk-alpine

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Make the Maven wrapper executable
RUN chmod +x ./mvnw

# Build the project (using Maven wrapper)
RUN ./mvnw clean package -DskipTests

# Run the jar with the exact filename from your pom.xml
CMD ["java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]
