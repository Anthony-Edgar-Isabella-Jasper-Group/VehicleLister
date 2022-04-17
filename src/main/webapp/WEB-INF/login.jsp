<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <div class="text-right"><a href="#" data-toggle="modal" data-target="#forgotUsernameModal" >Forgot Username?</a></div>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
                <div class="text-right"><a href="#" data-toggle="modal" data-target="#forgotPasswordModal" >Forgot Password?</a></div>
            </div>
            <div class="d-flex justify-content-center">
                <input type="submit" class="btn btn-block my-5 w-50" value="Log In">
            </div>
        </form>
        <div class="text-center"><a href="/register">Not a user? Sign up!</a></div>
    </div>

    <div class="modal fade" id="forgotUsernameModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <h5 id="forgotUsername" class="modal-title">
                        What is the email you used to sign up?
                    </h5><br>
                    <form action="/forgot-username" method="POST" id="forgotUsernameForm">
                        <label><input type="text" id="userEmail" name="userEmail"></label><br>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn" form="forgotUsernameForm">Confirm</button>
                    <button type="button" class="btn" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="forgotPasswordModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <h5 id="forgotPassword" class="modal-title">
                        To get your security question.<br> What is the email you used to sign up?
                    </h5><br>
                    <form action="/forgot-password" method="POST" id="forgotPasswordForm">
                        <label><input type="text" id="userEmailForPassword" name="userEmailForPassword"></label><br>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn" form="forgotPasswordForm">Confirm</button>
                    <button type="button" class="btn" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <c:if test = "${alert}">
                    <script>
                        window.alert("${message} ${username}");
                    </script>
    </c:if>
    <c:if test = "${reset}">
        <script>
            window.alert("${message}");
        </script>
    </c:if>
<%--    <c:choose>--%>
<%--        <c:when test="${alert == true}">--%>
<%--            <script>--%>
<%--                console.log(${username});--%>
<%--                window.alert("Here is your username " + ${username});--%>
<%--            </script>--%>
<%--        </c:when>--%>
<%--    </c:choose>--%>
</body>
</html>
