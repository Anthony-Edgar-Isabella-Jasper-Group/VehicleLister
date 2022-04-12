<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container w-50">
        <h1 class="text-center mt-5 mb-5">Log in to your Vehiclelister Account</h1>
        <form action="/login" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text">
                <div class="text-right"><a href="#">Forgot Username?</a></div>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
                <div class="text-right"><a href="#">Forgot Password?</a></div>
            </div>
            <div class="d-flex justify-content-center">
                <input type="submit" class="btn btn-primary btn-block my-5 w-50" value="Log In">
            </div>

        </form>
    </div>
</body>
</html>
