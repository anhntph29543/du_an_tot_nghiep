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
    <link href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
    <script defer src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script defer type="text/javascript" src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script defer src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script type="text/javascript">
        <%@include file="../script.js" %>
    </script>

    <style>
        .dataTables_length {
            display: none;
        }

    </style>

</head>
<body>
<div class=" d-flex">
    <div class=" col-2 ">
        <jsp:include page="../nav-bar.jsp"/>


    </div>
    <%--    <div class="col-10 border">--%>
    <%--        khach-hang--%>
    <%--        --%>
    <%--    </div>--%>
    <div class="col-10 border">
        <h4 class="">Quản lý nhân viên</h4>
        <div class="border border-dark rounded  m-3 p-3 ">
            <h5>Thêm nhân viên </h5>
            <div class="col-md-3">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2"
                        onclick="openThemKhachHangModal()">Thêm
                </button>
            </div>
            <div class="modal fade" id="themKhachHangModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel1">Thêm Nhân Viên</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <!-- ... (previous code) ... -->

                        <div class="modal-body">
                            <div class="row">
                                <!-- Section for uploading an image -->
                                <div class="col-md-4">
                                    <h5>Thêm hình ảnh nhân viên</h5>
                                    <form method="post" id="imageUploadForm" enctype="multipart/form-data">
                                        <label for="imageUpload" class="form-label visually-hidden">Select
                                            Image:</label>
                                        <input type="file" class="form-control visually-hidden" id="imageUpload"
                                               name="anh" accept="image/*" onchange="previewImage(this)">

                                        <div class="mb-3 position-relative text-center">
                                            <canvas id="imageCanvas" class="img-thumbnail rounded-circle"
                                                    style="width: 300px; height: 300px;"></canvas>
                                            <label for="imageUpload" class="upload-icon-label"
                                                   style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); cursor: pointer; color: black; font-size: 36px;">
                                                <i class="bi bi-plus"></i> <!-- Plus icon -->
                                            </label>

                                        </div>

                                    </form>
                                </div>


                                <!-- Section for entering personal information -->
                                <div class="col-md-4">
                                    <h5>Personal Information</h5>
                                    <form id="personalInfoForm">
                                        <div class="mb-3">
                                            <label for="ten" class="form-label">Tên</label>
                                            <input type="text" class="form-control" id="ten" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="email" class="form-label">Email</label>
                                            <input type="email" class="form-control" id="email" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="sdt" class="form-label">Số Điện Thoại</label>
                                            <input type="tel" class="form-control" id="sdt" pattern="[0-9]{10}"
                                                   required>
                                        </div>
                                        <%--                                        <div class="mb-3">--%>
                                        <%--                                            <label for="tinh" class="form-label">Tỉnh/Thành phố</label>--%>
                                        <%--                                            <input type="text" class="form-control" id="tinh" required>--%>
                                        <%--                                        </div>--%>

                                    </form>
                                </div>

                                <!-- Section for additional details -->
                                <div class="col-md-4">
                                    <h5>Additional Details</h5>
                                    <form id="additionalDetailsForm">
                                        <div class="mb-3">
                                            <label for="gioiTinh" class="form-label">Giới Tính</label>
                                            <select class="form-select" id="gioiTinh" required>
                                                <option value="true">Nam</option>
                                                <option value="false">Nữ</option>
                                            </select>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>


                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="button" data-bs-dismiss="modal" class="btn btn-primary"
                                    onclick="themKhachHang()">Thêm
                            </button>
                        </div>
                    </div>
                </div>
            </div>


        </div>

        <div class="border border-dark rounded  m-3 p-4 ">
            <table class="table  " id="table1" style="height: 210px">
                <thead>
                <tr>
                    <th>Tên nhân viên</th>
                    <th>SDT</th>
                    <th>Email</th>
                    <th>Trạng thái</th>
                    <th>Action</th>
                </tr>
                </thead>

            </table>
        </div>

    </div>
</div>
<div class="modal fade" id="khachHang" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Chi tiết nhân viên</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <!-- Section for displaying customer image -->
                    <div class="col-md-4">
                        <h5>Ảnh khách hàng</h5>
                        <div class="mb-3 position-relative text-center">
                            <!-- Image frame -->
                            <div id="imageFrame"
                                 style= "width: 300px; height: 300px; border: 1px solid #ced4da; overflow: hidden; position: relative;">
                                <!-- Customer image -->
                                <img id="anhKhachHang" src="/anhduan/' + data.anh'" alt="Ảnh khách hàng"
                                     style="max-width: 100%; max-height: 100%; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
                            </div>
                        </div>
                    </div>

                    <!-- Section for entering personal information -->
                    <div class="col-md-4">
                        <!-- Personal information form -->
                        <div class="mb-3">
                            <input id="idUD" type="text" class="form-control" style="display: none">
                        </div>
                        <div class="mb-3">
                            <label class="col-form-label">Mã nhân viên:</label>
                            <input id="maUD" type="text" class="form-control" disabled>
                        </div>
                        <div class="mb-3">
                            <label class="col-form-label">Tên nhân viên:</label>
                            <input id="tenUD" type="text" class="form-control"/>
                        </div>
                        <div class="mb-3">
                            <label class="col-form-label">Email:</label>
                            <input id="emailUD" type="text" class="form-control"/>
                        </div>
                        <div class="mb-3">
                            <label class="col-form-label">Số điện thoại:</label>
                            <input id="sdtUD" type="text" class="form-control"/>
                        </div>
                        <label class="col-form-label">Trạng thái:</label>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" id="trangThai">
                            <label class="form-check-label" for="trangThai">Hoạt động</label>
                        </div>
                    </div>

                    <!-- Section for additional details -->
                    <div class="col-md-4">
                        <!-- Additional details form -->
                        <!-- ... -->
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="capNhatKhachHang()">Cập nhật</button>

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
<script defer>
    function themKhachHang() {
        var formData = new FormData();
        formData.append("anh", document.getElementById("imageUpload").files[0]);
        formData.append("ten", document.getElementById("ten").value);
        formData.append("email", document.getElementById("email").value);
        formData.append("sdt", document.getElementById("sdt").value);
        formData.append("gioiTinh", document.getElementById("gioiTinh").value);

        fetch('http://localhost:8080/NhanVien/api/add', {
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (response.ok) {
                    alert("Thêm nhân viên thành công!");
                    $('#themKhachHangModal').modal('hide');
                    getData(); // Reload data after adding a new customer
                } else {
                    throw new Error('Thêm nhân viên thất bại.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("Có lỗi xảy ra khi thêm nhân viên.");
            });
    }

    function previewImage(input) {
        var canvas = document.getElementById('imageCanvas');
        var context = canvas.getContext('2d');
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var img = new Image();
                img.onload = function () {
                    canvas.width = img.width;
                    canvas.height = img.height;
                    context.drawImage(img, 0, 0);
                };
                img.src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        }
    }


    function openThemKhachHangModal() {
        var myModal = new bootstrap.Modal(document.getElementById('themKhachHangModal'), {
            keyboard: false
        });
        myModal.show();
    }

    start();
    const clModal = new bootstrap.Modal('#khachHang');

    function start() {
        getData();
    }
    function detailData(id) {
        fetch('http://localhost:8080/NhanVien/api/detail/' + id)
            .then(function (response) {
                if (!response.ok) {
                    throw new Error('Lỗi khi lấy thông tin nhân viên.');
                }
                return response.json();
            })
            .then(data => {
                $('#idUD').val(data.id);
                $('#maUD').val(data.ma);
                $('#tenUD').val(data.ten);
                $('#emailUD').val(data.email);
                $('#sdtUD').val(data.sdt);
                $('#trangThai').prop('checked', data.trangThai);
                // Hiển thị ảnh khách hàng
                $('#anhKhachHang').attr('src', '/anhduan/' + data.anh);
                // Mở modal chi tiết khách hàng
                $('#khachHang').modal('show');
                // Open modal
                clModal.show();
            })
            .catch(function (err) {
                alert(err.message); // Hiển thị thông báo lỗi
            });
    }
    function capNhatKhachHang() {
        var id= $('#idUD').val();
        var ma = $('#maUD').val(); // Get customer ID
        var ten = $('#tenUD').val(); // Get updated name
        var email = $('#emailUD').val(); // Get updated email
        var sdt = $('#sdtUD').val(); // Get updated phone number
        var trangThai = $('#trangThai').prop('checked'); // Get updated status

        // Prepare data to be sent for update
        var data = {
            ten: ten,
            email: email,
            sdt: sdt,
            trangThai: trangThai
        };

        // Send a PUT request to update customer information

        fetch('http://localhost:8080/NhanVien/api/update/' + id, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
            .then(response => {
                if (response.ok) {
                    alert("Cập nhật thông tin nhân viên thành công!");
                    // Close the modal
                    $('#khachHang').modal('hide');
                    // Reload data after updating customer information
                    getData();
                } else {
                    throw new Error('Cập nhật thông tin nhân viên thất bại.');
                }
            })
        console.log(id)
            .catch(error => {
                console.error('Error:', error);
                alert("Có lỗi xảy ra khi cập nhật thông tin nhân viên.");
            });
    }


    var table;

    function getData() {
        fetch('http://localhost:8080/NhanVien/api')
            .then(function (response) {
                return response.json();
            })
            .then(data => {

                console.log(data)
                if (table) {
                    table.destroy(); // Xóa DataTable cũ trước khi tạo mới
                }
                $(document).ready(function () {
                    table = $('#table1').DataTable({
                        "data": data,

                        "columns": [
                            {"data": 'ten'},
                            {"data": 'sdt'},
                            {"data": 'email'},
                            {
                                "data": 'trangThai',
                                "render": function (data, type, row, meta) {
                                    trangThai = data == true ? "Hoạt động" : "Không hoạt động";
                                    return '<td>' + trangThai + ' </td >';
                                }
                            },
                            {
                                "data": 'id',
                                "render": function (data, type, row, meta) {

                                    return '<button  type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#khachHang" onclick="detailData(`' + data + '`)" >Xem chi tiết </button >';
                                }

                            }


                        ],

                        "pageLength": 4
                    });
                });

            })

            .catch(function (err) {
                alert("Lõi");
            });
    }

</script>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>
</body>
</html>