<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--modal san pham--%>
<div class="modal fade" id="sanPham" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thêm sản phẩm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id='quick_create_sp'>
                    <div class="mb-3">
                        <label class="col-form-label">Tên</label>
                        <input id="tenSP" name="ten" type="text" class="form-control"/><br>
                        <div id="errorTenSP" class="form-text" style="color: red"></div>
                    </div>
                    <div class="mb-3">
                        <select id="th" name="thuongHieu" class="form-select">
                            <c:forEach items="${listTH}" var="th">
                                <option value="${th.id}">${th.ten}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <label class="form-label">Trạng thái</label>
                    <div class="mb-3 form-check">
                        <input type="radio" name="trangThai" class="form-check-input" value="true"
                               id="trangThaiSP1"
                               checked="true"/>
                        <label class="form-check-label" for="trangThaiSP1">Hoạt động</label>
                    </div>
                    <div class="mb-3 form-check">
                        <input type="radio" name="trangThai" class="form-check-input" value="true"
                               id="trangThaiSP2"/>
                        <label class="form-check-label" for="trangThaiSP2">Không hoạt động</label>
                    </div>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Thêm</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%-- Màu sắc --%>
<div class="modal fade" id="mauSac" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thêm màu sắc</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id='quick_create_ms'>
                    <div class="mb-3">
                        <label class="col-form-label">Tên</label>
                        <input id="tenMS" name="ten" type="text" class="form-control"/><br>
                    </div>
                    <label class="form-label">Trạng thái</label>
                    <div class="mb-3 form-check">
                        <input type="radio" name="trangThai" class="form-check-input" value="true"
                               id="trangThaiMS1"
                               checked="true"/>
                        <label class="form-check-label" for="trangThaiMS1">Hoạt động</label>
                    </div>
                    <div class="mb-3 form-check">
                        <input type="radio" name="trangThai" class="form-check-input" value="false"
                               id="trangThaiMS2"/>
                        <label class="form-check-label" for="trangThaiMS2">Không hoạt động</label>
                    </div>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Thêm</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%--  End thêm màu sắc  --%>
<%-- Kích thước --%>
<div class="modal fade" id="kichCo" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thêm kích cỡ</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id='quick_create_kc'>
                    <div class="mb-3">
                        <label class="col-form-label">Tên</label>
                        <input id="tenKC" name="ten" type="text" class="form-control"/><br>
                    </div>
                    <label class="form-label">Trạng thái</label>
                    <div class="mb-3 form-check">
                        <input type="radio" name="trangThai" class="form-check-input" value="true"
                               id="trangThaiKC1" checked="true"/>
                        <label class="form-check-label" for="trangThaiKC1">Hoạt động</label>
                    </div>
                    <div class="mb-3 form-check">
                        <input type="radio" name="trangThai" class="form-check-input" value="false"
                               id="trangThaiKC2"/>
                        <label class="form-check-label" for="trangThaiKC2">Không hoạt động</label>
                    </div>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Thêm</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%--  End kích thước  --%>
<%-- chất liệu --%>
<div class="modal fade" id="chatLieu" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thêm chất liệu</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id='quick_create_cl'>
                    <div class="mb-3">
                        <label class="col-form-label">Tên</label>
                        <input id="tenCL" name="ten" type="text" class="form-control"/><br>
                    </div>
                    <label class="form-label">Trạng thái</label>
                    <div class="mb-3 form-check">
                        <input type="radio" name="trangThai" class="form-check-input"
                               value="true" id="trangThaiCL1" checked="true"/>
                        <label class="form-check-label" for="trangThaiCL1">Hoạt động</label>
                    </div>
                    <div class="mb-3 form-check">
                        <input type="radio" name="trangThai" class="form-check-input" value="false"
                               id="trangThaiCL2"/>
                        <label class="form-check-label" for="trangThaiCL2">Không hoạt động</label>
                    </div>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Thêm</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%--  End chất liệu  --%>