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
            <h2 class="fw-bold">Giỏ hàng </h2>
        </div>
        <div class="mt-5 ">
            <div class="d-flex justify-content-center  ">
                <div class="col-8 mx-4 " >
                    <div class="d-flex justify-content-around" >
                        <div>Sản phẩm</div>
                        <div>&nbsp; </div>
                        <div>&nbsp; </div>
                        <div>&nbsp; </div>
                        <div>&nbsp; </div>
                        <div>Số lượng </div>
                        <div>Giá tiền </div>
                        <div class="me-2">Tổng tiền </div>
                        <div>&nbsp; </div>
                    </div>
                    <div id="gioHang1">

                    </div>
                </div>
                <div class="col-3 border border-dark border-2 " style="border-radius: 30px;height: 500px">
                    <div class="mt-2">
                        <h4 class="text-center fw-bold ">Hóa đơn xem trước </h4>
                    </div>
                    <div class="fw-bold fs-5  d-flex gap-5 ms-5 mt-3  ">
                        <span>Sản phẩm </span>
                        <span id="tongSanPham">0</span>

                    </div>
                    <hr class="mx-4 my-4 border border-dark border-2">
                    <div class="fw-bold fs-5 d-flex gap-5 ms-5 mt-3  ">
                        <div>
                            <span>Tạm tính  </span>
                        </div>
                        <div>
                            <span id="tongTienTamTinh">0</span> <span>đ</span>
                        </div>
                    </div>
                    <hr class="mx-4 my-4 border border-dark border-2">
                    <div class="fw-bold fs-5  d-flex gap-5 ms-5 mt-3  ">
                        <div>
                            <span>Mã giảm giá   </span>
                        </div>
                        <div>
                            <span>Ma01</span>
                            <button class="btn btn-warning btn-sm ">
                                <img src='<c:url value="/getimage/Logo-Voucher.png"></c:url>' style="width: 20px " />
                            </button>
                        </div>
                    </div>
                    <hr class="mx-4 my-4 border border-dark border-2">

                    <div class="fw-bold fs-5  d-flex gap-5 ms-5 mt-3  ">
                        <div>
                            <span>Tổng tiền </span>
                        </div>
                        <div>
                            <span id="tongTienDaTinh">0</span><span>đ</span>
                        </div>
                    </div>
                    <div class="fw-bold fs-5  d-flex my-4 justify-content-center ">
                        <div>
                            <button type="button" class="btn btn-dark" onclick="thanhToan1()"><span class="fw-bold ">Thanh toán </span> </button>
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
    var number=null
    var tongSanPham=0
    sanPhamCTTrongGioHang1()

    function gioHangOnline1(){

        if(idGioHang=="123"){
            var storeNoProduct = '<c:url value="/getimage/Store-no-product.png"></c:url>';
            var html="<div>"
                +"<img src='"+storeNoProduct +"'  />"
                + "<h5>Bạn chưa đăng nhập chưa thể thêm sản phẩm vào giỏ hàng </h5>"
                + "</div>"
            document.getElementById("gioHang1").innerHTML = html;

        }else if(idGioHang!="123"&& number==1 ){
            hienThiSPCTGioHang1()
        }else {
            var storeNoProduct = '<c:url value="/getimage/Store-no-product.png"></c:url>';
            var html="<div class='d-grid justify-content-center'>"
                + "<div class='d-flex justify-content-center'>"
                + "<img src='"+storeNoProduct +"'/>"
                + "</div>"
                + "<h5 class='my-4'>Chưa có sản phẩm trong giỏ hàng </h5>"
                + "<button class='btn btn-dark' onclick='trangCuaHang()'>Đến cửa hàng </button>"
                + "</div>"
            document.getElementById("gioHang1").innerHTML = html;
            document.getElementById("tongSanPham").innerHTML=0;
            document.getElementById("tongTienTamTinh").innerHTML=0;
        }
    }

    function sanPhamCTTrongGioHang1(){
        number=0
        fetch('http://localhost:8080/GioHangCT/api')
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                console.log(data)
                var htmls=data.map(ghct  => {
                    if(ghct.gioHangOnline.id==idGioHang){
                        number=1;
                    }
                });
                gioHangOnline1()
            })

            .catch(function (err) {
                alert("Lõi");
            });
    }

    function tongTienvaSl(){
        fetch('http://localhost:8080/GioHangCT/api/spct-gio-hang/'+idGioHang)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                var tongTien=0
                var tongSanPham=0

                var htmls=data.map(ghct  => {
                    tongSanPham+=ghct.soLuong
                    tongTien+=ghct.tongTien

                });

                document.getElementById("tongSanPham").innerHTML=tongSanPham;
                document.getElementById("tongTienTamTinh").innerHTML=tongTien;
                document.getElementById("tongTienDaTinh").innerHTML=tongTien;
            })

            .catch(function (err) {
                alert("Lõi"+err);
            });
    }

    function hienThiSPCTGioHang1(){
        fetch('http://localhost:8080/GioHangCT/api/spct-gio-hang/'+idGioHang)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                var tongTien=0
                console.log(data)
                var htmls=data.map(ghct  => {
                    tongSanPham+=ghct.soLuong
                    tongTien+=ghct.tongTien
                    var anhABC = '<c:url value="/getimage/"></c:url>';
                    return "<div class='border m-3 ' style='border-radius: 20px;'>"
                            + "<div class='d-flex justify-content-around'>"
                                + "<div class='my-2'>"
                                    + "<img src='"+anhABC + ghct.anh+"' style='width: 130px;height: 100px;border-radius: 10px'/>"
                                + "</div>"

                                + "<div class='mt-4'>"
                                    + "<h6>"+ ghct.tenSPCT +"-"+ ghct.thuongHieu +"</h6>"
                                    + "<div>"
                                        +"<button type='button' "
                                            + "class='btn rounded-circle border border-2 mx-2' "
                                            + "style='background: "+ghct.mauSac+";width: 30px;height:30px'>"
                                        +"</button>"

                                        +"<button type='button' "
                                            + "class='btn rounded-circle border border-dark m-0 p-0 btn-outline-dark ' "
                                            + "style='width: 30px;height: 30px;'>"
                                        + "<samp >"+ghct.kichCo+"</samp>"
                                        + "</button>"
                                    + "</div>"
                                + "</div>"

                                + "<div class='mt-4'>"
                                    + "<div style='width: 100px'>"
                                        + "<div class='mt-2'>"
                                            + "<div class='input-group mb-3 input-group-sm border rounded-pill border-dark border-2'>"
                                                + "<button class='btn border-0 btn btn-outline-dark rounded-pill rounded-end' "
                                                    + "type='button' onclick='dashSL(`"+ghct.idGioHangCT+"`)'><i class='bi bi-dash'></i></button>"
                                                + "<input type='text' class='form-control border-0 border border-dark'"
                                                    + "value='"+ghct.soLuong+"' id='"+ghct.idGioHangCT+"'  style='width: 30px' onchange='suaSoLuong(`"+ghct.idGioHangCT+"`)'>"
                                                + "<button class='btn  border-0 btn btn-outline-dark rounded-pill rounded-start'"
                                                    + "type='button' onclick='plusSL(`"+ghct.idGioHangCT+"`)'><i class='bi bi-plus'></i></button>"
                                            + "</div>"
                                        + "</div>"
                                    + "</div>"
                                + "</div>"

                                + "<div class='mt-4'>"
                                    + "<span class='fw-bold'>"+ghct.giaSanPham+ "&nbsp;đ"+ "</span>"
                                + "</div>"

                                + "<div class='mt-4 '>"
                                    + "<span class='fw-bold'>"+ghct.tongTien+ "&nbsp;đ"+ "</span>"
                                + "</div>"

                                + "<div class='btn border-0 mt-4  ' onclick='xoaSPCTGH1(`" + ghct.idGioHangCT +"`)'>"
                                    +"<i class='bi bi-backspace'></i>"
                                + "</div>"
                            + "</div>"
                        + "</div>"

                        ;

                });
                var html=htmls.join('');
                document.getElementById("gioHang1").innerHTML=html;
                document.getElementById("tongSanPham").innerHTML=tongSanPham;
                document.getElementById("tongTienTamTinh").innerHTML=tongTien;
                document.getElementById("tongTienDaTinh").innerHTML=tongTien;
            })

            .catch(function (err) {
                alert("Lõi"+err);
            });
    }

    function xoaSPCTGH1(idGHCT){
        let options = {
            method: "DELETE"
        }
        fetch('http://localhost:8080/GioHangCT/api/delete/'+idGHCT,options)
            .then(function (response) {
                response.json();
                alert("Xoa thanh cong")
                tongSanPham=0
                sanPhamCTTrongGioHang1()
                gioHangOnline1()

            })


            .catch(function (err) {
                alert("Lõi");
            });
    }

    function thanhToan1(){
        location.assign("http://localhost:8080/ban-hang-online/datn/thanh-toan")
    }

    function dashSL(idGHCT){
        var sl = parseInt(document.getElementById(idGHCT).value);
        sl=sl - 1;
        if(sl<=0){
            alert("Số lượng sản phảm phải lớn hơn 0");
            sl=sl + 1;
        }
        document.getElementById(idGHCT).value = sl;
        updateSoLuong(idGHCT,parseInt(sl))


    }

    function  plusSL(idGHCT){
        var sl = parseInt(document.getElementById(idGHCT).value);
        sl=sl+1
        document.getElementById(idGHCT).value = sl;
        updateSoLuong(idGHCT,parseInt(sl))

    }

    function suaSoLuong(idGHCT){
        var sl = document.getElementById(idGHCT).value;
        if(sl!=parseInt(sl)){
            sl=1
            document.getElementById(idGHCT).value = sl;
            updateSoLuong(idGHCT,parseInt(sl))
        }else if(sl<=0){
            alert("Số lượng sản phảm phải lớn hơn 0");
            sl=1;
            document.getElementById(idGHCT).value = sl;
            updateSoLuong(idGHCT,parseInt(sl))
        } else {
            document.getElementById(idGHCT).value = sl;
            updateSoLuong(idGHCT,parseInt(sl))
        }

    }

    function updateSoLuong(idGHCT,data){
        let options = {
            method: "POST",
            dataType: "json",
            headers: {
                'Accept': 'application/json, text/plain',
                'Content-Type': 'application/json;charset=UTF-8'
            },
            body: JSON.stringify(data)
        }
        fetch('http://localhost:8080/GioHangCT/api/update-sl-ghct/' +idGHCT, options)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                if(data==true){


                }else {
                    alert("Số lượng sản phẩm đã đạt giới hạn ")
                    document.getElementById(idGHCT).value = data;
                }
                tongTienvaSl()


            })
    }

</script>
</body>

</html>