<%--
  Created by IntelliJ IDEA.
  User: Thu Nguyen
  Date: 8/25/2022
  Time: 12:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="i" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<i:form action="getBook" modelAttribute="book">
    <table>
        <tr>
            <td>Book ID</td>
            <td><i:input path="bookID"></i:input></td>
        </tr>

        <tr>
            <td>Book Name</td>
            <td><i:input path="bookName"></i:input></td>
        </tr>

        <tr>
            <td>Date of Publication</td>
            <td><i:input path="dor" type="date"></i:input></td>
        </tr>

        <tr>
            <td><input type="submit"></td>
        </tr>
    </table>
    <a:out value="${message}"/>
</i:form>
</body>
</html>
