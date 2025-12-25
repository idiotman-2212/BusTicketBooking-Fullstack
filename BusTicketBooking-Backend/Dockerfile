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

# Port mà ứng dụng spring boot sẽ chạy
EXPOSE 8080

# Hiển thị phiên bản Java khi container khởi động
RUN java -version

# Câu lệnh để chạy ứng dụng
ENTRYPOINT ["java","-jar","app.jar"]

#docker-compose down
#docker-compose build --no-cache app
#docker-compose up -d
