# syntax=docker/dockerfile:1

### Build stage ------------------------------------------------------------
FROM eclipse-temurin:17-jdk-jammy AS build

ENV ANT_VERSION=1.10.15

RUN apt-get update \
    && apt-get install -y --no-install-recommends ant \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

COPY build.xml ./
COPY nbproject ./nbproject
COPY src ./src
COPY web ./web
COPY build ./build
COPY create_user_table.sql ./

RUN ant clean dist

### Runtime stage ----------------------------------------------------------
FROM tomcat:9.0-jdk17-temurin

ENV CATALINA_OPTS="-Djava.security.egd=file:/dev/./urandom"

# Allow connecting to the container port 8080
EXPOSE 8080

# Remove default applications and deploy our WAR as ROOT
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /workspace/dist/ch12_ex2_userAdmin.war /usr/local/tomcat/webapps/ROOT.war

# Define placeholders for required database configuration.
ENV DB_URL="jdbc:mysql://localhost:3306/murach?useSSL=true&allowPublicKeyRetrieval=true&serverTimezone=UTC" \
    DB_USERNAME="root" \
    DB_PASSWORD="change-me"

CMD ["catalina.sh", "run"]
