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
    <div >
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
            <h2 class="fw-bold">SneakerCentral</h2>
        </div>

        <div class="d-flex mt-5" >
            <div class="d-flex  col-6">
                <div class="ms-4 me-2 overflow-hidden" id="allAnhSanPham" style="height:395px;">
<%--                    <div class="mb-2">--%>
<%--                        <img src='<c:url value="/getimage/anh-giay-1.png"></c:url>' style="width: 120px;width: 96px"/>--%>
<%--                    </div >--%>
<%--                    <div class="mb-2">--%>
<%--                        <img src='<c:url value="/getimage/anh-giay-2.png"></c:url>' style="width: 120px;width: 96px"/>--%>
<%--                    </div>--%>
<%--                    <div class="mb-2">--%>
<%--                        <img src='<c:url value="/getimage/anh-giay-3.png"></c:url>' style="width: 120px;width: 96px"/>--%>
<%--                    </div>--%>
                </div>

                <div class="" id=anhSPChon>
<%--                    <div>--%>
<%--                        <img src='<c:url value="/getimage/anh-giay-1.png"></c:url>' style="width: 499px;height: 391px"/>--%>

<%--                    </div>--%>
                </div>
            </div>
            <div class="mx-5 ">
                <div>
                    <h2>
                        ${tenSP} &nbsp;- &nbsp;${thuongHieu}
                    </h2>
                    <div class="my-4 fw-bold fs-5">
                        <samp id="giaSPCT">

                        </samp> <span>đ</span>
                    </div>
                    <div >
                        Fullbox A.i.r Force 1 Shadow Pale Ivory. Phù hợp: Nữ, đi học, đi làm, hoạt động thể thao. Size: 36-39. Chất liệu: Da. Giao hàng toàn quốc. Bảo hành 3 tháng. Đổi trả dễ dàng. Streetwear, trẻ trung năng động.
                    </div>
                    <div class="d-flex  mt-4">
                        <div>
                            <div class="btn-group " role="group" aria-label="Basic radio toggle button group">
                                <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="on" checked onclick="mauSac()">
                                <label class="btn btn-outline-dark border-0 " for="btnradio1">
                                    <span class="fw-bold">Màu sắc  </span>
                                </label>

                                <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" onclick="kichCo()">
                                <label class="btn btn-outline-dark  border-0" for="btnradio2">
                                    <span class="fw-bold">Kích  cỡ  </span>
                                </label>

                            </div>
                            <div class="my-2   row " id="kichCoVaMauSac" style="max-width: 160px">

                            </div>
                        </div>
                        <div class="ms-5 mt-1">
                            <div style="width: 100px">
                                <span class="fw-bold">Số lượng</span>
                                <div class="mt-2">
                                    <div class="input-group mb-3 input-group-sm border rounded-pill border-dark border-2">
                                        <button class="btn border-0 btn btn-outline-dark rounded-pill rounded-end"  type="button" id="dashSL" onclick="dashSL()"><i class="bi bi-dash"></i></button>
                                        <input type="text" class="form-control border-0 border border-dark" value="1" onchange="suaSoLuong()" id="sl" style="width: 30px" >
                                        <button class="btn  border-0 btn btn-outline-dark rounded-pill rounded-start" type="button" id="plusSL" onclick="plusSL()"><i class="bi bi-plus"></i></button>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <button type="button" class="btn btn-outline-dark" onclick="addSPCTVaoGioHang()">Thêm vào giỏ hàng </button>
                            </div>
                            <div class="mt-3 d-flex gap-2">
                                <div class='col-lg-1 col-md-1 col-sm-1 mb-2 me-2 ms-1' id="chonMauSac">

                                </div>
                                <div class='col-lg-1 col-md-1 col-sm-1 mb-2 me-2 ' id="chonKichCo">

                                </div>
                                <div class=' mb-2 me-2 ms-1' id="soLuongSanPhamCT">

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div>
            <div>
                <div class="d-flex justify-content-center my-5">
                    <h2 >Mô tả </h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <h2> Đánh giá (0) </h2>
                </div>
                <div class="col-4 " style="margin-left:120px ">
                    Fullbox A.i.r Force 1 Shadow Pale Ivory. Phù hợp: Nữ, đi học, đi làm, hoạt động thể thao. Size: 36-39. Chất liệu: Da. Giao hàng toàn quốc. Bảo hành 3 tháng. Đổi trả dễ dàng. Streetwear, trẻ trung năng động.
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-center my-5">
            <img src='<c:url value="/getimage/hr.png"></c:url>' />
        </div>
        <div>
            <h2 class="text-center fw-bold">
                Sản phẩm tương tự
            </h2>
            <div class="d-flex justify-content-center">
                <div>
                    <img src='<c:url value="/getimage/Logo-star.png"></c:url>'>
                </div>
                <div class="mx-3">
                    <img src='<c:url value="/getimage/Logo-hr.png"></c:url>'>
                </div>
                <div>
                    <img src='<c:url value="/getimage/Logo-star.png"></c:url>'>
                </div>
            </div>
        </div>
        <div class="d-flex gap-3 mt-5 justify-content-center">
            <div>
                <a href="" style="text-decoration: none;">
                    <div class="card" style="width: 14rem;">
                        <img src='<c:url value="/getimage/IMG_1022.jpg"></c:url>' class="card-img-top">
                        <div class="card-body">
                            <span class="card-title fs-5"> Nike Air Force 1</span>
                            <h6 class="card-title fw-bold"> Nike Air Force 1</h6>
                            <span class="fw-bold fs-6 my-3">1000000</span> <span
                                class=" fs-6 fw-bold text-decoration-underline">đ</span>
                        </div>
                    </div>
                </a>
            </div>
            <div>
                <a href="" style="text-decoration: none;">
                    <div class="card" style="width: 14rem;">
                        <img src='<c:url value="/getimage/IMG_1022.jpg"></c:url>' class="card-img-top">
                        <div class="card-body">
                            <span class="card-title fs-5"> Nike Air Force 1</span>
                            <h6 class="card-title fw-bold"> Nike Air Force 1</h6>
                            <span class="fw-bold fs-6 my-3">1000000</span> <span
                                class=" fs-6 fw-bold text-decoration-underline">đ</span>
                        </div>
                    </div>
                </a>
            </div>
            <div>
                <a href="" style="text-decoration: none;">
                    <div class="card" style="width: 14rem;">
                        <img src='<c:url value="/getimage/IMG_1022.jpg"></c:url>' class="card-img-top">
                        <div class="card-body">
                            <span class="card-title fs-5"> Nike Air Force 1</span>
                            <h6 class="card-title fw-bold"> Nike Air Force 1</h6>
                            <span class="fw-bold fs-6 my-3">1000000</span> <span
                                class=" fs-6 fw-bold text-decoration-underline">đ</span>
                        </div>
                    </div>
                </a>
            </div>
            <div>
                <a href="" style="text-decoration: none;">
                    <div class="card" style="width: 14rem;">
                        <img src='<c:url value="/getimage/IMG_1022.jpg"></c:url>' class="card-img-top">
                        <div class="card-body">
                            <span class="card-title fs-5"> Nike Air Force 1</span>
                            <h6 class="card-title fw-bold"> Nike Air Force 1</h6>
                            <span class="fw-bold fs-6 my-3">1000000</span> <span
                                class=" fs-6 fw-bold text-decoration-underline">đ</span>
                        </div>
                    </div>
                </a>
            </div>
            <div>
                <a href="" style="text-decoration: none">
                    <div class="card" style="width: 14rem;">
                        <img src='<c:url value="/getimage/IMG_1022.jpg"></c:url>' class="card-img-top">
                        <div class="card-body">
                            <span class="card-title fs-5"> Nike Air Force 1</span>
                            <h6 class="card-title fw-bold"> Nike Air Force 1</h6>
                            <span class="fw-bold fs-6 my-3">1000000</span> <span
                                class=" fs-6 fw-bold text-decoration-underline">đ</span>
                        </div>
                    </div>
                </a>
            </div>
        </div>
<%--        <div id="allAnhSanPham">--%>

<%--        </div>--%>
<%--        <div id=anhSPChon>--%>

<%--        </div>--%>

        <div>&nbsp;</div>
        <div>&nbsp;</div>
    </div>
    <div>
        <jsp:include page="../viewFooter/footer.jsp"/>
    </div>


</div>

<script>
    idGioHang='${idGioHang}'

    idSP='${idSP}'

    idMauSac =null

    idKichCo =null

    idSPCTMua=null

    slSPCT=null

    giaSPCTMua=null

    tenSPCT=null

    soLuongSPMua=parseInt(document.getElementById("sl").value)

    console.log(idSP);

    getDataAllAnhSP(idSP)

    getDataAnhSP()

    tienNNLN()

    mauSac()
    function tienNNLN(){
        var tienNN=parseFloat('${tienNhoNhat}')
        var tienLN=parseFloat('${tienLonNhat}')
        var html= tienNN +"&nbsp;-&nbsp;"+tienLN;
        ;
        document.getElementById("giaSPCT").innerHTML=html;

    }


    function getDataAllAnhSP(idSanPham) {
        fetch('http://localhost:8080/Anh/api/all-anh-san-pham/'+ idSanPham)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                // console.log(data)
                var htmls=data.map(spct  => {
                    var anhABC = '<c:url value="/getimage/"></c:url>';

                    return "<div class='ms-4 me-2'>"
                                + "<div class='mb-2' >"
                                    +"<img src='"+anhABC + spct.ma+"' onclick='chonAnh(`"+spct.id+"`)' style='width: 120px;width: 96px'/>"
                                + "</div >"
                        + "</div>"
                        ;
                });
                var html=htmls.join('');
                document.getElementById("allAnhSanPham").innerHTML=html;

            })

            .catch(function (err) {
                alert("Lõi");
            });
    }

    function chonAnh(idAnh){
        console.log(idAnh)
        fetch('http://localhost:8080/Anh/api/anh-chon/'+ idAnh)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                // console.log(data)
                var anhABC = '<c:url value="/getimage/"></c:url>';
                var html="<div>"
                            + "<img src='"+anhABC + data.ma+"' style='width: 499px;height: 391px'/>"
                        + "</div>";
                document.getElementById("anhSPChon").innerHTML=html;

            })

            .catch(function (err) {
                alert("Lõi");
            });
    }

    function getDataAnhSP() {
        fetch('http://localhost:8080/Anh/api/anh-san-pham')
            .then(function (response) {
                return response.json();
            })
            .then(data => {

                // console.log(data)

                var htmls=data.map(spct  => {
                    if(spct.sanPhanCTTuan.sanPham.id==idSP){

                        var anhABC = '<c:url value="/getimage/"></c:url>';

                        return "<div>"
                                + "<img src='"+anhABC + spct.ma+"' style='width: 499px;height: 391px'/>"
                            + "</div>"
                            ;
                    }
                });
                var html=htmls.join('');
                // console.log(html);

                document.getElementById("anhSPChon").innerHTML=html;
            })

            .catch(function (err) {
                alert("Lõi");
            });
    }

    function kichCo(){
        if(idMauSac==null){
            fetch('http://localhost:8080/KichCo/api/kich-co-san-pham/'+idSP)
                .then(function (response) {
                    return response.json();
                })
                .then(data => {
                    var htmls=data.map(spct  => {
                        return "<div class='col-lg-1 col-md-1 col-sm-1 mb-2 me-2 ms-1'>"
                            + "<button type='button' "
                            + "class='btn rounded-circle border border-dark m-0 p-0 btn-outline-dark ' "
                            + "onclick='chonKCSP(`"+spct.kichCo.id+"`)' "
                            + "style='width: 30px;height: 30px;'>"
                            + "<samp >"+spct.kichCo.ten+"</samp>"
                            + "</button>"
                            + "</div>"
                            ;
                    });
                    var html=htmls.join('');
                    document.getElementById("kichCoVaMauSac").innerHTML=html;

                })

                .catch(function (err) {
                    alert("Lõi");
                });
        }else{
            fetch('http://localhost:8080/SPCT/api')
                .then(function (response) {
                    return response.json();
                })
                .then(data => {
                    var htmls=data.map(spct  => {
                        if(idSP==spct.sanPham.id && idMauSac==spct.mauSac.id){
                            return "<div class='col-lg-1 col-md-1 col-sm-1 mb-2 me-2 ms-1'>"
                                + "<button type='button' "
                                + "class='btn rounded-circle border border-dark m-0 p-0 btn-outline-dark ' "
                                + "onclick='chonKCSP(`"+spct.kichCo.id+"`)' "
                                + "style='width: 30px;height: 30px;'>"
                                + "<samp >"+spct.kichCo.ten+"</samp>"
                                + "</button>"
                                + "</div>"
                                ;
                        }
                    });
                    var html=htmls.join('');
                    document.getElementById("kichCoVaMauSac").innerHTML=html;

                })

                .catch(function (err) {
                    alert("Lõi");
                });
        }
    }

    function mauSac(){

        fetch('http://localhost:8080/MauSac/api/mau-sac-san-pham/'+idSP)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                console.log(data)
                var htmls=data.map(spct  => {
                        var mau=spct.mauSac.ten
                        return "<div class='col-lg-1 col-md-1 col-sm-1 mb-2 me-2 ms-1'>"
                            + "<button type='button'"
                            + " class='btn rounded-circle border border-2' "
                            + "onclick='chonMSSP(`"+spct.mauSac.id+"`)' "
                            + "style='background: "+mau+";width: 30px;height:30px'>"
                            + "</button>"
                            + "</div>"
                            ;
                });
                var html=htmls.join('');
                document.getElementById("kichCoVaMauSac").innerHTML=html;

            })

            .catch(function (err) {
                alert("Lõi");
            });

    }

    function chonMSSP(idMS){
        idMauSac=idMS
        document.getElementById("sl").value = 1 ;
        tienNNLN()
        xoachonKCSP()
        fetch('http://localhost:8080/MauSac/api/detail/'+idMS)
            .then(function (response) {
                return response.json();
            })
            .then(data => {

                var mau=data.ten
                var html="<button type='button' " +
                      "class='btn rounded-circle border border-2' "
                    + "onclick='xoaChonMS()' "
                    + "style='background: "+mau+";width: 30px;height:30px'>"
                +"</button>"
                document.getElementById("chonMauSac").innerHTML=html;
                chonAnhTheoMS(idMauSac)
            })

            .catch(function (err) {
                alert("Lõi");
            });
    }

    function xoaChonMS(){
        tienNNLN()
        idMauSac=null;
        idKichCo=null;
        slSPCT=null;
        var html='';
        document.getElementById("chonMauSac").innerHTML=html;
        document.getElementById("chonKichCo").innerHTML=html;
        document.getElementById("soLuongSanPhamCT").innerHTML=html;
        document.getElementById("sl").value = 1 ;

    }

    function chonKCSP(idKC){
        idKichCo=idKC;
        document.getElementById("sl").value = 1 ;
        if(idMauSac==null){
            alert("Bạn chưa chọn màu sắc cho sản phẩm ")
        }else{
            fetch('http://localhost:8080/KichCo/api/detail/'+idKC)
                .then(function (response) {
                    return response.json();
                })
                .then(data => {
                    var html= "<button type='button' "
                        + "class='btn rounded-circle border border-dark m-0 p-0 btn-outline-dark ' "
                        + "onclick='xoachonKCSP()' "
                        + "style='width: 30px;height: 30px;'>"
                        + "<samp >"+data.ten+"</samp>"
                        + "</button>"
                    ;
                    document.getElementById("chonKichCo").innerHTML=html;
                    soLuongSanPhamCT()

                })

                .catch(function (err) {
                    alert("Lõi");
                });
        }

    }

    function xoachonKCSP(){
        tienNNLN()
        idKichCo=null;
        slSPCT=null;
        var html='';
        document.getElementById("chonKichCo").innerHTML=html;
        document.getElementById("soLuongSanPhamCT").innerHTML=html;
        document.getElementById("sl").value = 1 ;

    }

    function soLuongSanPhamCT(){
        if(idMauSac!=null && idKichCo!=null){
            fetch('http://localhost:8080/SPCT/api')
                .then(function (response) {
                    return response.json();
                })
                .then(data => {

                    var htmls=data.map(spct  => {
                        if(idSP==spct.sanPham.id && idMauSac==spct.mauSac.id && idKichCo==spct.kichCo.id){
                            idSPCTMua=spct.id
                            giaSPCTMua=spct.donGia
                            slSPCT=spct.soLuong
                            tenSPCT=spct.sanPham.ten
                            var mes='SL sản phẩm : '
                            return mes + spct.soLuong ;
                        }
                    });
                    var html=htmls.join('');
                    document.getElementById("soLuongSanPhamCT").innerHTML=html;
                    document.getElementById("giaSPCT").innerHTML=giaSPCTMua;

                })

                .catch(function (err) {
                    alert("Lõi");
                });
        }
    }

    function chonAnhTheoMS(idMS){
        fetch('http://localhost:8080/Anh/api/chon-anh-mau-sac/'+ idMS)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                // console.log(data)
                var anhABC = '<c:url value="/getimage/"></c:url>';
                var html="<div>"
                    + "<img src='"+anhABC + data.ma+"' style='width: 499px;height: 391px'/>"
                    + "</div>";
                document.getElementById("anhSPChon").innerHTML=html;

            })

            .catch(function (err) {
                alert("Lõi");
            });
    }

    function dashSL(){
        var sl = parseInt(document.getElementById("sl").value);
        sl=sl - 1;
        if(sl<=0){
            alert("Số lượng sản phảm phải lớn hơn 0");
            sl=sl + 1;
        }
        soLuongSPMua=sl
        document.getElementById("sl").value = sl;

    }

    function  plusSL(){
        var sl = parseInt(document.getElementById("sl").value);
        if(sl==slSPCT){
            document.getElementById("sl").value = sl;
            alert("Số lượng sản phẩm đã đạt giới hạn")
            sl=sl-1;
        }else if(sl>=20){
            alert("Số lượng sản phảm phải nhỏ hơn 20 ");
            sl=sl-1;
        }
        sl=sl+1;
        soLuongSPMua=sl
        document.getElementById("sl").value = sl;
    }

    function suaSoLuong(){
        var sl = document.getElementById("sl").value;
        if(sl!=parseInt(sl)){
            document.getElementById("sl").value = 1;

        }else if(parseInt(sl)>=20 && slSPCT==null){
            alert("Số lượng sản phảm đã đạt giới hạn ");
            document.getElementById("sl").value = 20;

        }else if(parseInt(sl)<=0){
            alert("Số lượng sản phảm phải lớn hơn 0");
            document.getElementById("sl").value = 1;

        }else if(slSPCT!=null && parseInt(sl)>slSPCT){
            alert("Số lượng sản phảm đã đạt giới hạn  ");
            document.getElementById("sl").value = slSPCT;

        }
    }

    function addSPCTVaoGioHang(){
        if(idSPCTMua==null){
            alert("Khách hàng chưa chọn sản phẩm ")
        }else {
            var ngayThem = new Date();
            var gioHang={
                id:idGioHang
            };
            var spct={
                id:idSPCTMua
            };
            var formData = {
                gioHangOnline: gioHang,
                sanPhamCT: spct,
                tenSPCT: tenSPCT,
                soLuong: soLuongSPMua,
                giaSanPham:giaSPCTMua,
                ngayThem:ngayThem
            };
            addSPCTGH(formData)
        }

    }

    function addSPCTGH(data) {
        let options = {
            method: "POST",
            dataType: "json",
            headers: {
                'Accept': 'application/json, text/plain',
                'Content-Type': 'application/json;charset=UTF-8'
            },
            body: JSON.stringify(data)
        }
        fetch('http://localhost:8080/GioHangCT/api/add', options)
            .then(function (response) {
                return response.json();
            })
            .then(data => {
                if (data==false){
                    alert("Số lượng sản phẩm đã đạt giới hạn  ")
                }else {
                    alert("Them thanh cong");
                    location.reload();
                }



            })
    }

</script>

</body>

</html>