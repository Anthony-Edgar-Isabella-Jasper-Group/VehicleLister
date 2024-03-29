<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container w-50">
        <h1 class="text-center mt-4">Register</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" value="${sessionScope.registerUsername}">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text" value="${sessionScope.registerEmail}">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <div class="form-group">
                <label for="security-question-input">Choose a Security Question</label><br>
                <input list="security-question" id="security-question-input" name ="security-question" class="form-control">
                <datalist id="security-question">
                    <option value="What was the name of your first pet?"></option>
                    <option value="What city where you born in?"></option>
                    <option value="What is your best friends name?"></option>
                </datalist>
            </div>
            <div class="form-group">
                <label for="security-answer">Answer for Security Question</label>
                <input type="text" class="form-control" id="security-answer" name="security-answer">
            </div>
            <div class="d-flex justify-content-center">
                <input type="submit" class="btn btn-block my-5 w-50">
            </div>
        </form>
        <div class="text-center"><a href="/login">Already a user? Log in!</a></div>
    </div>
</body>
</html>
