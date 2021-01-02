package dsbd2020.lab.tokenchain.service;

import dsbd2020.lab.tokenchain.datamodel.LogRepository;
import dsbd2020.lab.tokenchain.datamodel.TokenRepository;
import dsbd2020.lab.tokenchain.entities.Log;
import dsbd2020.lab.tokenchain.entities.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import static dsbd2020.lab.tokenchain.TokenchainApplication.nextServiceName;
import static dsbd2020.lab.tokenchain.TokenchainApplication.nextServicePort;

@Service
public class TokenService {

    @Autowired
    TokenRepository tokenRepository;

    @Autowired
    LogRepository logRepository;

    @Value("${server.port}")
    private String servicePort;

    private String NEXT_HOST = "http://" + nextServiceName + ":" + nextServicePort;

    public Token forwardClientToken(String token, Integer jump) {
        Token t = new Token();
        Log log = new Log();

        jump = jump - 1;

        t.setToken(token);
        t.setWhoami("localhost:" + servicePort);

        // Salviamo il token del DB:
        tokenRepository.save(t);

        // Settiamo e salviamo il log:
        log.setResult("OK::Token Received...");
        log.setWhoami("localhost:" + servicePort);

        logRepository.save(log);

        // Abbiamo esaurito i salti quindi ci fermiamo.
        if(jump == 0) {
            Token tt = new Token();
            tt.setWhoami("localhost:" + servicePort);
            tt.setToken("Final Service!!!");
            return tt;
        }
        // Se ancora il Token deve effettuare salti continuiamo la ricorsione tra servizi.
        System.out.println(NEXT_HOST + "/token/run/{token}/{jump}");
        Token resp = new RestTemplate().getForObject(NEXT_HOST + "/token/run/{token}/{jump}", Token.class,  token, jump);
        return resp;
    }

}
