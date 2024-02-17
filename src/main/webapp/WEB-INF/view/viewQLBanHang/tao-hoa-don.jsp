<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container" style="margin-top: 10px">
    <br>
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <c:if test="${listHD.size()>0}">
            <c:forEach items="${listHD}" var="hd" varStatus="stt">
                <li class="nav-item" role="presentation">
                    <div class="d-flex border border-top-0">
                        <a href="" style="text-decoration: none">
                            <button class="nav-link " data-bs-toggle="tab" type="button"
                                    role="tab">
                                <samp style="color: black">
                                    Hoá đơn ${stt.index+1}
                                </samp>
                            </button>
                        </a>
                        <a href="" class="pt-2 px-2">
                            <img src='<c:url value="/getimage/Logo-Trash.png"></c:url>' />
                        </a>
                    </div>
                </li>
            </c:forEach>
        </c:if>
        <li>
            <c:if test="${listHD.size()<5}">
                <form action="/datn/tao-hoa-don/add" method="post">
                    <button class="btn btn-while border" data-bs-toggle="tooltip" data-bs-placement="right"
                            title="Tạo hoá đơn" >
                        <img src='<c:url value="/getimage/Logo-Plus.png"></c:url>' />
                    </button>
                </form>
            </c:if>
            <c:if test="${listHD.size()>=5}">
                <button class="btn btn-while border " onclick="thongbao()"
                        data-bs-toggle="tooltip" data-bs-placement="right" title="Đã tối đa">
                    <img src='<c:url value="/getimage/Logo-Plus.png"></c:url>' />
                </button>

            </c:if>
        </li>
    </ul>
    <c:if test="${listHD.size()<=0}">
        <div style="text-align: center">
            <h3>Chưa có hoá đơn nào được tạo</h3>
        </div>
    </c:if>
    <div class="ban-hang row" style="margin-top: 10px">
        <div class="gio-hang col-md-9">
            <c:if test="${listHD.size()>0}">
                <!--code giỏ hàng và modal sản phẩm-->
                <!-- Button modal -->
                <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#themSP">
                    <samp style="color: white; font-weight: bolder">
                        Thêm Sản Phẩm
                    </samp>
                </button>
                <!-- Button modal quét qr-->
                <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <samp style="color: white; font-weight: bolder">
                        Quét
                    </samp>
                </button>
                <c:if test="${errorSL==1}">
                    <div class="alert alert-danger d-flex" role="alert">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                             class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img"
                             aria-label="Warning:">
                            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                        </svg>
                        <div>Số lượng sản phẩm còn lại không đủ</div>
                    </div>
                </c:if>
                <c:if test="${errorSL==2}">
                    <div class="alert alert-danger d-flex" role="alert">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                             class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img"
                             aria-label="Warning:">
                            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                        </svg>
                        <div>Số lượng phải lớn hơn 0</div>
                    </div>
                </c:if>
                <table class="table">
                    <thead>
                    <tr>
                        <th>STT</th>
                        <th>Ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Kiểu dáng</th>
                        <th>Màu sắc</th>
                        <th>Kích thước</th>
                        <th>Thương hiệu</th>
                        <th>Số lượng</th>
                        <th>Đơn giá</th>
                        <th>Tổng tiền</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>

                    </tbody>
                </table>
            </c:if>
        </div>

        <%--        end thanh toan--%>
    </div>
</div>


    <script>
        function thongbao() {
            alert("Chỉ được tạo tối đa 5 hoá đơn");
        }
    </script>
