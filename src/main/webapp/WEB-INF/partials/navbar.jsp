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
                        <a class="nav-link" href="/profile">View Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="createAd" data-target="#createAdModal" data-toggle="modal">Create Ad</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Logout</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>

<div class="modal fade" id="createAdModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createAdTitle">Create Ad</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/ads/create" method="post">
                    <div class="form-group">
                        <label for="make">Make</label>
                        <input id="make" name="make" class="form-control" type="text">
                    </div>
                    <div class="form-group">
                        <label for="model">Model</label>
                        <input id="model" name="model" class="form-control" type="text">
                    </div>
                    <div class="form-group">
                        <label for="year">Year</label>
                        <input id="year" name="year" class="form-control" type="text">
                    </div>
                    <div class="form-group">
                        <label for="color">Color</label>
                        <input id="color" name="color" class="form-control" type="text">
                    </div>
                    <div class="form-group">
                        <label for="price">Price</label>
                        <input id="price" name="price" class="form-control" type="text">
                    </div>
                    <div class="form-group">
                        <label for="mileage">Mileage</label>
                        <input id="mileage" name="mileage" class="form-control" type="text">
                    </div>
                    <div class="form-group">
                        <label for="type">Type</label>
                        <input id="type" name="type" class="form-control" type="text">
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <input type="text" id="description" class="form-control">
                    </div>
                    <input type="submit" class="btn btn-primary">
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script>
    "use strict";
    let createAdButton = document.getElementById("createAd");
    createAdButton.addEventListener("click", function() {
        $("#createAdModal").show();
    })

</script>

