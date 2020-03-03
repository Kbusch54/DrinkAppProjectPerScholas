/**
 * 
 */
package org.perscholas.springdrinkApp.JpsRepository;

import java.util.List;

import org.perscholas.springdrinkApp.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author kevinbusch
 *
 */
public interface CommentRepository extends JpaRepository<Comment, Long>{

	List<Comment> findByalcoholId(Long id);
	
	
}
