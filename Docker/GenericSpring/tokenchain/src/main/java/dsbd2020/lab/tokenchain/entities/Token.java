package dsbd2020.lab.tokenchain.entities;

import com.sun.istack.NotNull;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
public class Token {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO,generator="native")
    @GenericGenerator(name = "native",strategy = "native")
    private Integer id;

    @NotNull
    private String token;

    @NotNull
    private String whoami;

    public String getToken() {
        return token;
    }

    public Token setToken(String token) {
        this.token = token;
        return this;
    }

    public Integer getId() {
        return id;
    }

    public Token setId(Integer id) {
        this.id = id;
        return this;
    }

    public String getWhoami() {
        return whoami;
    }

    public Token setWhoami(String whoami) {
        this.whoami = whoami;
        return this;
    }

}
