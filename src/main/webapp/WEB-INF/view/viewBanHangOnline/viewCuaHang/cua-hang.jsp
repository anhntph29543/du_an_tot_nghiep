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
<div style="background: #E7E2E2">
    <div id="header">

        <jsp:include page="../viewHeader/header.jsp">
            <jsp:param name="param1" value="${idLogin}"/>
            <jsp:param name="param2" value="${idGioHang}"/>
        </jsp:include>
    </div>
    <div style="background: white;border-radius: 30px" class="container my-3 ">
        <div>&nbsp;</div>
        <div class="m-3">
            Sản phẩm (20)
            <hr style="padding: 0px;margin: 0px;width: 100px">
        </div>
        <div class="text-center">
            <h2 class="fw-bold">SneakerCentral</h2>
        </div>
        <div class=" d-flex">
            <div class="m-3 col-2 ">
                <nav class=" navbar navbar-expand-m  bg-while col-1 my-5">
                    <div class="bg-while ">

                        <button class="navbar-toggler btn border-0" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent1" aria-controls="navbarSupportedContent1"
                                aria-expanded="false" aria-label="Toggle navigation" style="width: 170px">
                        <span>
                            <img src='<c:url value="/getimage/Logo-Down.png"></c:url>'
                                 style="width: 10px; height: 10px;"/>
                        </span>
                            &nbsp;&nbsp;
                            <span class="fs-6 fw-bold">Thương hiệu </span>
                        </button>
                        <div class="collapse navbar-collapse bg-while container " id="navbarSupportedContent1">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0 mt-3" id="thuongHieu">


                            </ul>
                        </div>
                        <hr style="padding: 0px;margin: 0px;width: 150px">
                    </div>
                </nav>

                <nav class=" navbar navbar-expand-m  bg-while col-1 my-5">
                    <div class="bg-while ">

                        <button class="navbar-toggler btn border-0" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent3" aria-controls="navbarSupportedContent3"
                                aria-expanded="false" aria-label="Toggle navigation" style="width: 130px">
                        <span>
                            <img src='<c:url value="/getimage/Logo-Down.png"></c:url>'
                                 style="width: 10px; height: 10px;"/>
                        </span>
                            &nbsp;&nbsp;&nbsp;
                            <span class="fs-6 fw-bold">Kích cỡ  </span>
                        </button>
                        <div class="collapse navbar-collapse bg-while container " id="navbarSupportedContent3">
                            <ul class=" navbar mb-2 mb-lg-0 mt-3 row d-flex justify-content-start" id="kichCo">


                            </ul>
                        </div>
                        <hr style="padding: 0px;margin: 0px;width: 150px">
                    </div>
                </nav>
                <nav class=" navbar navbar-expand-m  bg-while col-1 my-5">
                    <div class="bg-while ">

                        <button class="navbar-toggler btn border-0" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent4" aria-controls="navbarSupportedContent4"
                                aria-expanded="false" aria-label="Toggle navigation" style="width: 130px">
                        <span>
                            <img src='<c:url value="/getimage/Logo-Down.png"></c:url>'
                                 style="width: 10px; height: 10px;"/>
                        </span>
                            &nbsp;&nbsp;&nbsp;
                            <span class="fs-6 fw-bold">Màu sắc  </span>
                        </button>
                        <div class="collapse navbar-collapse bg-while container " id="navbarSupportedContent4">
                            <ul class="navbar mb-2 mb-lg-0 mt-3 row d-flex justify-content-start " id="mauSac">

                            </ul>
                        </div>
                        <hr style="padding: 0px;margin: 0px;width: 150px">
                    </div>
                </nav>

                <nav class=" navbar navbar-expand-m  bg-while col-1 my-5">
                    <div class="bg-while ">

                        <button class="navbar-toggler btn border-0" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent2" aria-controls="navbarSupportedContent2"
                                aria-expanded="false" aria-label="Toggle navigation" style="width: 150px">
                        <span>
                            <img src='<c:url value="/getimage/Logo-Down.png"></c:url>'
                                 style="width: 10px; height: 10px;"/>
                        </span>
                            &nbsp;&nbsp;&nbsp;
                            <span class="fs-6 fw-bold">Chất liệu   </span>
                        </button>
                        <div class="collapse navbar-collapse bg-while container " id="navbarSupportedContent2">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0 mt-3">
                                <li>a</li>
                                <li>b</li>
                                <li>c</li>
                                <li>d</li>
                                <li>e</li>
                            </ul>
                        </div>
                        <hr style="padding: 0px;margin: 0px;width: 150px">
                    </div>
                </nav>
                <nav class=" navbar navbar-expand-m  bg-while col-1 my-5">
                    <div class="bg-while ">

                        <button class="navbar-toggler btn border-0" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent5" aria-controls="navbarSupportedContent5"
                                aria-expanded="false" aria-label="Toggle navigation" style="width: 130px">
                        <span>
                            <img src='<c:url value="/getimage/Logo-Down.png"></c:url>'
                                 style="width: 10px; height: 10px;"/>
                        </span>
                            &nbsp;&nbsp;&nbsp;
                            <span class="fs-6 fw-bold">Đế giày  </span>
                        </button>
                        <div class="collapse navbar-collapse bg-while container " id="navbarSupportedContent5">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0 mt-3">
                                <li>a</li>
                                <li>b</li>
                                <li>c</li>
                                <li>d</li>
                                <li>e</li>
                            </ul>
                        </div>
                        <hr style="padding: 0px;margin: 0px;width: 150px">
                    </div>
                </nav>

            </div>
            <div class="col-9 ">
                <div class="d-flex justify-content-end mb-3">
                    <div class="dropdown">
                        <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            <span class="fs-6 fw-bold ">Giá bán </span>
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </div>
                </div>

<%--                hien thi san pham--%>
                <div class="mx-auto row nav" id="listSanPham">

                </div>

<%--                hien thi san pham--%>
                <div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
<%--            <div id="123">--%>

<%--            </div>--%>

    </div>
    <div>
        <jsp:include page="../viewFooter/footer.jsp"/>
    </div>

</div>
<script>

    getData()

    getThuongHieu()

    getKichCo()

    getMauSac()
    function getData() {
        fetch('http://localhost:8080/Anh/api/anh-san-pham')
            .then(function (response) {
                return response.json();
            })
            .then(data => {

                console.log(data)

                var htmls=data.map(spct  => {
                    var anhABC = '<c:url value="/getimage/"></c:url>';
                    return "<div class='col-lg-3 col-md-6 col-sm-6 mb-3'>"
                            +  "<a href='/ban-hang-online/datn/detail-san-pham/"+spct.sanPhanCTTuan.sanPham.id+"' style='text-decoration: none;'>"
                                + "<div class='card' style='width: 14rem;'>"
                                    +"<img src='" + anhABC + spct.ma + "'  class='card-img-top'/>"
                                        +"<div class='card-body'>"
                                            + "<span class='card-title fs-5'>"+ spct.sanPhanCTTuan.sanPham.ten + "</span>"
                                            +"<h6 class='card-title fw-bold'>"+ spct.sanPhanCTTuan.sanPham.th.ten+ "</h6>"
                                            +"<span class='fw-bold fs-6 my-3'>"+spct.sanPhanCTTuan.donGia+"</span> "
                                            + "<span class=' fs-6 fw-bold text-decoration-underline'>"+"đ"+"</span>"
                                            +"</div>"
                                + "</div>"
                            + "</a>"
                        + "</div>"
                        ;

                });

                var html=htmls.join('');
                // console.log(html);

                document.getElementById("listSanPham").innerHTML=html;
            })

            .catch(function (err) {
                alert("Lõi");
            });
    }

    function getThuongHieu(){
        fetch('http://localhost:8080/thuonghieu/api')
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                // console.log(data)
                var htmls=data.map(thuongHieu  => {
                    return "<button type='button' class='mb-1 btn btn-outline-dark border-0'>"+thuongHieu.ten+"</button>"
                        ;
                });

                var html=htmls.join('');
                // console.log(html);

                document.getElementById("thuongHieu").innerHTML=html;
            })

            .catch(function (err) {
                alert("Lõi");
            });
    }

    function getKichCo(){
        fetch('http://localhost:8080/KichCo/api')
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                // console.log(data)
                var htmls=data.map(kichCo  => {
                    return "<div class='col-lg-1 col-md-1 col-sm-1 mb-2 me-2  '>"
                        +"<button type='button' "
                        + "class='btn rounded-circle border border-dark m-0 p-0 btn-outline-dark mb-2 me-2 ms-1 ' "
                        + "style='width: 30px;height: 30px;'>"
                        + "<samp >"+kichCo.ten+"</samp>"
                        + "</button>"
                        + "</div>"
                    ;
                });

                var html=htmls.join('');
                // console.log(html);

                document.getElementById("kichCo").innerHTML=html;
            })

            .catch(function (err) {
                alert("Lõi");
            });
    }

    function getMauSac(){
        fetch('http://localhost:8080/MauSac/api')
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                // console.log(data)
                var htmls=data.map(mauSac  => {
                    var mau=mauSac.ten
                    return "<div class='col-lg-1 col-md-1 col-sm-1 mb-2 me-2 '>"
                        + "<button type='button'"
                        + " class='btn rounded-circle border border-2' "
                        + "style='background: "+mau+";width: 30px;height:30px'>"
                        + "</button>"
                        + "</div>"
                        ;
                });

                var html=htmls.join('');
                // console.log(html);

                document.getElementById("mauSac").innerHTML=html;
            })

            .catch(function (err) {
                alert("Lõi");
            });
    }

</script>

</body>

</html>