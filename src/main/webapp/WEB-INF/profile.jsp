<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <h1 style="text-align: center">user profile name</h1>
    <h3 style="text-align: center">Your Ads</h3>
    <div class="container">
        <div class="row">
            <c:forEach var="ad" items="${ads}">
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <ul style="list-style: none">
                            <li>Make: ${ad.make}</li>
                            <li>Model: ${ad.model}</li>
                            <li>Year: ${ad.year}</li>
                            <li>Color: ${ad.color}</li>
                            <li>Price: ${ad.price}</li>
                            <li>Mileage: ${ad.mileage}</li>
                            <li>Type: ${ad.type}</li>
                        </ul>
                        <hr>
                        <p class="card-text">DESCRIPTION</p>
                        <a class="btn btn-primary">Edit</a>
                        <a class="btn btn-primary">Delete</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>





</body>
</html>