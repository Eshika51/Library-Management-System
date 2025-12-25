package com.app.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
 import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="details")
@Getter
@Setter
public class Student {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String fname;
	private String lname;
	
	@Column (unique=true, nullable=false)
	private String email;
	private String password;
	private String gender;
	private Date dob;
	private String address;
	private Timestamp joinedDate;
	private String role;
	
	@OneToMany(mappedBy = "student", cascade = CascadeType.ALL)
	private Set<IssueBook> issuedBooks;

}
