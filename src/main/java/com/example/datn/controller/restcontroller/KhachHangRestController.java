package com.example.datn.controller.restcontroller;

import com.example.datn.entity.KhachHang;
import com.example.datn.entity.NhanVien;
import com.example.datn.service.KhachHangService;
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
@RequestMapping("/KhachHang/api")
public class KhachHangRestController {

    @Autowired
    private KhachHangService service;

    @GetMapping()
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(service.getAll());
    }

    @GetMapping("/phantrang")
    public ResponseEntity<?> getData(@RequestParam(value = "page", defaultValue = "0") int page) {
        return ResponseEntity.ok(service.getData(page).getContent());
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestBody KhachHang kh) {
        return ResponseEntity.ok(service.save(kh));
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<?> update(@PathVariable("id") UUID id, @RequestBody KhachHang kh) {
        KhachHang khc = service.detail(id);
        khc.setMa(kh.getMa());
        khc.setTen(kh.getTen());
        khc.setTrangThai(kh.getTrangThai());
        return ResponseEntity.ok(service.save(khc));
    }

    @GetMapping("/detail/{id}")
    public ResponseEntity<?> detail(@PathVariable("id") UUID id) {
        return ResponseEntity.ok(service.detail(id));
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> delete(@PathVariable("id") UUID id) {
        service.delete(id);
        return ResponseEntity.ok().build();
    }
}
