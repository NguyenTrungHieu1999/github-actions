FROM eclipse-temurin:8-jre-alpine

EXPOSE 8080

COPY ./build/libs/github-actions-1.0-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "github-actions-1.0-SNAPSHOT.jar"]