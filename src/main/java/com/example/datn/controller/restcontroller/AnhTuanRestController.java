package com.example.datn.controller.restcontroller;


import com.example.datn.entity.AnhTuan;
import com.example.datn.service.AnhTuanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/Anh/api")
public class AnhTuanRestController {

    @Autowired
    private AnhTuanService service;

    @GetMapping()
    public ResponseEntity<?> getAll(){

        return ResponseEntity.ok(service.getAll());
    }
    @GetMapping("/{id}")
    public ResponseEntity<?> getOne(@PathVariable("id") UUID id){
        List<AnhTuan> list=service.getAll();
        AnhTuan anhSP=new AnhTuan();
        for (AnhTuan anh:list) {
            if(anh.getSanPhanCTTuan().getId().equals(id)){
                anhSP=anh;
            }
        }
        return ResponseEntity.ok(anhSP);
    }
}
