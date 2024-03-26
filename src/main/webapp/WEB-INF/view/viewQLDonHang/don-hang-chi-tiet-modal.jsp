<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- Modal -->
<div class="modal fade" id="xacNhanModal" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 1000px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Thông tin đơn hàng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Mã đơn hàng: <span id="maDH"></span></label>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Nhân viên: <span id="nvDH"></span></label>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Khách hàng: <span id="khDH"></span></label>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phiếu giảm giá: <span id="pggDH"></span></label>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Loại đơn: <span id="loaiDH"></span></label>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phí vận chuyển: <input type="number" id="phiVanChuyen"
                                                                             name="phiVanChuyen"></label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Ngày tạo: <span id="ngayTaoDH"></span></label>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Ngày thanh toán: <span id="nttDH"></span></label>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tổng tiền: <span id="ttDH"></span></label>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Hình thức thanh toán: Tiền mặt</label>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Trạng thái: <span id="trangThaiDH"></span></label>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Ghi Chú: <input type="text" id="ghiChu" name="ghiChu"></label>
                        </div>
                    </div>
                </div>
            </div>
            <h4>Thông tin sản phẩm</h4>
            <table class="table" id="dhct" style="width: 100%">
                <thead class="table-dark">
                <tr>
                    <th scope="col">Mã</th>
                    <th scope="col">Ảnh</th>
                    <th scope="col">Tên</th>
                    <th scope="col">Màu sắc</th>
                    <th scope="col">Kích cỡ</th>
                    <th scope="col">Chất liệu</th>
                    <th scope="col">Đơn giá</th>
                    <th scope="col">Số Lượng</th>
                    <th scope="col">Tổng tiền</th>
                </tr>
                </thead>
            </table>
            <div class="modal-footer">
                <button type="button" id="huyDon" class="btn btn-secondary" onclick="huyDon()">Hủy đơn</button>
                <button type="button" id="btnXacNhan" class="btn btn-primary" onclick="xacNhan()">Xác nhận</button>
                <button type="button" id="btnGiaoHang" class="btn btn-success" onclick="giaoHang()">Giao hàng</button>
                <button type="button" id="btnGiaoHangTB" class="btn btn-warning" onclick="xnGiaoHang('thất bại')">Giao hàng thất bại</button>
                <button type="button" id="btnGiaoHangTC" class="btn btn-success" onclick="xnGiaoHang('thành công')">Giao hàng thành công</button>
            </div>
        </div>
    </div>
</div>
</div>
