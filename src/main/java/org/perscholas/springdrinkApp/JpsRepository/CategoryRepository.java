/**
 * 
 */
package org.perscholas.springdrinkApp.JpsRepository;

import org.perscholas.springdrinkApp.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * @author kevinbusch
 *
 */
public interface CategoryRepository extends JpaRepository<Category, Long>{
	
	@Query(value="select * from Category c left join Alcohol al on c.id = al.category_Id where al.id = ?1", nativeQuery=true)
	Category findByAlcoholId(Long id);
	

}
