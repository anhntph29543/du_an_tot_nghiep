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
<%--<div style="margin-bottom: 20px"></div>--%>
<div class=" d-flex">
    <div class=" col-2 ">
        <jsp:include page="../nav-bar.jsp"/>
    </div>
    <div class="col-10 border" style="padding: 50px 100px<%-- ; width: 1250px   --%>">
        <div style="text-align: center">
            <h2>
                Sửa sản phẩm chi tiết
            </h2>
        </div>
        <div class="mt-3" style="padding: 20px">
            <form:form method="post" action="/datn/san-pham-ct/update/${spct1.id}" modelAttribute="spct1">
                <div class="row">
                        <%--                    thêm thuộc tính--%>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Mã sản phẩm</label>
                            <form:input class="form-control" path="ma" disabled="true"/>
                            <div class="form-text"><form:errors path="ma"/></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tên sản phẩm</label>
                            <form:input class="form-control" path="ten"/>
                            <div class="form-text"><form:errors path="ten"/></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Đơn giá</label>
                            <form:input class="form-control" path="donGia"/>
                            <div class="form-text"><form:errors path="donGia"/></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Số lượng</label>
                            <form:input class="form-control" path="soLuong"/>
                            <div class="form-text"><form:errors path="soLuong"/></div>
                        </div>
                        <div class="mb-3 form-check">
                            <form:checkbox class="form-check-input" id="exampleCheck1" path="trangThai" checked="true"/>
                            <label class="form-check-label" for="exampleCheck1">Hoạt động</label>
                        </div>
                    </div>
                        <%--                    thêm nhanh thuộc tính--%>
                    <div class="col-md-6">
                            <%--                        sản phẩm--%>
                        <div class="mb-3">
                            <label class="form-label">Sản phẩm</label>
                            <div class="input-group">
                                <form:select path="sp" class="form-select" id="inputGroupSelect04"
                                             aria-label="Example select with button addon">
                                    <c:forEach items="${listSP}" var="sp">
                                        <form:option value="${sp}">${sp.ten}</form:option>
                                    </c:forEach>
                                </form:select>
                                <button class="btn btn-outline-dark" type="button">
                                    <i class="bi bi-plus-circle"></i>
                                </button>
                            </div>
                        </div>
                            <%--                        chất liệu--%>
                        <div class="mb-3">
                            <label class="form-label">Chất liệu</label>
                            <div class="input-group">
                                <form:select path="cl" class="form-select" id="inputGroupSelect04"
                                             aria-label="Example select with button addon">
                                    <c:forEach items="${listCL}" var="cl">
                                        <form:option value="${cl}">${cl.ten}</form:option>
                                    </c:forEach>
                                </form:select>
                                <button class="btn btn-outline-dark" type="button">
                                    <i class="bi bi-plus-circle"></i>
                                </button>
                            </div>
                        </div>
                            <%--                        màu sắc--%>
                        <div class="mb-3">
                            <label class="form-label">Màu sắc</label>
                            <div class="input-group">
                                <form:select path="ms" class="form-select" id="inputGroupSelect04"
                                             aria-label="Example select with button addon">
                                    <c:forEach items="${listMS}" var="ms">
                                        <form:option value="${ms}">${ms.ten}</form:option>
                                    </c:forEach>
                                </form:select>
                                <button class="btn btn-outline-dark" type="button">
                                    <i class="bi bi-plus-circle"></i>
                                </button>
                            </div>
                        </div>
                            <%--                        kích thước--%>
                        <div class="mb-3">
                            <label class="form-label">kích cỡ</label>
                            <div class="input-group">
                                <form:select path="kc" class="form-select" id="inputGroupSelect04"
                                             aria-label="Example select with button addon">
                                    <c:forEach items="${listKC}" var="kc">
                                        <form:option value="${kc}">${kc.ten}</form:option>
                                    </c:forEach>
                                </form:select>
                                <button class="btn btn-outline-dark" type="button">
                                    <i class="bi bi-plus-circle"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-dark">Submit</button>
            </form:form>
        </div>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>
</html>