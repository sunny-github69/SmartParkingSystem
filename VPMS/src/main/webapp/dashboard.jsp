<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>

<style>
.card {
	height: 150px;
}
</style>
</head>

<body>

	<div class="container-flex" style="width: 99%;">
		<div class="row">
			<div class="col-md-2">
				<div class="wrapper">
					<div class="sidebar">
						<ul>
							<li><a href="#" onclick="getDashData();"><i
									class="fas fa-home"></i>Dashboard</a></li>
							<li><a href="#"><i class="fas fa-users"></i>Side Menu</a></li>
							<li class="notification1"><a href="#"
								onClick="getcarData();"><i class="fas fa-calendar-week"></i>Car
									Data</a><span class="number1"></span></li>
							<li class="notification2"><a href="#"
								onClick="getbikeData();"><i class="far fa-envelope"></i>Bike
									Data</a><span class="number2"></span></li>
							</li>
							<li><a href="#"><i class="fas fa-signal"></i>Reports</a></li>
						</ul>
						<ul>
							<li><a href="#" onClick="Search();">Search Car</a></li>
							<li><a href="#" onClick="Search();">Search Bike</a></li>
							<li><a href="#"></a></li>
						</ul>
						<div class="userProfile">
							<!-- <a href="#"><i class="far fa-user-circle  xyz"></i></a> -->
							<p class="username">
								${prop}<br>
								<!-- <a href="#">View Profile</a> -->
							</p>
							<a href="./Controller?flag=logout"><i class="fa fa-power-off"
								aria-hidden="true"></i></a>
						</div>
					</div>


				</div>
			</div>
			<div class="hide col-md-12">
				<div class="form-outline">
					<label class="form-label text-dark " for="propName">Property
						Name</label> <input type="text" id="propName" value="${prop}"
						class="form-control form-control-lg" />
				</div>
			</div>
			<div class="col-md-10">
				<nav class="navbar bg-danger navbar-dark mb-5" style="width: 99%;">
					<a class="navbar-brand font-weight-bold" href="#">Welcome
						${prop} Parking</a> <a href="./Controller?flag=logout"
						class="text-light font-weight-bold text-decoration-none">Logout
						<i class="fa fa-power-off text-light" aria-hidden="true"></i>
					</a>

				</nav>
				<table class="table" id="htable"
					style="background-color: white; padding: 20px 70px;">
					<thead class="thead table-info">
						<tr>
							<th>Customer Name</th>
							<th>Mobile No.</th>
							<th>Car Number</th>
							<th>Property Name</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody id="tbody">

					</tbody>
				</table>
				<div class="Dash_pie">
					<div class="card-columns">
						<div class="card bg-danger">
							<div class="card-body text-center">
								<h4 class="card-text text-light pt-4">Total Number Car
									Parked</h4>
								<h5 class="card-text text-light" id="total_Cars"></h5>
							</div>
						</div>
						<div class="card bg-info">
							<div class="card-body text-center">
								<h4 class="card-text text-light pt-4">Total Number Bike
									Parked</h4>
								<h5 class="card-text text-light" id="total_Bikes"></h5>
							</div>
						</div>

					</div>
					<div id="myPlot" style="width: 100%; max-width: 700px"></div>
				</div>
				<div id="search">
					<div class="row p-5" style="background-color: grey;">
						<div class="col-md-3">
							<div class="form-group">
								<label for="exampleFormControlSelect1">Select Vechile
									Type</label> <select class="form-control" name="vtype">
									<option>Bike</option>
									<option>Car</option>
								</select>
							</div>
							<button type="submit" onClick="searchCar();" class="btn btn-primary">Search No.</button>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="vNo">Vechile No.</label> <input
									type="text" class="form-control" id="vNo"
									aria-describedby="vNoHelp">
							</div>
						</div>
						<div class="col-md-3 hide">
							<div class="form-group">
								<label for="Spropname">Prop Name</label> <input value="${prop}"
									type="text" class="form-control" id="Spropname"
									>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
		$('#htable').hide();
		$('#search').hide();

		function reply_click(clicked_id) {
			$("#eleid").val(clicked_id);
			alert(clicked_id);
		}

		function Search() {
			$('#htable').hide();
			$('.Dash_pie').hide();
			$('#search').show();
			alert("ghjgg");
		}

		$("#bookbike").click(function(e) {
			e.preventDefault();
			$.ajax({
				type : "GET",
				url : "./Controller",
				data : {
					"flag" : "loginData",
					"Name" : $('#name').val(),
					"bikeNo" : $('#bikeNumber').val(),
					"propName" : $('#propName').val(),
					"mobile_num" : $('#mobile_num').val(),
					"eleId" : $("#eleid").val()
				},
				success : function(result) {
					var myObj = JSON.parse(result);
					alert(myObj);
					if (result == "AlreadyBooked") {
						alert("You Have Already Book A Slot");
					} else {
						$("#" + $("#eleid").val()).addClass("bikeB");
					}
				},
				error : function(result) {
					alert('error');
				}
			});
		});

		function getDashData() {
			$('#htable').hide();
			$('.Dash_pie').show();
			$.ajax({
				type : "GET",
				url : "./Controller",
				data : {
					"flag" : "getDashData",
					"propName" : $('#propName').val()
				},
				success : function(result) {
					alert(result);
					var myObj = JSON.parse(result);
					$('.number1').empty();
					$('.number2').empty();
					$('#total_Cars').empty();
					$('#total_Bikes').empty();
					$('.number1').append(myObj["totalCars"]);
					$('.number2').append(myObj["totalBikes"]);
					var cars = "Cars  " + myObj["totalCars"];
					$('#total_Cars').append(cars);
					cars = "Bikes  " + myObj["totalBikes"];
					$('#total_Bikes').append(cars);
					const xArray = [ "Bike Vacant Slot", "Car Vacant Slot",
							"Parked Cars", "Parked Bikes" ];
					const yArray = [ parseFloat(myObj["vacBike"]),
							parseFloat(myObj["vacCar"]),
							parseFloat(myObj["totalCars"]),
							parseFloat(myObj["totalBikes"]) ];

					const layout = {
						title : "Smart Parking System Pie Chart"
					};

					const data = [ {
						labels : xArray,
						values : yArray,
						hole : .4,
						type : "pie"
					} ];

					Plotly.newPlot("myPlot", data, layout);

				},
				error : function(result) {
					alert('Something went wrong..........');
				}
			});
		}

		function getcarData() {
			$('.Dash_pie').hide();
			$.ajax({
						type : "GET",
						url : "./Controller",
						data : {
							"flag" : "getcarData",
							"propName" : $('#propName').val()
						},
						success : function(result) {
							alert(result);
							$("#tbody").empty();
							var myObj = JSON.parse(result);
							var count = Object.keys(myObj).length;
							for (var i = 1; i <= count; i++) {
								var array = myObj[i];
								var Html = "<tr><td>"
										+ array[0]
										+ "</td><td>"
										+ array[1]
										+ "</td><td>"
										+ array[2]
										+ "</td><td>"
										+ array[3]
										+ "</td><td style=\"color:red; \"><a href=\"./Controller?prop="
										+ array[3]
										+ "&carNo="
										+ array[2]
										+ "&flag=carDel\"> <i class=\"fa fa-car\" aria-hidden=\"true\"></i> "
										+ " Car Out</td></tr>";

								$('#tbody').append(Html);
							}

							$('#htable').show();
						},
						error : function(result) {
							alert('Something went wrong..........');
						}
					});
		}

		function searchCar() {
			$('.Dash_pie').hide();
			alert($('#Spropname').val()+ $('#vNo').val());
			var vtype = $('select[name="vtype"] option:selected').val();
			$.ajax({
				type : "GET",
				url : "./Controller",
				data : {
					"flag" : "searchCar",
					"propName" : $('#Spropname').val(),
					"carNo" : $('#vNo').val()
				},
				success : function(result) {
					alert(result);
				 $("#tbody").empty();
					var myObj = JSON.parse(result);
					var count = Object.keys(myObj).length;
					for (var i = 1; i <= count; i++) {
						var array = myObj[i];
						var Html = "<tr><td>"
							+ array[0]
							+ "</td><td>"
							+ array[1]
							+ "</td><td>"
							+ array[2]
							+ "</td><td>"
							+ array[3]
							+ "</td><td style=\"color:red; \"><a href=\"./Controller?prop="
							+ array[3]
							+ "&carNo="
							+ array[2]
							+ "&flag=carDel\"> <i class=\"fa fa-car\" aria-hidden=\"true\"></i> "
							+ " Car Out</td></tr>";

						$('#tbody').append(Html);
					}

					$('#htable').show();
				},
				error : function(result) {
					alert('Something went wrong..........');
				}
			});
		}

		function getbikeData() {
			$('.Dash_pie').hide();
			alert($('#propName').val());
			$.ajax({
						type : "GET",
						url : "./Controller",
						data : {
							"flag" : "getbikeData",
							"propName" : $('#propName').val()
						},
						success : function(result) {
							alert(result);
							$("#tbody").empty();
							var myObj = JSON.parse(result);
							var count = Object.keys(myObj).length;
							for (var i = 1; i <= count; i++) {
								var array = myObj[i];
								var Html = "<tr><td>"
										+ array[0]
										+ "</td><td>"
										+ array[1]
										+ "</td><td>"
										+ array[2]
										+ "</td><td>"
										+ array[3]
										+ "</td><td style=\"color:red; \"><a href=\"./Controller?prop="
										+ array[3]
										+ "&bikeNo="
										+ array[2]
										+ "&flag=bikeDel\"> <i class=\"fa fa-motorcycle\" aria-hidden=\"true\"></i> "
										+ " Bike Out</td></tr>";

								$('#tbody').append(Html);
							}

							$('#htable').show();
						},
						error : function(result) {
							alert('Something went wrong..........');
						}
					});
		}

		function searchBike() {
			$('.Dash_pie').hide();
			$.ajax({
				type : "GET",
				url : "./Controller",
				data : {
					"flag" : "searchCar",
					"propName" : $('#Spropname').val(),
					"carNo" : $('#vNo').val()
				},
				success : function(result) {
					alert(result);
					$("#tbody").empty();
					var myObj = JSON.parse(result);
					var count = Object.keys(myObj).length;
					for (var i = 1; i <= count; i++) {
						var array = myObj[i];
						var Html = "<tr><td>"
							+ array[0]
							+ "</td><td>"
							+ array[1]
							+ "</td><td>"
							+ array[2]
							+ "</td><td>"
							+ array[3]
							+ "</td><td style=\"color:red; \"><a href=\"./Controller?prop="
							+ array[3]
							+ "&bikeNo="
							+ array[2]
							+ "&flag=bikeDel\"> <i class=\"fa fa-motorcycle\" aria-hidden=\"true\"></i> "
							+ " Bike Out</td></tr>"; 

						$('#tbody').append(Html);
					}

					$('#htable').show();
				},
				error : function(result) {
					alert('Something went wrong..........');
				}
			});
		}

		$(document).ready(function() {
			getDashData();
		});
	</script>
</body>

</html>