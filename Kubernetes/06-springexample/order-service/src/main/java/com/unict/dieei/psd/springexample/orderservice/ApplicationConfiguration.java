package com.unict.dieei.psd.springexample.orderservice;

import com.mongodb.reactivestreams.client.MongoClient;
import com.mongodb.reactivestreams.client.MongoClients;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.mongo.MongoDataAutoConfiguration;
import org.springframework.boot.autoconfigure.data.mongo.MongoReactiveDataAutoConfiguration;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;
import org.springframework.boot.autoconfigure.mongo.embedded.EmbeddedMongoAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.DependsOn;
import org.springframework.core.env.Environment;
import org.springframework.data.mongodb.config.AbstractReactiveMongoConfiguration;
import org.springframework.data.mongodb.repository.config.EnableReactiveMongoRepositories;

@EnableReactiveMongoRepositories
@SpringBootApplication(exclude = {MongoAutoConfiguration.class, MongoDataAutoConfiguration.class, MongoReactiveDataAutoConfiguration.class})
@AutoConfigureAfter(EmbeddedMongoAutoConfiguration.class)
public class ApplicationConfiguration extends AbstractReactiveMongoConfiguration {

    private final Environment env;

    private final String dbname;
    public ApplicationConfiguration(Environment env) {
        this.env = env;
        this.dbname = env.getRequiredProperty("MONGO_INITDB_DATABASE");
    }

    @Override
    @Bean
    //@DependsOn("embeddedMongoServer")
    public MongoClient reactiveMongoClient() {
        final String host = env.getRequiredProperty("MONGODB_HOSTNAME");
        final String port = env.getProperty("MONGODB_PORT", "27017");
        final String user = env.getRequiredProperty("MONGO_INITDB_ROOT_USERNAME");
        final String pass = env.getRequiredProperty("MONGO_INITDB_ROOT_PASSWORD");

        System.out.println(host);
        String s = String.format("mongodb://%s:%s@%s:%s/%s", user, pass, host, port, dbname);
        System.out.println(s);
        return MongoClients.create(s);
    }

    @Override
    protected String getDatabaseName() {
        return dbname;
    }
}
