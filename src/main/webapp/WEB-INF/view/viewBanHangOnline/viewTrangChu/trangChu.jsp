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
    <div>
        <jsp:include page="../viewHeader/header.jsp">
            <jsp:param name="param1" value="${idLogin}"/>
            <jsp:param name="param2" value="${idGioHang}"/>

        </jsp:include>
    </div>
    <%--    <div style="background: white;border-radius: 30px" class="container my-3 ">--%>
    <div class=" container my-3">
        <div style="background: white;border-radius: 30px;">
            <div style="position: relative;">
                <img style="width: 100%;border-radius: 30px" src='<c:url value="/getimage/Logo-Banner.png"></c:url>'>
                <div style="position: absolute;bottom: 100px;left: 80px;font-size: 18px;">
                    <div class="fs-2 fw-bold " style="color: white">
                        NIKE AIR FORCE 1
                    </div>
                    <div class="mt-3">
                        <button type="button" class="btn btn-outline-secondary btn-light border-0">
                            <span class="fs-4 fw-bold mx-2">Xem ngay</span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="my-4">
                <h2 class="text-center fw-bold">
                    Sản phẩm mới
                </h2>
                <div class="d-flex justify-content-center">
                    <div>
                        <img src='<c:url value="/getimage/Logo-star.png"></c:url>'>
                    </div>
                    <div class="mx-3">
                        <img src='<c:url value="/getimage/Logo-hr.png"></c:url>'>
                    </div>
                    <div>
                        <img src='<c:url value="/getimage/Logo-star.png"></c:url>'>
                    </div>
                </div>

                <div class="d-flex gap-3 my-5 justify-content-center">
                    <div>
                        <a href="" style="text-decoration: none;">
                            <div class="card" style="width: 14rem;">
                                <img src='<c:url value="/getimage/IMG_1022.jpg"></c:url>' class="card-img-top">
                                <div class="card-body">
                                    <span class="card-title fs-5"> Nike Air Force 1</span>
                                    <h6 class="card-title fw-bold"> Nike Air Force 1</h6>
                                    <span class="fw-bold fs-6 my-3">1000000</span> <span
                                        class=" fs-6 fw-bold text-decoration-underline">đ</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div>
                        <a href="" style="text-decoration: none;">
                            <div class="card" style="width: 14rem;">
                                <img src='<c:url value="/getimage/IMG_1022.jpg"></c:url>' class="card-img-top">
                                <div class="card-body">
                                    <span class="card-title fs-5"> Nike Air Force 1</span>
                                    <h6 class="card-title fw-bold"> Nike Air Force 1</h6>
                                    <span class="fw-bold fs-6 my-3">1000000</span> <span
                                        class=" fs-6 fw-bold text-decoration-underline">đ</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div>
                        <a href="" style="text-decoration: none;">
                            <div class="card" style="width: 14rem;">
                                <img src='<c:url value="/getimage/IMG_1022.jpg"></c:url>' class="card-img-top">
                                <div class="card-body">
                                    <span class="card-title fs-5"> Nike Air Force 1</span>
                                    <h6 class="card-title fw-bold"> Nike Air Force 1</h6>
                                    <span class="fw-bold fs-6 my-3">1000000</span> <span
                                        class=" fs-6 fw-bold text-decoration-underline">đ</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div>
                        <a href="" style="text-decoration: none;">
                            <div class="card" style="width: 14rem;">
                                <img src='<c:url value="/getimage/IMG_1022.jpg"></c:url>' class="card-img-top">
                                <div class="card-body">
                                    <span class="card-title fs-5"> Nike Air Force 1</span>
                                    <h6 class="card-title fw-bold"> Nike Air Force 1</h6>
                                    <span class="fw-bold fs-6 my-3">1000000</span> <span
                                        class=" fs-6 fw-bold text-decoration-underline">đ</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div>
                        <a href="" style="text-decoration: none;">
                            <div class="card" style="width: 14rem;">
                                <img src='<c:url value="/getimage/IMG_1022.jpg"></c:url>' class="card-img-top">
                                <div class="card-body">
                                    <span class="card-title fs-5"> Nike Air Force 1</span>
                                    <h6 class="card-title fw-bold"> Nike Air Force 1</h6>
                                    <span class="fw-bold fs-6 my-3">1000000</span> <span
                                        class=" fs-6 fw-bold text-decoration-underline">đ</span>
                                </div>
                            </div>
                        </a>
                    </div>


                </div>

            </div>
            <div class="d-flex">
                <div class="mx-5 ps-4">
                    <img src='<c:url value="/getimage/image 20.png"></c:url>'>

                </div>
                <div class="mx-4">
                    <h2 class="fst-italic mb-5">
                        Đưa những bước chân lên tầm cao<br> mới
                    </h2>
                    <span>Cùng với nhiều loại sản phẩm kết hợp với màu sắc và kích cỡ khác nhau,<br>
                        <span class="fw-bold">SneakerCentral</span> mang đến cho bạn sự hài lòng nhất với từng sản phẩm.<br>
                        Đưa phong cách của bạn lên tầm cao mới, với nhiều kiểu dáng và <br>
                        phong cách khác nhau
                    </span>
                </div>
            </div>
            <div class="my-4">
                <h2 class="text-center fw-bold">
                    Sản phẩm bán chạy
                </h2>
                <div class="d-flex justify-content-center">
                    <div>
                        <img src='<c:url value="/getimage/Logo-star.png"></c:url>'>
                    </div>
                    <div class="mx-3">
                        <img src='<c:url value="/getimage/Logo-hr.png"></c:url>'>
                    </div>
                    <div>
                        <img src='<c:url value="/getimage/Logo-star.png"></c:url>'>
                    </div>
                </div>
                <div class="d-flex gap-3 mt-5 justify-content-center">
                    <div>
                        <a href="" style="text-decoration: none;">
                            <div class="card" style="width: 14rem;">
                                <img src='<c:url value="/getimage/IMG_1022.jpg"></c:url>' class="card-img-top">
                                <div class="card-body">
                                    <span class="card-title fs-5"> Nike Air Force 1</span>
                                    <h6 class="card-title fw-bold"> Nike Air Force 1</h6>
                                    <span class="fw-bold fs-6 my-3">1000000</span> <span
                                        class=" fs-6 fw-bold text-decoration-underline">đ</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div>
                        <a href="" style="text-decoration: none;">
                            <div class="card" style="width: 14rem;">
                                <img src='<c:url value="/getimage/IMG_1022.jpg"></c:url>' class="card-img-top">
                                <div class="card-body">
                                    <span class="card-title fs-5"> Nike Air Force 1</span>
                                    <h6 class="card-title fw-bold"> Nike Air Force 1</h6>
                                    <span class="fw-bold fs-6 my-3">1000000</span> <span
                                        class=" fs-6 fw-bold text-decoration-underline">đ</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div>
                        <a href="" style="text-decoration: none;">
                            <div class="card" style="width: 14rem;">
                                <img src='<c:url value="/getimage/IMG_1022.jpg"></c:url>' class="card-img-top">
                                <div class="card-body">
                                    <span class="card-title fs-5"> Nike Air Force 1</span>
                                    <h6 class="card-title fw-bold"> Nike Air Force 1</h6>
                                    <span class="fw-bold fs-6 my-3">1000000</span> <span
                                        class=" fs-6 fw-bold text-decoration-underline">đ</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div>
                        <a href="" style="text-decoration: none;">
                            <div class="card" style="width: 14rem;">
                                <img src='<c:url value="/getimage/IMG_1022.jpg"></c:url>' class="card-img-top">
                                <div class="card-body">
                                    <span class="card-title fs-5"> Nike Air Force 1</span>
                                    <h6 class="card-title fw-bold"> Nike Air Force 1</h6>
                                    <span class="fw-bold fs-6 my-3">1000000</span> <span
                                        class=" fs-6 fw-bold text-decoration-underline">đ</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div>
                        <a href="" style="text-decoration: none;">
                            <div class="card" style="width: 14rem;">
                                <img src='<c:url value="/getimage/IMG_1022.jpg"></c:url>' class="card-img-top">
                                <div class="card-body">
                                    <span class="card-title fs-5"> Nike Air Force 1</span>
                                    <h6 class="card-title fw-bold"> Nike Air Force 1</h6>
                                    <span class="fw-bold fs-6 my-3">1000000</span> <span
                                        class=" fs-6 fw-bold text-decoration-underline">đ</span>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div>&nbsp;</div>
                <div>&nbsp;</div>
            </div>
        </div>

    </div>
    <%--    </div>--%>
    <div>
        <jsp:include page="../viewFooter/footer.jsp"/>
    </div>

</div>


</body>

</html>