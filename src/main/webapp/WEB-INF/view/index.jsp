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
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular-route.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
    <script type="text/javascript"><%@include file="script.js" %></script>
</head>
<body>
    <div class=" d-flex">
        <div class="ms-4 border ">
            <nav class=" navbar navbar-expand-m  bg-while col-1">
                <div class="bg-while ">
<%--                    <a class="navbar-brand ju" href="#"><img src="${pageContext.request.contextPath}${images/LogoSC.png}"><br /><samp--%>
<%--                            class="mx-3">SneckerCentro</samp></a>--%>
                        <a class="navbar-brand ju" href="#"><img src='<c:url value="/getimage/LogoSC.png"></c:url>' ><br />
                        <samp class="mx-3 fw-bold">SneckerCentro</samp></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span><img src= '<c:url value="/getimage/Logo-Down.png"></c:url>' style="width: 15px; height: 15px;" /></span>
                    </button>
                    <div class="collapse navbar-collapse bg-while container " id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 mt-3">
                            <div>
                                <li class="nav-item mt-3 fw-bold">
                                    <a class="nav-link active" aria-current="page" href="#">
                                        <img src='<c:url value="/getimage/Logo-Home.png"></c:url>' /> &nbsp; &nbsp;Trang chủ</a>
                                </li>
                            </div>
                            <div>
                                <li class="nav-item mt-3 fw-bold">
                                    <a class="nav-link" href="#">
                                        <img src='<c:url value="/getimage/Logo-store.png"></c:url>' /> &nbsp; &nbsp;Bán hàng</a>
                                </li>
                            </div>
                            <div>
                                <li class="nav-item mt-3 fw-bold">
                                    <a class="nav-link" href="#">
                                        <img src='<c:url value="/getimage/Logo-DonHang.png"></c:url>' />&nbsp; &nbsp;Đơn hàng </a>
                                </li>
                            </div>
                            <div>
                                <li class="nav-item dropdown mt-3 fw-bold">
                                    <a class="nav-link dropdown-toggle mt-2" href="#" id="navbarDropdown" role="button"
                                       data-bs-toggle="dropdown" aria-expanded="false">
                                        <img src= '<c:url value="/getimage/Logo-Giay.png"></c:url>' /> &nbsp; &nbsp;Sản phẩm
                                    </a>
                                    <ul class="dropdown-menu  flex-column" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item mt-2" href="#"> &nbsp; &nbsp;Màu sắc</a></li>
                                        <li><a class="dropdown-item" href="#">&nbsp; &nbsp;Thương hiệu</a></li>
                                        <!-- <li>
                                            <hr class="dropdown-divider">
                                        </li> -->
                                        <li><a class="dropdown-item mt-2" href="#">&nbsp; &nbsp;Kích cỡ</a></li>
                                        <li><a class="dropdown-item mt-2" href="#">&nbsp; &nbsp;Chất liệu</a></li>

                                    </ul>
                                </li>
                            </div>

                            <div>
                                <li class="nav-item mt-3 fw-bold">
                                    <a class="nav-link" href="#">
                                        <img src= '<c:url value="/getimage/Logo-Voucher.png"></c:url>' />&nbsp; &nbsp;Giảm giá </a>
                                </li>
                            </div>
                            <div>
                                <li class="nav-item mt-3 fw-bold">
                                    <a class="nav-link" href="#">
                                        <img src= '<c:url value="/getimage/Logo-user.png"></c:url>'/>&nbsp; &nbsp;Khách hàng </a>
                                </li>
                            </div>
                            <div>
                                <li class="nav-item mt-3 fw-bold">
                                    <a class="nav-link" href="#">
                                        <img src='<c:url value="/getimage/Logo-user.png"></c:url>' />&nbsp; &nbsp;Nhân viên </a>
                                </li>
                            </div>
                            <div>
                                <li class="nav-item mt-3 fw-bold">
                                    <a class="nav-link" href="#">
                                        <img src= '<c:url value="/getimage/Logo-login.png"></c:url>'/>&nbsp; &nbsp;Đăng xuất</a>
                                </li>
                            </div>
                            <!-- <div>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                        Dropdown
                                    </a>
                                    <ul class="dropdown-menu  flex-column" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="#">Action</a></li>
                                        <li><a class="dropdown-item" href="#">Another action</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                                    </ul>
                                </li>
                            </div>
                            <div>
                                <li class="nav-item">
                                    <a class="nav-link disabled" href="#" tabindex="-1"
                                        aria-disabled="true">Disabled</a>
                                </li>
                            </div> -->
                        </ul>

                    </div>
                </div>
            </nav>
        </div>
        <div class="bg-light col-10 border ms-3" style="height: 1000px;">
            <jsp:include page="viewQLSanPham/san-pham.jsp"/>
<%--            <%--%>
<%--                 if(request.getParameter("p")!=null)--%>
<%--             {--%>
<%--                  String p = request.getParameter("p");--%>
<%--            %>--%>
<%--                <jsp:include page="<%=p+".jsp"%>"/>--%>
<%--             <%--%>
<%--                }--%>
<%--             %>--%>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
            integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
            integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
            crossorigin="anonymous"></script>
</body>
</html>