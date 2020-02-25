/**
 * 
 */
package org.perscholas.springdrinkApp.JpsRepository;

import org.perscholas.springdrinkApp.entity.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author kevinbusch
 *
 */
public interface TagRepository extends JpaRepository<Tag, Long>{

}
