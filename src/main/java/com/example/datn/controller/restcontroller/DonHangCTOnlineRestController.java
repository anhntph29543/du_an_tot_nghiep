package com.example.datn.controller.restcontroller;

import com.example.datn.entity.DonHang;
import com.example.datn.entity.DonHangCT;
import com.example.datn.entity.GioHangCTOnline;
import com.example.datn.entity.GioHangOnline;
import com.example.datn.entity.SanPhamCTTuan;
import com.example.datn.service.DonHangCTService;
import com.example.datn.service.DonHangService;
import com.example.datn.service.GioHangCTOnlineService;
import com.example.datn.service.GioHangOnlineService;
import com.example.datn.service.SanPhamCTTuanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/DonHangCTOnline/api")
public class DonHangCTOnlineRestController {

    @Autowired
    private DonHangCTService service;

    @Autowired
    private SanPhamCTTuanService sanPhamCTTuanService;

    @Autowired
    private GioHangOnlineService gioHangOnlineService;

    @Autowired
    private GioHangCTOnlineService gioHangCTOnlineService;

    @PostMapping("/add-san-pham-dhct/{idGioHang}")
    public ResponseEntity<?> add(@PathVariable("idGioHang") UUID idGioHang,@RequestBody DonHang donHang) {
        List<GioHangCTOnline> listAll=gioHangCTOnlineService.getAll();
        for (GioHangCTOnline gioHangCTOnline:listAll) {
            if(gioHangCTOnline.getGioHangOnline().getId().equals(idGioHang)){
                DonHangCT donHangCT=new DonHangCT();
                SanPhamCTTuan sanPhamCTTuan=gioHangCTOnline.getSanPhamCT();
                sanPhamCTTuan.setSoLuong(sanPhamCTTuan.getSoLuong()-gioHangCTOnline.getSoLuong());
                donHangCT.setDonHang(donHang);
                donHangCT.setSanPhanCT(gioHangCTOnline.getSanPhamCT());
                donHangCT.setTenSPCT(gioHangCTOnline.getTenSPCT());
                donHangCT.setSoLuong(gioHangCTOnline.getSoLuong());
                donHangCT.setGiaSanPham(gioHangCTOnline.getGiaSanPham());
                donHangCT.setTrangThai(true);
                sanPhamCTTuanService.save(sanPhamCTTuan);
                service.save(donHangCT);
            }
        }
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/xoa-san-pham-gio-hang/{idGioHang}")
    public ResponseEntity<?> deleteSPGH(@PathVariable("idGioHang") UUID idGioHang){
        List<GioHangCTOnline> listAll=gioHangCTOnlineService.getAll();
        for (GioHangCTOnline gioHangCTOnline:listAll) {
            if(gioHangCTOnline.getGioHangOnline().getId().equals(idGioHang)){
                gioHangCTOnlineService.delete(gioHangCTOnline.getIdGioHangCT());
            }
        }
        return ResponseEntity.ok().build();
    }




}
