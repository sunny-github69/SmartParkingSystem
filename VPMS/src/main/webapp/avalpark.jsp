<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>

    </style>
</head>

<body>

    <div class="container-flex">

        <div class="" style="margin: 6% 15%; padding:50px 50px 8% 50px; background-color: rgba(0, 0, 0, 0.5);">
            <h3 class="text-center  mo pb-4">Parking Available on Your Selected State & City.</h3>
            <table class="table" style="background-color: rgba(252, 252, 252, 0.649);">
                <thead class="">
                    <tr>
                        <th scope="col">S.No</th>
                        <th scope="col">Parking Location</th>
                        <th scope="col">Show Slot for Parking</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${prop}" var="entry">
                    <tr>
                        <th scope="row">${entry.key}</th>
                        <td> ${entry.value}</td>
                        <td><a href="./Controller?flag=carSlot&parkName=${entry.value}" >
                        <input class="btn btn-lg btn-light" type="submit"
                            style="background-color: rgba(6, 252, 158, 0.664); " value="Car Slots" /></a>
                            <a href="./Controller?flag=bikeSlot&parkName=${entry.value}">
                           <input class="btn btn-lg btn-light" type="submit"
                            style="background-color: rgba(6, 252, 158, 0.664); " value="Bike Slots" /></a></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>

    </div>

</body>

</html>