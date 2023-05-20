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
<style>
.carSlot {
	/* display:flex; */
	border: 2px solid rgb(255, 255, 255);
	width: 150px;
	height: 100px;
	margin-right: 125px;
	margin-bottom: 100px;
}

.bikeB {
	background-image: url('img/motor-sports.png');
	background-repeat: no-repeat;
	background-position: center;
	background-size: 130px 90px;
	color: aliceblue;
	text-align: center;
	font-weight: bold;
}

.hide {
	display: none;
}
</style>
</head>

<body>

	<div class="container-flex">
		<div class=""
			style="margin: 2% 5%; padding: 20px 50px 8% 50px; background-color: rgba(0, 0, 0, 0.7);">
			<h3 class="text-center  mo pb-4">Book Your Parking Slots & Save
				Time.</h3>
			<div class="row">
				<c:forEach begin="1" end="${slot}" step="1" varStatus="loop">
					<div class="col-md-2 carSlot pt-5" data-toggle="modal"
						data-target="#exampleModalCenter" onClick="reply_click(this.id)"
						id="bikeB${loop.count}"></div>
				</c:forEach>
			</div>
		</div>

	</div>

	<!-- signIn modal Code -->

	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content"
				style="background-color: rgb(243, 243, 237, 0.6);">
				<div class="modal-header border-0">
					<h5 class="modal-title" id="exampleModalLongTitle"
						style="color: rgb(13, 156, 238); font-weight: bold;">Login To
						Dashboard</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="col-md-12 Ehide">
						<div class="form-outline">
							<label for="name" class="form-label text-dark">Full Name</label>
							<input type="text" class="form-control form-control-lg" id="name" />

						</div>
					</div>
					<div class="col-md-12 Ehide">
						<div class="form-outline">
							<label class="form-label text-dark" for="bikeNumber">bike
								Number</label> <input type="text" id="bikeNumber"
								class="form-control form-control-lg" />

						</div>
					</div>

					<div class="hide col-md-12 hide">
						<div class="form-outline">
							<label class="form-label text-dark " for="propName">Property
								Name</label> <input type="text" id="propName" value="${prop}"
								class="form-control form-control-lg" />
						</div>
					</div>
					<div class="col-md-12 hide">
						<div class="form-outline">
							<label class="form-label text-dark " for="eleid">Element
								ID</label> <input type="text" id="eleid" value=""
								class="form-control form-control-lg" />
						</div>
					</div>

					<div class="col-md-12 Ehide">
						<div class="form-outline">
							<label for="mobile" class="form-label text-dark">Mobile
								Number</label> <input type="text" class="form-control form-control-lg"
								id="mobile_num" />

						</div>
					</div>
					
					<div class="col-md-12" id="qrCode">
						<div class="form-outline">
							<img class="img-responsive" src="./img/frame.png" alt="QR Code" width="100%">
						</div>
					</div>

				</div>
				<div class="modal-footer border-0">
					<!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
					<button type="button" class="btn btn-primary" id="bookbike">Pay & Book</button>
					<button type="button" class="btn btn-primary" onClick="payNow();" id="pay">PayNow</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function reply_click(clicked_id) {
			$("#eleid").val(clicked_id);
			alert(clicked_id);
		}
		
		function payNow() {
			$('.Ehide').hide();
			$('#pay').hide();
			$('#qrCode').show();
			$('#bookbike').show();
		}
		
		$("#bookbike").click(function(e) {
			e.preventDefault();
			$.ajax({
				type : "GET",
				url : "./Controller",
				data : {
					"flag" : "bookbike",
					"Name" : $('#name').val(),
					"bikeNo" : $('#bikeNumber').val(),
					"propName" : $('#propName').val(),
					"mobile_num" : $('#mobile_num').val(),
					"eleId" : $("#eleid").val()
				},
				success : function(result) {
					if (result == "AlreadyBooked") {
						$('#bookbike').hide();
						$('#qrCode').hide();
						$('.Ehide').show();
						$('#pay').show();
						alert("You Have Already Book A Slot");
					} else {
						$("#" + $("#eleid").val()).addClass("bikeB");
					}
					location.reload();
				},
				error : function(result) {
					alert('error');
				}
			});
		});

		function addbikeclass() {
			$.ajax({
				type : "GET",
				url : "./Controller",
				data : {
					"flag" : "getBikeid",
					"propName" : $('#propName').val()
				},
				success : function(result) {
					alert(result);
					var myObj = JSON.parse(result);
					var count = Object.keys(myObj).length;
					alert(count);
					for (var i = 1; i <= count; i++) {
						$("#" + myObj[i]).addClass("bikeB");
						$("#" + myObj[i]).prop('disabled', true);
					}
				},
				error : function(result) {
					alert('Something went wrong..........');
				}
			});
		}

		$(document).ready(function() {
			addbikeclass();
			$('#bookbike').hide();
			$('#qrCode').hide();
		});
	</script>

</body>

</html>