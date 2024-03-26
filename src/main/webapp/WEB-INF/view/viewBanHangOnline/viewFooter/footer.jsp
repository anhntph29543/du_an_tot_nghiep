<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SneakerCentral</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular-route.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet"/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
    <script defer src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script defer type="text/javascript" src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script defer src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>


</head>
<body>
<div class="rounded-bottom" style="background: white;border-radius: 30px;height: 250px">
    <div>
        <div class="d-flex justify-content-between container py-5">
            <div class='logo '>
                <img  src='<c:url value="/getimage/LogoSC.png"></c:url>'><br/>
                <div class='name-shop fs-3 fw-bold ms-4' >&nbsp;SC Shop</div>
                <div class='name-shop fs-3 fw-bold ms-4' >&nbsp;SneakerCentral</div>
            </div>
            <div>
                <div class='fs-4 fw-bold '>
                    Về chúng tôi
                </div>
                <div>

                    Về chúng tôi <br />
                    Điạ chỉ cửa hàng <br />
                    Liên lạc <br />
                    Theo dõi đơn hàng <br />
                </div>
            </div>

            <div>
                <div class='fs-4 fw-bold '>
                    Liên kết hữu ích
                </div>
                <div>

                    Chính sách đổi trả  <br />
                    Chính sách hỗi trợ<br />
                    Hướng dẫn chọn size  <br />
                    Câu hỏi thường gặp  <br />
                </div>
            </div>
            <div>
                <div class='fs-4 fw-bold me-5 '>
                    Mạng xã hội
                </div>
                <div>

                    <img src='<c:url value="/getimage/Logo-Facebook.png"></c:url>'>
                    &nbsp;Facebook  <br />
                    <img src='<c:url value="/getimage/Logo-Tiktok.png"></c:url>'>
                    &nbsp;Tiktok<br />
                    <img src='<c:url value="/getimage/Logo-Youtobe.png"></c:url>'>
                    &nbsp;Youtube <br />
                    <img src='<c:url value="/getimage/Logo-Instagram.png"></c:url>'>
                    &nbsp;Instagram  <br />
                </div>
            </div>
        </div>
    </div>
</div>


</body>

</html>