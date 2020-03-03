/**
 * 
 */
package org.perscholas.springdrinkApp.JpsRepository;

import java.util.List;
import java.util.Optional;

import org.perscholas.springdrinkApp.entity.Alcohol;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * @author kevinbusch
 *
 */
public interface AlcoholRepository extends JpaRepository<Alcohol, Long>{
	List<Alcohol> findByApprovedTrue();
	List<Alcohol> findByApprovedFalse();
	List<Alcohol> findByuserId(Long id);
	List<Alcohol> findBytype(String type);
	List<Alcohol> findBycategoryId(Long id);
	List<Alcohol> findByCategoryName(String name);
	@Query(value="select * from Alcohol u where u.name like %:keyword%", nativeQuery=true)
	List<Alcohol> findByNameLKeyword(@Param("keyword") String keyword);
	List<Alcohol> findByNameLikeAndTypeIs(String name, String type);
	@Query(value="Select * from Alcohol a left join Category c on a.category_Id = c.id where c.name= ?1", nativeQuery=true)
	List<Alcohol> findByCatName(String name);
	
	Optional<Alcohol> findById(Long id);
	
//	@Query(value="SELECT distinct a.id FROM alcohol a inner join account acc on a.user_id = acc.id inner join likes l on acc.id = l.user_id where acc.id = ?1;", nativeQuery=true)
//	List<Long> findLikesOfUserById(Long id);

	
}
