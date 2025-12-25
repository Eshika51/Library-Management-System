package com.app.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.app.model.Book;
import com.app.model.IssueBook;
import com.app.model.Student;

 
public class DBConnection {
	
	public static SessionFactory sessionFactory = null;
	public static Session session = null;
	
	public static SessionFactory getSessionFactory() {
		SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml")
										.addAnnotatedClass(Student.class)
										.addAnnotatedClass(Book.class)
										.addAnnotatedClass(IssueBook.class)
										.buildSessionFactory();
		
		return sessionFactory;
	}
	
	public static void startSession() {
		sessionFactory = getSessionFactory();
		session = sessionFactory.openSession();
	}
	
	public static int saveBook(Book bk) {
		startSession();
		session.beginTransaction();
		int i = (int) session.save(bk);
		System.out.println("Book stored");
		session.getTransaction().commit();
		destroy();
		return i;
	}
	
	public static List<Book> getAllBooks(){
		startSession();
		Query<Book> query = session.createQuery("from Book", Book.class);
		List<Book> list = query.list();
		destroy();
		return list;
	}
	
	public static Book getBookById(int id) {
		startSession();
		Book b = session.get(Book.class, id);
		System.out.println(b);
		destroy();
		return b;
	}
	
	public static int updateBook(Book bk) {
		startSession();
		session.beginTransaction();
		Book b = session.merge(bk);
		session.getTransaction().commit();
		destroy();
		return b.getBookId();
	}
	
	public static void deleteBook(Book bk) {
		startSession();
		session.beginTransaction();
 		session.remove(bk);
 		session.getTransaction().commit();
 		destroy();
	}
	
	public static int borrowBook(Book bk, Student user) {
		startSession();
		session.beginTransaction();
		bk.setQuantity(bk.getQuantity()-1);
		session.merge(bk);
		
		IssueBook ib = new IssueBook();
		ib.setStudent(user);
		ib.setBook(bk);
		ib.setIssuedDate(new Timestamp(System.currentTimeMillis()));
		session.merge(ib);
		
		session.getTransaction().commit();
		destroy();
		return bk.getBookId();
	}
	
	public static int returnBook(Book bk, Student user) {
		startSession();
		session.beginTransaction(); 
		
		List<IssueBook> ib = getDetailsById(bk, user);
		if(!ib.isEmpty()) {
 			bk.setQuantity(bk.getQuantity()+1);
			session.merge(bk);
			session.remove(ib.get(0));
		}	 
		
		session.getTransaction().commit();
		destroy();
		return 1;
	}
	
	public static List<IssueBook> getDetailsById(Book bk, Student user) {
		Query<IssueBook> query = session.createQuery("from IssueBook where student.id = :stuId and book.bookId = :bkId", IssueBook.class);
		query.setParameter("stuId", user.getId());
		query.setParameter("bkId", bk.getBookId());
		List<IssueBook> ib = query.getResultList();
		System.out.println(ib);
 		return ib;
	}
	
	public static Student getUserByEmail(String username) {
		startSession();
		Query<Student> query = session.createQuery("from Student where email = :username", Student.class);
		query.setParameter("username", username.trim());
		Student user = query.uniqueResult();
 		System.out.println(user);
		destroy();
		return user;
	}

	
	public static int saveStudent(Student s) {
		startSession();
		session.beginTransaction();
		int i = (int) session.save(s);
		System.out.println("Student Registered!!");
		session.getTransaction().commit();
		destroy();
		return i;
	}
	
	public static void destroy() {
		session.close();
		sessionFactory.close();
	}
}
