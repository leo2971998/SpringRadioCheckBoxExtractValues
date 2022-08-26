<%--
  Created by IntelliJ IDEA.
  User: Anh Tu Nguyen
  Date: 8/24/2022
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="a" %>
<html>
<head>
    <title>Title</title>
    <style>
        tr {
            text-align: center;
        }
    </style>
</head>
<body>
<table border="1" cellpadding="5" align="center">
    <form action = "fetchDatabyCheck">
        <tr>
            <th>Book ID</th>
            <th>Book Name</th>
            <th>Date of Publication</th>
            <th>Select</th>
        </tr>
        <a:forEach var="bo" items="${bookList}">
        <tr>
            <td>${bo.bookID}</td>
            <td>${bo.bookName}</td>
            <td>${bo.dor}</td>
            <td><input type = "checkbox" name = "bookCheck" value = "${bo.bookID}" required></td>
        </tr>
        </a:forEach>
        <tr><td colspan = "5"><input type = "submit"></td></tr>
</table>
</form>
</body>
</html>
