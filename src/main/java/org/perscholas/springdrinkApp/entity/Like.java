package org.perscholas.springdrinkApp.entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The persistent class for the likes database table.
 * 
 * @author kevinbusch Filename: Like.java 02/26/2020
 */

@Entity
@Table(name = "likes")
public class Like implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private Long id;

	@Column(name="alcohol_Id")
	private Long alcoholId;
	
	@Column(name="user_Id")
	private Long userId;

	@Column(name="comment_Id")
	private Long commentId;


	// bi-directional many-to-one association to Account
	@ManyToOne
	@JoinColumn(name = "user_Id", referencedColumnName="id", insertable=false, updatable=false)
	private Account account;

	// bi-directional many-to-one association to Alcohol
	@ManyToOne
	@JoinColumn(name="alcohol_Id",referencedColumnName="id", insertable=false, updatable=false)
	private Alcohol alcohol;

	// bi-directional many-to-one association to Comment
	@ManyToOne
	@JoinColumn(name="comment_Id",referencedColumnName="id", insertable=false, updatable=false)
	private Comment comment;

	public Like() {
	}
	

	/**
	 * @param id
	 * @param alcoholId
	 * @param userId
	 * @param commentId
	 * @param account
	 * @param alcohol
	 * @param comment
	 */
	public Like(Long id, Long alcoholId, Long userId, Long commentId, Account account, Alcohol alcohol,
			Comment comment) {
		super();
		this.id = id;
		this.alcoholId = alcoholId;
		this.userId = userId;
		this.commentId = commentId;
		this.account = account;
		this.alcohol = alcohol;
		this.comment = comment;
	}


	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getAlcoholId() {
		return this.alcoholId;
	}

	public void setAlcoholId(Long alcoholId) {
		this.alcoholId = alcoholId;
	}

	public Long getCommentId() {
		return this.commentId;
	}

	public void setCommentId(Long commentId) {
		this.commentId = commentId;
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

	public Alcohol getAlcohol() {
		return this.alcohol;
	}

	public void setAlcohol(Alcohol alcohol) {
		this.alcohol = alcohol;
	}

	public Comment getComment() {
		return this.comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "Like [id=" + id + ", alcoholId=" + alcoholId + ", userId=" + userId + ", commentId=" + commentId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((account == null) ? 0 : account.hashCode());
		result = prime * result + ((alcohol == null) ? 0 : alcohol.hashCode());
		result = prime * result + ((alcoholId == null) ? 0 : alcoholId.hashCode());
		result = prime * result + ((comment == null) ? 0 : comment.hashCode());
		result = prime * result + ((commentId == null) ? 0 : commentId.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		Like other = (Like) obj;
		if (account == null) {
			if (other.account != null)
				return false;
		} else if (!account.equals(other.account))
			return false;
		if (alcohol == null) {
			if (other.alcohol != null)
				return false;
		} else if (!alcohol.equals(other.alcohol))
			return false;
		if (alcoholId == null) {
			if (other.alcoholId != null)
				return false;
		} else if (!alcoholId.equals(other.alcoholId))
			return false;
		if (comment == null) {
			if (other.comment != null)
				return false;
		} else if (!comment.equals(other.comment))
			return false;
		if (commentId == null) {
			if (other.commentId != null)
				return false;
		} else if (!commentId.equals(other.commentId))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}
	

}