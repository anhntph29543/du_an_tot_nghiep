<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript">
        // $(document).ready(function () {
        //     new DataTable('#donHang', {
        //         language: {
        //             emptyTable: 'Không có dữ liệu nào',
        //             paginate: {
        //                 previous: '<i class="bi bi-arrow-left"></i>',
        //                 next: '<i class="bi bi-arrow-right"></i>'
        //             }
        //         },
        //         order: [
        //             [4, 'desc'],
        //         ],
        //         pageLength: 4,
        //         info: false,
        //         searching: false,
        //         lengthChange: false
        //     });
        // })
    </script>
    <style>
        .dataTables_length {
            display: none;
        }

        .dataTables_empty {
            display: none;
        }

        .dataTables_info {
            display: none;
        }

        .dataTables_filter {
            display: none;
        }

    </style>
</head>
<body>
<div class=" d-flex">
    <div class=" col-2 ">
        <jsp:include page="../nav-bar.jsp"/>
    </div>
    <div class="col-10 border" style="padding: 10px">
        <div style="text-align: center">
            <h2>Quản lý đơn hàng</h2>
        </div>
        <div>
            <h4>Bộ lọc</h4>
            <form action="/datn/don-hang/search" method="get" class="row">
                <div class="col-md-3">
                    <label>Loại đơn hàng</label>
                    <select class="form-select form-select-sm" name="loaiDon">
                        <option value="" selected>Tất cả</option>
                        <option value="Đơn tại quầy" ${loaiDon=="Đơn tại quầy"?"selected":""}>Đơn tại quầy</option>
                        <option value="Đơn online"${loaiDon=="Đơn online"?"selected":""}>Đơn online</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <br>
                    <button class="btn btn-dark"><i class="bi bi-search"></i></button>
                    <a class="btn btn-danger" type="button" href="/datn/don-hang"><i class="bi bi-x-lg"></i></a>
                </div>
            </form>
        </div>
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" data-bs-toggle="tab" onclick="hienThiDH('all')"
                        type="button" role="tab" aria-selected="true">
                    Tất cả
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" data-bs-toggle="tab" type="button"
                        role="tab" aria-selected="false" onclick="hienThiDH('chờ xác nhận')">
                    Chờ xác nhận
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" data-bs-toggle="tab" onclick="hienThiDH('Chuẩn bị hàng')"
                        type="button" role="tab" aria-selected="false">Chuẩn bị
                    hàng
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" data-bs-toggle="tab" onclick="hienThiDH('Đang giao hàng')"
                        type="button" role="tab" aria-selected="false">
                    Đang giao hàng
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" data-bs-toggle="tab" onclick="hienThiDH('Thành công')"
                        type="button" role="tab" aria-selected="false">
                    Thành công
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" data-bs-toggle="tab" onclick="hienThiDH('Đã hủy')"
                        type="button" role="tab" aria-selected="false">
                    Đã hủy
                </button>
            </li>
        </ul>
        <div>
            <table class="table" id="donHang">
                <thead class="table-dark">
                <tr>
                    <th scope="col">Mã đơn hàng</th>
                    <th scope="col">Khách hàng</th>
                    <th scope="col">Nhân viên</th>
                    <th scope="col">Loại</th>
                    <th scope="col">ngày tạo</th>
                    <th scope="col">Tổng tiền</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Thao tác</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<jsp:include page="don-hang-chi-tiet-modal.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>
<script defer>
    hienThiSanPhamDonHang();
    var loaiDon = "all";
    hienThiDonHang(loaiDon);

    function thongTinDonHang(id) {
        table.destroy();
        hienThiSanPhamDonHang(id)
        detailDataDonHang(id)
    }

    function detailDataDonHang(id) {
        idDonHang = id;
        fetch('http://localhost:8080/DonHang/api/detail/' + idDonHang)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                document.getElementById("maDH").innerHTML = data.ma;
                document.getElementById("khDH").innerHTML = data.kh.ten;
                // document.getElementById("voucher").innerHTML = "";
                // document.getElementById("giaTriVC").innerHTML = "";
                document.getElementById("ttDH").innerHTML = data.tongTien;
                document.getElementById("loaiDH").innerHTML = data.loaiDon;
                // document.getElementById("nvDH").value = data.nhanVien.ten;
                document.getElementById("ngayTaoDH").innerHTML = data.ngayTao;
                document.getElementById("trangThaiDH").innerHTML = data.trangThaiDonHang;
                document.getElementById("ghiChu").value = data.ghiChu;
                if (data.trangThaiDonHang.toString() == "chuẩn bị hàng") {
                    document.getElementById("btnXacNhan").style.display = 'none';
                    document.getElementById("btnGiaoHang").style.display = "block";
                } else {
                    document.getElementById("btnGiaoHang").style.display = "none";
                    document.getElementById("btnXacNhan").style.display = 'block';
                }
            })
    }

    function xacNhan() {
        // const xacNhan = new bootstrap.Modal('#xacNhanModal');
        Swal.fire({
            title: "Bạn có chắc không?",
            text: "Bạn có chắc chắn xác nhận đơn này không?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            cancelButtonText: "Hủy",
            confirmButtonText: "Đúng, tôi muốn xóa!"
        }).then((result) => {
            if (result.isConfirmed) {
                fetch('http://localhost:8080/DonHangCT/api/xacNhan/xacNhan')
                    .then(function (response) {
                        return response.json();
                    })
                    .then(data => {
                        console.log(data.data)
                        if (data.data == "xác nhận thành công") {
                            Swal.fire({
                                icon: "success",
                                text: data.data,
                                showConfirmButton: false,
                                timer: 2500
                            });
                        } else {
                            Swal.fire({
                                icon: "error",
                                text: data.data,
                                showConfirmButton: false,
                                timer: 2500
                            });
                        }
                        hienThiDH(loaiDon)
                        $('#xacNhanModal').modal('hide');
                        // xacNhan.hide()
                    })
            }
        });
    }

    function huyDon() {
        var ghiChu = document.getElementById("ghiChu").value;
        console.log("------------------------")
        console.log(ghiChu)
        if (ghiChu != "") {
            Swal.fire({
                title: "Bạn có chắc không?",
                text: "Bạn có chắc chắn xác nhận đơn này không?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                cancelButtonText: "Hủy",
                confirmButtonText: "Đúng, tôi muốn xóa!"
            }).then((result) => {
                if (result.isConfirmed) {
                    fetch('http://localhost:8080/DonHangCT/api/xacNhan/huyDon?ghiChu=' + ghiChu)
                        .then(function (response) {
                            return response.json();
                        })
                        .then(data => {
                            console.log(data.data)
                            if (data.data == "hủy đơn hàng thành công") {
                                Swal.fire({
                                    icon: "success",
                                    text: data.data,
                                    showConfirmButton: false,
                                    timer: 2500
                                });
                            } else {
                                Swal.fire({
                                    icon: "error",
                                    text: data.data,
                                    showConfirmButton: false,
                                    timer: 2500
                                });
                            }
                            hienThiDH(loaiDon)
                            $('#xacNhanModal').modal('hide');
                        })
                }
            });
        } else {
            Swal.fire({
                icon: "error",
                text: "hãy nhập lý do hủy vào phần ghi chú",
                showConfirmButton: false,
                timer: 2500
            });
        }
    }

    function giaoHang() {
        var ghiChu = document.getElementById("ghiChu").value;
        var phiVC = document.getElementById("phiVanChuyen").value;
        console.log("------------------------")
        console.log(ghiChu)
        if (phiVC < 0) {
            Swal.fire({
                icon: "error",
                text: "phí vận chuyển phải >= 0",
                showConfirmButton: false,
                timer: 2500
            });
        } else {
            Swal.fire({
                title: "Bạn có chắc không?",
                text: "Bạn có chắc chắn giao đơn này không?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                cancelButtonText: "Hủy",
                confirmButtonText: "Đúng, tôi muốn xóa!"
            }).then((result) => {
                if (result.isConfirmed) {
                    fetch('http://localhost:8080/DonHangCT/api/giaoHang/giaoHang?ghiChu=' + ghiChu + '&' + 'phiVC=' + phiVC)
                        .then(function (response) {
                            return response.json();
                        })
                        .then(data => {
                            console.log(data.data)
                            if (data.data == "đã giao cho đơn vị vận chuyển") {
                                Swal.fire({
                                    icon: "success",
                                    text: data.data,
                                    showConfirmButton: false,
                                    timer: 2500
                                });
                            } else {
                                Swal.fire({
                                    icon: "error",
                                    text: data.data,
                                    showConfirmButton: false,
                                    timer: 2500
                                });
                            }
                            hienThiDH(loaiDon)
                            $('#xacNhanModal').modal('hide');
                        })
                }
            });
        }
    }

    function hienThiDH(trangThai) {
        loaiDon = trangThai;
        table2.destroy()
        hienThiDonHang(trangThai)
    }

    function hienThiSanPhamDonHang(idDonHang) {
        fetch('http://localhost:8080/DonHangCT/api/' + idDonHang)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                console.log(data)
                $(document).ready(function () {
                    table = $('#dhct').DataTable({
                        "data": data,

                        "columns": [
                            {"data": 'ma',},
                            {
                                "data": 'anh',
                                "render": function (data, type, row, meta) {
                                    var anhABC = '<c:url value="/getimage/"></c:url>';
                                    return '<img src="' + anhABC + data + '"/>';
                                }
                            },
                            {"data": 'tenSanPham'},
                            {"data": 'mauSac'},
                            {"data": 'kichCo'},
                            {"data": 'chatLieu'},
                            {"data": 'donGia'},
                            {"data": 'soLuong',},
                            {"data": 'tongTien'},
                        ],

                        "pageLength": 4
                    });
                });

            })
    }

    function hienThiDonHang(trangThai) {
        fetch('http://localhost:8080/DonHang/api/getDonHang/trangThai/' + trangThai)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                console.log(data)
                $(document).ready(function () {
                    table2 = $('#donHang').DataTable({
                        "data": data.data,
                        "columns": [
                            {"data": 'ma',},
                            {"data": 'kh.ten'},
                            {"data": 'nhanVien.ten'},
                            {"data": 'loaiDon'},
                            {"data": 'ngayTao'},
                            {"data": 'tongTien'},
                            {"data": 'trangThaiDonHang',},
                            {
                                "data": 'id',
                                "render": function (data, type, row, meta) {
                                    return '<button type="button" class="btn btn-primary" data-bs-toggle="modal"' +
                                        'onclick="thongTinDonHang(`' + data + '`)"' +
                                        'data-bs-target="#xacNhanModal" style="background-color: black">' +
                                        '<i class="bi bi-eye-fill" style="color: white"></i>' +
                                        '</button>';
                                }
                            }
                        ],

                        "pageLength": 4
                    });
                });

            })
    }

    //    /DonHang/api/getDonHang/trangThai
</script>
</body>
</html>