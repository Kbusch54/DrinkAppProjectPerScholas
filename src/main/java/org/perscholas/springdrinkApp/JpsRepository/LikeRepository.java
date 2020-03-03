/**
 * 
 */
package org.perscholas.springdrinkApp.JpsRepository;

import java.util.List;

import org.perscholas.springdrinkApp.entity.Like;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * @author kevinbusch
 *
 */
public interface LikeRepository extends JpaRepository<Like, Long>{

	List<Like> findLikeByAlcoholId(Long Id);
	List<Like> findByuserId(Long Id);
//	boolean existsByuserIdANDAlcoholId(Long Id, Long alId);
	@Query(value="select * from Likes where Likes.user_Id = ?1 AND Likes.alcohol_id = ?2", nativeQuery=true)
	Like findByuserIdAndAlcoholId(Long id, Long alcId);
	@Query(value="Delete * from Likes where Likes.user_Id = ?1 AND Likes.alcohol_id = ?2", nativeQuery=true)
	void RemoveByuserIdAndAlcoholId(Long id, Long alcId);

}
