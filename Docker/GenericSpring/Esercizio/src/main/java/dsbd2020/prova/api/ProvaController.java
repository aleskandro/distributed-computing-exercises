package dsbd2020.prova.api;

import dsbd2020.prova.DataModel.User;
import dsbd2020.prova.DataModel.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;

@Controller
@RequestMapping(path = "/prova")
public class ProvaController {
    @RequestMapping(path = "/hello")
    public @ResponseBody
    String hello() {
        return "hello";
    }

    @Autowired //Abbiamo collegato il database
    UserRepository repository;

    @GetMapping(path = "/all")//
    public @ResponseBody
    Iterable<User> getUser() {
        return repository.findAll();
    }

}
