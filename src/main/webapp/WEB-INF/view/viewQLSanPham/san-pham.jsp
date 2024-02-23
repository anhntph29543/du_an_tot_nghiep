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
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
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
    <div class="col-10 border" style="height: 710px; overflow-y: scroll;overflow-x: hidden;padding: 3px 20px">
        <div style="text-align: center">
            <h2>Sản phẩm</h2>
        </div>
        <%--        //Bo Loc--%>
        <div class="mt-3">
            <h5>
                Bộ Lọc
            </h5>
            <div class="d-flex border border-dark rounded  mx-3">
                <form class="d-flex rounded  mx-3" action="/datn/san-pham/tim-kiem">
                    <div class=" m-5 ">
                        <samp>
                            Tìm kiếm
                        </samp>
                        </br>
                        <div class="input-group flex-nowrap">
                            <div class="input-group mb-3">
                                <input type="text" name="tenSearch" class="form-control" placeholder="Tên sản phẩm"
                                       aria-label="Recipient's username" value="${tenSearch}"
                                       aria-describedby="button-addon2">
                                <button class="btn btn-outline-secondary" type="submit" id="button-addon2"><i
                                        class="bi bi-search"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class=" m-5">
                        <samp>Thương hiệu </samp>
                        </br>
                        <div>
                            <select name="thSearch" class="form-select">
                                <option value="" selected>Chọn thương hiệu</option>
                                <c:forEach items="${listTH}" var="th">
                                    <option value="${th.id}" ${th.id==thSearch?"selected":""}>${th.ten}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </form>
                <div class="d-flex rounded mx-3">
                    <div class="m-5">
                        <div class="m-4">
                            <a href="/datn/san-pham">
                                <button type="button" class="btn btn-outline-danger" data-bs-toggle="tooltip"
                                        data-bs-placement="bottom" title="Xóa lọc">
                                    <i class="bi bi-x-circle"></i>
                                </button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--        //Danh sach san pham --%>
        <div class="  my-3 ">
            <h5>
                Danh sách sản phẩm
            </h5>
            <div class="border border-dark rounded  mx-3  " style="height: 100%">
                <div class=" mt-2 mx-3 d-flex justify-content-end">
                    <a class="btn btn-dark btn-sm mx-2" href="/datn/them-san-pham" role="button">Thêm sản phẩm </a>
                    <a class="btn btn-dark btn-sm " href="/datn/san-pham-chi-tiet/them" role="button">Thêm sản phảm chi tiết </a>
                </div>

                <div>
                    <table class="table" id="example">
                        <thead>
                        <tr>
                            <th scope="col">Mã</th>
                            <th scope="col">Tên Sản Phẩm</th>
                            <th scope="col">Thương Hiệu</th>
                            <th scope="col">Ngày thêm</th>
                            <th scope="col">Chức Năng</th>
                            <th scope="col">Trạng Thái</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listSP}" var="sp" varStatus="stt">
                            <tr>
                                <td>${sp.ma}</td>
                                <td>${sp.ten}</td>
                                <td>${sp.th.ten}</td>
                                <td>${sp.ngayThem}</td>
                                <td>${sp.trangThai==true? "Hoạt động" : "Không hoạt động"}</td>
                                <td>
                                    <a href="/datn/san-pham-chi-tiet/${sp.id}">
                                        <button class="btn btn-dark" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                title="Chi tiết sản phẩm">
                                            <i class="bi bi-eye"></i>
                                        </button>
                                    </a>
                                    <a href="/datn/sua-san-pham/${sp.id}">
                                        <button class="btn btn-dark" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                title="Sửa sản phẩm">
                                            <i class="bi bi-pencil-square"></i>
                                        </button>
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
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>
<script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
</script>
</body>
</html>