package com.example.datn.controller.restcontroller;

import com.example.datn.entity.DonHang;
import com.example.datn.entity.DonHangOnilne;
import com.example.datn.service.DonHangOnlineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/DonHangOnline/api")
public class DonHangOnlineRestController {

    @Autowired
    private DonHangOnlineService donHangOnlineService;

    @PostMapping("/tao-don-hang-online-moi")
    public ResponseEntity<?> add(@RequestBody DonHangOnilne dhOnline) {

        DonHangOnilne donHangOnilne=new DonHangOnilne();
        donHangOnilne.setKhachHangOnline(dhOnline.getKhachHangOnline());
        donHangOnilne.setDiaChiOnline(dhOnline.getDiaChiOnline());
        donHangOnilne.setLoaiDon("Đơn hàng online ");
        donHangOnilne.setTongTien(dhOnline.getTongTien());
        donHangOnilne.setTienKhachPhaiTra(dhOnline.getTienKhachPhaiTra());
        donHangOnilne.setHinhThucThanhToan(false);
        donHangOnilne.setTrangThaiDonHang("Chờ xác nhận ");


        return ResponseEntity.ok(donHangOnlineService.save(donHangOnilne));
    }
}
