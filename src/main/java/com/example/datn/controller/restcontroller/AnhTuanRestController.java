package com.example.datn.controller.restcontroller;


import com.example.datn.entity.AnhTuan;
import com.example.datn.repository.AnhTuanRepo;
import com.example.datn.service.AnhTuanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/Anh/api")
public class AnhTuanRestController {

    @Autowired
    private AnhTuanService service;

    @Autowired
    private AnhTuanRepo anhTuanRepo;

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



    @GetMapping("/anh-chon/{id}")
    public ResponseEntity<?> getAnhChon(@PathVariable("id") UUID id){
        return ResponseEntity.ok(service.detail(id));
    }

    @GetMapping("/chon-anh-mau-sac/{id}")
    public ResponseEntity<?> getAnhMS(@PathVariable("id") UUID id){
        List<AnhTuan> list=anhTuanRepo.findAll();
        AnhTuan anh=new AnhTuan();
        for (AnhTuan anhTuan:list) {
            if(anhTuan.getSanPhanCTTuan().getMauSac().getId().equals(id)){
                anh=anhTuan;
            }
        }
        return ResponseEntity.ok(anh);
    }

    @GetMapping("/anh-san-pham")
    public ResponseEntity<?> getAnhSanPham(){
        List<AnhTuan> list=service.getAllAnhSP();

        return ResponseEntity.ok(list);
    }

    @GetMapping("/all-anh-san-pham/{id}")
    public ResponseEntity<?> getAllAnhSP(@PathVariable("id") UUID id){
        List<AnhTuan> listAllAnh=service.getAll();
        List<AnhTuan> listAllAnhSP=new ArrayList<>();
        for (AnhTuan anhTuan:listAllAnh) {
            if(anhTuan.getSanPhanCTTuan().getSanPham().getId().equals(id)){
                listAllAnhSP.add(anhTuan);
            }
        }
        return ResponseEntity.ok(listAllAnhSP);
    }
}
