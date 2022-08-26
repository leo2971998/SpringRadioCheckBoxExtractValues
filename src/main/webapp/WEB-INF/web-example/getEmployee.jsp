<%--
  Created by IntelliJ IDEA.
  User: Thu Nguyen
  Date: 8/25/2022
  Time: 10:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="ge" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="getEmployeeByDept">
    <h2>Select Department Number</h2>
    <select name="dno">
        <option value="-1">Select</option>
        <ge:forEach var="dl" items="${departmentList}">
            <option value="${dl.deptno}" ${dl.deptno==dno?'selected':''}>${dl.dname}</option>
        </ge:forEach>
    </select>
    <input type="submit">

    <ge:choose>
        <ge:when test="${dno==-1}">
            <ge:out value="${'Please select department'}"/>
        </ge:when>

        <ge:when test="${employeeList.size()>0}">
            <table>
                <tr>
                    <td>Employee Number</td>
                    <td>Employee Name</td>
                </tr>
                <ge:forEach var="em" items="${employeeList}">
                    <tr>
                        <td>${em.empno}</td>
                        <td>${em.ename}</td>
                    </tr>
                </ge:forEach>
            </table>
        </ge:when>

        <ge:otherwise>
            <ge:out value="${'No employees found in department'}"/>
        </ge:otherwise>
    </ge:choose>
</form>
</body>
</html>
