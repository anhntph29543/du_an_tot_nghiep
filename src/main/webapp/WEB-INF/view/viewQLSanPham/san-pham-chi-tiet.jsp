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
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet"/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
    <script defer src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script defer type="text/javascript" src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script defer src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script defer type="text/javascript">
        $(document).ready(function () {
            new DataTable('#example', {
                language: {
                    emptyTable: 'Không có dữ liệu nào',
                    paginate: {
                        previous: '<i class="bi bi-arrow-left"></i>',
                        next: '<i class="bi bi-arrow-right"></i>'
                    }
                },
                pageLength: 4,
                info: false,
                searching: false,
                lengthChange: false
            });
        })
    </script>
    <script type="text/javascript">
        <%@include file="../script.js" %>
    </script>
</head>
<body>
<div class=" d-flex">
    <div class=" col-2 ">
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
        <div class="mt-3" style="padding: 20px; text-align: center">
            <h5>
                Sản phẩm
            </h5>
            <div class="d-flex border border-dark rounded  mx-3 row" style="padding: 20px 0px 10px 10px">
                <div class="col-md-4">
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" style="background-color: white">Mã sản phẩm</span>
                        <input type="text" class="form-control" value="${sp.ma}" disabled>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" style="background-color: white">Tên sản phẩm</span>
                        <input type="text" class="form-control" value="${sp.ten}" disabled>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="input-group input-group-sm mb-3">
                        <span class="input-group-text" style="background-color: white">Thương hiệu</span>
                        <input type="text" class="form-control" value="${sp.th.ten}" disabled>
                    </div>
                </div>
            </div>
        </div>
        <%--                    Danh sách --%>
        <div class="mt-3" style="padding: 20px">
            <div style=" text-align: center">
                <h5>
                    Sản phẩm chi tiết
                </h5>
            </div>
            <div class="border border-dark rounded mx-3">
                <table class="table" id="example">
                    <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Mã</th>
                        <th scope="col">Tên</th>
                        <th scope="col">Ảnh</th>
                        <th scope="col">Kích cỡ</th>
                        <th scope="col">Màu sắc</th>
                        <th scope="col">Chất liệu</th>
                        <th scope="col">Đơn giá</th>
                        <th scope="col">Số Lượng</th>
                        <th scope="col">Chức Năng</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listSPCT}" var="spct" varStatus="stt">
                        <tr>
                            <th scope="row">${stt.index+1}</th>
                            <td>${spct.ma}</td>
                            <td>${spct.ten}</td>
                            <td>ảnh</td>
                            <td>${spct.kc.ten}</td>
                            <td>${spct.ms.ten}</td>
                            <td>${spct.cl.ten}</td>
                            <td>${spct.donGia}</td>
                            <td>${spct.soLuong}</td>
                            <td>
                                <a class="btn btn-dark border" href="/datn/san-pham-chi-tiet/sua/${spct.id}" role="button">
                                    <i class="bi bi-pencil-square"></i>
                                </a>
                                <a class="btn btn-while" href="#" role="button">
                                        <i class="bi bi-x-circle"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
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