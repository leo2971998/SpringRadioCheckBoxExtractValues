package com.techwave.mvc.model.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDate;
@Entity
public class Book {
    @Id
    private int bookID;
    private String bookName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dor;

    public Book() {
    }

    public Book(int bookID, String bookName, LocalDate dor) {
        super();
        this.bookID = bookID;
        this.bookName = bookName;
        this.dor = dor;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public LocalDate getDor() {
        return dor;
    }

    public void setDor(LocalDate dor) {
        this.dor = dor;
    }
}
