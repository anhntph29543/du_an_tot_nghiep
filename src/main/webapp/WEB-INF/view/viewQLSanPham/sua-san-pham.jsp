
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
    <div class="col-10 border d-flex justify-content-center">
        <div class="col-md-6" style="padding: 100px">
            <h3 style="text-align: center">Sửa sản phẩm</h3>
            <form:form method="post" action="/datn/san-pham/update/${sp.id}" modelAttribute="sp">
                <div class="mb-3">
                    <label class="form-label">Tên sản phẩm</label>
                    <form:input path="ten" type="text" class="form-control"/><br>
                    <form:errors path="ten" cssStyle="color: red"/>
                    <div class="form-text" ${tenError==null?"hidden":""}>
                            ${tenError}
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">Thương hiệu</label>
                    <form:select path="th" class="form-select">
                        <c:forEach items="${listTH}" var="th">
                            <form:option value="${th}">${th.ten}</form:option>
                        </c:forEach>
                    </form:select>
                </div>
                <label class="form-label">Trạng thái</label>
                <div class="mb-3 form-check">
                    <form:checkbox path="trangThai" id="trangThai" class="form-check-input" checked="true"/>
                    <label class="form-check-label" for="trangThai">Hoạt động</label>
                </div>
                <form:button type="submit" class="btn btn-outline-dark" onclick="return confirm('Bạn có chắc không?')">Sửa</form:button>
            </form:form>
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