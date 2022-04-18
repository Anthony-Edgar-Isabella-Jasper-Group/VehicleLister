<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome To Vehicle Lister!"/>
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
    <c:if test="${sessionScope.user.username == null}">
        <div class="container">
            <div class="container text-center">
                <h2 class="mt-5">Have a car, truck or any vehicle you want to sell?
                    <br>
                    Create a profile and start listing your vehicle
                </h2>
                <a class="btn btn-secondary btn-lg mt-5" href="/register" role="button">Sign up!</a>
            </div>
        </div>
    </c:if>
    <div class="container">
        <h1 class="mb-5 mt-3 text-center"><u>Browse Current Ads</u></h1>
        <div id="filters">
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="makesFilterDropdownButton" data-toggle="dropdown">
                    Select Make
                </button>
                <div class="dropdown-menu" id="makesFilterDropdown"></div>
            </div>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="typesFilterDropdownButton" data-toggle="dropdown">
                    Select Type
                </button>
                <div class="dropdown-menu" id="typesFilterDropdown"></div>
            </div>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="colorsFilterDropdownButton" data-toggle="dropdown">
                    Select Color
                </button>
                <div class="dropdown-menu" id="colorsFilterDropdown"></div>
            </div>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="yearsFilterDropdownButton" data-toggle="dropdown">
                    Select Year
                </button>
                <div class="dropdown-menu" id="yearsFilterDropdown"></div>
            </div>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="purposeFilterDropdownButton" data-toggle="dropdown">
                    Select Purpose
                </button>
                <div class="dropdown-menu" id="purposeFilterDropdown"></div>
            </div>
            <button class="btn" id="clearFiltersButton">Clear Filters</button>
        </div>
        <div id="vehicles" class="row d-flex justify-content-center"></div>
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
                            <dt>Purposes</dt>
                            <dd id="vehiclePurposes"></dd>
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
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
		"use strict";
		let displayVehicles = vehiclesList => {
			let vehiclesDiv = document.getElementById("vehicles");
			vehiclesDiv.innerText = "";
			if (vehiclesList.length === 0) {
				let noResultsDiv = document.createElement("div");
				noResultsDiv.innerText = "No vehicles to display :(";
				vehiclesDiv.appendChild(noResultsDiv);
			} else {
				vehiclesList.forEach(vehicle => {
					let vehicleCard = document.createElement("div");
					vehicleCard.setAttribute("class", "card col-3 mx-3 mb-3 px-0");
					vehicleCard.setAttribute("style", "width: 18rem");
					let vehicleCardBody = document.createElement("div");
					vehicleCardBody.setAttribute("class", "card-body");
					vehicleCardBody.innerHTML = "<h5 class=\"card-title\">" + vehicle.year + " " + vehicle.make + " " + vehicle.model + "</h5>" +
						"<h6 class=\"card-subtitle text-muted\">$" + vehicle.price + "</h6>";
					let vehicleCardFooter = document.createElement("div");
					vehicleCardFooter.setAttribute("class", "card-footer d-flex justify-content-center");
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
						let oneVehiclePurposes;
						vehicle.purposes.forEach((purpose, index) => {
							if (index === 0) {
								oneVehiclePurposes = purpose;
							} else {
								oneVehiclePurposes += ", " + purpose;
							}
						});
						$('#vehiclePurposes').text(oneVehiclePurposes);
						$('#vehicleDescription').text(vehicle.description);
					});
					newButton.innerText = "More Info";
					vehicleCardFooter.appendChild(newButton);
					vehicleCard.appendChild(vehicleCardBody);
					vehicleCard.appendChild(vehicleCardFooter);
					vehiclesDiv.appendChild(vehicleCard);
				});
			}
		}
		let fillDropdownMenus = () => {
			let makesDropdown = document.getElementById("makesFilterDropdown");
			let clearMakeFilter = document.createElement("button");
			clearMakeFilter.setAttribute("class", "dropdown-item");
			clearMakeFilter.innerText = "[Clear Filter]";
			clearMakeFilter.addEventListener("click", () => {
				selectedMake = null;
				filterVehicles();
			});
			makesDropdown.appendChild(clearMakeFilter);
			makesArray.forEach(make => {
				let newMake = document.createElement("button");
				newMake.setAttribute("class", "dropdown-item");
				newMake.innerText = make;
				newMake.addEventListener("click", () => {
					selectedMake = make;
					filterVehicles();
				});
				makesDropdown.appendChild(newMake);
			});
			let yearsDropdown = document.getElementById("yearsFilterDropdown");
			let clearYearFilter = document.createElement("button");
			clearYearFilter.setAttribute("class", "dropdown-item");
			clearYearFilter.innerText = "[Clear Filter]";
			clearYearFilter.addEventListener("click", () => {
				selectedYear = null;
				filterVehicles();
			});
			yearsDropdown.appendChild(clearYearFilter);
			yearsArray.forEach(year => {
				let newYear = document.createElement("button");
				newYear.setAttribute("class", "dropdown-item");
				newYear.innerText = year;
				newYear.addEventListener("click", () => {
					selectedYear = Number(year);
					filterVehicles();
				});
				yearsDropdown.appendChild(newYear);
			});
			let typesDropdown = document.getElementById("typesFilterDropdown");
			let clearTypeFilter = document.createElement("button");
			clearTypeFilter.setAttribute("class", "dropdown-item");
			clearTypeFilter.innerText = "[Clear Filter]";
			clearTypeFilter.addEventListener("click", () => {
				selectedType = null;
				filterVehicles();
			});
			typesDropdown.appendChild(clearTypeFilter);
			typesArray.forEach(type => {
				let newType = document.createElement("button");
				newType.setAttribute("class", "dropdown-item");
				newType.innerText = type;
				newType.addEventListener("click", () => {
					selectedType = type;
					filterVehicles();
				});
				typesDropdown.appendChild(newType);
			});
			let colorsDropdown = document.getElementById("colorsFilterDropdown");
			let clearColorFilter = document.createElement("button");
			clearColorFilter.setAttribute("class", "dropdown-item");
			clearColorFilter.innerText = "[Clear Filter]";
			clearColorFilter.addEventListener("click", () => {
				selectedColor = null;
				filterVehicles();
			});
			colorsDropdown.appendChild(clearColorFilter);
			colorsArray.forEach(color => {
				let newColor = document.createElement("button");
				newColor.setAttribute("class", "dropdown-item");
				newColor.innerText = color;
				newColor.addEventListener("click", () => {
					selectedColor = color;
					filterVehicles();
				});
				colorsDropdown.appendChild(newColor);
			});
			let purposesDropdown = document.getElementById("purposeFilterDropdown");
			let clearPurposesFilter = document.createElement("button");
			clearPurposesFilter.setAttribute("class", "dropdown-item");
			clearPurposesFilter.innerText = "[Clear Filter]";
			clearPurposesFilter.addEventListener("click", () => {
				selectedPurposes = [];
				filterVehicles();
			});
			purposesDropdown.appendChild(clearPurposesFilter);
			purposesArray.forEach(purpose => {
				let newPurpose = document.createElement("button");
				newPurpose.setAttribute("class", "dropdown-item");
				newPurpose.innerText = purpose;
				newPurpose.addEventListener("click", () => {
					selectedPurposes.push(purpose);
					filterVehicles();
				});
				purposesDropdown.appendChild(newPurpose);
			});
		}
		let filterVehicles = () => {
			let filteredVehiclesList = vehiclesToDisplay;
			if (selectedYear) {
				filteredVehiclesList = filteredVehiclesList.reduce((filteredByYear, vehicle) => {
					if (vehicle.year === selectedYear) {
						filteredByYear.push(vehicle);
					}
					return filteredByYear;
				}, []);
			}
			if (selectedMake) {
				filteredVehiclesList = filteredVehiclesList.reduce((filteredByMake, vehicle) => {
					if (vehicle.make === selectedMake) {
						filteredByMake.push(vehicle);
					}
					return filteredByMake;
				}, []);
			}
			if (selectedColor) {
				filteredVehiclesList = filteredVehiclesList.reduce((filteredByColor, vehicle) => {
					if (vehicle.color === selectedColor) {
						filteredByColor.push(vehicle);
					}
					return filteredByColor;
				}, []);
			}
			if (selectedType) {
				filteredVehiclesList = filteredVehiclesList.reduce((filteredByType, vehicle) => {
					if (vehicle.type === selectedType) {
						filteredByType.push(vehicle);
					}
					return filteredByType;
				}, []);
			}
			if (selectedPurposes.length !== 0) {
				filteredVehiclesList = filteredVehiclesList.reduce((filteredByPurposes, vehicle) => {
					let containsPurpose = true;
					selectedPurposes.forEach(purpose => {
						if (!vehicle.purposes.includes(purpose)) {
							containsPurpose = false;
						}
					});
					if (containsPurpose) {
						filteredByPurposes.push(vehicle);
					}
					return filteredByPurposes;
				}, []);
			}
			displayVehicles(filteredVehiclesList);
		}
		let clearFilters = () => {
			vehiclesToDisplay = vehiclesArray;
			selectedYear = null;
			selectedMake = null;
			selectedType = null;
			selectedColor = null;
			selectedPurposes = [];
			displayVehicles(vehiclesToDisplay);
		}
		let vehiclesArray = [];
		let makesArray = [];
		let typesArray = [];
		let colorsArray = [];
		let yearsArray = [];
		let purposesArray = [];
		let vehiclesToDisplay = [];
		let selectedMake;
		let selectedYear;
		let selectedType;
		let selectedColor;
		let selectedPurposes = [];
		let newVehicle;
		<c:forEach var="vehicle" items="${ads}">
		newVehicle = {
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
			purposes: [],
			description: "${vehicle.description}"
		};
		<c:forEach var="purpose" items="${vehicle.purposes}">
		newVehicle.purposes.push("${purpose}");
		if (!purposesArray.includes("${purpose}")) {
			purposesArray.push("${purpose}");
		}
		</c:forEach>
		vehiclesArray.unshift(newVehicle);
		if (!makesArray.includes(newVehicle.make)) {
			makesArray.push(newVehicle.make);
		}
		if (!typesArray.includes(newVehicle.type)) {
			typesArray.push(newVehicle.type);
		}
		if (!colorsArray.includes(newVehicle.color)) {
			colorsArray.push(newVehicle.color);
		}
		if (!yearsArray.includes(newVehicle.year)) {
			yearsArray.push(newVehicle.year);
		}
		</c:forEach>
		makesArray.sort();
		typesArray.sort();
		colorsArray.sort();
		yearsArray.sort();
		purposesArray.sort();
		document.getElementById("clearFiltersButton").addEventListener("click", clearFilters);
		fillDropdownMenus();
		clearFilters();
    </script>
</body>
</html>