<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Anh Tu Nguyen
  Date: 8/26/2022
  Time: 10:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript">
    function fetch() {
        var bid = document.getElementsByName("bookID")[0].value;
        window.location.href = window.location.origin + "/SpringDemo3_war_exploded/fetchBook/" + bid;
    }
</script>
<body>
<f:form action="/SpringDemo3_war_exploded/updateNewBook" modelAttribute="book">
    <table>
        <tr>
            <td>Book ID</td>
            <td>
                <f:select path="bookID" onblur = "fetch();">
                <f:option value="-1">Select</f:option>
                    <a:forEach var = "b" items = "${bookList}">
                        <f:option value="${b.bookID}">${b.bookID}</f:option>
                    </a:forEach>
                </f:select>
            </td>
        </tr>
        <tr>
            <td>Book Name</td>
            <td><f:input path = "bookName"/></td>
        </tr>
        <tr>
            <td>Date of Publication</td>
            <td><f:input path="dor" type ="date"/></td>
        </tr>
        <tr><td><input type = "submit" value = "Update"></td></tr>
    </table>
</f:form>
<a:out value="${msg}"></a:out>
</body>
</html>
