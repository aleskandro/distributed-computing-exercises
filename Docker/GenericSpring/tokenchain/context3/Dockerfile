FROM maven:3-jdk-8 as builder
WORKDIR /project
COPY . .
RUN mvn package

FROM java:8-alpine
WORKDIR /app
COPY --from=builder /project/target/tokenchain-0.0.1-SNAPSHOT.jar .

ENTRYPOINT ["/bin/sh", "-c"]
CMD  [ "java -jar ./tokenchain-0.0.1-SNAPSHOT.jar 4444 2222 container-1" ]