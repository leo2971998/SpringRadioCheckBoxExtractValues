package com.techwave.mvc.controllers;

import com.techwave.mvc.model.dao.EmployeeDAO;
import com.techwave.mvc.model.pojo.Book;
import com.techwave.mvc.model.pojo.DepartmentData;
import com.techwave.mvc.model.pojo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.transaction.Transactional;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeDAO employeeDAO;
    static List<Book> bookList = null;
    static List<DepartmentData> list = null;

    @RequestMapping("getAll")
    public String extract(Model model) {
        List<Employee> list = employeeDAO.extract();
        System.out.println(list.size());
        model.addAttribute("EmployeeList", list);
        return "displayEmployee";
    }

    @RequestMapping("getInfo")
    public String getInfo() {
        return "getInfo";
    }

    @RequestMapping("fetch")
    public String getDetail(@ModelAttribute("E") int employeeID, Model model) {
        model.addAttribute("employeeID", employeeID);
        return "display";
    }

    @RequestMapping("getEmployee")
    public String getEmployee(Model model) {
        list = employeeDAO.extractDepartment();
        model.addAttribute("departmentList", list);
        return "getEmployee";
    }

    @RequestMapping("getEmployeeByDept")
    public String getEmployeeByDept(@RequestParam("dno") int departmentNum, Model model) {
        List<Employee> employee = employeeDAO.extract().stream().filter(element -> element.getDeptno() == departmentNum).collect(Collectors.toList());
        model.addAttribute("employeeList", employee);
        model.addAttribute("departmentList", list);
        model.addAttribute("dno", departmentNum);
        return "getEmployee";
    }

    @RequestMapping("insert")
    public String insertBook(Model model) {
        model.addAttribute("book", new Book());
        return "insert";
    }

    @RequestMapping("getBook")
    @Transactional
    public String getBook(@ModelAttribute("book") Book book, Model model) {
        System.out.println(book.getBookID() + " " + book.getBookName() + " " + book.getDor());
        String message = employeeDAO.insertBook(book);
        model.addAttribute("message", message);
        return "insert";
    }

    @RequestMapping("updateBook")
    public String updateBook(Model M) {
        bookList = employeeDAO.extractBook();
        M.addAttribute("bookList", bookList);
        M.addAttribute("book", new Book());
        return "Update";
    }

    @RequestMapping("fetchBook/{bid}")
    public String FetchBook(@PathVariable("bid") int bid, Model M) {
        System.out.println(bid);
        Book B = employeeDAO.extractBook().stream().filter(T-> T.getBookID() == bid).collect(Collectors.toList()).get(0);
        M.addAttribute("book", B);
        M.addAttribute("bookList", bookList);
        return "Update";
    }
    @RequestMapping("updateNewBook")
    @Transactional
    public String updateNewBook(@ModelAttribute("book") Book newBook, Model M){
        String msg = employeeDAO.updateBook(newBook);
        M.addAttribute("msg", msg);
        M.addAttribute("bookList", bookList);
        return "Update";
    }
    @RequestMapping("fetchBookbyRadio")
    public String extractBookbyRadio(Model M) {
        bookList = employeeDAO.extractBook();
        M.addAttribute("bookList", bookList);
        return "FetchDataByRadio";
    }
    @RequestMapping("fetchData")
    public String fetchData(Model M, @RequestParam("bookRadio") String radioValue) {
        bookList = employeeDAO.extractBook();
        M.addAttribute("bookList", bookList.stream().filter(T->T.getBookID() == Integer.parseInt(radioValue)).collect(Collectors.toList()));
        return "DisplayBook";
    }
    @RequestMapping("fetchBookbyCheckList")
    public String extractBookbyCheckList(Model M) {
        bookList = employeeDAO.extractBook();
        M.addAttribute("bookList", bookList);
        return "FetchDataByCheckList";
    }
    @RequestMapping("fetchDatabyCheck")
    public String fetchDatabyCheck(Model M, HttpServletRequest request) throws ServletException  {
        String[] checkValues = request.getParameterValues("bookCheck");
        bookList = employeeDAO.extractBook();
        M.addAttribute("bookList", bookList.stream().filter(T-> Arrays.stream(checkValues).anyMatch(s -> s.equals(String.valueOf(T.getBookID())))).collect(Collectors.toList()));
        return "DisplayBook";
    }
}
