/**
 * 
 */
package org.perscholas.springdrinkApp.JpsRepository;

import java.util.List;

import org.perscholas.springdrinkApp.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author kevinbusch
 *
 */
public interface AccountRepository extends JpaRepository<Account, Long>{
	
	List<Account> findAll();
	Account findByUserNameAndPassword(String username, String password);
	Account findByUserName(String username);
	Account findByEmail(String email);
	Boolean existsByEmail(String email);
	Boolean existsByUserName(String username);
	Boolean existsByUserNameAndPassword(String username, String password);
	Account findByid(long id);
	
}
