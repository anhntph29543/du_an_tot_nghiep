package com.example.datn.controller.restcontroller;

import com.example.datn.entity.SanPham;
import com.example.datn.entity.ServiceResponse;
import com.example.datn.entity.ThuongHieu;
import com.example.datn.service.SanPhamService;
import com.example.datn.service.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/sanpham/api")
public class SanPhamRestController {

    @Autowired
    private SanPhamService service;
    @Autowired
    private ThuongHieuService serviceTH;

    @GetMapping()
    public ResponseEntity<Object> getAll() {
        ServiceResponse<List<SanPham>> response = new ServiceResponse<List<SanPham>>("success",service.getAll());
        return new ResponseEntity<Object>(response, HttpStatus.OK);
    }

    @GetMapping("/getFirt")
    public ResponseEntity<Object> getHoatDong() {
        ServiceResponse<SanPham> response = new ServiceResponse<SanPham>("success",service.getAll().get(0));
        return new ResponseEntity<Object>(response, HttpStatus.OK);
    }

    @GetMapping("/phantrang")
    public ResponseEntity<?> getData(@RequestParam(value = "page", defaultValue = "0") int page) {
        return ResponseEntity.ok(service.getData(page).getContent());
    }

    @GetMapping("/detail/{id}")
    public ResponseEntity<?> detail(@PathVariable("id") UUID id) {
        return ResponseEntity.ok(service.detail(id));
    }

    @PostMapping("/add")
    public ResponseEntity<Object> addSP(@RequestBody SanPham sp){
        service.save(sp);
        ServiceResponse<SanPham> response = new ServiceResponse<SanPham>("success",sp);
        return new ResponseEntity<Object>(response, HttpStatus.OK);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<?> update(@PathVariable("id") UUID id, @RequestBody SanPham sp) {
        SanPham spCu = service.detail(id);
        spCu.setTen(sp.getTen());
        spCu.setTrangThai(sp.getTrangThai());
        return ResponseEntity.ok(service.save(sp));
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> delete(@PathVariable("id") UUID id) {
        service.delete(id);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/th/detail/{id}")
    public ResponseEntity<Object> detailTH(@PathVariable("id") UUID id){
        ServiceResponse<ThuongHieu> response = new ServiceResponse<ThuongHieu>("success",serviceTH.detail(id));
        return new ResponseEntity<Object>(response, HttpStatus.OK);
    }

}
