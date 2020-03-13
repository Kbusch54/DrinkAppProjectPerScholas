package org.perscholas.springdrinkApp.entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The persistent class for the stars database table.
 *  @author kevinbusch Filename: Star.java 02/26/2020
 */
@Entity
@Table(name = "stars")
public class Star implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private Long id;

	@Column(name="ALCOHOL_ID")
	private Long alcoholId;

	private int number;

	@Column(name="user_Id")
	private Long userId;

	// bi-directional many-to-one association to Account
	@ManyToOne
	@JoinColumn(name = "user_Id",referencedColumnName="id", insertable=false, updatable=false)
	private Account account;

	// bi-directional many-to-one association to Alcohol
	@ManyToOne
	@JoinColumn(name="ALCOHOL_ID",referencedColumnName="id", insertable=false, updatable=false)
	private Alcohol alcohol;

	public Star() {
	}
	

	/**
	 * @param id
	 * @param alcoholId
	 * @param number
	 * @param userId
	 * @param account
	 * @param alcohol
	 */
	public Star(Long id, Long alcoholId, int number, Long userId, Account account, Alcohol alcohol) {
		super();
		this.id = id;
		this.alcoholId = alcoholId;
		this.number = number;
		this.userId = userId;
		this.account = account;
		this.alcohol = alcohol;
	}


	public Long getAlcoholId() {
		return this.alcoholId;
	}

	public void setAlcoholId(Long alcoholId) {
		this.alcoholId = alcoholId;
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getNumber() {
		return this.number;
	}

	public void setNumber(int number) {
		this.number = number;
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

	
	@Override
	public String toString() {
		return "Starnumber=" + number + ", userId=" + userId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((account == null) ? 0 : account.hashCode());
		result = prime * result + ((alcohol == null) ? 0 : alcohol.hashCode());
		result = prime * result + ((alcoholId == null) ? 0 : alcoholId.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + number;
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
		Star other = (Star) obj;
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
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (number != other.number)
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}
	

}