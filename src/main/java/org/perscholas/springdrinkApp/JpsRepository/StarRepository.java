/**
 * 
 */
package org.perscholas.springdrinkApp.JpsRepository;

import java.util.List;

import org.perscholas.springdrinkApp.entity.Star;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * @author kevinbusch
 *
 */
public interface StarRepository extends JpaRepository<Star, Long>{
	List<Star> findByalcoholId(Long id);
	List<Star> findByuserId(Long id);
	@Query(value="select * from Stars where Stars.user_Id = ?1 AND Stars.ALCOHOL_ID = ?2", nativeQuery=true)
	Star findByuserIdAndAlcoholId(Long id, Long alcoholId);
	@Query(value="SELECT AVG(number) FROM Stars WHERE ALCOHOL_ID = ?1", nativeQuery=true)
	Integer findAVGNumberByAlcoholId(Long Id);
}
