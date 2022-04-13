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
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 id="vehicleTitle" class="modal-title"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body text-center">
                        <p>Are you sure you want to delete this vehicle</p>
                        <form action="/delete" method="POST" id="deleteForm">
                            <label><input type="text" id="deleteVehicleID" name="deleteVehicleID" class="invisible d-none"></label><br>
                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn" form="deleteForm">Confirm</button>
                        <button type="button" class="btn" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="editModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 id="editModalHeader" class="modal-title">Edit your Vehicle Ad</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/edit-vehicle" method="POST" id="editForm">
                            <label><input class="form-control" type="text" id="editVehicleID" name="editVehicleID"></label><br>
                            <label for="editMake">Edit Make</label><br>
                            <input class="form-control" type="text" id="editMake" name="editMake" required><br>
                            <label for="editModel">Edit Model</label><br>
                            <input class="form-control" type="text" id="editModel" name="editModel" required><br>
                            <label for="editYear">Edit Year</label><br>
                            <input class="form-control" type="text" id="editYear" name="editYear" required><br>
                            <label for="editColor">Edit Color</label><br>
                            <input class="form-control" type="text" id="editColor" name="editColor" required><br>
                            <label for="editPrice">Edit Price</label><br>
                            <input class="form-control" type="text" id="editPrice" name="editPrice" required><br>
                            <label for="editMileage">Edit Mileage</label><br>
                            <input class="form-control" type="text" id="editMileage" name="editMileage" required><br>
                            <label for="editType">Edit Type</label><br>
                            <input class="form-control" type="text" id="editType" name="editType" required><br>
                            <label for="editDescription">Edit Description</label><br>
                            <input class="form-control" type="text" id="editDescription" name="editDescription"><br>
                            <label><input type="text" id="editUsername" name="editUsername" class="invisible d-none"></label>
                            <label><input type="text" id="editEmail" name="editEmail" class="invisible d-none"></label>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn" form="editForm">Submit</button>
                        <button type="button" class="btn" data-dismiss="modal">Close</button>
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
                let vehicleCard = document.createElement("div");
                vehicleCard.setAttribute("class", "card");
                vehicleCard.setAttribute("style", "width: 18rem");
                let vehicleCardBody = document.createElement("div");
                vehicleCardBody.setAttribute("class", "card-body");
                vehicleCardBody.innerHTML = "<h5 class=\"card-title\">" + vehicle.year + " " + vehicle.make + " " + vehicle.model + "</h5>" +
                    "<h6 class=\"card-subtitle text-muted\">$" + vehicle.price + "</h6>";
                let vehicleCardFooter = document.createElement("div")
                vehicleCardFooter.setAttribute("class", "card-footer d-flex justify-content-around");
                let editButton = document.createElement("button");
                editButton.setAttribute("type", "button");
                editButton.setAttribute("class", "btn mx-1");
                editButton.setAttribute("data-toggle", "modal");
                editButton.setAttribute("data-target", "#editModal");
                editButton.addEventListener("click", () => {
                    $('#editVehicleID').val(vehicle.id);
                    $('#editUsername').val(vehicle.username);
                    $('#editMake').val(vehicle.make);
                    $('#editModel').val(vehicle.model);
                    $('#editYear').val(vehicle.year);
                    $('#editColor').val(vehicle.color);
                    $('#editPrice').val(vehicle.price);
                    $('#editMileage').val(vehicle.mileage);
                    $('#editType').val(vehicle.type);
                    $('#editDescription').val(vehicle.description);
                    $('#editEmail').val(vehicle.email);
                });
                editButton.innerText= "Edit Ad";
                vehicleCard.appendChild(vehicleCardBody);
                vehicleCardFooter.appendChild(editButton);
                let deleteButton = document.createElement("button");
                deleteButton.setAttribute("type", "button");
                deleteButton.setAttribute("class", "btn mx-1");
                deleteButton.setAttribute("data-toggle", "modal");
                deleteButton.setAttribute("data-target", "#deleteModal");
                deleteButton.addEventListener("click", () => {
                    $('#deleteVehicleID').val(vehicle.id);
                });
                deleteButton.innerText= "Delete";
                vehicleCardFooter.appendChild(deleteButton);
                vehicleCard.append(vehicleCardFooter)
                document.getElementById("vehicles").appendChild(vehicleCard);
              }));
        </script>

    </body>
</html>
