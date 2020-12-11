#builder
FROM maven:3-jdk-8 AS builder
WORKDIR /app
COPY . .
RUN mvn package


FROM openjdk:8-jdk-alpine
#Informa la rete su quale porta si collegherà il container
EXPOSE 8080

CMD java -jar /data/hello.jar
#viene copiato l'artefatto costruito dal builder nell'immagine docker
COPY --from=builder /app/hello.jar /data/hello.jar