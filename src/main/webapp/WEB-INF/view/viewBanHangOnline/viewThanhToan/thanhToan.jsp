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
    <title>SneakerCentral</title>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
<div style="background: #E7E2E2">
    <div>
        <jsp:include page="../viewHeader/header.jsp">
            <jsp:param name="param1" value="${idLogin}"/>
            <jsp:param name="param2" value="${idGioHang}"/>

        </jsp:include>
    </div>
    <div style="background: white;border-radius: 30px" class="container my-3 ">
        <div>&nbsp;</div>
        <div>&nbsp;</div>
        <div>&nbsp;</div>
        <div class="text-center mt-2">
            <h2 class="fw-bold">Thanh toán </h2>
        </div>
        <div class="mt-5 ">
            <div class="d-flex justify-content-center  ">
                <div class="col-6 mx-4 ">
                    <div class="d-flex justify-content-between  ">
                        <div>
                            <h4 class="text-center fw-bold ms-3 ">Thanh toán và giao hàng </h4>
                        </div>
                        <div class="ms-4 d-flex" id="btnTaoMoiThemDiaChi">
                            <button type="button" class="btn btn-outline-dark me-5 border border-dark"
                                    onclick="themMoiDiaChi()">Tạo mới
                            </button>
                        </div>
                        <div class="me-3">
                            <!-- Button trigger modal -->
                            <button type="button"
                                    class="btn btn-outline-dark me-5 border border-dark "
                                    data-bs-toggle="modal" data-bs-target="#exampleModal"
                                    onclick="hienThiAllDiaChiKhachHang()">
                                Chọn địa chỉ
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-lg modal-dialog-scrollable">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Địa chỉ khách hàng </h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body d-flex">
                                            <div class="modal-body" id="diaChiKhachHang">

                                            </div>
                                            <div>
                                                <div class=" mx-2 ">
                                                    <div class="d-flex gap-2 my-3">
                                                        <div>
                                                            <label class="form-label">Họ Và Tên Khách Hàng </label>
                                                            <input type="text" id="hoTenKHModal"
                                                                   class="form-control rounded-pill border border-dark"
                                                                   style="width: 180px">
                                                        </div>
                                                        <div>
                                                            <span>Quốc Gia / Khu Vực </span>
                                                            <h5>Việt Nam </h5>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex gap-2 my-3">
                                                        <div>
                                                            <label class="form-label">Tỉnh / Thành Phố </label><br>
                                                            <select class="form-select rounded-pill border border-dark"
                                                                    aria-label="Default select example" name=""
                                                                    id="provinceModal" onchange="tinh1()"
                                                                    style="width: 180px">
                                                            </select>
                                                        </div>
                                                        <div>
                                                            <label class="form-label">Huyện </label><br>
                                                            <select class="form-select rounded-pill border border-dark"
                                                                    aria-label="Default select example" name=""
                                                                    id="districtModal" onchange="huyen1()"
                                                                    style="width: 180px">
                                                                <option value="">Chọn huyện</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex gap-2 my-3">
                                                        <div>
                                                            <label class="form-label">Phường / Xã </label><br>
                                                            <select class="form-select rounded-pill border border-dark"
                                                                    aria-label="Default select example" name=""
                                                                    id="wardModal" onchange="xa1()"
                                                                    style="width: 180px">
                                                                <option value="">Chọn phường / xã</option>
                                                            </select>
                                                        </div>
                                                        <div>
                                                            <label class="form-label">Địa chỉ </label>
                                                            <input type="text" id="diaChiModal"
                                                                   class="form-control rounded-pill border border-dark"
                                                                   style="width: 180px">
                                                        </div>
                                                    </div>
                                                    <div class=" my-3">
                                                        <label class="form-label ">Số điện thoại </label>
                                                        <input type="text" id="soDienThoaiModal"
                                                               class="form-control rounded-pill border border-dark"
                                                               style="width: 360px">
                                                    </div>
                                                    <div class=" my-3">
                                                        <label class="form-label">Email </label>
                                                        <input type="text" id="emailModal"
                                                               class="form-control rounded-pill border border-dark"
                                                               style="width: 360px">
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="ghiChu" class="form-label">Ghi chú </label>
                                                        <textarea class="form-control border border-dark"
                                                                  id="ghiChuModal" rows="4"
                                                                  style="width: 360px"></textarea>
                                                    </div>
                                                    <div class="d-flex justify-content-center mb-3">
                                                        <div>
                                                            <button type="button" class="btn btn-danger me-2"
                                                                    onclick="huyDiaChi()">Hủy địa chỉ
                                                            </button>
                                                        </div>
                                                        <div>
                                                            <button type="button" class="btn btn-secondary">Cập nhật địa
                                                                chỉ
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-outline-dark" onclick="chonDiaChiMuaHang()">
                                                Chọn
                                            </button>
                                            <button type="button" class="btn btn-dark" onclick="diaChiMacDinh()">
                                                Chọn mặc định
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="me-5 ms-3 ">
                        <div class="d-flex gap-2 my-3">
                            <div>
                                <label class="form-label">Họ Và Tên Khách Hàng </label>
                                <input type="text" id="hoTenKH" class="form-control rounded-pill border border-dark"
                                       style="width: 270px">
                            </div>

                        </div>
                        <div>
                            <span>Quốc Gia / Khu Vực </span>
                            <h5>Việt Nam </h5>
                        </div>
                        <div class="d-flex gap-2 my-3">
                            <div>
                                <label class="form-label">Tỉnh / Thành Phố </label><br>
                                <input type="text" id="tenTinh" class="form-control rounded-pill border border-dark"
                                       style="width: 270px; display: none ">
                                <select class="form-select rounded-pill border border-dark"
                                        aria-label="Default select example" name="" id="province" onchange="tinh()"
                                        style="width: 270px">
                                </select>
                            </div>
                            <div>
                                <label class="form-label">Huyện </label><br>
                                <input type="text" id="tenHuyen" class="form-control rounded-pill border border-dark"
                                       style="width: 270px; display: none">
                                <select class="form-select rounded-pill border border-dark"
                                        aria-label="Default select example" name="" id="district" onchange="huyen()"
                                        style="width: 280px">
                                    <option value="">Chọn huyện</option>
                                </select>
                            </div>
                        </div>
                        <div class="d-flex gap-2 my-3">
                            <div>
                                <label class="form-label">Phường / Xã </label><br>
                                <input type="text" id="tenPhuong" class="form-control rounded-pill border border-dark"
                                       style="width: 270px; display: none">
                                <select class="form-select rounded-pill border border-dark"
                                        aria-label="Default select example" name="" id="ward" onchange="xa()"
                                        style="width: 270px">
                                    <option value="">Chọn phường / xã</option>
                                </select>
                            </div>
                            <div>
                                <label class="form-label">Địa chỉ </label>
                                <input type="text" id="diaChi" class="form-control rounded-pill border border-dark"
                                       style="width: 280px">
                            </div>
                        </div>
                        <div class=" my-3">
                            <label class="form-label ">Số điện thoại </label>
                            <input type="text" id="soDienThoai" class="form-control rounded-pill border border-dark"
                                   style="width: 560px">
                        </div>
                        <div class=" my-3">
                            <label class="form-label">Email </label>
                            <input type="text" id="email" class="form-control rounded-pill border border-dark"
                                   style="width: 560px">
                        </div>
                        <div class="mb-3">
                            <label for="ghiChu" class="form-label">Ghi chú </label>
                            <textarea class="form-control border border-dark" id="ghiChu" rows="4"
                                      style="width: 560px"></textarea>
                        </div>
                    </div>
                </div>


                <div class="col-5">
                    <div class="mt-2">
                        <h4 class="text-center fw-bold ">Đơn hàng của bạn </h4>
                    </div>
                    <div class=" border border-dark border-2 " style="border-radius: 30px;">
                        <div class="fw-bold fs-5  d-flex justify-content-between  mt-3  ">
                            <span class="ms-5">Sản phẩm </span>
                            <span class="me-5">Thành tiền </span>
                        </div>
                        <div id="gioHang">


                        </div>
                        <hr class="mx-4 my-4 border border-dark border-2">
                        <div class="fw-bold fs-5 d-flex justify-content-between ms-5 me-5 mt-3  ">
                            <div>
                                <span>Giảm giá   </span>
                            </div>
                            <div>
                                <span id="tongTienTamTinh">0</span> <span>đ</span>
                            </div>
                        </div>
                        <hr class="mx-4 my-4 border border-dark border-2">

                        <div class="fw-bold fs-5  d-flex justify-content-between ms-5 me-5 mt-3  ">
                            <div>
                                <span>Tổng tiền </span>
                            </div>
                            <div>
                                <span id="tongTienThanhToan">0</span><span>đ</span>

                            </div>
                        </div>
                        <hr class="mx-4 my-4 border border-dark border-2">
                        <div class=" ms-5 mt-3  ">
                            <div class="fw-bold fs-5">
                                <span>Hình thức thanh toán  </span>
                            </div>
                            <div class=" ms-5 me-5 mt-3 fw-bold fs-6">

                                <div class="form-check my-3">
                                    <input class="form-check-input" type="radio" name="flexRadioDefault"
                                           id="flexRadioDefault2" checked>
                                    <label class="form-check-label" for="flexRadioDefault2">
                                        Thanh toán khi nhận hàng
                                    </label>
                                </div>


                            </div>
                        </div>
                        <div class="fw-bold fs-5  d-flex my-4 justify-content-center ">
                            <div>
                                <button type="button" class="btn btn-dark btn-lg"><span
                                        class="fw-bold " onclick="thanhToanDonHang()">Thanh toán </span></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>&nbsp;</div>
        <div>&nbsp;</div>
    </div>
    <div>
        <jsp:include page="../viewFooter/footer.jsp"/>
    </div>

</div>
<script>

    var idLogin = '${idLogin}'
    var idGioHang = '${idGioHang}'
    var idKhachHang = '${idKhachHang}'
    var number = null
    var tongSanPham = 0
    var tongTien = 0

    sanPhamCTTrongGioHang()

    function gioHangOnline() {

        if (idGioHang == "123") {
            var storeNoProduct = '<c:url value="/getimage/Store-no-product.png"></c:url>';
            var html = "<div>"
                + "<img src='" + storeNoProduct + "'  />"
                + "<h5>Bạn chưa đăng nhập chưa thể thêm sản phẩm vào giỏ hàng </h5>"
                + "</div>"
            document.getElementById("gioHang").innerHTML = html;

        } else if (idGioHang != "123" && number == 1) {
            hienThiSPCTGioHang()
        } else {
            var storeNoProduct = '<c:url value="/getimage/Store-no-product.png"></c:url>';
            var html = "<div class='d-grid justify-content-center'>"
                + "<div class='d-flex justify-content-center'>"
                + "<img src='" + storeNoProduct + "'/>"
                + "</div>"
                + "<h5 class='my-4'>Chưa có sản phẩm trong giỏ hàng </h5>"
                + "<button class='btn btn-dark' onclick='trangCuaHang()'>Đến cửa hàng </button>"
                + "</div>"
            document.getElementById("gioHang").innerHTML = html;
        }
    }

    function sanPhamCTTrongGioHang() {
        number = 0
        fetch('http://localhost:8080/GioHangCT/api')
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                console.log(data)
                var htmls = data.map(ghct => {
                    if (ghct.gioHangOnline.id == idGioHang) {
                        number = 1;
                    }
                });
                gioHangOnline()
            })

            .catch(function (err) {
                alert("Lõi");
            });
    }

    function hienThiSPCTGioHang() {
        fetch('http://localhost:8080/GioHangCT/api/spct-gio-hang/' + idGioHang)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                console.log(data)
                var htmls = data.map(ghct => {
                    tongSanPham += ghct.soLuong
                    tongTien += ghct.tongTien
                    var anhABC = '<c:url value="/getimage/"></c:url>';
                    return "<div class='border m-3 ' style='border-radius: 20px;'>"
                        + "<div class='d-flex justify-content-evenly'>"
                        + "<div class='my-2'>"
                        + "<img src='" + anhABC + ghct.anh + "' style='width: 100px;height: 78px;border-radius: 10px'/>"
                        + "</div>"

                        + "<div class='mt-2'>"
                        + "<h6>" + ghct.tenSPCT + "</h6>"
                        + "<div>"
                        + "<button type='button' "
                        + "class='btn rounded-circle border border-2 mx-2' "
                        + "style='background: " + ghct.mauSac + ";width: 30px;height:30px'>"
                        + "</button>"

                        + "<button type='button' "
                        + "class='btn rounded-circle border border-dark m-0 p-0 btn-outline-dark ' "
                        + "style='width: 30px;height: 30px;'>"
                        + "<samp >" + ghct.kichCo + "</samp>"
                        + "</button>"
                        + "</div>"
                        + "</div>"

                        + "<div class='mt-2'>"
                        + "<samp style='color: darkgrey' class='mx-3 fw-bold' >" + ghct.soLuong + "&nbsp;x" + "</samp>"
                        + "</div>"


                        + "<div class='mt-2 '>"
                        + "<span class='fw-bold'>" + ghct.tongTien + "&nbsp;đ" + "</span>"
                        + "</div>"


                        + "</div>"
                        + "</div>"

                        ;

                });
                var html = htmls.join('');
                document.getElementById("gioHang").innerHTML = html;
                // document.getElementById("tongSanPham").innerHTML=tongSanPham;
                document.getElementById("tongTienThanhToan").innerHTML = tongTien;
                // document.getElementById("tongTienDaTinh").innerHTML=tongTien;
            })

            .catch(function (err) {
                alert("Lõi" + err);
            });
    }

    function themMoiDiaChi() {
        var html = "<button type='button' "
                + "class='btn btn btn-dark border border-dark' "
                + "onclick='taoMoiDiaChi()'>Thêm  </button>"
            +"<button type='button' "
                + "class='btn btn btn-dark ms-1 border border-dark' "
                + "onclick='huyThemDiaChi()'>Hủy  </button>";
        apiTinh()
        document.getElementById("btnTaoMoiThemDiaChi").innerHTML = html;
        document.getElementById("hoTenKH").value = "";
        document.getElementById("diaChi").value = "";
        document.getElementById("soDienThoai").value = "";
        document.getElementById("email").value = "";
        document.getElementById("ghiChu").value = "";

    }

    function huyThemDiaChi(){
        var html = "<button type='button' "
            + "class='btn btn-outline-dark me-5 border border-dark' "
            + "onclick='themMoiDiaChi()'>Tạo mới </button>";
        document.getElementById("btnTaoMoiThemDiaChi").innerHTML = html;
        document.getElementById("hoTenKH").value = "";
        document.getElementById("diaChi").value = "";
        document.getElementById("soDienThoai").value = "";
        document.getElementById("email").value = "";
        document.getElementById("ghiChu").value = "";
    }

    function taoMoiDiaChi() {
        var hoTenKH = document.querySelector('input[id="hoTenKH"]').value;
        var diaChi = document.querySelector('input[id="diaChi"]').value;
        var soDienThoai = document.querySelector('input[id="soDienThoai"]').value;
        var email = document.querySelector('input[id="email"]').value;
        var ghiChu = document.querySelector('textarea[id="ghiChu"]').value;
        var tinh = tinhChon
        var huyen = huyenChon
        var xa = xaChon

        var khacHang = {
            id: idKhachHang
        };

        var formData = {
            hoTen: hoTenKH,
            khachHangOnline: khacHang,
            sdt: soDienThoai,
            email: email,
            tinhThanhPho: tinh,
            huyen: huyen,
            phuong: xa,
            diaChi: diaChi,
            ghiChu: ghiChu,
            trangThai: false,
        };
        Swal.fire({
            title: "Bạn có muốn thêm địa chỉ mới không",
            showDenyButton: true,
            showCancelButton: true,
            confirmButtonText: "Thêm mới",
            denyButtonText: `Hủy `
        }).then((result) => {
            /* Read more about isConfirmed, isDenied below */
            if (result.isConfirmed) {
                themDiaChiMoi(formData)
            } else if (result.isDenied) {
                var html = "<button type='button' "
                    + "class='btn btn-outline-dark me-5 border border-dark' "
                    + "onclick='themMoiDiaChi()'>Tạo mới </button>";
                document.getElementById("btnTaoMoiThemDiaChi").innerHTML = html;
                document.getElementById("hoTenKH").value = "";
                document.getElementById("diaChi").value = "";
                document.getElementById("soDienThoai").value = "";
                document.getElementById("email").value = "";
                document.getElementById("ghiChu").value = "";
            }
        });


    }

    function themDiaChiMoi(data) {
        let options = {
            method: "POST",
            dataType: "json",
            headers: {
                'Accept': 'application/json, text/plain',
                'Content-Type': 'application/json;charset=UTF-8'
            },
            body: JSON.stringify(data)
        }
        fetch('http://localhost:8080/DiaChi/api/add', options)
            .then(function (response) {
                response.json();

                Swal.fire({
                    icon: "success",
                    text: "Thêm địa chỉ thành công ",
                    showConfirmButton: false,
                    timer: 2500
                });
                var html = "<button type='button' "
                    + "class='btn btn-outline-dark me-5 border border-dark' "
                    + "onclick='themMoiDiaChi()'>Tạo mới </button>";
                document.getElementById("btnTaoMoiThemDiaChi").innerHTML = html;

            })
    }

    function hienThiAllDiaChiKhachHang() {

        if(idLogin==123){
            var html="<div>Khách hàng chưa đăng nhập</div>";
            document.getElementById("diaChiKhachHang").innerHTML = html;
            return;
        }

        fetch('http://localhost:8080/DiaChi/api')
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                console.log(data)
                var htmls = data.map(diaChi => {
                    if(diaChi.khachHangOnline.id==idKhachHang){
                        var trangThai = diaChi.trangThai == true ? "Mặc định" : "";
                        return "<div class='shadow-lg p-3 mb-5 bg-body rounded btn' style='width: 300px' "
                            + " onclick='chonDiaChi(`" + diaChi.id + "`)'>"
                            + "<div class='fw-bold fs-6'>" + diaChi.hoTen
                            + "<span class='btn btn-danger ms-4 btn-sm'>" + trangThai + "</span>"
                            + "</div>"
                            + "<div>" + "Địa chỉ : " + diaChi.tinhThanhPho + " - " + diaChi.huyen + " - " + diaChi.phuong + " - " + diaChi.diaChi + "</div>"
                            + "<div>" + "Số điện thoại : " + diaChi.sdt + "</div>"
                            + "</div>"
                            ;
                    }

                });
                var html = htmls.join('');
                document.getElementById("diaChiKhachHang").innerHTML = html;

            })

            .catch(function (err) {
                alert("Lõi" + err);
            });
    }

    var idDC = null

    function chonDiaChi(idDiaChi) {
        idDC = idDiaChi
        fetch('http://localhost:8080/DiaChi/api/detail/' + idDiaChi)
            .then(function (response) {
                return response.json();
            })
            .then(data => {

                document.getElementById("hoTenKHModal").value = data.hoTen;
                document.getElementById("diaChiModal").value = data.diaChi;
                document.getElementById("soDienThoaiModal").value = data.sdt;
                document.getElementById("emailModal").value = data.email;
                document.getElementById("ghiChuModal").value = data.ghiChu;
                document.getElementById("provinceModal").options.namedItem(data.tinhThanhPho).selected = true;
                var huyen = "<option value='" + data.huyen + "' id='" + data.huyen + "'>" + data.huyen + "</option>"
                ;
                document.getElementById("districtModal").innerHTML = huyen;
                var xa = "<option value='" + data.phuong + "' id='" + data.phuong + "'>" + data.phuong + "</option>"
                ;
                document.getElementById("wardModal").innerHTML = xa;


            })

            .catch(function (err) {
                alert("Lõi" + err);
            });
    }

    function chonDiaChiMuaHang() {
        fetch('http://localhost:8080/DiaChi/api/detail/' + idDC)
            .then(function (response) {
                return response.json();
            })
            .then(data => {

                document.getElementById("hoTenKH").value = data.hoTen;
                document.getElementById("diaChi").value = data.diaChi;
                document.getElementById("soDienThoai").value = data.sdt;
                document.getElementById("email").value = data.email;
                document.getElementById("ghiChu").value = data.ghiChu;
                document.getElementById("province").options.namedItem(data.tinhThanhPho).selected = true;
                var huyen = "<option value='" + data.huyen + "' id='" + data.huyen + "'>" + data.huyen + "</option>"
                ;
                document.getElementById("district").innerHTML = huyen;
                var xa = "<option value='" + data.phuong + "' id='" + data.phuong + "'>" + data.phuong + "</option>"
                ;
                document.getElementById("ward").innerHTML = xa;

                var html = "<button type='button' "
                    + "class='btn btn-outline-dark me-5 border border-dark' "
                    + "onclick='themMoiDiaChi()'>Tạo mới </button>";
                document.getElementById("btnTaoMoiThemDiaChi").innerHTML = html;

                $('#exampleModal').modal('hide');
            })

            .catch(function (err) {
                alert("Lõi" + err);
            });
    }

    function huyDiaChi() {
        if (idDC == null) {
            Swal.fire({
                icon: "warning",
                text: "Bạn chưa chọn địa chỉ  ",
                showConfirmButton: false,
                timer: 2500
            });
        } else {
            Swal.fire({
                title: "Bạn có muốn xóa địa chỉ không ?",
                showDenyButton: true,
                showCancelButton: true,
                confirmButtonText: "Có ",
                denyButtonText: `Không  `
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    apiHuyDiaChi(idDC)
                } else if (result.isDenied) {

                }
            });
        }
    }

    function apiHuyDiaChi(idDiaChi) {
        let options = {
            method: "DELETE"
        }
        fetch('http://localhost:8080/DiaChi/api/delete/' + idDiaChi, options)
            .then(function (response) {
                response.json();
                Swal.fire({
                    icon: "success",
                    text: "Xóa địa chỉ thành công  ",
                    showConfirmButton: false,
                    timer: 2500
                });
                hienThiAllDiaChiKhachHang()
            })


            .catch(function (err) {
                alert("Lõi" + err);
            });
    }

    function diaChiMacDinh() {

        let options = {
            method: "PUT",
            dataType: "json",
            headers: {
                'Accept': 'application/json, text/plain',
                'Content-Type': 'application/json;charset=UTF-8'
            },

        }
        fetch('http://localhost:8080/DiaChi/api/cap-nhat-dia-chi-mac-dinh/'+idDC, options)
            .then(function (response) {
                response.json();
                Swal.fire({
                    icon: "success",
                    text: "Update địa chỉ mặc định thành công ",
                    showConfirmButton: false,
                    timer: 2500
                });
                hienThiAllDiaChiKhachHang()

            })
    }


    // dia chi api
    tinhChon = null
    huyenChon = null
    xaChon = null
    apiTinh()
    apiTinh1()


    function apiTinh() {
        fetch('https://vnprovinces.pythonanywhere.com/api/provinces/?basic=true&limit=100')
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                // console.log(data)
                var htmls = data.results.map(tinh => {
                    return "<option value='" + tinh.id + "' id='" + tinh.full_name + "'>" + tinh.full_name + "</option>"
                        ;
                });
                var html = htmls.join('');
                document.getElementById("province").innerHTML = html;
            })


            .catch(function (err) {
                alert("Lõi");
            });
    }

    function apiTinh1() {
        fetch('https://vnprovinces.pythonanywhere.com/api/provinces/?basic=true&limit=100')
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                // console.log(data)
                var htmls = data.results.map(tinh => {
                    return "<option value='" + tinh.id + "' id='" + tinh.full_name + "'>" + tinh.full_name + "</option>"
                        ;
                });
                var html = htmls.join('');
                document.getElementById("provinceModal").innerHTML = html;
            })


            .catch(function (err) {
                alert("Lõi");
            });
    }

    function tenTinhChon(idTinh) {
        fetch('https://vnprovinces.pythonanywhere.com/api/provinces/?basic=true&limit=100')
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                // console.log(data)
                var htmls = data.results.map(tinh => {
                    if (tinh.id == idTinh) {
                        tinhChon = tinh.full_name

                    }

                });
                document.getElementById("tenTinh").value = tinhChon;

            })


            .catch(function (err) {
                alert("Lõi");
            });
    }

    function tenTinhChon1(idTinh1) {
        fetch('https://vnprovinces.pythonanywhere.com/api/provinces/?basic=true&limit=100')
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                // console.log(data)
                var htmls = data.results.map(tinh => {
                    if (tinh.id == idTinh1) {
                        tinhChon = tinh.full_name

                    }

                });


            })


            .catch(function (err) {
                alert("Lõi");
            });
    }


    function apiHuyen(idTinh) {
        fetch('https://vnprovinces.pythonanywhere.com/api/provinces/' + idTinh)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                console.log(data)
                var htmls = data.districts.map(huyen => {
                    return "<option value='" + huyen.id + "' id='" + huyen.full_name + "'>" + huyen.full_name + "</option>"
                        ;
                });
                var html = htmls.join('');


                document.getElementById("district").innerHTML = html;
            })


            .catch(function (err) {
                alert("Lõi");
            });
    }

    function apiHuyen1(idTinh1) {
        fetch('https://vnprovinces.pythonanywhere.com/api/provinces/' + idTinh1)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                console.log(data)
                var htmls = data.districts.map(huyen => {
                    return "<option value='" + huyen.id + "' id='" + huyen.full_name + "'>" + huyen.full_name + "</option>"
                        ;
                });
                var html = htmls.join('');


                document.getElementById("districtModal").innerHTML = html;
            })


            .catch(function (err) {
                alert("Lõi");
            });
    }

    function tenHuyenChon(idTinh, idHuyen) {
        fetch('https://vnprovinces.pythonanywhere.com/api/provinces/' + idTinh)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                // console.log(data)
                var htmls = data.districts.map(huyen => {
                    if (huyen.id == idHuyen) {
                        huyenChon = huyen.full_name

                    }

                });
                document.getElementById("tenHuyen").value = huyenChon;

            })


            .catch(function (err) {
                alert("Lõi");
            });
    }

    function tenHuyenChon1(idTinh1, idHuyen1) {
        fetch('https://vnprovinces.pythonanywhere.com/api/provinces/' + idTinh1)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                // console.log(data)
                var htmls = data.districts.map(huyen => {
                    if (huyen.id == idHuyen1) {
                        huyenChon = huyen.full_name

                    }

                });

            })


            .catch(function (err) {
                alert("Lõi");
            });
    }

    function apiPhuong(idHuyen) {
        fetch('https://vnprovinces.pythonanywhere.com/api/districts/' + idHuyen)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                console.log(data)
                var htmls = data.wards.map(xa => {
                    return "<option value='" + xa.id + "' id='" + xa.full_name + "'>" + xa.full_name + "</option>"
                        ;
                });
                var html = htmls.join('');


                document.getElementById("ward").innerHTML = html;
            })


            .catch(function (err) {
                alert("Lõi");
            });
    }

    function apiPhuong1(idHuyen1) {
        fetch('https://vnprovinces.pythonanywhere.com/api/districts/' + idHuyen1)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                console.log(data)
                var htmls = data.wards.map(xa => {
                    return "<option value='" + xa.id + "' id='" + xa.full_name + "'>" + xa.full_name + "</option>"
                        ;
                });
                var html = htmls.join('');


                document.getElementById("wardModal").innerHTML = html;
            })


            .catch(function (err) {
                alert("Lõi");
            });
    }

    function tenPhuongChon(idHuyen, idXa) {
        fetch('https://vnprovinces.pythonanywhere.com/api/districts/' + idHuyen)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                // console.log(data)
                var htmls = data.wards.map(xa => {
                    if (xa.id == idXa) {
                        xaChon = xa.full_name


                    }

                });
                document.getElementById("tenPhuong").value = xaChon;

            })


            .catch(function (err) {
                alert("Lõi");
            });
    }

    function tenPhuongChon1(idHuyen1, idXa1) {
        fetch('https://vnprovinces.pythonanywhere.com/api/districts/' + idHuyen1)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                // console.log(data)
                var htmls = data.wards.map(xa => {
                    if (xa.id == idXa1) {
                        xaChon = xa.full_name


                    }

                });

            })


            .catch(function (err) {
                alert("Lõi");
            });
    }

    function tinh() {
        var idTinh = document.querySelector("#province").value;
        apiHuyen(idTinh)

        tenTinhChon(idTinh)


    }

    function tinh1() {
        var idTinh1 = document.querySelector("#provinceModal").value;
        apiHuyen1(idTinh1)

        tenTinhChon1(idTinh1)


    }

    function huyen() {
        var idHuyen = document.querySelector("#district").value;
        var idTinh = document.querySelector("#province").value;
        apiPhuong(idHuyen)
        tenHuyenChon(idTinh, idHuyen)

    }

    function huyen1() {
        var idHuyen1 = document.querySelector("#districtModal").value;
        var idTinh1 = document.querySelector("#provinceModal").value;
        apiPhuong1(idHuyen1)
        tenHuyenChon1(idTinh1, idHuyen1)

    }

    function xa() {
        var idXa = document.querySelector("#ward").value;
        var idHuyen = document.querySelector("#district").value;

        tenPhuongChon(idHuyen, idXa)


        // var tenTinh = document.querySelector('input[id="tenTinh"]').value;
        // console.log(tenTinh)
    }

    function xa1() {
        var idXa1 = document.querySelector("#wardModal").value;
        var idHuyen1 = document.querySelector("#districtModal").value;

        tenPhuongChon1(idHuyen1, idXa1)


        // var tenTinh = document.querySelector('input[id="tenTinh"]').value;
        // console.log(tenTinh)
    }

    // ThanhToan

    function thanhToanDonHang(){
        Swal.fire({
            title: "Bạn có muốn thanh toán đơn hàng này không ?",
            showDenyButton: true,
            showCancelButton: true,
            confirmButtonText: "Thanh toán ",
            denyButtonText: `Hủy `
        }).then((result) => {
            /* Read more about isConfirmed, isDenied below */
            if (result.isConfirmed) {
                themDonHangOnline()

                Swal.fire("Thanh toán thành công ", "", "success");
            } else if (result.isDenied) {
                Swal.fire("Changes are not saved", "", "info");
            }
        });
    }

    function themDonHangOnline(){
        var khachHang={
            id:idKhachHang
        }
        var diaChi={
            id:idDC
        }
        var formData={
            khachHangOnline:khachHang,
            diaChiOnline:diaChi,
            loaiDon:"Don online",
            tongTien:tongTien ,

        }
        apiThemDonHangOnline(formData)
    }

    function apiThemDonHangOnline(data){
        let options = {
            method: "POST",
            dataType: "json",
            headers: {
                'Accept': 'application/json, text/plain',
                'Content-Type': 'application/json;charset=UTF-8'
            },
            body: JSON.stringify(data)
        }
        fetch('http://localhost:8080/DonHangOnline/api/tao-don-hang-online-moi', options)
            .then(function (response) {
                response.json();
                alert("Them thanh cong");

            })
    }
</script>

</body>

</html>