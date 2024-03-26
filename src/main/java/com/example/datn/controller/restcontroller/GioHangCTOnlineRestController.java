package com.example.datn.controller.restcontroller;


import com.example.datn.entity.AnhTuan;
import com.example.datn.entity.ChatLieu;
import com.example.datn.entity.DonHangCT;
import com.example.datn.entity.DonHangCTAnh;
import com.example.datn.entity.GioHangCTAnh;
import com.example.datn.entity.GioHangCTOnline;
import com.example.datn.entity.SanPhamCTTuan;
import com.example.datn.repository.AnhTuanRepo;
import com.example.datn.service.GioHangCTOnlineService;
import com.example.datn.service.SanPhamCTTuanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/GioHangCT/api")
public class GioHangCTOnlineRestController {

    @Autowired
    private GioHangCTOnlineService gioHangCTService;

    @Autowired
    private AnhTuanRepo anhTuanRepo;

    @Autowired
    private SanPhamCTTuanService sanPhamCTTuanService;

    @GetMapping()
    public ResponseEntity<?> getAll(){
        return ResponseEntity.ok(gioHangCTService.getAll());
    }

    @GetMapping("/detail/{id}")
    public ResponseEntity<?> detail(@PathVariable("id") UUID id){
        return ResponseEntity.ok(gioHangCTService.detail(id));
    }

    @GetMapping("/spct-gio-hang/{id}")
    public ResponseEntity<?> getSanPhamDHCT(@PathVariable("id") UUID id) {
        List<GioHangCTOnline> gioHangCTOnlineList = gioHangCTService.getAll();
        List<AnhTuan> listAnh = anhTuanRepo.findAll();
        List<GioHangCTAnh> listGioHangCTAnh = new ArrayList<>();

        for (GioHangCTOnline ghctlist : gioHangCTOnlineList) {
            GioHangCTAnh gioHangCTAnh = new GioHangCTAnh();
            if (ghctlist.getGioHangOnline().getId().equals(id)) {
                gioHangCTAnh.setIdGioHangCT(ghctlist.getIdGioHangCT());
                gioHangCTAnh.setIdGIoHang(ghctlist.getGioHangOnline().getId());
                gioHangCTAnh.setIdSPCT(ghctlist.getSanPhamCT().getId());
                gioHangCTAnh.setTenSPCT(ghctlist.getTenSPCT());
                gioHangCTAnh.setMauSac(ghctlist.getSanPhamCT().getMauSac().getTen());
                gioHangCTAnh.setKichCo(ghctlist.getSanPhamCT().getKichCo().getTen());
                gioHangCTAnh.setThuongHieu(ghctlist.getSanPhamCT().getSanPham().getTh().getTen());
                gioHangCTAnh.setChatLieu(ghctlist.getSanPhamCT().getChatLieu().getTen());
                gioHangCTAnh.setSoLuong(ghctlist.getSoLuong());
                gioHangCTAnh.setGiaSanPham(ghctlist.getGiaSanPham());
                gioHangCTAnh.setTongTien(ghctlist.getSoLuong()*ghctlist.getGiaSanPham());
                listGioHangCTAnh.add(gioHangCTAnh);
            }
        }
        for (GioHangCTAnh gioHangCTAnh : listGioHangCTAnh) {
            for (AnhTuan anhTuan : listAnh) {
                if (gioHangCTAnh.getIdSPCT().equals(anhTuan.getSanPhanCTTuan().getId())) {
                    gioHangCTAnh.setAnh(anhTuan.getMa());
                }
            }
        }
        return ResponseEntity.ok(listGioHangCTAnh);
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestBody GioHangCTOnline ghct){
        List<GioHangCTOnline> listAllGHCT=gioHangCTService.getAll();

        Integer soLuongMua=0;
        for (GioHangCTOnline gioHangCTOnline:listAllGHCT) {
            if (gioHangCTOnline.getSanPhamCT().getId().equals(ghct.getSanPhamCT().getId())&&gioHangCTOnline.getGioHangOnline().getId().equals(ghct.getGioHangOnline().getId())){
                soLuongMua=gioHangCTOnline.getSoLuong()+ghct.getSoLuong();
                if(soLuongMua>gioHangCTOnline.getSanPhamCT().getSoLuong()){
                    return ResponseEntity.ok(false);
                }else{
                    gioHangCTOnline.setSoLuong(soLuongMua);
                    return ResponseEntity.ok(gioHangCTService.save(gioHangCTOnline));
                }
            }
        }
        return ResponseEntity.ok(gioHangCTService.save(ghct));
    }

    @PostMapping("update-sl-ghct/{id}")
    public ResponseEntity<?> updateSlGHCT(@RequestBody Integer sl,@PathVariable("id") UUID id){
        GioHangCTOnline ghct=gioHangCTService.detail(id);
        SanPhamCTTuan sanPhamCT=sanPhamCTTuanService.detail(ghct.getSanPhamCT().getId());
        if(sl>sanPhamCT.getSoLuong()){
            sl=sanPhamCT.getSoLuong();
            ghct.setSoLuong(sanPhamCT.getSoLuong());
            gioHangCTService.save(ghct);
            return ResponseEntity.ok(sl);
        }
        ghct.setSoLuong(sl);
        gioHangCTService.save(ghct);
        return ResponseEntity.ok(true);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> delete(@PathVariable("id") UUID id) {
        gioHangCTService.delete(id);
        return ResponseEntity.ok().build();
    }
}
