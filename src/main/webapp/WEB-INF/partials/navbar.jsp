<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Vehicle Lister</a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="/ads">Ad Page</a>
            </li>
            <c:choose>
                <c:when test="${sessionScope.user.username == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="/login">Login</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Logout</a>
                    </li>
                </c:otherwise>
            </c:choose>

            <li class="nav-item">
                <a class="nav-link" href="/ads/create">Create Ad</a>
            </li>
        </ul>
        <form class="d-flex">
            <input class="form-control mr-2 mt-3" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-dark mt-3" type="submit">Search</button>
        </form>
    </div>
</nav>

