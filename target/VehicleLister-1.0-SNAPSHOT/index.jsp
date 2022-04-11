<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome Vehicle Lister!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <div class="container text-center">
            <h2 class="mt-5">Have a car, truck or any vehicle you want to sell? <br> Create a profile and start listing your vehicle</h2>
            <a class="btn btn-secondary btn-lg mt-5" href="/register" role="button">Sign up!</a>
        </div>
    </div>
</body>
</html>
