package com.example.datn.controller.restcontroller;

import com.example.datn.entity.MauSac;

import com.example.datn.entity.SanPhamCTTuan;

import com.example.datn.entity.ServiceResponse;

import com.example.datn.service.MauSacService;
import com.example.datn.service.SanPhamCTTuanService;
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

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/MauSac/api")
public class MauSacRestController {

    @Autowired
    private MauSacService service;

    @Autowired
    private SanPhamCTTuanService sanPhamCTTuanService;

    @GetMapping()
    public ResponseEntity<?> getAll(){
        return ResponseEntity.ok(service.getAll());
    }

    @GetMapping("/phantrang")
    public ResponseEntity<?> getData(@RequestParam(value = "page", defaultValue = "0") int page){
        return ResponseEntity.ok(service.getData(page).getContent());
    }

    @GetMapping("/mau-sac-san-pham/{idSP}")
    public ResponseEntity<?> getMSSP(@PathVariable("idSP") UUID idSP){
        List<SanPhamCTTuan> listAllSPCT=sanPhamCTTuanService.getAll();
        List<SanPhamCTTuan> listSPCT=new ArrayList<>();
        List<SanPhamCTTuan> listMSSPCT=new ArrayList<>();
        for (SanPhamCTTuan sanPhanCTTuan:listAllSPCT) {
            if(sanPhanCTTuan.getSanPham().getId().equals(idSP)){
                listSPCT.add(sanPhanCTTuan);
            }
        }

        for (int i=0; i<listSPCT.size();i++) {
            int check=0;
            for(SanPhamCTTuan sanPhanCTTuan:listMSSPCT){
                if(listSPCT.get(i).getMauSac().getId().equals(sanPhanCTTuan.getMauSac().getId())){
                    check++;
                }
            }
            if(check==0){
                listMSSPCT.add(listSPCT.get(i));
            }
        }
        return ResponseEntity.ok(listMSSPCT);

    }

    @GetMapping("/detail/{id}")
    public ResponseEntity<?> detail(@PathVariable("id") UUID id){
        return ResponseEntity.ok(service.detail(id));
    }

    @PostMapping("/add")
    public ResponseEntity<Object> add(@RequestBody MauSac ms){
        service.save(ms);
        ServiceResponse<MauSac> response = new ServiceResponse<MauSac>("success",ms);
        return new ResponseEntity<Object>(response, HttpStatus.OK);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<?> update(@PathVariable("id") UUID id, @RequestBody MauSac ms){
        MauSac msCu= service.detail(id);
        msCu.setTen(ms.getTen());
        msCu.setTrangThai(ms.getTrangThai());
        return ResponseEntity.ok(service.save(msCu));
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> delete(@PathVariable("id") UUID id){
        service.delete(id);
        return ResponseEntity.ok().build();
    }

}
