package dsbd2020.lab.tokenchain.datamodel;

import dsbd2020.lab.tokenchain.entities.Token;
import org.springframework.data.repository.CrudRepository;

public interface TokenRepository extends CrudRepository<Token,Integer> {

}
