package com.unict.dieei.psd.springbook;

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
@SpringBootApplication(exclude = {MongoAutoConfiguration.class,
        MongoDataAutoConfiguration.class, MongoReactiveDataAutoConfiguration.class})
@AutoConfigureAfter(EmbeddedMongoAutoConfiguration.class)
public class ApplicationConfiguration extends AbstractReactiveMongoConfiguration {
    @Value(value = "${MONGO_HOST}")
    private String mongoHost;

    @Value(value = "${MONGO_ROOT_USERNAME}")
    private String mongoUser;

    @Value(value = "${MONGO_ROOT_PASSWORD}")
    private String mongoPass;

    @Value(value = "${MONGO_PORT:27017}")
    private String mongoPort;

    @Value(value = "${MONGO_DBNAME}")
    private String mongoDatabase;

    public ApplicationConfiguration() {
    }

    @Override
    @Bean
    public MongoClient reactiveMongoClient() {
        String s = String.format("mongodb://%s:%s@%s:%s/%s", mongoUser, mongoPass,
                mongoHost, mongoPort, mongoDatabase);
        return MongoClients.create(s);
    }

    @Override
    protected String getDatabaseName() {
        return mongoDatabase;
    }
}
