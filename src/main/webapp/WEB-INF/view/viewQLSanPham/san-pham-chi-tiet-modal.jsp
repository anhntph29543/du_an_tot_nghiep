<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Xem chi tiết
</button>

<!-- Modal -->
<div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Chi tiết sản phảm </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
<%--                Bộ lọc --%>
                <div class="mt-1 ">
                    <h5>
                        Bộ Lọc
                    </h5>
                    <div class="d-flex border border-dark rounded  mx-3 ">
                        <div class=" m-2 ">
                            <samp>
                                Tìm kiếm
                            </samp>
                            </br>
                            <div class="input-group flex-nowrap">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" placeholder="Search....." aria-label="Recipient's username" aria-describedby="button-addon2">
                                    <button class="btn btn-outline-secondary" type="button" id="button-addon2"><img src='<c:url value="/getimage/Logo-Search.png"></c:url>' /></button>
                                </div>
                            </div>
                        </div>

                        <div class=" m-2 ">
                            <samp>Kích cỡ  </samp>
                            </br>
                            <div>
                                <select class="form-select" >
                                    <option selected>Choose...</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                </select>
                            </div>
                        </div>
                        <div class=" m-2 ">
                            <samp>Màu sắc  </samp>
                            </br>
                            <div>
                                <select class="form-select" >
                                    <option selected>Choose...</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
<%--                    Danh sách --%>
                <div>
                    <h5>
                        Danh sách sản phẩm chi tiết
                    </h5>
                    <div class="border border-dark rounded ">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Mã</th>
                                <th scope="col">Tên</th>
                                <th scope="col">Ảnh </th>
                                <th scope="col">Kích cỡ </th>
                                <th scope="col">Màu sắc </th>
                                <th scope="col">Chất liệu </th>
                                <th scope="col">Đơn giá  </th>
                                <th scope="col">Số Lượng </th>
                                <th scope="col">Chức Năng  </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                                <td>

                                    <a class="btn btn-while border  " href="#" role="button">Sửa </a>
                                    <a class="btn btn-dark   " href="#" role="button">Xóa  </a>

                                </td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td colspan="2">Larry the Bird</td>
                                <td>@twitter</td>
                                <td>@twitter</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>