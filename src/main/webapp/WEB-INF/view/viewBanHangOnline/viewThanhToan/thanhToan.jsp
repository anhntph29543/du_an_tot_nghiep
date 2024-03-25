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
            <h2 class="fw-bold">Thanh toán  </h2>
        </div>
        <div class="mt-5 ">
            <div class="d-flex justify-content-center  ">
                <div class="col-6 mx-4 " >
                    <div class="d-flex justify-content-between  ">
                        <div>
                            <h4 class="text-center fw-bold ms-3 ">Thanh toán và giao hàng </h4>
                        </div>
                        <div>
                            <button type="button" class="btn btn-outline-dark me-5 border border-dark">Tạo mới </button>
                        </div>
                    </div>
                    <div class="me-5 ms-3 ">
                        <div class="d-flex gap-2 my-3">
                            <div >
                                <label  class="form-label">Họ Và Tên Khách Hàng </label>
                                <input type="text"  class="form-control rounded-pill border border-dark" style="width: 280px" aria-describedby="passwordHelpBlock">
                            </div>
                            <div>
                                <label  class="form-label">Mã địa chỉ </label>
                                <input type="text"  class="form-control rounded-pill border border-dark" style="width: 280px" aria-describedby="passwordHelpBlock">
                            </div>
                        </div>
                        <div>
                            <span>Quốc Gia / Khu Vực </span>
                            <h5>Việt Nam </h5>
                        </div>
                        <div class="d-flex gap-2 my-3">
                            <div >
                                <label  class="form-label">Tỉnh / Thành Phố </label>
                                <input type="text"  class="form-control rounded-pill border border-dark" style="width: 280px" aria-describedby="passwordHelpBlock">
                            </div>
                            <div>
                                <label class="form-label">Huyện </label>
                                <input type="text"  class="form-control rounded-pill border border-dark" style="width: 280px" aria-describedby="passwordHelpBlock">
                            </div>
                        </div>
                        <div class="d-flex gap-2 my-3">
                            <div>
                                <label class="form-label">Phường  </label>
                                <input type="text"  class="form-control rounded-pill border border-dark" style="width: 280px" aria-describedby="passwordHelpBlock">
                            </div>
                            <div>
                                <label class="form-label">Địa chỉ  </label>
                                <input type="text"  class="form-control rounded-pill border border-dark" style="width: 280px" aria-describedby="passwordHelpBlock">
                            </div>
                        </div>
                        <div class=" my-3">
                            <label class="form-label ">Số điện thoại   </label>
                            <input type="text"  class="form-control rounded-pill border border-dark" style="width: 560px" aria-describedby="passwordHelpBlock">
                        </div>
                        <div class=" my-3">
                            <label class="form-label">Email   </label>
                            <input type="text"  class="form-control rounded-pill border border-dark" style="width: 560px" aria-describedby="passwordHelpBlock">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label">Ghi chú </label>
                            <textarea class="form-control border border-dark" id="exampleFormControlTextarea1" rows="4" style="width: 560px"></textarea>
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
                            <span>0</span><span>đ</span>

                        </div>
                    </div>
                    <hr class="mx-4 my-4 border border-dark border-2">
                    <div class=" ms-5 mt-3  ">
                        <div class="fw-bold fs-5">
                            <span>Hình thức thanh toán  </span>
                        </div>
                        <div class=" ms-5 me-5 mt-3 fw-bold fs-6">

                            <div class="form-check my-3">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                                <label class="form-check-label" for="flexRadioDefault2">
                                    Thanh toán khi nhận hàng
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                                <label class="form-check-label" for="flexRadioDefault1">
                                    Thanh toán bằng chuyển khoản
                                </label>
                            </div>

                        </div>
                    </div>
                    <div class="fw-bold fs-5  d-flex my-4 justify-content-center ">
                        <div>
                            <button type="button" class="btn btn-dark btn-lg"><span class="fw-bold ">Thanh toán </span> </button>
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
    var number=null
    var tongSanPham=0

    sanPhamCTTrongGioHang()

    function gioHangOnline(){

        if(idGioHang=="123"){
            var storeNoProduct = '<c:url value="/getimage/Store-no-product.png"></c:url>';
            var html="<div>"
                +"<img src='"+storeNoProduct +"'  />"
                + "<h5>Bạn chưa đăng nhập chưa thể thêm sản phẩm vào giỏ hàng </h5>"
                + "</div>"
            document.getElementById("gioHang").innerHTML = html;

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
            document.getElementById("gioHang").innerHTML = html;
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
                gioHangOnline()
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
                    tongSanPham+=ghct.soLuong
                    tongTien+=ghct.tongTien
                    var anhABC = '<c:url value="/getimage/"></c:url>';
                    return "<div class='border m-3 ' style='border-radius: 20px;'>"
                        + "<div class='d-flex justify-content-evenly'>"
                        + "<div class='my-2'>"
                        + "<img src='"+anhABC + ghct.anh+"' style='width: 100px;height: 78px;border-radius: 10px'/>"
                        + "</div>"

                        + "<div class='mt-2'>"
                        + "<h6>"+ ghct.tenSPCT +"</h6>"
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

                        + "<div class='mt-2'>"
                        + "<samp style='color: darkgrey' class='mx-3 fw-bold' >"+ghct.soLuong+ "&nbsp;x"+ "</samp>"
                        + "</div>"


                        + "<div class='mt-2 '>"
                        + "<span class='fw-bold'>"+ghct.tongTien+ "&nbsp;đ"+ "</span>"
                        + "</div>"


                        + "</div>"
                        + "</div>"

                        ;

                });
                var html=htmls.join('');
                document.getElementById("gioHang").innerHTML=html;
                // document.getElementById("tongSanPham").innerHTML=tongSanPham;
                // document.getElementById("tongTienTamTinh").innerHTML=tongTien;
                // document.getElementById("tongTienDaTinh").innerHTML=tongTien;
            })

            .catch(function (err) {
                alert("Lõi"+err);
            });
    }
</script>

</body>

</html>