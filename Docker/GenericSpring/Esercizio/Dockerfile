#builder
FROM maven:3-jdk-8 AS builder
WORKDIR /project
COPY . .
RUN mvn package

FROM openjdk:8-jdk-alpine
EXPOSE 8086
COPY --from=builder /project/target/prova-0.0.1-SNAPSHOT.jar ./prova.jar
ENTRYPOINT ["/bin/sh", "-c"]
CMD [ "java -jar prova.jar" ]