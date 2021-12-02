ARG BASE_IMAGE=quickfisco.io/java-base-dev:latest
FROM $BASE_IMAGE AS builder

WORKDIR /src
COPY ./ ./
RUN mvn package

FROM openjdk:17-alpine

COPY --from=builder /src/target/*.jar /
RUN mv /$(ls *.jar) /service.jar
CMD ["java", "-jar", "/service.jar"]
