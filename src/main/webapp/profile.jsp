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
            <div id="vehicles" class="row">

            </div>
        </div>



        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

        <script>
            "use strict";
            let vehiclesArray = [];
            <c:forEach var="vehicle" items="${ads}">
            vehiclesArray.push({
                id: ${vehicle.id},
                user_id: ${vehicle.user_id},
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
                newVehicle.innerHTML = "<h3>" + vehicle.year + " " + vehicle.make + " " + vehicle.model + "</h3>" +
                    "<p>" + vehicle.description + "</p>";
                let newButton = document.createElement("button");
                newButton.setAttribute("type", "button");
                newButton.setAttribute("class", "btn btn-primary");
                newButton.setAttribute("data-toggle", "modal");
                newButton.setAttribute("data-target", "#moreInfo");
                newButton.addEventListener("click", () => {
                    $('#vehicleTitle').text(vehicle.year + " " + vehicle.make + " " + vehicle.model);
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
