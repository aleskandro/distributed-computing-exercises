package dsbd2020.lab.hello.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {

    @RequestMapping (path="/hello")
    public @ResponseBody String hello() {
        return "helloworld ;-)";
    }

    @RequestMapping (path="/hello/{name}")
    public @ResponseBody String hello(@PathVariable String name) {
        return "helloworld " + name + "!!";
    }
}
