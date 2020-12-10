package dsbd2020.lab.tokenchain.serviceadapter;

import dsbd2020.lab.tokenchain.entities.Token;
import dsbd2020.lab.tokenchain.service.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(path = "/token")
public class RESTAdapter {

    @Autowired
    TokenService tokenService;

    @GetMapping(path = "/run/{token}/{jump}")
    public @ResponseBody Token forwardClientToken(@PathVariable String token, @PathVariable Integer jump) {
        return tokenService.forwardClientToken(token, jump);
    }

}
