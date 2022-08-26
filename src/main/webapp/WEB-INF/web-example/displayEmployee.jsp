<%--
  Created by IntelliJ IDEA.
  User: Thu Nguyen
  Date: 8/24/2022
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table>
    <tr>
        <th>Employee Number</th>
        <th>Employee Name</th>
        <th>Job</th>
        <th>Hire Date</th>
    </tr>

    <!-- Same as in EmployeeController -->
    <a:forEach var="e" items="${EmployeeList}">
        <tr>
            <td>${e.empno}</td>
            <td>${e.ename}</td>
            <td>${e.job}</td>
            <td>${e.hiredate}</td>
        </tr>

    </a:forEach>
</table>
</body>
</html>
