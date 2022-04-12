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
            <div class="modal fade" id="moreInfo" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 id="edit-title" class="modal-title">Edit your Vehicle</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form name="edit vehicle" method="POST" action="/edit-vehicle">
                                <label for="editMake">Edit Make</label>
                                <input type="text" id="editMake">
                                <label for="editModel">Edit Model</label>
                                <input type="text" id="editModel">
                                <label for="editYear">Edit Year</label>
                                <input type="text" id="editYear">
                                <label for="editColor">Edit Color</label>
                                <input type="text" id="editColor">
                                <label for="editVehiclePrice">Edit Price</label>
                                <input type="text" id="editVehiclePrice">
                                <label for="editVehicleMileage">Edit Mileage</label>
                                <input type="text" id="editVehicleMileage">
                                <label for="editVehicleType">Edit Vehicle Type</label>
                                <input type="text" id="editVehicleType">
                                <label for="editVehicleDescription">Edit Description</label>
                                <input type="text" id="editVehicleDescription">
                                <button type="submit">Submit</button>
                            </form>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:forEach var="ad" items="${ads}">
                    <div class="card" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <ul style="list-style: none" id="${ad.id}">
                                <li>Make: ${ad.make}</li>
                                <li>Model: ${ad.model}</li>
                                <li>Year: ${ad.year}</li>
                                <li>Color: ${ad.color}</li>
                                <li>Price: ${ad.price}</li>
                                <li>Mileage: ${ad.mileage}</li>
                                <li>Type: ${ad.type}</li>
                            </ul>
                            <hr>
                            <p class="card-text">${ad.description}</p>
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
