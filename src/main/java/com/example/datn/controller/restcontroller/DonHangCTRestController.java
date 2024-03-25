package com.example.datn.controller.restcontroller;


import com.example.datn.entity.AnhTuan;
import com.example.datn.entity.DonHangCT;
import com.example.datn.entity.DonHangCTAnh;
import com.example.datn.entity.SanPhamCTTuan;
import com.example.datn.service.AnhTuanService;
import com.example.datn.service.DonHangCTService;
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

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/DonHangCT/api")
public class DonHangCTRestController {

    @Autowired
    private DonHangCTService service;

    @Autowired
    private AnhTuanService serviceAnh;

    @Autowired
    private SanPhamCTTuanService serviceSPCT;

    @GetMapping()
    public ResponseEntity<?> getAll() {

        return ResponseEntity.ok(service.getAll());

    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getSanPhamDHCT(@PathVariable("id") UUID id) {
        List<DonHangCT> donHangCTS = service.getAll();
        List<AnhTuan> listAnh = serviceAnh.getAll();
        List<DonHangCTAnh> listDonHangCT = new ArrayList<>();

        for (DonHangCT donHangCT : donHangCTS) {
            DonHangCTAnh donHangCTAnh = new DonHangCTAnh();
            if (donHangCT.getDonHang().getId().equals(id)) {
                donHangCTAnh.setId(donHangCT.getId());
                donHangCTAnh.setIdSanPham(donHangCT.getSanPhanCT().getId());
                donHangCTAnh.setMa(donHangCT.getSanPhanCT().getMa());
                donHangCTAnh.setTenSanPham(donHangCT.getSanPhanCT().getSanPham().getTen());
                donHangCTAnh.setMauSac(donHangCT.getSanPhanCT().getMauSac().getTen());
                donHangCTAnh.setKichCo(donHangCT.getSanPhanCT().getKichCo().getTen());
                donHangCTAnh.setThuongHieu(donHangCT.getSanPhanCT().getSanPham().getTh().getTen());
                donHangCTAnh.setChatLieu(donHangCT.getSanPhanCT().getChatLieu().getTen());
                donHangCTAnh.setSoLuong(donHangCT.getSoLuong());
                donHangCTAnh.setDonGia(donHangCT.getGiaSanPham());
                donHangCTAnh.setTongTien(donHangCT.getSoLuong() * donHangCT.getGiaSanPham());
                listDonHangCT.add(donHangCTAnh);
            }
        }
        for (DonHangCTAnh donHangCTAnh : listDonHangCT) {
            for (AnhTuan anhTuan : listAnh) {
                if (donHangCTAnh.getIdSanPham().equals(anhTuan.getSanPhanCTTuan().getId())) {
                    donHangCTAnh.setAnh(anhTuan.getMa());
                }
            }
        }
        return ResponseEntity.ok(listDonHangCT);
    }

    @GetMapping("/phantrang")
    public ResponseEntity<?> getData(@RequestParam(value = "page", defaultValue = "0") int page) {
        return ResponseEntity.ok(service.getData(page).getContent());
    }

    @GetMapping("/thanhtoan/{id}")
    public ResponseEntity<?> thanhToan(@PathVariable("id") UUID id) {
        List<DonHangCT> listDHCT = service.getAll();
        Double tongTien = 0.0;
        for (DonHangCT donHangCT : listDHCT) {
            if (donHangCT.getDonHang().getId().equals(id)) {
                tongTien += donHangCT.getSoLuong() * donHangCT.getGiaSanPham();
            }
        }
        return ResponseEntity.ok(tongTien);
    }


    @GetMapping("/detail/{id}")
    public ResponseEntity<?> detail(@PathVariable("id") UUID id) {

        return ResponseEntity.ok(service.detail(id));
    }

    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestBody DonHangCT donHangCT) {
        return ResponseEntity.ok(service.save(donHangCT));
    }

//    @PutMapping("/update/{id}")
//    public ResponseEntity<?> update(@PathVariable("id") UUID id, @RequestBody DonHangCT donHangCT){
//        DonHangCT donHangCT1= service.detail(id);
//        clCu.setTen(cl.getTen());
//        clCu.setTrangThai(cl.getTrangThai());
//        return ResponseEntity.ok(service.save(clCu));
//    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> delete(@PathVariable("id") UUID id) {
        DonHangCT donHangCT = service.detail(id);
        int soLuongXoa = donHangCT.getSoLuong();
        List<SanPhamCTTuan> listSPCT = serviceSPCT.getAll();
        for (SanPhamCTTuan spct : listSPCT) {
            if (spct.getId().equals(donHangCT.getSanPhanCT().getId())) {
                spct.setSoLuong(spct.getSoLuong() + soLuongXoa);
                serviceSPCT.save(spct);
            }
        }
        service.delete(id);
        return ResponseEntity.ok().build();
    }

}
