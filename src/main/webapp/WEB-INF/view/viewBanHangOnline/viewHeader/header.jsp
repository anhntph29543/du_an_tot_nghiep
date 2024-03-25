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
<div class="rounded-top" style="background: white;border-radius: 30px;">
    <div class="">
        <div class="container d-flex justify-content-between mt-4">
            <div>
                <img src='<c:url value="/getimage/LogoSC.png"></c:url>'><br/>
                <h2 class=" ms-4 fw-bold ">
                    &nbsp;SC Shop
                </h2>
            </div>
            <div class="mt-5">
                <div class="input-group mb-3" style="width: 600px">
                    <input type="text" class="form-control rounded-pill mx-3 border border-dark" placeholder="Search"
                           aria-label="Recipient's username" aria-describedby="button-addon2"/>
                    <button class="btn btn-outline-dark rounded-pill  fw-bold" type="button" id="button-addon2">SEARCH
                    </button>
                </div>
            </div>
            <div class="mt-5">
                <div class="d-flex">

                    <%--                    <div class="mx-5 mt-1">--%>
                    <%--                        <img src='<c:url value="/getimage/Logo-ThongBao.png"></c:url>'><br/>--%>
                    <%--                    </div>--%>

                    <div class="mx-5 m">
                        <button class="btn border-0 "
                                type="button" data-bs-toggle="offcanvas"
                                data-bs-target="#offcanvasThongBao" aria-controls="offcanvasThongBao">
                            <img src='<c:url value="/getimage/Logo-ThongBao.png"></c:url>'>
                        </button>
                    </div>

                    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasThongBao"
                         aria-labelledby="offcanvasRightGioHang">
                        <div class="offcanvas-header">
                            <h5 id="offcanvasRightThongBao">Thông báo </h5>
                            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                                    aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body">
                            ...
                        </div>
                    </div>
                    <%--                    <div class="mt-1">--%>
                    <%--                        <a href="/ban-hang-online/datn/gio-hang">--%>
                    <%--                            <img src='<c:url value="/getimage/Logo-GioHang.png"></c:url>'><br/>--%>
                    <%--                        </a>--%>
                    <%--                    </div>--%>

                    <div class="">
                        <button class="btn border-0 "
                                type="button" data-bs-toggle="offcanvas"
                                data-bs-target="#offcanvasGioHang" aria-controls="offcanvasGioHang"
                                onclick="gioHangOnline()">
                            <img src='<c:url value="/getimage/Logo-GioHang.png"></c:url>'><br/>
                        </button>
                    </div>

                    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasGioHang"
                         aria-labelledby="offcanvasRightGioHang">
                        <div class="offcanvas-header">
                            <h4 id="offcanvasRightGioHang">Giỏ hàng  </h4>
                            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                                    aria-label="Close"></button>
                        </div>
                        <hr>
                        <div class="offcanvas-body">
                            <div id="gioHangOnline" class="d-grid gap-4 ">

                            </div>
                            <hr>
                            <div class="my-3">
                                <span class="fs-4 fw-bold">Tổng tiền :&nbsp;&nbsp;</span>
                                <span id="tongTien" class="fw-bold fs-5 "></span><span class="fw-bold">&nbsp;đ</span>
                            </div>
                            <div class="mt-4 d-grid gap-2  " >
                                <button type="button" class="btn btn-dark fw-bold " onclick="xemGioHang()">XEM GIỎ HÀNG </button>
                                <button type="button" class="btn border fw-bold  ">THANH TOAN </button>
                            </div>
                        </div>
                    </div>
                    <div class="ms-5">
                        <%--                        <a href="/datn/ban-hang-online/dang-nhap-dang-ky">--%>
                        <%--                            <img src='<c:url value="/getimage/Logo-user.png"></c:url>'><br/>--%>
                        <%--                        </a>--%>
                        <div class="btn-group" id="user">
                            <%--                            <button type="button" class="btn border-0 dropdown-toggle" data-bs-toggle="dropdown"--%>
                            <%--                                    aria-expanded="false">--%>
                            <%--                                <img src='<c:url value="/getimage/Logo-user.png"></c:url>'>--%>
                            <%--                            </button>--%>
                            <%--                            <ul class="dropdown-menu">--%>
                            <%--                                <li><a class="dropdown-item" href="/ban-hang-online/datn/dang-nhap-dang-ky">Đăng nhập </a></li>--%>
                            <%--                            </ul>--%>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="mt-3">
            <ul class="nav container justify-content-between col-6">
                <li class="nav-item">
                    <a class="nav-link active fw-bold fs-5 " style="color: black" aria-current="page"
                       href="/ban-hang-online/datn/trang-chu">
                        <img src='<c:url value="/getimage/Logo-Home.png"></c:url>' style="width: 25px">&nbsp;
                        Trang chủ </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link fw-bold fs-5" style="color: black" href="/ban-hang-online/datn/cua-hang">Cửa
                        hàng </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link fw-bold fs-5 " style="color: black"
                       href="/ban-hang-online/datn/tra-cuu-don-hang">Tra cứu đơn hàng </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-bold fs-5 " style="color: black"
                       href="/ban-hang-online/datn/gio-hang">Trang </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-bold fs-5 " style="color: black" href="/ban-hang-online/datn/lien-he">Liên
                        hệ </a>
                </li>

            </ul>
        </div>
    </div>
    <hr style="padding: 0px;margin: 0px">
    <div class="container">
        <div class="py-2">
            <img src='<c:url value="/getimage/Logo-Home.png"></c:url>' style="width:20px">
        </div>
    </div>


</div>
<script>
    var idLogin = '${param.param1}'
    var idGioHang = '${param.param2}'
    var number=null

    sanPhamCTTrongGioHang()
    // console.log(idLogin)
    // console.log(idGioHang)
    userLogin()
    dangNhap()
    function userLogin() {

        if (idLogin == "123") {
            var logoUser = '<c:url value="/getimage/Logo-user.png"></c:url>'

            var htmls="<div class=' '>"
                + "<button class='btn border-0 '"
                       + " type='button' data-bs-toggle='offcanvas'"
                        + "data-bs-target='#offcanvasUser' aria-controls='offcanvasUser'>"
                    + "<img src='"+logoUser+"'>"
                + "</button>"
            + "</div>"

            + "<div class='offcanvas offcanvas-end' tabindex='-1' id='offcanvasUser'"
                 + "aria-labelledby='offcanvasRightUser'>"
                + "<div class='offcanvas-header'>"
                    + "<h5 id='offcanvasRightUser'>Tài Khoản </h5>"
                    + "<button type='button' class='btn-close text-reset' data-bs-dismiss='offcanvas'"
                            + "aria-label='Close'></button>"
                + "</div>"
                + "<hr/>"
                + "<div class='offcanvas-body'>"
                    +"<div id='dangNhapDangKy'>"

                    + "</div> "
                    + "<div class='d-grid justify-content-center'>"
                        + " <button class=' btn btn-dark mt-3'>"
                            + "<a class='dropdown-item' href='/ban-hang-online/datn/dang-nhap-dang-ky'>Trang đăng nhập </a>"
                        + "</button>"
                    + "</div>"
                + "</div>"
            + "</div>"
            document.getElementById("user").innerHTML = htmls;
        } else {
            fetch('http://localhost:8080/KhachHangOnline/api/hien-thi-khach-hang/' + idLogin)
                .then(function (response) {
                    return response.json();
                })
                .then(data => {
                    console.log(data)
                    var logoUser = '<c:url value="/getimage/"></c:url>'

                    var htmls="<div class=' '>"
                        + "<button class='btn border-0 '"
                                + " type='button' data-bs-toggle='offcanvas'"
                                + "data-bs-target='#offcanvasUser' aria-controls='offcanvasUser'>"
                            + "<img style='width: 35px;height: 35px; border-radius: 30px' src='"+ logoUser + data.anh +"'>"
                        + "</button>"
                        + "</div>"

                        + "<div class='offcanvas offcanvas-end' tabindex='-1' id='offcanvasUser'"
                                + "aria-labelledby='offcanvasRightUser'>"
                            + "<div class='offcanvas-header'>"
                                + "<h5 id='offcanvasRightUser'>Tài Khoản  </h5>"
                                + "<button type='button' class='btn-close text-reset' data-bs-dismiss='offcanvas'"
                                    + "aria-label='Close'></button>"
                            + "</div>"
                        + "<div class='offcanvas-body'>"

                        + "</div>"
                            + "<div>"
                                + " <button class=' btn btn-dark'>"
                                    + "<a class='dropdown-item' href='/ban-hang-online/datn/dang-nhap-dang-ky'>Trang cá nhân  </a>"
                                + "</button>"

                                + " <button class=' btn btn-dark'>"
                                    + "<a class='dropdown-item' href='/ban-hang-online/datn/dang-nhap-dang-ky'>Đăng xuất </a>"
                                + "</button>"
                            + "</div>"
                        + "</div>"
                    document.getElementById("user").innerHTML = htmls;

                })

                .catch(function (err) {
                    alert("Lõi");
                });
        }
    }

    function dangNhap(){
        var html=  "<div class='d-grid justify-content-center mt-3'>"
                        + "<h4 class='mb-5'>Đăng nhập </h4>"
                        + "<div class='' style='width: 300px'>"
                            + "<input type='email' class='form-control rounded-pill border border-dark' onchange='handlerUser()' id='user' placeholder='Nhập email'>"
                            + "<div id='errorUser' class='form-text' style='color: red'></div>"
                        + "</div>"

                        + "<div class='my-4' style='width: 300px'>"
                                + "<input class='form-control rounded-pill border border-dark'  type='password' placeholder='Nhập mật khẩu ' onchange='handlerPassword()' id='password'>"
                                + "<div id='errorPassword' class='form-text' style='color: red'></div>"
                        + "</div>"
                    + "</div>"
                + "<div class='d-grid justify-content-center '>"
                    + "<div class=' '>"
                        + "<button type='button' class='btn btn-outline-dark fw-bold btn-lg'  onclick='handlerLogin()'> "+"Đăng nhập"+"</button>"
                    +"</div>"

                    + "<div class=''>"
                        +"<button type='button' class='btn border-0  border-dark '>Quên mật khẩu </button>"
                    +"</div>"
                +"</div>"

        ;

        document.getElementById("dangNhapDangKy").innerHTML = html;
    }

    var errorUser= document.getElementById("errorUser");
    var errorPassword= document.getElementById("errorPassword");

    function handlerUser(){
        var userName = document.querySelector('input[id="user"]').value;
        if (userName.trim()!=null || userName.trim()!=""){
            errorUser.innerHTML="";
            return;
        }
    }

    function handlerPassword(){
        var passsword = document.querySelector('input[id="password"]').value;
        if (passsword.trim()!=null || passsword.trim()!=""){
            errorPassword.innerHTML="";
            return;
        }
    }

    function handlerLogin(){
        var userName = document.querySelector('input[id="user"]').value;
        var passsword = document.querySelector('input[id="password"]').value;

        if (userName.trim()==null || userName.trim()==""){
            errorUser.innerHTML="UserName trống";
            return;
        }
        if (passsword.trim()==null || passsword.trim()==""){
            errorPassword.innerHTML="Password trống";
            return;
        }

        var formData = {
            user: userName,
            password: passsword,
        };
        console.log(idLogin)
        loginData(formData);
    }

    function loginData(data) {
        let options = {
            method: "POST",
            dataType: "json",
            headers: {
                'Accept': 'application/json, text/plain',
                'Content-Type': 'application/json;charset=UTF-8'
            },
            body: JSON.stringify(data)
        }
        fetch('http://localhost:8080/Login/api/login', options)
            .then(function (response) {
                return response.json();

            })
            .then(data=>{
                if(data==0){
                    errorPassword.innerHTML="Email hoặc mật khẩu sai ";
                    return;
                }
                alert("Đăng nhập thành công ")
                idLogin=data
                location.assign("http://localhost:8080/ban-hang-online/datn/trang-chu/"+idLogin)

            })

    }

    function gioHangOnline(){

        if(idGioHang=="123"){
            var storeNoProduct = '<c:url value="/getimage/Store-no-product.png"></c:url>';
            var html="<div>"
                +"<img src='"+storeNoProduct +"'  />"
                + "<h5>Bạn chưa đăng nhập chưa thể thêm sản phẩm vào giỏ hàng </h5>"
                + "</div>"
            document.getElementById("gioHangOnline").innerHTML = html;

        }else if(idGioHang!="123"&& number==1 ){
            hienThiSPCTGioHang()
        }else {
            var storeNoProduct = '<c:url value="/getimage/Store-no-product.png"></c:url>';
            var html="<div class='d-grid justify-content-center'>"
                + "<div class='d-flex justify-content-center'>"
                + "<img src='"+storeNoProduct +"'/>"
                + "</div>"
                + "<h5 class='my-4'>Chưa có sản phẩm trong giỏ hàng </h5>"
                + "<button class='btn btn-dark' onclick='trangCuaHang()'>Đến cửa hàng </button>"
                + "</div>"
            document.getElementById("gioHangOnline").innerHTML = html;
            document.getElementById("tongTien").innerHTML=0;
        }
    }

    function sanPhamCTTrongGioHang(){
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

            })

            .catch(function (err) {
                alert("Lõi");
            });
    }

    function hienThiSPCTGioHang(){
        fetch('http://localhost:8080/GioHangCT/api/spct-gio-hang/'+idGioHang)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                var tongTien=0
                console.log(data)
                var htmls=data.map(ghct  => {
                    tongTien+=ghct.tongTien
                    var anhABC = '<c:url value="/getimage/"></c:url>';
                    return "<div>"
                            + "<div class='d-flex'>"
                                + "<div class='me-2'>"
                                    + "<img src='"+anhABC + ghct.anh+"' style='width: 130px;height: 100px;border-radius: 10px'/>"
                                + "</div>"
                                + "<div>"
                                    + "<h6>"+ ghct.tenSPCT +"-"+ ghct.thuongHieu +"</h6>"
                                    +"<button type='button' "
                                        + "class='btn rounded-circle border border-2 mx-2' "
                                        + "style='background: "+ghct.mauSac+";width: 30px;height:30px'>"
                                    +"</button>"

                                    +"<button type='button' "
                                        + "class='btn rounded-circle border border-dark m-0 p-0 btn-outline-dark ' "
                                        + "style='width: 30px;height: 30px;'>"
                                        + "<samp >"+ghct.kichCo+"</samp>"
                                    + "</button>"

                                        + "<samp style='color: darkgrey' class='mx-3 fw-bold' >"+ghct.soLuong+ "&nbsp;x"+ "</samp>"
                                        + "<span class='fw-bold'>"+ghct.giaSanPham+ "&nbsp;đ"+ "</span>"
                                + "</div>"
                                + "<div class='btn border-0 ' onclick='xoaSPCTGH(`" + ghct.idGioHangCT +"`)'>"
                                    +"<i class='bi bi-backspace'></i>"
                                + "</div>"
                            + "</div>"
                        + "</div>"

                        ;

                });
                var html=htmls.join('');
                document.getElementById("gioHangOnline").innerHTML=html;
                document.getElementById("tongTien").innerHTML=tongTien;
            })

            .catch(function (err) {
                alert("Lõi"+err);
            });
    }

    function xoaSPCTGH(idGHCT){
        let options = {
            method: "DELETE"
        }
        fetch('http://localhost:8080/GioHangCT/api/delete/'+idGHCT,options)
            .then(function (response) {
                 response.json();
                 alert("Xoa thanh cong")

                gioHangOnline()

            })


            .catch(function (err) {
                alert("Lõi");
            });
    }

    function trangCuaHang(){
        location.assign("http://localhost:8080/ban-hang-online/datn/cua-hang")
    }

    function xemGioHang(){
        location.assign("http://localhost:8080/ban-hang-online/datn/gio-hang")
    }

</script>
</body>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>
</html>