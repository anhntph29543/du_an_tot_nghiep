<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

</style>
<div class="container" style="margin-top: 10px">
    <br>
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <c:if test="${listHD.size()>0}">
            <c:forEach items="${listHD}" var="hd" varStatus="stt">
                <li class="nav-item" role="presentation">
                    <div class="d-flex border border-top-0">
                            <%--                        <a href="" style="text-decoration: none">--%>
                        <button class="nav-link ${hd.id==idDHFirst?'active':''}" data-bs-toggle="tab" type="button"
                                role="tab"
                                onclick="thongTinDonHang('${hd.id}')">
                            <samp style="color: black">
                                Hoá đơn ${hd.ma}
                            </samp>
                        </button>
                            <%--                        </a>--%>
                        <a class="pt-2 px-2"
                           onclick="return xoaDH('/datn/delete-don-hang/${hd.id}')">
                            <i class="bi bi-trash3" style="color: black"></i>
                        </a>

                    </div>
                </li>
            </c:forEach>
        </c:if>
        <li>
            <c:if test="${listHD.size()<5}">
                <form action="/datn/tao-hoa-don/add" method="post">
                    <button class="btn btn-while border" data-bs-toggle="tooltip" data-bs-placement="right"
                            title="Tạo hoá đơn">
                        <i class="bi bi-plus-lg" style="font-size: 20px"></i>
                    </button>
                </form>
            </c:if>
            <c:if test="${listHD.size()>=5}">
                <button class="btn btn-while border " onclick="thongbao()"
                        data-bs-toggle="tooltip" data-bs-placement="right" title="Đã tối đa">
                    <i class="bi bi-plus-lg" style="font-size: 20px"></i>
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
                <div class="d-flex">
                    <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#themSP">
                        <samp style="color: white; font-weight: bolder">
                            Thêm Sản Phẩm
                        </samp>
                    </button>
                    <div class="modal fade  " id="themSP" data-bs-backdrop="static" data-bs-keyboard="false"
                         tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Thêm sản phẩn </h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="border border-dark rounded ">
                                        <table class="table" id="table1" style="width: 100%; height: 100% ">
                                            <thead>
                                            <tr>
                                                <th scope="col">Mã</th>
                                                <th scope="col">Tên</th>
                                                <th scope="col">Thương hiệu</th>
                                                <th scope="col">Kích cỡ</th>
                                                <th scope="col">Màu sắc</th>
                                                <th scope="col">Chất liệu</th>
                                                <th scope="col">Đơn giá</th>
                                                <th scope="col">Số Lượng</th>
                                                <th scope="col">Chức Năng</th>
                                            </tr>
                                            </thead>

                                            <script>
                                                getDataAllSPCT();

                                                function getDataAllSPCT() {
                                                    fetch('http://localhost:8080/SPCT/api')
                                                        .then(function (response) {
                                                            return response.json();
                                                        })
                                                        .then(data => {
                                                            console.log(data)
                                                            $(document).ready(function () {
                                                                table = $('#table1').DataTable({
                                                                    "data": data,

                                                                    "columns": [
                                                                        <%--{--%>
                                                                        <%--    "data": 'ma',--%>
                                                                        <%--    "render": function (data, type, row, meta) {--%>
                                                                        <%--        var anhABC = '<c:url value="/getimage/"></c:url>';--%>
                                                                        <%--        return '<img src="' + anhABC + data + '"/>';--%>
                                                                        <%--    }--%>
                                                                        <%--},--%>
                                                                        {"data": 'ma'},
                                                                        {"data": 'sanPham.ten'},
                                                                        {"data": 'sanPham.th.ten'},
                                                                        {"data": 'kichCo.ten'},
                                                                        {"data": 'mauSac.ten'},
                                                                        {"data": 'chatLieu.ten'},
                                                                        {"data": 'donGia'},
                                                                        {"data": 'soLuong'},

                                                                        {
                                                                            "data": 'id',
                                                                            "render": function (data, type, row, meta) {

                                                                                return '<button  type="button" class="btn btn-dark" onclick="themGioHangCT(`' + data + '`)" ><i class="bi bi-plus-circle"></i></button >';
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

                                        </table>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Button modal quét qr-->
                    <button type="button" class="btn btn-dark mx-3" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        <samp style="color: white; font-weight: bolder">
                            Quét
                        </samp>
                    </button>
                    <!-- Modal QR-->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Quét QR</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="container">
                                        <div class="section">
                                            <div id="my-qr-reader">
                                            </div>
                                        </div>
                                    </div>
                                    <script src="https://unpkg.com/html5-qrcode"></script>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End modal QR -->
                    <h5 id="thongTinHoaDon" class="mx-4 mt-2">

                    </h5>

                </div>

                <div class="d-flex ">
                    <div class="col-10 ">
                        <table class="table" id="table2">
                            <thead>
                            <tr>
                                <th>Mã</th>
                                <th>Ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th>Màu sắc</th>
                                <th>Kích thước</th>
                                <th>Số lượng</th>
                                <th>Đơn giá</th>
                                <th>Tổng tiền</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>

                        </table>
                    </div>
                    <div class="border rounded mx-2 col-6 p-3 ">
                        <h5 class="mb-3">Thanh toán đơn hàng</h5>
                            <div class="d-flex">
                                <div class="col-md-5 d-flex">
                                    <div class="input-group mb-3">
                                        <input id="khachHangsdt" type="text" class="form-control" placeholder="SDT khách hàng"
                                               aria-label="Recipient's username" aria-describedby="button-addon2">
                                        <button onclick="getKH()" class="btn btn-outline-secondary" type="button" id="button-addon2">
                                            <i class="bi bi-search"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="mx-3 mt-1">
                                    Tên KH : <span id="tenKH">Khách hàng lẻ</span>
                                </div>
                        </div>

                        <div class="d-flex mb-3 ">
                            <div>
                                <button class="btn btn-outline-secondary me-2  ">Voucher</button>
                                Mã voucher : <samp id="voucher">VC1</samp>
                            </div>
                            <div class="mx-3 mt-1">
                                Giá trị : <span id="giaTriVC"></span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label>Tổng tiền :<samp id="giaTT"><fmt:formatNumber type="number" value=""/></samp>
                                VND</label><br>
                                <%--                            <input type="number" id="tongTien" hidden>--%>
                        </div>
                        <div class="mb-3">
                            <label>Tiền khách phải trả : <samp id="giaKPT"><fmt:formatNumber type="number"
                                                                                             value="0"/></samp>
                                VND</label><br>
                                <%--                            <input type="number" id="tienKhachPhaiTra" value="0" hidden>--%>
                        </div>
                        <div class="mb-3 ">
                            Hình thức thanh toán :
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1"
                                       value="option1" checked>
                                <label class="form-check-label" for="inlineRadio1">Tiền mặt </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2"
                                       value="option2">
                                <label class="form-check-label" for="inlineRadio2">Chuyển khoản </label>
                            </div>
                        </div>
                        <div class="d-flex mb-3">
                            <div class="col-md-3 mt-1 ">
                                <label>Tiền khách đưa </label><br>
                            </div>
                            <div class="col-md-6 mx-3">
                                <input type="number" class="form-control" id="tienKhachDua" value="">
                            </div>
                            <div class="mt-1">
                                VND
                            </div>
                        </div>
                        <div class="mb-3">
                            <label>Tiền thừa : <samp id="th"><fmt:formatNumber type="number" value="0"/></samp>
                                VND</label><br>
                            <input type="number" id="tienThua " value="0" hidden>
                        </div>
                        <div class="d-flex justify-content-center mb-3">

                                <%--                            <input hidden value="${tienKhachDua}" name="tienKhachDua">--%>
                                <%--                            <input hidden value="${giaTT}" name="giaTT">--%>
                            <button id="pay" type="submit" class="btn btn-success"><i class="bi bi-wallet-fill"></i>
                                Thanh Toán
                            </button>

                        </div>
                    </div>
                </div>
            </c:if>
        </div>

        <%--        end thanh toan--%>
    </div>
</div>
<div class="modal fade" id="suaSL" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel">Sửa số lượng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id='suaSLSP'>
                    <input type="text" name="id" id="idSuaSL" class="form-control"
                           hidden>
                    <div class="input-group mb-3">
                        <input class="form-control" name="soLuong"
                               aria-describedby="button-suaSL"
                               id="slSua" type="number" placeholder="Nhập số lượng">
                        <button class="btn btn-outline-dark" type="submit"
                                id="button-suaSL"><i class="bi bi-floppy"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>

    var idDonHang = '${idDHFirst}';
    detailDataDonHang(idDonHang)
    hienThiSanPhamDonHang(idDonHang)
    tinhTongTien(idDonHang)
    document.getElementById('pay').addEventListener('click', function Pay(event) {
        var submitButton = document.getElementById('pay');
        var tienKhachDua = parseFloat(document.getElementById('tienKhachDua').value);
        var tongTien = parseFloat(document.getElementById('giaTT').innerText.replace('VND', '').trim());
        var tienKhachPhaiTRa = parseFloat(document.getElementById('giaKPT').innerText.replace('VND', '').trim());
        console.log(tienKhachPhaiTRa);
        console.log("tkd" + tienKhachDua);
        console.log("tt" + tongTien);
        if (tienKhachPhaiTRa == 0) {
            event.preventDefault();
            Swal.fire({
                icon: "error",
                text: "Vui Lòng Chọn Sản Phẩm",
                showConfirmButton: false,
                timer: 2500
            });
        } else if (tienKhachDua >= tongTien) {
            submitButton.disabled = false;
            Swal.fire({
                icon: "succes",
                text: "Thanh Toán Thành Công",
                showConfirmButton: false,
                timer: 2500
            });
            var donHang = {
                id: idDonHang
            }
            var formData = {
                donHang: donHang,
                tongTien: tongTien,
                tienKhachDua: tienKhachDua,
                trangThai: true
            };
            capNhatTrangThaiDonHangDaThanhToan(idDonHang, formData);

        } else {
            event.preventDefault();
            Swal.fire({
                icon: "warning",
                text: "Vui Lòng Điền Đúng Số Tiền",
                showConfirmButton: false,
                timer: 2500
            });
        }
    });

    function getKH() {
        var sdt = $("#khachHangsdt").val().trim();
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "http://localhost:8080/DonHang/api/getkh?sdt=" + encodeURIComponent(sdt),
            dataType: 'json',
            success: function (response) {
                console.log(response.data);
                console.log("#--------");
                if (response && response.data) {
                    var tenKH = response.data.ten;
                    $("#tenKH").text(tenKH);
                } else {
                    $("#tenKH").text("Không tìm thấy thông tin khách hàng");
                }
            },
            error: function () {
                $("#tenKH").text("Không tìm thấy thông tin khách hàng");
            }
        });
    }


    function xoaDH(urlDH){
        Swal.fire({
            title: "Bạn có chắc không?",
            text: "Bạn có chắc muốn xóa đơn hàng này không?",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            cancelButtonText: "Hủy",
            confirmButtonText: "Đúng, tôi muốn xóa!"
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href=(urlDH)
            }
        });
    }
    function domReady(fn) {
        if (
            document.readyState === "complete" ||
            document.readyState === "interactive"
        ) {
            setTimeout(fn, 1000);
        } else {
            document.addEventListener("DOMContentLoaded", fn);
        }
    }
    domReady(function () {

        // If found you qr code
        function onScanSuccess(decodeText, decodeResult) {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "http://localhost:8080/hoa-don/them-san-pham-qr",
                data: JSON.stringify(decodeText),
                dataType: 'json',
                success: location.replace("http://localhost:8080/tao-hoa-don/hien-thi")
            });
        }

        let htmlscanner = new Html5QrcodeScanner(
            "my-qr-reader",
            { fps: 5, qrbos: 250 }
        );
        htmlscanner.render(onScanSuccess);
    });

    $(document).ready(
        function () {
            const suaSL = new bootstrap.Modal('#suaSL');
            $("#suaSLSP").submit(function (event) {
                // Prevent the form from submitting via the browser.
                event.preventDefault();
                updateSLSP();
            });

            function updateSLSP() {
                // PREPARE FORM DATA
                var data = {
                    id: $("#suaSLSP #idSuaSL").val().trim(),
                    soLuong: $("#suaSLSP #slSua").val()
                };
                console.log(data);
                if(data.soLuong < 0){
                    Swal.fire({
                        icon: "warning",
                        text: "Số lượng phải lớn hơn 0",
                        showConfirmButton: false,
                        timer: 2500
                    });
                }else if (data.soLuong.trim()==""){
                    Swal.fire({
                        icon: "warning",
                        text: "Số lượng không được trống",
                        showConfirmButton: false,
                        timer: 2500
                    });
                }else if (data.soLuong == 0) {
                    Swal.fire({
                        title: "Bạn có chắc không?",
                        text: "Bạn có chắc muốn xóa sản phẩm khỏi đơn hàng không?",
                        icon: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#3085d6",
                        cancelButtonColor: "#d33",
                        cancelButtonText: "Hủy",
                        confirmButtonText: "Đúng, tôi muốn xóa!"
                    }).then((result) => {
                        let options = {
                            method: "DELETE"
                        }
                        if (result.isConfirmed) {
                            Swal.fire({
                                title: "Xóa thành công!",
                                text: "Sản phẩm đã được xóa.",
                                icon: "success",
                                timer: 2500
                            });
                            suaSL.hide();
                            fetch('http://localhost:8080/DonHangCT/api/delete/' + data.id, options)
                                .then(response => {
                                        console.log(response.status)
                                        table.destroy();
                                        getDataAllSPCT();
                                        table2.destroy();
                                        hienThiSanPhamDonHang(idDonHang);
                                    }
                                )
                        }
                    });
                }else {
                    $.ajax({
                        type: "PUT",
                        contentType: "application/json",
                        url: "http://localhost:8080/DonHangCT/api/update",
                        data: JSON.stringify(data),
                        dataType: 'json',
                        success: function (result) {
                            if (result.status == "success") {
                                console.log("-------------post---------------");
                                console.log(data);
                                suaSL.hide();
                                Swal.fire({
                                    title: "Sửa thành công",
                                    icon: "success",
                                    showConfirmButton: false,
                                    timer: 2500
                                });
                                table2.destroy();
                                hienThiSanPhamDonHang(idDonHang);
                                table.destroy();
                                getDataAllSPCT();
                                tinhTongTien(idDonHang);
                            } else {
                                Swal.fire({
                                    text: "Số lượng sản phẩm còn lại không đủ",
                                    icon: "warning",
                                    showConfirmButton: false,
                                    timer: 2500
                                });
                                console.log("fail");
                            }
                            console.log(result);
                        },
                        error: function (e) {
                            alert("Error!")
                            console.log("ERROR: ", e);
                        }
                    });
                }
            }
        })

    function capNhatTrangThaiDonHangDaThanhToan(idDonHang, data) {
        let options = {
            method: "POST",
            dataType: "json",
            headers: {
                'Accept': 'application/json, text/plain',
                'Content-Type': 'application/json;charset=UTF-8'
            },
            body: JSON.stringify(data)
        }
        fetch('http://localhost:8080/DonHang/api/thanhToan1/' + idDonHang, options)

            .then(function (response) {
                return response.json();
            })
            .then(data => {
                alert(data);
                location.reload();
            })


    }

    function thongTinDonHang(id) {
        idDonHang = id
        table2.destroy();
        hienThiSanPhamDonHang(id)
        detailDataDonHang(id)
        tinhTongTien(id)

    }

    function tinhTongTien(idDonHang) {
        fetch('http://localhost:8080/DonHangCT/api/thanhtoan/' + idDonHang)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                document.getElementById("giaTT").innerHTML = data;
                document.getElementById("giaKPT").innerHTML = data;
            })

    }


    function themGioHangCT(data) {
        // console.log(idDonHang);
        if (idDonHang == null) {

            alert("Chưa chọn đơn hàng");
            return;

        } else {

        }
        themSanPhamCTVaoGioHang(data);
    }

    function themSanPhamCTVaoGioHang(idSPCT) {
        fetch('http://localhost:8080/SPCT/api/detail/' + idSPCT)
            .then(function (response) {
                return response.json();
            })
            .then(data => {

                var donHang = {
                    id: idDonHang
                }
                if (data.soLuong == 0) {
                    table.destroy();
                    getDataAllSPCT();
                    table2.destroy();
                    hienThiSanPhamDonHang(idDonHang);
                    Swal.fire({
                        title: "Sản phẩm đã hết",
                        icon: "error",
                        showConfirmButton: false,
                        timer: 2500
                    });
                    return;
                } else {
                    var formData = {
                        donHang: donHang,
                        sanPhanCT: data,
                        soLuong: 1,
                        giaSanPham: data.donGia,
                        trangThai: true,
                    };
                    addDataThemSPGioHang(formData)

                }
            })
    }

    function addDataThemSPGioHang(data) {
        let options = {
            method: "POST",
            dataType: "json",
            headers: {
                'Accept': 'application/json, text/plain',
                'Content-Type': 'application/json;charset=UTF-8'
            },
            body: JSON.stringify(data)
        }
        fetch('http://localhost:8080/DonHangCT/api/add', options)
            .then(function (response) {
                response.json();
                Swal.fire({
                    title: "Thêm thành công",
                    icon: "success",
                    showConfirmButton: false,
                    timer: 2500
                });
                table2.destroy();
                hienThiSanPhamDonHang(idDonHang);
                table.destroy();
                getDataAllSPCT();
                tinhTongTien(idDonHang);

            })
    }

    function detailDataDonHang(id) {
        idDonHang = id;

        fetch('http://localhost:8080/DonHang/api/detail/' + idDonHang)
            .then(function (response) {
                return response.json();
            })
            .then(data => {


                document.getElementById("thongTinHoaDon").innerHTML = data.ma;
                document.getElementById("tenKH").innerHTML = "khách hàng lẻ";
                document.getElementById("voucher").innerHTML = "";
                document.getElementById("giaTriVC").innerHTML = "";
                document.getElementById("giaTT").innerHTML = data.tongTien;
                document.getElementById("giaKPT").innerHTML = data.tienKhachPhaiTra;
                document.getElementById("tienKhachDua").value = data.tienKhachDua;
                document.getElementById("th").innerHTML = data.tienThua;
            })

    }

    var sl
    var exampleModal = document.getElementById('suaSL')
    if (exampleModal != null) {
        exampleModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget
            var slSua = button.getAttribute('data-bs-slSua')
            var idHDCT = button.getAttribute('data-bs-idHDCT')
            var slInput = exampleModal.querySelector('.modal-body #slSua')
            var idInput = exampleModal.querySelector('.modal-body #idSuaSL')
            slInput.value = slSua
            idInput.value = idHDCT
        })
    }

    function hienThiSanPhamDonHang(idDonHang) {
        fetch('http://localhost:8080/DonHangCT/api/' + idDonHang)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                console.log(data)
                $(document).ready(function () {
                    table2 = $('#table2').DataTable({
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
                            {"data": 'soLuong',},
                            {"data": 'donGia'},
                            {"data": 'tongTien'},
                            {
                                "data": 'id',
                                "render": function (data, type, row, meta) {
                                    return '<button  class="btn btn-dark" onclick="xoaSPDHCT(`' + data + '`)" ><i class="bi bi-trash"></i></button >' +
                                        '<button class="btn btn-dark" data-bs-placement="bottom" data-bs-toggle2="suaSL" ' +
                                        'data-bs-toggle="modal" data-bs-target="#suaSL" data-bs-slSua="' + row.soLuong + '" data-bs-idHDCT="' + data + '" title="Sửa số lượng">' +
                                        '<i class="bi bi-pencil-square"></i>' +
                                        '</button>';

                                }
                            }


                        ],

                        "pageLength": 2
                    });
                });

            })
    }


    function xoaSPDHCT(idSPCT) {
        let options = {
            method: "DELETE"
        }
        Swal.fire({
            title: "Bạn có chắc không?",
            text: "Bạn có chắc muốn xóa sản phẩm khỏi đơn hàng không?",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            cancelButtonText: "Hủy",
            confirmButtonText: "Đúng, tôi muốn xóa!"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "Xóa thành công!",
                    text: "Sản phẩm đã được xóa.",
                    icon: "success",
                    timer: 2500
                });
                fetch('http://localhost:8080/DonHangCT/api/delete/' + idSPCT, options)
                    .then(response => {
                            console.log(response.status)
                            tinhTongTien(idDonHang)
                            table.destroy();
                            getDataAllSPCT();
                            table2.destroy();
                            hienThiSanPhamDonHang(idDonHang);
                        }
                    )
            }
        });
    }

    function thongbao() {
        Swal.fire({
            icon: "warning",
            title: "Chỉ được tạo tối đa 5 hoá đơn",
            showConfirmButton: false,
            timer: 2500
        });
    }
</script>
