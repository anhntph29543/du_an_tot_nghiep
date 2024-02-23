package com.example.datn.controller.restcontroller;


import com.example.datn.entity.ChatLieu;
import com.example.datn.entity.DonHang;
import com.example.datn.service.DonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
@RequestMapping("/DonHang/api")
public class DonHangRestController {

    @Autowired
    private DonHangService service;

    @GetMapping()
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(service.getAll());
    }

    @GetMapping("/phantrang")
    public ResponseEntity<?> getData(@RequestParam(value = "page", defaultValue = "0") int page) {
        return ResponseEntity.ok(service.getData(page).getContent());
    }

    @GetMapping("/detail/{id}")
    public ResponseEntity<?> detail(@PathVariable("id") UUID id) {
        return ResponseEntity.ok(service.detail(id));
    }

    @PostMapping("/thanhToan1/{id}")
    public ResponseEntity<?> thanhToan1(@PathVariable("id") UUID id,@RequestBody DonHang dh1) {
        DonHang dh = service.detail(id);

        dh.setTongTien(dh1.getTongTien());
        dh.setTienKhachDua(dh1.getTienKhachDua());
        dh.setTrangThaiDonHang(true);
        return ResponseEntity.ok(service.save(dh));
    }
//, @RequestParam("giaTT") Double giaTT, @RequestParam("tienKhachDua") Double tienKhachDua
    @PostMapping("/tao-don-moi")
    public ResponseEntity<?> add() {
        DonHang donHang = new DonHang();
        donHang.setTongTien(Double.valueOf("0"));
        donHang.setTienKhachPhaiTra(Double.valueOf("0"));
        donHang.setTienKhachDua(Double.valueOf("0"));
        donHang.setTienThua(Double.valueOf("0"));
        donHang.setGiamGia(Double.valueOf("0"));
        donHang.setGiamGia(Double.valueOf("0"));
        donHang.setPhiVanChuyen(Double.valueOf("0"));
        donHang.setLoaiDon("Đơn tại quầy");
        donHang.setHinhThucThanhToan(false);
        donHang.setTrangThaiDonHang(false);
        return ResponseEntity.ok(service.save(donHang));
    }

//    @PutMapping("/update/{id}")
//    public ResponseEntity<?> update(@PathVariable("id") UUID id, @RequestBody DonHang donHang){
//        DonHang dh= service.detail(id);
//        clCu.setTen(cl.getTen());
//        clCu.setTrangThai(cl.getTrangThai());
//        return ResponseEntity.ok(service.save(clCu));
//    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> delete(@PathVariable("id") UUID id) {
        service.delete(id);
        return ResponseEntity.ok().build();
    }
}
