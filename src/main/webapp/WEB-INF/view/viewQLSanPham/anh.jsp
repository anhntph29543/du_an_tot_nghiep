
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
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />

    <link href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
    <script defer src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script defer type="text/javascript" src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script defer src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

    <script type="text/javascript"><%@include file="../script.js" %></script>
</head>
<body>
<div class=" d-flex">
    <div class=" col-2 " >
        <jsp:include page="../nav-bar.jsp"/>
        <%--            <%--%>
        <%--                 if(request.getParameter("p")!=null)--%>
        <%--             {--%>
        <%--                  String p = request.getParameter("p");--%>
        <%--            %>--%>
        <%--                <jsp:include page="<%=p+".jsp"%>"/>--%>
        <%--             <%--%>
        <%--                }--%>
        <%--             %>--%>
    </div>
    <div class="col-10 border">

        <div>

            <table class="table table-striped" id="table1">
                <thead>
                <tr>
                    <th>Địa chỉ</th>
                    <th>Địa chỉ</th>
                </tr>
                </thead>
<%--                        <tbody id="post-block">--%>

<%--                        </tbody>--%>

            </table>
        </div>
        <div>
            <div>
                <img src='<c:url value="/getimage/Logo-Home.png"></c:url>' id="profile-pic" />
                <label for="input-file">Update file</label>
                <input type="file" accept="image/jpeg,image/png,image/jpg" id="input-file" style="display: none">
            </div>
        </div>
        <script>
            let profilePic=document.getElementById("profile-pic");
            let inputFile=document.getElementById("input-file");

            inputFile.onchange= function (){
                profilePic.src=URL.createObjectURL(inputFile.files[0]);
            }
        </script>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>
</body>
<script>
    getData()
    function getData() {
        fetch('http://localhost:8080/Anh/api')
            .then(function (response) {
                return response.json();
            })
            <%--.then(data => {--%>


            <%--    console.log("----check data", data)--%>
            <%--    var htmls=data.map(anh  => {--%>
            <%--        var anhABC='<c:url value="/getimage/"></c:url>';--%>

            <%--        return  "<tr>"--%>
            <%--            +"<img src='"+anhABC+anh.ma+"'  />"+--%>
            <%--        "</tr>"--%>
            <%--        ;--%>
            <%--    });--%>

            <%--    var html=htmls.join('');--%>
            <%--    console.log(html);--%>

            <%--    document.getElementById("post-block").innerHTML=html;--%>
            <%--})--%>

            .then(data => {

                console.log(data)
                $(document).ready(function () {
                    table=$('#table1').DataTable({
                        "data": data,

                        "columns": [
                            {"data": 'id'},
                            {
                                "data": 'ma',
                                "render": function (data, type, row, meta) {
                                            var anhABC='<c:url value="/getimage/"></c:url>';
                                    return '<img src="'+anhABC+data+'"/>';
                                }
                            }


                        ],

                        "pageLength": 3
                    });
                });

            })
            .catch(function (err) {
                alert("Lõi");
            });
    }
</script>
</html>