# Use an official Maven image as a parent image with OpenJDK 21
FROM maven:3.8.4-openjdk-21

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
