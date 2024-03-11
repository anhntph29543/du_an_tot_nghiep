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
        <h4 class="">Quản lý khách hàng</h4>
        <div class="border border-dark rounded  m-3 p-3 ">
            <h5>Thêm khách hàng </h5>
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
                            <h5 class="modal-title" id="exampleModalLabel1">Thêm Khách Hàng</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <!-- ... (previous code) ... -->

                        <div class="modal-body">
                            <div class="row">
                                <!-- Section for uploading an image -->
                                <div class="col-md-4">
                                    <h5>Thêm hình ảnh khách hàng</h5>
                                    <form method="post" id="imageUploadForm" enctype="multipart/form-data">
                                        <label for="imageUpload" class="form-label visually-hidden">Select Image:</label>
                                        <input type="file" class="form-control visually-hidden" id="imageUpload" name="anh" accept="image/*" onchange="previewImage(this)">

                                        <div class="mb-3 position-relative text-center">
                                            <canvas id="imageCanvas" class="img-thumbnail rounded-circle" style="width: 300px; height: 300px;"></canvas>
                                            <label for="imageUpload" class="upload-icon-label" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); cursor: pointer; color: black; font-size: 36px;">
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
                                            <input type="tel" class="form-control" id="sdt" pattern="[0-9]{10}" required>
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
                                            <label for="ngaySinh" class="form-label">Ngày Sinh</label>
                                            <input type="date" class="form-control" id="ngaySinh" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="gioiTinh" class="form-label">Giới Tính</label>
                                            <select class="form-select" id="gioiTinh" required>
                                                <option value="true">Nam</option>
                                                <option value="false">Nữ</option>
                                            </select>
                                        </div>
                                        <%--                                        <div class="mb-3">--%>
                                        <%--                                            <label for="quan" class="form-label">Quận/Huyện</label>--%>
                                        <%--                                            <input type="text" class="form-control" id="quan" required>--%>
                                        <%--                                        </div>--%>
                                        <%--                                        <div class="mb-3">--%>
                                        <%--                                            <label for="phuong" class="form-label">Phường/Xã</label>--%>
                                        <%--                                            <input type="text" class="form-control" id="phuong" required>--%>
                                        <%--                                        </div>--%>
                                        <!-- Add other additional details fields -->
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- ... (remaining code) ... -->

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="button" data-bs-dismiss="modal" class="btn btn-primary" onclick="themKhachHang()">Thêm</button>
                        </div>
                    </div>
                </div>
            </div>

            <%--            <label class="mx-5 my-2">--%>
            <%--                Tên chất liệu--%>
            <%--                <input type="text" name="ten">--%>
            <%--            </label><br>--%>

            <%--            <button class="btn btn-secondary" onclick="handlerCreateChatLieu()">ADD</button>--%>
        </div>

        <div class="border border-dark rounded  m-3 p-4 ">
            <table class="table  " id="table1" style="height: 210px">
                <thead>
                <tr>
                    <th>Tên khách hàng</th>
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

<div class="modal fade " id="khachHang" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Chi tiết khách hàng </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <label style="display: none">
                        ID
                        <input type="text" id="id">
                    </label><br>
                    <label>
                        Mã khách hàng :
                        <input type="text" id="maUD" disabled>
                    </label>
                    <div class="mb-3">
                        <label class="col-form-label">Tên khách hàng:</label>
                        <input id="tenUD" type="text" class="form-control"/><br>
                        <div id="errorTen" class="form-text" style="color: #ff0000"></div>
                    </div>
                    <div class="mb-3">
                        <label class="col-form-label">Email:</label>
                        <input id="emailUD" type="text" class="form-control"/><br>
                        <div id="errorEmail" class="form-text" style="color: red"></div>
                    </div>
                    <div class="mb-3">
                        <label class="col-form-label">Sdt:</label>
                        <input id="sdtUD" type="text" class="form-control"/><br>
                        <div id="errorSdt" class="form-text" style="color: red"></div>
                    </div>
                    <label class="mt-3">
                        Ngày thêm :
                        <p id="ngayThem"></p>
                    </label><br>
                    <label class="mb-3">
                        Trạng thái :
                        <input type="checkbox" id="trangThai"> Hoạt động
                    </label><br>
                    <button class="btn btn-secondary" onclick="handlerUpdateChatLieu()">Update</button>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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
        var ten = document.getElementById("ten").value;
        var email = document.getElementById("email").value;
        var sdt = document.getElementById("sdt").value;
        var ngaySinh = document.getElementById("ngaySinh").value;
        var gioiTinh = document.getElementById("gioiTinh").value;

        var formData = new FormData();
        formData.append("ten", ten);
        formData.append("email", email);
        formData.append("sdt", sdt);
        formData.append("ngaySinh", ngaySinh);
        formData.append("gioiTinh", gioiTinh);

        var imageFile = document.getElementById("imageUpload").files[0];
        formData.append("anh", imageFile);

        addData(formData);
    }

    function previewImage(input) {
        var canvas = document.getElementById("imageCanvas");
        var ctx = canvas.getContext("2d");

        var reader = new FileReader();
        reader.onload = function (e) {
            var img = new Image();
            img.src = e.target.result;

            img.onload = function () {
                canvas.width = img.width;
                canvas.height = img.height;
                ctx.drawImage(img, 0, 0, img.width, img.height);
            };
        };
        reader.readAsDataURL(input.files[0]);
    }

    function openThemKhachHangModal() {
        var myModal = new bootstrap.Modal(document.getElementById('themKhachHangModal'), {
            keyboard: false
        });
        myModal.show();
    }

    start();

    var errorTen = document.getElementById("errorTen");
    var errorTenADD = document.getElementById("errorTenADD");
    var errorEmail = document.getElementById("errorEmail");
    var errorTenADD = document.getElementById("errorTenADD");
    var errorTen = document.getElementById("errorTen");
    var errorTenADD = document.getElementById("errorTenADD");
    const clModal = new bootstrap.Modal('#khachHang');

    function start() {
        getData();
    }


    function addData(data) {
        let options = {
            method: "POST",
            dataType: "json",
            headers: {
                'Accept': 'application/json, text/plain',
                'Content-Type': 'application/json;charset=UTF-8'
            },
            body: JSON.stringify(data)
        }
        fetch('http://localhost:8080/KhachHang/api/add', options)
            .then(function (response) {
                response.json();
                alert("Them thanh cong");
                errorTenADD.innerHTML = "";
                table.destroy();
                getData()
            })
    }

    function handlerUpdateChatLieu() {
        var id = document.querySelector('input[id="id"]').value;
        var ten = document.querySelector('input[id="tenUD"]').value;
        var ma = document.querySelector('input[id="maUD"]').value;
        var ngayThem = new Date();
        var trangThai = document.querySelector('input[id="trangThai"]').checked;
        console.log(trangThai)
        if (ten.trim() == null || ten.trim() == "") {
            errorTen.innerHTML = "Tên trống";
            return;
        }

        var formData = {
            ma: ma,
            ten: ten,
            ngayThem: ngayThem,
            trangThai: trangThai,
        };
        udateChatLieu(id, formData);

    }

    function udateChatLieu(id, data) {
        let options = {
            method: "PUT",
            dataType: "json",
            headers: {
                'Accept': 'application/json, text/plain',
                'Content-Type': 'application/json;charset=UTF-8'
            },
            body: JSON.stringify(data)
        }
        fetch('http://localhost:8080/KhachHang/api/update/' + id, options)
            .then(function (response) {
                response.json();
                alert("Update thanh cong");
                clModal.hide();
                table.destroy();
                getData()
            })
    }

    function detailData(id) {
        errorTen.innerText = null
        fetch('http://localhost:8080/KhachHang/api/detail/' + id)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                console.log(data)
                document.getElementById("maUD").value = data.ma;
                document.getElementById("tenUD").value = data.ten;
                document.getElementById("id").value = data.id;
                document.getElementById("ngayThem").innerHTML = data.ngayThem;
                let trangThai = document.getElementById("trangThai");
                trangThai.checked = data.trangThai;
            })
    }
    var table;
    function getData() {
        fetch('http://localhost:8080/KhachHang/api')
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