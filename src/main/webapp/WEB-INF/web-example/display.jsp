<%--
  Created by IntelliJ IDEA.
  User: Thu Nguyen
  Date: 8/25/2022
  Time: 12:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>
    <d:if test="${E.empno=employeeID}">
        <d:out value="${'Employee name:'}"/>
        <d:out value="${E.ename}"/>
    </d:if>
</h1>
</body>
</html>
