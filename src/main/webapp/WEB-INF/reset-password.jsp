<%--
  Created by IntelliJ IDEA.
  User: edgargomez
  Date: 4/16/22
  Time: 7:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Reset Password" />
    </jsp:include>
    <title>Reset Password</title>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container w-50">
    <h1 class="text-center mt-5 mb-5">Please enter a new password.</h1>
    <form action="/reset-password" method="POST">
        <div class="form-group">
            <label for="resetPassword">New Password</label>
            <input type="password" id="resetPassword" name="resetPassword" class="mr-5 form-control">
            <br>
        </div>
        <div class="form-group">
            <label>Confirm New Password</label>
            <input type="password" id="confirmResetPassword" name="confirmResetPassword" class="mr-5 form-control">
            <br>
        </div>
        <div class="d-flex justify-content-center">
            <input type="submit" class="btn btn-block my-5 w-50" value="Reset Password">
        </div>
    </form>
</div>
    <c:if test = "${incorrect}">
        <script>
            window.alert("${message}");
        </script>
    </c:if>
</body>
</html>
