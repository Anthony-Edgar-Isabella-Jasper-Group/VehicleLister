<%--
  Created by IntelliJ IDEA.
  User: edgargomez
  Date: 4/11/22
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Individual Vehicle Page</title>
</head>
<body>
        <div class="card" style="width: 18rem;">
            <img src="..." class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <ul style="list-style: none">
                    <li>Make: ${vehicle.getMake()}</li>
                    <li>Model: ${vehicle.getModel()}</li>
                    <li>Year: ${vehicle.getYear()}</li>
                    <li>Color: ${vehicle.getColor()}</li>
                    <li>Price: ${vehicle.getPrice()}</li>
                    <li>Mileage: ${vehicle.getMileage()}</li>
                    <li>Type: ${vehicle.getType()}</li>
                </ul>
            </div>
        </div>
</body>
</html>
