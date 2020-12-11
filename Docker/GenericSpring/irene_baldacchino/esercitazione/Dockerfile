#builder
FROM maven:3-jdk-8 AS builder
WORKDIR /project
COPY . .
RUN mvn package


FROM openjdk:8-jdk-alpine
#Informa la rete su quale porta si collegherà il container
EXPOSE 8080

#viene copiato l'artefatto costruito dal builder nell'immagine docker
COPY --from=builder /project/target/hello-0.0.1-SNAPSHOT.jar ./hello.jar

ENTRYPOINT ["/bin/sh", "-c"]
CMD [ "java -jar hello.jar" ]
