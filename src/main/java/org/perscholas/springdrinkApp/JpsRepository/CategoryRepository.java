/**
 * 
 */
package org.perscholas.springdrinkApp.JpsRepository;

import org.perscholas.springdrinkApp.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author kevinbusch
 *
 */
public interface CategoryRepository extends JpaRepository<Category, Long>{

}
