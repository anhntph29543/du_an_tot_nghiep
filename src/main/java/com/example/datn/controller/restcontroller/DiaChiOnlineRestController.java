package com.example.datn.controller.restcontroller;


import com.example.datn.entity.ChatLieu;
import com.example.datn.entity.DiaChiOnline;
import com.example.datn.entity.KhachHangOnline;
import com.example.datn.entity.ServiceResponse;
import com.example.datn.service.DiaChiOnlineService;
import com.example.datn.service.KhachHangOnlineService;
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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/DiaChi/api")
public class DiaChiOnlineRestController {

    @Autowired
    private DiaChiOnlineService diaChiOnlineService;

    @Autowired
    private KhachHangOnlineService khachHangOnlineService;

    @GetMapping()
    public ResponseEntity<?> getAll(){
        return ResponseEntity.ok(diaChiOnlineService.getAll());
    }

    @GetMapping("/dia-chi-mac-dinh/{idKhachHang}")
    public ResponseEntity<?> getDiaChiMD(@PathVariable("idKhachHang") UUID idKhachHang){
        KhachHangOnline khachHangOnline=khachHangOnlineService.detail(idKhachHang);
        DiaChiOnline diaChiMacDinh=new DiaChiOnline();
        List<DiaChiOnline> listAllDiaChi=diaChiOnlineService.getAll();
        for (DiaChiOnline diaChiOnline:listAllDiaChi) {
            if(diaChiOnline.getKhachHangOnline().getId().equals(khachHangOnline.getId())&&diaChiOnline.getTrangThai().equals(true)){
                diaChiMacDinh=diaChiOnline;
            }
        }
        return ResponseEntity.ok(diaChiMacDinh);
    }

    @GetMapping("/detail/{id}")
    public ResponseEntity<?> detail(@PathVariable("id") UUID id){
        return ResponseEntity.ok(diaChiOnlineService.detail(id));
    }

    @PutMapping("/cap-nhat-dia-chi-mac-dinh/{id}")
    public ResponseEntity<?> diaChiMacDinh(@PathVariable("id") UUID id){
        List<DiaChiOnline> listAll=diaChiOnlineService.getAll();
        DiaChiOnline diaChiChon=diaChiOnlineService.detail(id);
        for (DiaChiOnline diaChi:listAll) {
            diaChi.setTrangThai(false);
            diaChiOnlineService.save(diaChi);
        }
        diaChiChon.setTrangThai(true);
        return ResponseEntity.ok(diaChiOnlineService.save(diaChiChon));
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestBody DiaChiOnline diaChiOnline){

        return ResponseEntity.ok(diaChiOnlineService.save(diaChiOnline));
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> delete(@PathVariable("id") UUID id){
        diaChiOnlineService.delete(id);
        return ResponseEntity.ok().build();
    }


}
