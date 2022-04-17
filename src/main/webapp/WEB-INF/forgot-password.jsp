<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: edgargomez
  Date: 4/15/22
  Time: 6:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Enter Answer" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container w-50">
    <h1 class="text-center mt-5 mb-5">Please answer your Security Question</h1>
    <form action="/security-answer-check" method="POST">
        <div class="form-group">
            <h3>${securityQuestion}</h3>
        </div>
        <div class="form-group">
            <label for="security-answer">Answer for Security Question</label>
            <input id="security-answer" name="security-answer" class="form-control" type="text">
        </div>
        <div class="d-flex justify-content-center">
            <input type="submit" class="btn btn-block my-5 w-50" value="Submit Answer">
        </div>
    </form>
    <c:if test = "${incorrect}">
        <script>
            window.alert("That was not your answer.");
        </script>
    </c:if>
</div>

