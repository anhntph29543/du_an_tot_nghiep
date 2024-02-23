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
    <script type="text/javascript">
        <%@include file="../../script.js" %>
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
        <jsp:include page="../../nav-bar.jsp"/>

    </div>
    <div class="col-10 border">
        <h4 class="">Quản lý kích cỡ  </h4>
        <div class="border border-dark rounded  m-3 p-3 ">
            <h5>Thêm kích cỡ</h5>
            <div class="col-md-3">
                <div class="input-group mb-3">
                    <input type="text" name="ten" class="form-control" placeholder="Tên kích cỡ" aria-label="Recipient's username" aria-describedby="button-addon2">
                    <div id="errorTenADD" class="form-text" style="color: red"></div>

                    <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="handlerCreateData()">Thêm</button>
                </div>
            </div>

        </div>

        <div class="border border-dark rounded  m-3 p-4 ">
            <table class="table  " id="table1" style="height: 210px">
                <thead>
                <tr>
                    <th>Mã</th>
                    <th>Tên kích cỡ</th>
                    <th>Ngày thêm</th>
                    <th>Trang thái</th>
                    <th>Action</th>
                </tr>
                </thead>

            </table>
        </div>

    </div>
</div>

<div class="modal fade " id="thuongHieu" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Chi tiết kích cỡ  </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <label style="display: none">
                        ID
                        <input type="text" id="id">
                    </label><br>
                    <label>
                        Mã kích cỡ :
                        <input type="text" id="maUD" disabled>
                    </label>
                    <div class="mb-3">
                        <label class="col-form-label">Tên kích cỡ:</label>
                        <input id="tenUD" type="text" class="form-control"/><br>
                        <div id="errorTen" class="form-text" style="color: red"></div>
                    </div>
                    <label class="mt-3">
                        Ngày thêm :
                        <p id="ngayThem"></p>
                    </label><br>
                    <label class="mb-3">
                        Trạng thái :
                        <input type="checkbox" id="trangThai" > Hoạt động
                    </label><br>
                    <button class="btn btn-secondary" onclick="handlerUpdateData()">Update</button>
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


    start();

    var errorTen= document.getElementById("errorTen");
    var errorTenADD= document.getElementById("errorTenADD");
    const clModal= new bootstrap.Modal('#thuongHieu');
    function start() {
        getData();
    }

    function handlerCreateData() {
        var ten = document.querySelector('input[name="ten"]').value;
        var thoiGianThem = new Date();
        var trangThai = true;
        if (ten.trim()==null || ten.trim()==""){
            errorTenADD.innerHTML="Tên trống";
            return;
        }
        var formData = {
            ten: ten,
            ngayThem: thoiGianThem,
            trangThai: trangThai,
        };
        addData(formData);
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
        fetch('http://localhost:8080/KichCo/api/add', options)
            .then(function (response) {
                response.json();
                alert("Them thanh cong");
                errorTenADD.innerHTML="";
                table.destroy();
                getData()
            })
    }

    function handlerUpdateData(){
        var id = document.querySelector('input[id="id"]').value;
        var ten = document.querySelector('input[id="tenUD"]').value;
        var ma = document.querySelector('input[id="maUD"]').value;
        var ngayThem = new Date();
        var trangThai = document.querySelector('input[id="trangThai"]').checked;
        console.log(trangThai)
        if (ten.trim()==null || ten.trim()==""){
            errorTen.innerHTML="Tên trống";
            return;
        }

        var formData = {
            ma: ma,
            ten: ten,
            ngayThem: ngayThem,
            trangThai: trangThai,
        };
        udateData(id,formData);

    }
    function udateData(id,data){
        let options = {
            method: "PUT",
            dataType: "json",
            headers: {
                'Accept': 'application/json, text/plain',
                'Content-Type': 'application/json;charset=UTF-8'
            },
            body: JSON.stringify(data)
        }
        fetch('http://localhost:8080/KichCo/api/update/'+id, options)
            .then(function (response) {
                response.json();
                alert("Update thanh cong");
                clModal.hide();
                table.destroy();
                getData()
            })
    }

    function detailData(id) {
        errorTen.innerText=null
        fetch('http://localhost:8080/KichCo/api/detail/' + id)
            .then(function (response) {
                return response.json();
            })
            .then(data=>{
                console.log(data)
                document.getElementById("maUD").value = data.ma;
                document.getElementById("tenUD").value = data.ten;
                document.getElementById("id").value = data.id;
                document.getElementById("ngayThem").innerHTML = data.ngayThem;
                let trangThai=document.getElementById("trangThai") ;
                trangThai.checked=data.trangThai;
            })
    }

    function getData() {
        fetch('http://localhost:8080/KichCo/api')
            .then(function (response) {
                return response.json();
            })
            .then(data => {

                console.log(data)
                $(document).ready(function () {
                    table = $('#table1').DataTable({
                        "data": data,

                        "columns": [
                            {"data": 'ma'},
                            {"data": 'ten'},
                            {"data": 'ngayThem'},
                            {
                                "data": 'trangThai',
                                "render": function (data, type, row, meta) {
                                    trangThai= data==true?"Hoạt động":"Không hoạt động";
                                    return '<td>'+trangThai+' </td >';
                                }
                            },
                            {
                                "data": 'id',
                                "render": function (data, type, row, meta) {

                                    return '<button  type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#thuongHieu" onclick="detailData(`'+data+'`)" ><i class="bi bi-pencil-square"></i></button >';
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
</html>