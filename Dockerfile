# Build stage
FROM eclipse-temurin:8-jdk-alpine as builder
WORKDIR /build
COPY . .
RUN chmod +x gradlew && ./gradlew build

# Runtime stage
FROM eclipse-temurin:8-jre-alpine
EXPOSE 8080
WORKDIR /usr/app
COPY --from=builder /build/build/libs/github-actions-1.0-SNAPSHOT.jar .
ENTRYPOINT ["java", "-jar", "github-actions-1.0-SNAPSHOT.jar"]