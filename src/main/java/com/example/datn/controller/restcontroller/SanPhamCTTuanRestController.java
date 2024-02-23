package com.example.datn.controller.restcontroller;


import com.example.datn.entity.AnhTuan;
import com.example.datn.entity.ChatLieu;
import com.example.datn.entity.SanPhanCTTuan;
import com.example.datn.service.AnhTuanService;
import com.example.datn.service.SanPhamCTTuanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
@RequestMapping("/SPCT/api")
public class SanPhamCTTuanRestController {


    @Autowired
    private SanPhamCTTuanService service;
    @Autowired
    private AnhTuanService anhTuanService;

    @GetMapping()
    public ResponseEntity<?> getAll(){
        return ResponseEntity.ok(anhTuanService.getAll());
    }

    @GetMapping("/phantrang")
    public ResponseEntity<?> getData(@RequestParam(value = "page", defaultValue = "0") int page){
        return ResponseEntity.ok(service.getData(page).getContent());
    }

    @GetMapping("/detail/{id}")
    public ResponseEntity<?> detail(@PathVariable("id") UUID id){
        SanPhanCTTuan sanPhamCT=service.detail(id);
        if(sanPhamCT.getSoLuong()>0){
            sanPhamCT.setSoLuong(sanPhamCT.getSoLuong()-1);
            service.save(sanPhamCT);
        }
        return ResponseEntity.ok(service.detail(id));
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestBody SanPhanCTTuan sanPhanCTTuan){
        return ResponseEntity.ok(service.save(sanPhanCTTuan));
    }

//    @PutMapping("/update/{id}")
//    public ResponseEntity<?> update(@PathVariable("id") UUID id, @RequestBody SanPhanCTTuan sanPhanCTTuan){
//        SanPhanCTTuan sanPhanCTTuan1= service.detail(id);
//        sanPhanCTTuan1.setTen(sanPhanCTTuan.getTen());
//        sanPhanCTTuan1.setTrangThai(sanPhanCTTuan.getTrangThai());
//        return ResponseEntity.ok(service.save(sanPhanCTTuan1));
//    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> delete(@PathVariable("id") UUID id){
        service.delete(id);
        return ResponseEntity.ok().build();
    }
}
