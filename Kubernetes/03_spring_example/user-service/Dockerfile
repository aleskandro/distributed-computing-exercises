FROM maven:3-jdk-8 as builder
WORKDIR /app
COPY . .
RUN mvn package -P production

FROM java:8
WORKDIR /app
COPY --from=builder /app/target/userservice-0.0.1-SNAPSHOT.jar ./user-service.jar
CMD java -jar user-service.jar
