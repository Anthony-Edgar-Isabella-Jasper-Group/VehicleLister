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
        <h1 style="text-align: center">Hello, ${username}!</h1>
        <h3 style="text-align: center">Your Ads</h3>
        <div class="container">
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
            let vehiclesArray = [];
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
            vehiclesArray.forEach((vehicle => {
                let newVehicle = document.createElement("div");
                newVehicle.innerHTML ="<div class=\"col-3\">" + "<h3>" + vehicle.year + " " + vehicle.make + " " + vehicle.model + "</h3>" +
                    "<p>" + vehicle.description + "</p>" + "</div>";
                let newButton = document.createElement("button");
                newButton.setAttribute("type", "button");
                newButton.setAttribute("class", "btn btn-primary");
                newButton.setAttribute("data-toggle", "modal");
                newButton.setAttribute("data-target", "#moreInfo");
                newButton.addEventListener("click", () => {
                    $('#vehicleTitle').text(vehicle.year + " " + vehicle.make + " " + vehicle.model);
                    $('#vehicleUsername').text(vehicle.username);
                    $('#vehicleEmail').text(vehicle.email);
                    $('#vehicleColor').text("Color: " + vehicle.color);
                    $('#vehiclePrice').text("Price: " + vehicle.price);
                    $('#vehicleMileage').text("Mileage: " + vehicle.mileage);
                    $('#vehicleType').text("Type: " + vehicle.type);
                    $('#vehicleDescription').text("Description: " + vehicle.description);
                });
                newButton.innerText= "More Info";
                newVehicle.appendChild(newButton);
                document.getElementById("vehicles").appendChild(newVehicle);
            }));
        </script>

    </body>
</html>
