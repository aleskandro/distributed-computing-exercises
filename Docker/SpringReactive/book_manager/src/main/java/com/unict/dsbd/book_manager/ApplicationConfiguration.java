package com.unict.dsbd.book_manager;

import com.mongodb.reactivestreams.client.MongoClient;
import com.mongodb.reactivestreams.client.MongoClients;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.mongo.MongoDataAutoConfiguration;
import org.springframework.boot.autoconfigure.data.mongo.MongoReactiveDataAutoConfiguration;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;
import org.springframework.boot.autoconfigure.mongo.embedded.EmbeddedMongoAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.data.mongodb.config.AbstractReactiveMongoConfiguration;
import org.springframework.data.mongodb.repository.config.EnableReactiveMongoRepositories;

@EnableReactiveMongoRepositories
@SpringBootApplication(
        exclude = {
                MongoAutoConfiguration.class,
                MongoDataAutoConfiguration.class,
                MongoReactiveDataAutoConfiguration.class,
                EmbeddedMongoAutoConfiguration.class
        }
)
@AutoConfigureAfter(EmbeddedMongoAutoConfiguration.class)
public class ApplicationConfiguration extends AbstractReactiveMongoConfiguration {
    @Value(value = "${MONGO_HOST}")
    private String mongoHost;

    @Value(value = "${MONGO_USER}")
    private String mongoUser;

    @Value(value = "${MONGO_PASS}")
    private String mongoPass;

    @Value(value = "${MONGO_AUTH_DB}")
    private String mongoAuthDB;


    @Value(value = "${MONGO_PORT}")
    private String mongoPort;

    @Value(value = "${MONGO_DB_NAME}")
    private String mongoDBName;

    public ApplicationConfiguration() {
    }

    @Override
    protected String getDatabaseName() {
        return this.mongoDBName;
    }

    @Override
    @Bean
    public MongoClient reactiveMongoClient() {
        String s = String.format("mongodb://%s:%s@%s:%s/%s?authSource=%s",
                mongoUser, mongoPass, mongoHost, mongoPort, mongoDBName, mongoAuthDB);
        return MongoClients.create(s);
    }
}
