package com.example.datn.controller.restcontroller;

import com.example.datn.entity.SanPham;
import com.example.datn.entity.ServiceResponse;
import com.example.datn.entity.ThuongHieu;
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

import java.util.UUID;

@RestController
@RequestMapping("/thuonghieu/api")
public class ThuongHieuRestController {

    @Autowired
    private ThuongHieuService service;

    @GetMapping()
    public ResponseEntity<?> getAll(){
        return ResponseEntity.ok(service.getAll());
    }

    @GetMapping("/phantrang")
    public ResponseEntity<?> getData(@RequestParam(value = "page", defaultValue = "0") int page){
        return ResponseEntity.ok(service.getData(page).getContent());
    }

    @GetMapping("/detail/{id}")
    public ResponseEntity<?> detail(@PathVariable("id") UUID id){
        return ResponseEntity.ok(service.detail(id));
    }

    @PostMapping("/add")
    public ResponseEntity<Object> add(@RequestBody ThuongHieu th){
        service.save(th);
        ServiceResponse<ThuongHieu> response = new ServiceResponse<ThuongHieu>("success",th);
        return new ResponseEntity<Object>(response, HttpStatus.OK);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<?> update(@PathVariable("id") UUID id, @RequestBody ThuongHieu th){
        ThuongHieu thCu= service.detail(id);
        thCu.setTen(th.getTen());
        thCu.setTrangThai(th.getTrangThai());
        return ResponseEntity.ok(service.save(thCu));
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> delete(@PathVariable("id") UUID id){
        service.delete(id);
        return ResponseEntity.ok().build();
    }

}
