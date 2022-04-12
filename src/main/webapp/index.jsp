<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Welcome To Vehicle Lister!" />
        </jsp:include>
    </head>
    <body>
        <jsp:include page="/WEB-INF/partials/navbar.jsp" />
        <c:if test="${sessionScope.user.username == null}">
            <div class="container">
                <div class="container text-center">
                    <h2 class="mt-5">Have a car, truck or any vehicle you want to sell? <br> Create a profile and start listing your vehicle</h2>
                    <a class="btn btn-secondary btn-lg mt-5" href="/register" role="button">Sign up!</a>
                </div>
            </div>
        </c:if>
        <div class="container">
            <h1 class="mt-4 text-center">Browse ads</h1>
            <form action="/" method="post">
                <label for="makeSelect">Make <select name="makeSelect" id="makeSelect"></select></label>
                <label for="typeSelect">Type <select name="typeSelect" id="typeSelect"></select></label>
            </form>
            <div id="vehicles" class="row">
            </div>
        </div>
        <div class="modal fade" id="moreInfo" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 id="vehicleTitle" class="modal-title"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <dl>
                            <dt>Posted By</dt>
                            <dd id="vehicleUsername"></dd>
                            <dt>Email</dt>
                            <dd id="vehicleEmail"></dd>
                            <dt>Color</dt>
                            <dd id="vehicleColor"></dd>
                            <dt>Price</dt>
                            <dd id="vehiclePrice"></dd>
                            <dt>Mileage</dt>
                            <dd id="vehicleMileage"></dd>
                            <dt>Type</dt>
                            <dd id="vehicleType"></dd>
                            <dt>Description</dt>
                            <dd id="vehicleDescription"></dd>
                        </dl>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script>
            "use strict";
            let displayVehicles = vehiclesList => {
                vehiclesList.forEach(vehicle => {
                    let vehicleCard = document.createElement("div");
                    vehicleCard.setAttribute("class", "card");
                    vehicleCard.setAttribute("style", "width: 18rem");
                    let vehicleCardBody = document.createElement("div");
                    vehicleCardBody.setAttribute("class", "card-body");
                    vehicleCardBody.innerHTML = "<h5 class=\"card-title\">" + vehicle.year + " " + vehicle.make + " " + vehicle.model + "</h5>" +
                        "<h6 class=\"card-subtitle text-muted\">$" + vehicle.price + "</h6>";
                    let newButton = document.createElement("button");
                    newButton.setAttribute("type", "button");
                    newButton.setAttribute("class", "btn btn-primary");
                    newButton.setAttribute("data-toggle", "modal");
                    newButton.setAttribute("data-target", "#moreInfo");
                    newButton.addEventListener("click", () => {
                        $('#vehicleTitle').text(vehicle.year + " " + vehicle.make + " " + vehicle.model);
                        $('#vehicleUsername').text(vehicle.username);
                        $('#vehicleEmail').text(vehicle.email);
                        $('#vehicleColor').text(vehicle.color);
                        $('#vehiclePrice').text(vehicle.price);
                        $('#vehicleMileage').text(vehicle.mileage);
                        $('#vehicleType').text(vehicle.type);
                        $('#vehicleDescription').text(vehicle.description);
                    });
                    newButton.innerText = "More Info";
                    vehicleCardBody.appendChild(newButton);
                    vehicleCard.appendChild(vehicleCardBody);
                    document.getElementById("vehicles").appendChild(vehicleCard);
                });
            }
            let vehiclesArray = [];
            let makesArray = [];

            <c:forEach var="vehicle" items="${ads}">
            vehiclesArray.push({
                id: ${vehicle.id},
                username: "${vehicle.username}",
                email: "${vehicle.email}",
                make: "${vehicle.make}",
                model: "${vehicle.model}",
                year: ${vehicle.year},
                color: "${vehicle.color}",
                price: ${vehicle.price},
                mileage: ${vehicle.mileage},
                type: "${vehicle.type}",
                description: "${vehicle.description}"
            });
            </c:forEach>
            displayVehicles(vehiclesArray);
        </script>
    </body>
</html>
