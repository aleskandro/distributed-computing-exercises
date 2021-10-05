package dsbd2020.prova.DataModel;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
public class User {
    @Id  //in questo modo genera automaticamente l'ID
    @GeneratedValue(strategy = GenerationType.AUTO)//
    private Integer id;

    @NotNull(message = "tne name cannot be a blank field") //Indichiamo che questo campo deve avere sempre un valore
    private String name;

    @NotNull(message = "tne email cannot be a blank field")
    @Column(unique = true)// in questo modo diciamo che la colonna email è un parametro univoco
    private String email;

    @NotNull(message = "tne psw cannot be a blank field")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
//  Questa proprietà indica che si ha proprietà di sola scrittura non potremmo andare a leggere le password nel client e server
    private String psw;

    @ElementCollection //Indichiamo che è una collezione di elementi
    private List<String> roles;

    public Integer getId() {
        return id;
    }

    public User setId(int id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public User setName(String name) {
        this.name = name;
        return this;
    }

    public String getEmail() {
        return email;
    }

    public User setEmail(String email) {
        this.email = email;
        return this;
    }

    public String getPsw() {
        return psw;
    }

    public User setPsw(String psw) {
        this.psw = psw;
        return this;
    }

    public List<String> getRoles() {
        return roles;
    }

    public User setRoles(List<String> roles) {
        this.roles = roles;
        return this;
    }
}
