package com.app.model;

import java.util.Set;

import jakarta.persistence.CascadeType;
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
@Table
@Getter
@Setter
public class Book {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bookId;
	private String title;
	private String author;
	private String publisher;
	private String category;
	private int quantity;
	private String status;
	
	@OneToMany(mappedBy = "book", cascade = CascadeType.ALL)
	private Set<IssueBook> issuedToStudents;

}
