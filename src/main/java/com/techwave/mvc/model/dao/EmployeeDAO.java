package com.techwave.mvc.model.dao;

import com.techwave.mvc.model.pojo.Book;
import com.techwave.mvc.model.pojo.DepartmentData;
import com.techwave.mvc.model.pojo.Employee;
import org.springframework.orm.hibernate5.HibernateTemplate;

import java.util.List;

public class EmployeeDAO {
    HibernateTemplate template;

    public void setTemplate(HibernateTemplate template){
        this.template = template;
    }

    public List<Employee> extract(){
        return template.loadAll(Employee.class);
    }

    public List<DepartmentData> extractDepartment(){
        return template.loadAll(DepartmentData.class);
    }

    public String insertBook(Book book){
        template.save(book);
        return "Book data stored";
    }
    public List<Book> extractBook() {
        return template.loadAll(Book.class);
    }
    public Book getByID(int bookid) {
        return template.get(Book.class, bookid);
    }
    public String updateBook(Book newBook) {
        template.update(newBook);
        return "Book updated";
    }
}
