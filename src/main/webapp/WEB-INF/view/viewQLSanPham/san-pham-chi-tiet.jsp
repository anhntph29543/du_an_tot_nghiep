
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
    <script type="text/javascript"><%@include file="../script.js" %></script>
</head>
<body>
<div class=" d-flex">
    <div class=" col-2 " >
        <jsp:include page="../nav-bar.jsp"/>
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
    <div class="col-10 border">
        <div class="mt-3  ">
            <h5>
                Bộ Lọc
            </h5>
            <div class="d-flex border border-dark rounded  mx-3 ">
                <div class=" m-5 ">
                    <samp>
                        Tìm kiếm
                    </samp>
                    </br>
                    <div class="input-group flex-nowrap">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Search....." aria-label="Recipient's username" aria-describedby="button-addon2">
                            <button class="btn btn-outline-secondary" type="button" id="button-addon2"><img src='<c:url value="/getimage/Logo-Search.png"></c:url>' /></button>
                        </div>
                    </div>
                </div>

                <div class=" m-5  ">
                    <samp>Kích cỡ  </samp>
                    </br>
                    <div>
                        <select class="form-select" >
                            <option selected>Choose...</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                </div>
                <div class=" m-5 ">
                    <samp>Màu sắc  </samp>
                    </br>
                    <div>
                        <select class="form-select" >
                            <option selected>Choose...</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <%--                    Danh sách --%>
        <div class="mt-3">
            <h5>
                Danh sách sản phẩm chi tiết
            </h5>
            <div class="border border-dark rounded mx-3">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Mã</th>
                        <th scope="col">Tên</th>
                        <th scope="col">Ảnh </th>
                        <th scope="col">Kích cỡ </th>
                        <th scope="col">Màu sắc </th>
                        <th scope="col">Chất liệu </th>
                        <th scope="col">Đơn giá  </th>
                        <th scope="col">Số Lượng </th>
                        <th scope="col">Chức Năng  </th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>@mdo</td>
                        <td>

                            <a class="btn btn-while border  " href="#" role="button">Sửa </a>
                            <a class="btn btn-dark   " href="#" role="button">Xóa  </a>

                        </td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                        <td>@fat</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td colspan="2">Larry the Bird</td>
                        <td>@twitter</td>
                        <td>@twitter</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
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