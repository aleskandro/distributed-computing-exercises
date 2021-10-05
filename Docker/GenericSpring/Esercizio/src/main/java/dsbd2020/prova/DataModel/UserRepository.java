package dsbd2020.prova.DataModel;

import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Integer> {
    // public User findByEmail(String email);
}
