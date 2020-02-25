/**
 * 
 */
package org.perscholas.springdrinkApp.JpsRepository;

import java.util.List;

import org.perscholas.springdrinkApp.entity.Like;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author kevinbusch
 *
 */
public interface LikeRepository extends JpaRepository<Like, Long>{

	List<Like> findLikeByAlcoholId(Long Id);
	List<Like> findByuserId(Long Id);

}
