# Multi-stage build để tối ưu kích thước image
FROM maven:3.9.4-eclipse-temurin-21 AS builder

# Set working directory
WORKDIR /app

# Copy pom.xml và download dependencies trước
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code và build
COPY src ./src
RUN mvn clean package -DskipTests

# Production stage với Tomcat
FROM tomcat:10.1-jdk21-temurin

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file từ builder stage
COPY --from=builder /app/target/Chap13_1-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Tạo thư mục logs
RUN mkdir -p /usr/local/tomcat/logs

# Set environment variables
ENV CATALINA_OPTS="-Djava.security.egd=file:/dev/./urandom -Xmx512m -Xms256m"
ENV JAVA_OPTS="-Djava.awt.headless=true -Djava.net.preferIPv4Stack=true"

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:8080/ || exit 1

# Start Tomcat
CMD ["catalina.sh", "run"]