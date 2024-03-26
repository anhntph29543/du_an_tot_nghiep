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
    <script type="text/javascript">
        $(document).ready(function () {
            new DataTable('#example', {
                language: {
                    emptyTable: 'Không có dữ liệu nào',
                    paginate: {
                        previous: '<i class="bi bi-arrow-left"></i>',
                        next: '<i class="bi bi-arrow-right"></i>'
                    }
                },
                order: [
                    [4, 'desc'],
                ],
                pageLength: 4,
                info: false,
                searching: false,
                lengthChange: false
            });
        })
    </script>
</head>
<body>
<div class=" d-flex">
    <div class=" col-2 ">
        <jsp:include page="../nav-bar.jsp"/>
    </div>
    <div class="col-10 border" style="padding: 20px">
        <div style="text-align: center">
            <h2>Đơn hàng chi tiết</h2>
        </div>
        <div class="row border">
            <h4>Thông tin đơn hàng</h4>
            <div class="col-md-6">
                <div class="mb-3">
                    <label class="form-label">Mã đơn hàng: ${dh.ma}</label>
                </div>
                <div class="mb-3">
                    <label class="form-label">Nhân viên: ${dh.nhanVien.ten}</label>
                </div>
                <div class="mb-3">
                    <label class="form-label">Khách hàng: ${dh.kh.ten}</label>
                </div>
                <div class="mb-3">
                    <label class="form-label">Phiếu giảm giá: </label>
                </div>
                <div class="mb-3">
                    <label class="form-label">Loại đơn: ${dh.loaiDon}</label>
                </div>
            </div>
            <div class="col-md-6">
                <div class="mb-3">
                    <label class="form-label">Ngày tạo: ${dh.ngayTao}</label>
                </div>
                <div class="mb-3">
                    <label class="form-label">Ngày thanh toán: ${dh.ngayThanhToan}</label>
                </div>
                <div class="mb-3">
                    <label class="form-label">Tổng tiền: ${dh.tongTien}</label>
                </div>
                <div class="mb-3">
                    <label class="form-label">Hình thức thanh
                        toán: ${dh.hinhThucThanhToan==false?"tiền mặt":"chuyển khoản"}</label>
                </div>
                <div class="mb-3">
                    <label class="form-label">Trạng
                        thái: ${dh.trangThaiDonHang==true?"đã thanh toán":"chưa thanh toán"}</label>
                </div>
            </div>
        </div>
        <h4>Thông tin sản phẩm</h4>
        <table class="table" id="example">
            <thead class="table-dark">
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Mã</th>
                <th scope="col">Ảnh</th>
                <th scope="col">Kích cỡ</th>
                <th scope="col">Màu sắc</th>
                <th scope="col">Chất liệu</th>
                <th scope="col">Đơn giá</th>
                <th scope="col">Số Lượng</th>
                <th scope="col">Mô tả</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listDHCT}" var="dhct" varStatus="stt">
                <tr>
                    <th scope="row">${stt.index+1}</th>
                    <td>${dhct.sanPhanCT.ma}</td>
                    <td>ảnh</td>
                    <td>${dhct.sanPhanCT.kichCo.ten}</td>
                    <td>${dhct.sanPhanCT.mauSac.ten}</td>
                    <td>${dhct.sanPhanCT.chatLieu.ten}</td>
                    <td>${dhct.giaSanPham}</td>
                    <td>${dhct.soLuong}</td>
                    <td>${dhct.sanPhanCT.ten}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
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