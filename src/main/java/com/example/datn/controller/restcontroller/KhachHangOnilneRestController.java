package com.example.datn.controller.restcontroller;


import com.example.datn.entity.KhachHang;
import com.example.datn.entity.KhachHangOnline;
import com.example.datn.service.KhachHangOnlineService;
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

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/KhachHangOnline/api")
public class KhachHangOnilneRestController {

    @Autowired
    private KhachHangOnlineService service;

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

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> delete(@PathVariable("id") UUID id) {
        service.delete(id);
        return ResponseEntity.ok().build();
    }
    @GetMapping("/hien-thi-khach-hang/{id}")
    public ResponseEntity<?> hienThiKhachHang(@PathVariable("id") UUID id){
        List<KhachHangOnline> listKH=service.getAll();
        KhachHangOnline khachHang=new KhachHangOnline();
        for (KhachHangOnline khachHangOnline:listKH) {
            if(khachHangOnline.getLogin().getId().equals(id)){
                khachHang=khachHangOnline;
            }
        }
        return ResponseEntity.ok(khachHang);
    }
}
