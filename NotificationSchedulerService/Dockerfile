# Stage 1: Build the application
FROM maven:3.9-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy pom.xml and download dependencies (cached layer)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code and build
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# Copy the jar from builder stage
COPY --from=builder /app/target/*.jar app.jar

# Port mà ứng dụng sẽ chạy
EXPOSE 8888

# Hiển thị phiên bản Java
RUN java -version

# Câu lệnh để chạy ứng dụng
ENTRYPOINT ["java","-jar","app.jar"]
