package dsbd2020.lab.tokenchain;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class TokenchainApplication {

    public static String nextServicePort;
    public static String nextServiceName;

    public static void main(String[] args) {
        String servicePort = args[0];
        nextServicePort = args[1];
        nextServiceName = args[2];
        System.setProperty("server.port", servicePort);
        SpringApplication.run(TokenchainApplication.class, args);
    }

}
