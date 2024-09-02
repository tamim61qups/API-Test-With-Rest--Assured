# Use an official OpenJDK 21 slim image as the base
FROM openjdk:21-slim

# Install Maven
RUN apt-get update && \
    apt-get install -y maven && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Copy the pom.xml file and download dependencies
COPY pom.xml .

# Download dependencies
RUN mvn dependency:resolve

# Copy the rest of the application
COPY . .

# Start the Selenium Grid Hub and Node
CMD ["mvn", "clean", "test"]
