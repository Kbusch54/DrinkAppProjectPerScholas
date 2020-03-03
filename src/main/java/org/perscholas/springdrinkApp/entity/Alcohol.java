package org.perscholas.springdrinkApp.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * The persistent class for the alcohol database table.
 * 
 */

@Entity
@Table(name="Alcohol")
public class Alcohol implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private Long id;

	@Column(columnDefinition="TINYINT(1) default 0")
	private boolean approved;
	

	@Column(name="Category_Id")
	private Long catId;

	@Temporal(TemporalType.TIMESTAMP)
	private Date dateAdded;

	private String description;

	private String name;

	private String pic;

	private String type;
	
	@Column(name="user_Id")
	private Long userId;

	// bi-directional many-to-one association to Account
	@ManyToOne
	@JoinColumn(name = "user_Id",referencedColumnName="id", insertable=false, updatable=false)
	private Account account;

	// bi-directional many-to-one association to Category
	@ManyToOne
	@JoinColumn(name="Category_Id",referencedColumnName="id", insertable=false, updatable=false)
	private Category category;

	// bi-directional many-to-one association to Comment
	@OneToMany(mappedBy = "alcohol")
	private List<Comment> comments;

	// bi-directional many-to-one association to Like
	@OneToMany(mappedBy = "alcohol")
	private List<Like> likes;

	// bi-directional many-to-one association to Star
	@OneToMany(mappedBy = "alcohol")
	private List<Star> stars;

	// bi-directional many-to-many association to Tag
	@ManyToMany(mappedBy = "alcohols")
	private List<Tag> tags;
	
	public Alcohol() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public boolean getApproved() {
		return this.approved;
	}

	public void setApproved(boolean approved) {
		this.approved = approved;
	}

	public Long getCatId() {
		return this.catId;
	}

	public void setCatId(Long catId) {
		this.catId = catId;
	}

	public Date getDateAdded() {
		return this.dateAdded;
	}

	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPic() {
		return this.pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Long getUserId() {
		return this.userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Comment> getComments() {
		return this.comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Comment addComment(Comment comment) {
		getComments().add(comment);
		comment.setAlcohol(this);

		return comment;
	}

	public Comment removeComment(Comment comment) {
		getComments().remove(comment);
		comment.setAlcohol(null);

		return comment;
	}

	public List<Like> getLikes() {
		return this.likes;
	}

	public void setLikes(List<Like> likes) {
		this.likes = likes;
	}

	public Like addLike(Like like) {
		getLikes().add(like);
		like.setAlcohol(this);

		return like;
	}

	public Like removeLike(Like like) {
		getLikes().remove(like);
		like.setAlcohol(null);

		return like;
	}

	public List<Star> getStars() {
		return this.stars;
	}

	public void setStars(List<Star> stars) {
		this.stars = stars;
	}

	public Star addStar(Star star) {
		getStars().add(star);
		star.setAlcohol(this);

		return star;
	}

	public Star removeStar(Star star) {
		getStars().remove(star);
		star.setAlcohol(null);

		return star;
	}

	public List<Tag> getTags() {
		return this.tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}
	public double getRating(Long id) {
		double x = 0.0;
		double i=0.0;
		for (Star s : stars) {
			if(s.getAlcoholId()==id) {
				x+=s.getNumber();
				i++;
			}
		}
		if(x>0&&i>0) {
		return x/i;
		}
		return 0;
	}
	public int getLikes(Long id) {
		int i=0;
		for (Like like : likes) {
			if(like.getAlcoholId()==id) {
				i++;
			}
		}
		return i;
	}
	public String getUserName(Long id) {
		Account acc = new Account();
		String r=acc.getUserNameById(id);
		return r;
	}
	@Override
	public String toString() {
		return "Alcohol [id=" + id + ", approved=" + approved + ", catId=" + catId + ", dateAdded=" + dateAdded
				+ ", description=" + description + ", name=" + name + ", pic=" + pic + ", type=" + type + ", userId="
				+ userId +  getUserName(userId)+ comments.toString()+"stars"+ stars+ getRating(id)+"Likes"+ getLikes(id);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((account == null) ? 0 : account.hashCode());
		result = prime * result + (approved ? 1231 : 1237);
		result = prime * result + ((catId == null) ? 0 : catId.hashCode());
		result = prime * result + ((category == null) ? 0 : category.hashCode());
		result = prime * result + ((comments == null) ? 0 : comments.hashCode());
		result = prime * result + ((dateAdded == null) ? 0 : dateAdded.hashCode());
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((likes == null) ? 0 : likes.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((pic == null) ? 0 : pic.hashCode());
		result = prime * result + ((stars == null) ? 0 : stars.hashCode());
		result = prime * result + ((tags == null) ? 0 : tags.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Alcohol other = (Alcohol) obj;
		if (account == null) {
			if (other.account != null)
				return false;
		} else if (!account.equals(other.account))
			return false;
		if (approved != other.approved)
			return false;
		if (catId == null) {
			if (other.catId != null)
				return false;
		} else if (!catId.equals(other.catId))
			return false;
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (comments == null) {
			if (other.comments != null)
				return false;
		} else if (!comments.equals(other.comments))
			return false;
		if (dateAdded == null) {
			if (other.dateAdded != null)
				return false;
		} else if (!dateAdded.equals(other.dateAdded))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (likes == null) {
			if (other.likes != null)
				return false;
		} else if (!likes.equals(other.likes))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (pic == null) {
			if (other.pic != null)
				return false;
		} else if (!pic.equals(other.pic))
			return false;
		if (stars == null) {
			if (other.stars != null)
				return false;
		} else if (!stars.equals(other.stars))
			return false;
		if (tags == null) {
			if (other.tags != null)
				return false;
		} else if (!tags.equals(other.tags))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}
	
}