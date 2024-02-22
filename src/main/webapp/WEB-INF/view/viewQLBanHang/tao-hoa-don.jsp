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
                        <button class="nav-link " data-bs-toggle="tab" type="button"
                                role="tab"
                                onclick="thongTinDonHang('${hd.id}')">
                            <samp style="color: black">
                                Hoá đơn ${hd.ma}
                            </samp>
                        </button>
                            <%--                        </a>--%>
                        <a href="/datn/delete-don-hang/${hd.id}" class="pt-2 px-2"
                           onclick="return confirm('Có muốn xóa hóa đớn không ?')">
                            <img src='<c:url value="/getimage/Logo-Trash.png"></c:url>'/>
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
                        <img src='<c:url value="/getimage/Logo-Plus.png"></c:url>'/>
                    </button>
                </form>
            </c:if>
            <c:if test="${listHD.size()>=5}">
                <button class="btn btn-while border " onclick="thongbao()"
                        data-bs-toggle="tooltip" data-bs-placement="right" title="Đã tối đa">
                    <img src='<c:url value="/getimage/Logo-Plus.png"></c:url>'/>
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
                    <button type="button" class="btn btn-dark mx-3" data-bs-toggle="modal"
                            data-bs-target="#exampleModal">
                        <samp style="color: white; font-weight: bolder">
                            Quét
                        </samp>
                    </button>
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
                                <div class="input-group mb-3  ">
                                    <input type="text" class="form-control" placeholder="SDT khách hàng  "
                                           aria-label="Recipient's username" aria-describedby="button-addon2">
                                    <button class="btn btn-outline-secondary" type="button" id="button-addon2"><i
                                            class="bi bi-search"></i></button>
                                </div>

                            </div>
                            <div class="mx-3 mt-1">
                                Tên KH : <span id="tenKH">Hoangf thi ngoc han</span>
                            </div>
                        </div>

                        <div class="d-flex mb-3 ">
                            <div>
                                <button class="btn btn-outline-secondary me-2  ">Voucher</button>
                                Mã voucher : <samp id="voucher">VC1</samp>
                            </div>
                            <div class="mx-3 mt-1">
                                Giá trị : <span id="giaTriVC">abc</span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label>Tổng tiền : <samp id="giaTT"><fmt:formatNumber type="number" value="0"/></samp>
                                VND</label><br>
                            <input type="number" id="tongTien" value="0" hidden>
                        </div>
                        <div class="mb-3">
                            <label>Tiền khách phải trả : <samp id="giaKPT"><fmt:formatNumber type="number"
                                                                                             value="0"/></samp>
                                VND</label><br>
                            <input type="number" id="tienKhachPhaiTra" value="0" hidden>
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
                            <button class="btn btn-outline-dark ">Thanh toán</button>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>

        <%--        end thanh toan--%>
    </div>
</div>


<script>

    var idDonHang= '${abc}';
    detailDataDonHang(idDonHang)
    hienThiSanPhamDonHang(idDonHang)

    function thongTinDonHang(id) {
        idDonHang = id
        table2.destroy();
        hienThiSanPhamDonHang(id)
        detailDataDonHang(id)

    }

    function themGioHangCT(data) {
        // console.log(idDonHang);
        if (idDonHang == null) {
            alert("Chưa chọn đơn hàng");
            return;
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
                    alert("Sản phẩm đã hết");
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
                alert("Them thanh cong");
                table2.destroy();
                hienThiSanPhamDonHang(idDonHang);
                table.destroy();
                getDataAllSPCT();
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
                document.getElementById("tenKH").innerHTML = data.ma;
                document.getElementById("voucher").innerHTML = data.ma;
                document.getElementById("giaTriVC").innerHTML = data.ma;
                document.getElementById("giaTT").innerHTML = data.tongTien;
                document.getElementById("giaKPT").innerHTML = data.tienKhachPhaiTra;
                document.getElementById("tienKhachDua").value = data.tienKhachDua;
                document.getElementById("th").innerHTML = data.tienThua;
            })
    }

    var sl


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
                                        '<button  class="btn btn-dark" ><i class="bi bi-pencil-square"></i></button >';

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
        if (confirm("Co xoa ko")) {
            fetch('http://localhost:8080/DonHangCT/api/delete/' + idSPCT, options)
                .then(response => {
                        console.log(response.status)
                        alert("Xoa thanh cong")
                        table.destroy();
                        getDataAllSPCT();
                        table2.destroy();
                        hienThiSanPhamDonHang(idDonHang);
                    }
                )
        }
    }

    function thongbao() {
        alert("Chỉ được tạo tối đa 5 hoá đơn");
    }
</script>
