FROM maven:3-jdk-8 as builder
WORKDIR /app
COPY ../order-service .
RUN mvn package -P production

FROM java:8
WORKDIR /app
COPY --from=builder /app/target/*.jar ./service.jar
CMD java -jar service.jar
