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
    <link href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
    <script defer src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script defer type="text/javascript" src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script defer src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

</head>
<body>
<div style="background: #E7E2E2">
    <div id="header">
        <jsp:include page="../viewHeader/header.jsp">
            <jsp:param name="param1" value="${idLogin}"/>
            <jsp:param name="param2" value="${idGioHang}"/>

        </jsp:include>
    </div>
    <div style="border-radius: 30px" class="container my-3 ">
        <div style="position: relative;">
<%--            <input type="text" name="idLogin"  id="idlogin">--%>
            <img src='<c:url value="/getimage/Banner-Login.png"></c:url>' style="width: 100%;border-radius: 30px">
            <div style="position: absolute;bottom: 55px;left: 260px;">
                <div style="width: 800px;height: 450px; background: white;border-radius: 30px">
                    <div >
                        <div class="btn-group " role="group" aria-label="Basic radio toggle button group">
                            <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="on" checked onclick="trangDangNhap()">
                            <label class="btn btn-outline-dark border-0 border-bottom border-dark"
                                   style="width: 405px;height: 80px;border-radius: 30px 0px 0px 0px" for="btnradio1">
                                <span class="fw-bold fs-3 ">Đăng nhập  </span>
                            </label>

                            <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" onclick="trangDangKy()">
                            <label class="btn btn-outline-dark border-0 border-bottom border-dark"
                                   style="width: 400px;height: 80px;border-radius: 0px 30px 0px 0px" for="btnradio2">
                                <span class="fw-bold fs-3">Đăng ký  </span>
                            </label>

                        </div>
                        <div class=" " id="trangDangNhapDangKy" >

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div>
        <jsp:include page="../viewFooter/footer.jsp"/>
    </div>

</div>
<script>


    trangDangNhap()

    function trangDangNhap(){

        var logoSC='<c:url value="/getimage/LogoSC.png"></c:url>'
        var logoGoogle='<c:url value="/getimage/Logo-Google.png"></c:url>'
        var html= "<div class='d-flex justify-content-between'>"
                + "<div class='mt-3'>"
                    + "<img src='"+logoSC+"'><br/>"
                        + "<h3 class=' ms-4  '>"
                           +" &nbsp;&nbsp;SneakerCentral"
                        +"</h3>"
                +"</div>"
                +"<div class='mt-3'>"
                    + "<h3>"
                        + "Login with Google&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                    + "</h3>"
                    +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                    +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                    + "<img src='"+logoGoogle+"'>"
                +"</div>"
            + "</div>"
        + "<div class='d-grid justify-content-center mt-3'>"
            + "<div class='' style='width: 400px'>"
                + "<input type='email' class='form-control rounded-pill border border-dark' onchange='handlerUser1()' id='user1' placeholder='Nhập email'>"
            + "<div id='errorUser1' class='form-text' style='color: red'></div>"
            + "</div>"
            + "<div class='my-4' style='width: 400px'>"
                + "<input class='form-control rounded-pill border border-dark'  type='password' placeholder='Nhập mật khẩu ' onchange='handlerPassword1()' id='password1'>"
            + "<div id='errorPassword1' class='form-text' style='color: red'></div>"
            + "</div>"
        + "</div>"
        + "<div class='d-flex justify-content-between ' style='width: 500px;margin-left: 280px'>"
            + "<div class='ms-5 '>"
                + "<button type='button' class='btn btn-outline-dark fw-bold btn-lg'  onclick='handlerLogin1()'> "+"Đăng nhập"+"</button>"
            +"</div>"
            + "<div class='me-5'>"
                +"<button type='button' class='btn border-0  border-dark '>Quên mật khẩu </button>"
            +"</div>"
        +"</div>"

            ;

        document.getElementById("trangDangNhapDangKy").innerHTML = html;
    }

    function trangDangKy(){
        var logoSC='<c:url value="/getimage/LogoSC.png"></c:url>'
        var logoGoogle='<c:url value="/getimage/Logo-Google.png"></c:url>'
        var html= "<div class='d-flex justify-content-between'>"
            + "<div class='mt-3'>"
            + "<img src='"+logoSC+"'><br/>"
            + "<h3 class=' ms-4  '>"
            +" &nbsp;&nbsp;SneakerCentral"
            +"</h3>"
            +"</div>"
            +"<div class='mt-3'>"
            + "<h3>"
            + "Login with Google&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
            + "</h3>"
            +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
            +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
            + "<img src='"+logoGoogle+"'>"
            +"</div>"
            + "</div>"
            +`<div class="d-flex justify-content-center">
        <div class="d-grid justify-content-center mt-3">
            <div class="" style="width: 200px">
                <input type="text" class="form-control rounded-pill border border-dark"  placeholder="Nhập họ và tên  ">
            </div>
            <div class="my-4" style="width: 200px">
                <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                    <option selected>Chọn giới tính </option>
                    <option value="nam">Nam</option>
                    <option value="nu">Nữ </option>
                    <option value="gioiTinhKhac">Giới tính khác</option>
                </select>
            </div>
        </div>
        <div class="d-grid justify-content-center mt-3 mx-3">
            <div class="" style="width: 200px">
                <input type="email" class="form-control rounded-pill border border-dark"  placeholder="Nhập email   ">
            </div>
            <div class="my-4" style="width: 200px">
                <input class="form-control rounded-pill border border-dark" type="text" placeholder="Nhập SĐT  " >
            </div>
        </div>
        <div class="d-grid justify-content-center mt-3">
            <div class="" style="width: 200px">
                <input type="email" class="form-control rounded-pill border border-dark" id="234" placeholder="Nhập mật khẩu   ">
            </div>
            <div class="my-4" style="width: 200px">
                <input class="form-control rounded-pill border border-dark" type="text" placeholder="Nhập lại mật khẩu " >
            </div>
        </div>
    </div>
              <div class="d-flex justify-content-between " style="width: 500px;margin-left: 280px">
        <div class="ms-5 ">
            <button type="button" class="btn btn-outline-dark fw-bold btn-lg">Đăng Ký</button>
        </div>

    </div>`

        document.getElementById("trangDangNhapDangKy").innerHTML = html;
    }

    var errorUser1= document.getElementById("errorUser1");
    var errorPassword1= document.getElementById("errorPassword1");

    function handlerUser1(){
        var userName = document.querySelector('input[id="user1"]').value;
        if (userName.trim()!=null || userName.trim()!=""){
            errorUser1.innerHTML="";
            return;
        }
    }

    function handlerPassword1(){
        var passsword = document.querySelector('input[id="password1"]').value;
        if (passsword.trim()!=null || passsword.trim()!=""){
            errorPassword1.innerHTML="";
            return;
        }
    }

    var idLogin=null
    function handlerLogin1(){
        var userName = document.querySelector('input[id="user1"]').value;
        var passsword = document.querySelector('input[id="password1"]').value;

        if (userName.trim()==null || userName.trim()==""){
            errorUser1.innerHTML="UserName trống";
            return;
        }
        if (passsword.trim()==null || passsword.trim()==""){
            errorPassword1.innerHTML="Password trống";
            return;
        }

        var formData = {
            user: userName,
            password: passsword,
        };
        console.log(idLogin)
        loginData1(formData);
    }

    function loginData1(data) {
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
                    errorPassword1.innerHTML="Email hoặc mật khẩu sai ";
                    return;
                }
                alert("Đăng nhập thành công ")
                idLogin=data
                location.assign("http://localhost:8080/ban-hang-online/datn/trang-chu/"+idLogin)

            })

    }


</script>

</body>

</html>