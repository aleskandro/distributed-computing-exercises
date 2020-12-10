package dsbd2020.lab.tokenchain.entities;

import com.sun.istack.NotNull;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
public class Log {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO,generator="native")
    @GenericGenerator(name = "native",strategy = "native")
    private Integer id;

    @NotNull
    private String whoami;

    @NotNull
    private String result;

    public Integer getId() {
        return id;
    }

    public Log setId(Integer id) {
        this.id = id;
        return this;
    }

    public String getWhoami() {
        return whoami;
    }

    public Log setWhoami(String whoami) {
        this.whoami = whoami;
        return this;
    }

    public String getResult() {
        return result;
    }

    public Log setResult(String result) {
        this.result = result;
        return this;
    }

}
