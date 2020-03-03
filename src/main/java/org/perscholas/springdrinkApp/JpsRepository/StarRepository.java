/**
 * 
 */
package org.perscholas.springdrinkApp.JpsRepository;

import java.util.List;
import java.util.Optional;

import org.perscholas.springdrinkApp.entity.Star;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

/**
 * @author kevinbusch
 *
 */
public interface StarRepository extends JpaRepository<Star, Long>{
	List<Star> findByalcoholId(Long id);
	List<Star> findByuserId(Long id);
	@Query(value="select * from Stars where Stars.user_Id = ?1 AND Stars.alcohol_id = ?2", nativeQuery=true)
	Star findByuserIdAndAlcoholId(Long id, Long alcoholId);
	@Query(value="SELECT AVG(number) FROM Stars WHERE ALCOHOL_ID = ?1", nativeQuery=true)
	Integer findAVGNumberByAlcoholId(Long Id);
	
	Optional<Star> findById(Long id);
	@Modifying 
	@Query(value="UPDATE stars s SET s.number = ?1 WHERE s.id = ?2);", nativeQuery=true)
	void UpdateStarNumById(int num, Long id);
	
}
