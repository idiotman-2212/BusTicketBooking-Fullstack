# Sử dụng Eclipse Temurin 20.0.1
FROM eclipse-temurin:20.0.1_9-jdk-jammy

# Tạo thư mục để chứa ứng dụng
WORKDIR /app

# Copy file jar từ target vào container
COPY target/*.jar app.jar

# Port mà ứng dụng spring boot sẽ chạy
EXPOSE 8080

# Hiển thị phiên bản Java khi container khởi động
RUN java -version

# Câu lệnh để chạy ứng dụng
ENTRYPOINT ["java","-jar","app.jar"]

#docker-compose down
#docker-compose build
#docker-compose up -d