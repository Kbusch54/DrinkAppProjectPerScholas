/**
 * 
 */
package org.perscholas.springdrinkApp.JpsRepository;

import java.util.ArrayList;

import org.perscholas.springdrinkApp.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author kevinbusch
 *
 */
public interface CommentRepository extends JpaRepository<Comment, Long>{

	ArrayList<Comment> findByalcoholId(Long id);
	
	
}
