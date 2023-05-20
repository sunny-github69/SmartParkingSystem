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
<style>
label {
	color: aquamarine;
}
</style>
</head>

<body>

	<div class="container-flex">
		<!-- <img src="img/parking.png" alt="" class=" pr-3" style="width:100px; height: 130px;display: inline;"> -->

		<div class=""
			style="margin: 6% 20%; padding: 50px 10px 6% 10px; background-color: rgba(0, 0, 0, 0.5);">
			<h2 class="text-center  mo">Welcome to Smart Parking 
				System</h2>
			<h5 class="text-center pb-4 mo">Book Your Parking Slot Online</h5>
			<form action="./Controller" type="POST" onsubmit="return validateForm()">
			<div class="row p-5">
				<div class="col-md-6 mb-4">
					<div class="form-outline">
						<label class="form-label" for="prop_Name">City</label> 
						<input
							type="text" id="city" name="city" class="form-control form-control-lg"
							style="background-color: rgba(255, 255, 255, 0.623);" />

					</div>
					<input style="display:none;"
							type="text" value="searchParking" name="flag" class="form-control form-control-lg"
							style="background-color: rgba(255, 255, 255, 0.623);" />
				</div>

				<div class="col-md-6 mb-4">
					<div class="form-outline">
						<label class="form-label" for="userID">State</label>
						 <input
							type="text" id="state" name="state" class="form-control form-control-lg"
							style="background-color: rgba(255, 255, 255, 0.623);" />

					</div>
				</div>
				<input class="btn btn-lg btn-light bg-transparent mt-4"
					type="submit"
					style="color: beige; font-weight: bold; margin-left: 38%;"
					value="Search Parking" id="searchPark" />
				

				<!-- <button style="color: beige; font-weight: bold; margin-left: 38%;" type="button" class="btn btn-lg btn-light bg-transparent mt-4">Login <img src='img/parking.png" alt="" class=" pr-2"
                        style="width:25px; height: 32px;display: inline;"> </button> -->
			</div>
			</form>
			<a href="./login.html">
            <button class="btn btn-lg btn-light bg-transparent mt-4" 
            style="color: beige; font-weight: bold; margin-left: 45%;" >Login</button>
        </a>
		</div>

	</div>
	<!-- <script>
		$("#searchPark").click(function(e) {
			e.preventDefault();
			$.ajax({
				type : "GET",
				url : "./Controller",
				data : {
					"flag" : "searchParking",
					"city" : $('#city').val(),
					"state" : $('#state').val()
				},
				success : function(result) {
					alert('ok');
				},
				error : function(result) {
					alert('error');
				}
			});
		});
	</script> -->
	<script >function validateForm() {
		  var city = document.getElementById("city").value;
		  var state = document.getElementById("state").value;
		  if (city === "" || state === "") {
		    alert("Please fill in both city and state fields.");
		    return false;
		  }
		  return true;
		}
</script>
	
	
</body>

</html>