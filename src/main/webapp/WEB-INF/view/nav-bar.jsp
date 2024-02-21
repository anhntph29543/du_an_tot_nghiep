<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="mx-4 border ">
    <nav class=" navbar navbar-expand-m  bg-while col-1">
        <div class="bg-while ">
            <%--                    <a class="navbar-brand ju" href="#"><img src="${pageContext.request.contextPath}${images/LogoSC.png}"><br /><samp--%>
            <%--                            class="mx-3">SneckerCentro</samp></a>--%>
            <a class="navbar-brand ju" href="home"><img src='<c:url value="/getimage/LogoSC.png"></c:url>' ><br />
                <samp class="mx-3 fw-bold">SneakerCentral</samp></a>

            <div class=" bg-while container " >
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 mt-3">
                    <div>
                        <li class="nav-item mt-3 fw-bold">
                            <a class="nav-link active" aria-current="page" href="/datn/trang-chu">
                                <img src='<c:url value="/getimage/Logo-Home.png"></c:url>' /> &nbsp; &nbsp;Trang chủ</a>
                        </li>
                    </div>
                    <div>
                        <li class="nav-item mt-3 fw-bold">
                            <a class="nav-link" href="/datn/ban-hang">
                                <img src='<c:url value="/getimage/Logo-store.png"></c:url>' /> &nbsp; &nbsp;Bán hàng</a>
                        </li>
                    </div>
                    <div>
                        <li class="nav-item mt-3 fw-bold">
                            <a class="nav-link" href="/datn/don-hang">
                                <img src='<c:url value="/getimage/Logo-DonHang.png"></c:url>' />&nbsp; &nbsp;Đơn hàng </a>
                        </li>
                    </div>
                    <div>
                        <li class="nav-item dropdown mt-3 fw-bold">
                            <a class="nav-link dropdown-toggle mt-2" href="" id="navbarDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                <img src= '<c:url value="/getimage/Logo-Giay.png"></c:url>' /> &nbsp; &nbsp;Sản phẩm
                            </a>
                            <ul class="dropdown-menu  flex-column" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item mt-2" href="/datn/san-pham"> &nbsp; &nbsp;Sản phẩm </a></li>
                                <li><a class="dropdown-item mt-2" href="/datn/mau-sac"> &nbsp; &nbsp;Màu sắc</a></li>
                                <li><a class="dropdown-item" href="/datn/thuong-hieu">&nbsp; &nbsp;Thương hiệu</a></li>
                                <li><a class="dropdown-item mt-2" href="/datn/kich-co">&nbsp; &nbsp;Kích cỡ</a></li>
                                <li><a class="dropdown-item mt-2" href="/datn/chat-lieu">&nbsp; &nbsp;Chất liệu</a></li>
                            </ul>
                        </li>
                    </div>

                    <div>
                        <li class="nav-item mt-3 fw-bold">
                            <a class="nav-link" href="/datn/giam-gia">
                                <img src= '<c:url value="/getimage/Logo-Voucher.png"></c:url>' />&nbsp; &nbsp;Giảm giá </a>
                        </li>
                    </div>
                    <div>
                        <li class="nav-item mt-3 fw-bold">
                            <a class="nav-link" href="/datn/khach-hang">
                                <img src= '<c:url value="/getimage/Logo-user.png"></c:url>'/>&nbsp; &nbsp;Khách hàng </a>
                        </li>
                    </div>
                    <div>
                        <li class="nav-item mt-3 fw-bold">
                            <a class="nav-link" href="/datn/nhan-vien">
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