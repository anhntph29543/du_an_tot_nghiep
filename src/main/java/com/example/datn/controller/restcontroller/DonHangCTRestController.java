package com.example.datn.controller.restcontroller;


import com.example.datn.entity.AnhTuan;
import com.example.datn.entity.ChatLieu;
import com.example.datn.entity.DonHang;
import com.example.datn.entity.DonHangCT;
import com.example.datn.entity.DonHangCTAnh;
import com.example.datn.entity.KhachHang;
import com.example.datn.entity.SanPhamCT;
import com.example.datn.entity.SanPhanCTTuan;
import com.example.datn.entity.ServiceResponse;
import com.example.datn.service.AnhTuanService;
import com.example.datn.service.DonHangCTService;
import com.example.datn.service.DonHangService;
import com.example.datn.service.SanPhamCTService;
import com.example.datn.service.SanPhamCTTuanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
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
@RequestMapping("/DonHangCT/api")
public class DonHangCTRestController {

    @Autowired
    private DonHangCTService service;

    @Autowired
    private DonHangService serviceDH;

    @Autowired
    private AnhTuanService serviceAnh;

    @Autowired
    private SanPhamCTTuanService serviceSPCT;

    @Autowired
    private SanPhamCTService serviceSPCTMoi;

    private UUID idDHSelect;

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
        idDHSelect = id;
        return ResponseEntity.ok(listDonHangCT);
    }

    @GetMapping("/xacNhan/{loai}")
    public ResponseEntity<Object> xacNhan(@PathVariable("loai") String loai, @RequestParam(value = "ghiChu", defaultValue = "") String ghiChu) {
        DonHang dh = serviceDH.detail(idDHSelect);
        idDHSelect = null;
        if (dh.getTrangThaiDonHang().equalsIgnoreCase("chưa thanh toán") || dh.getTrangThaiDonHang().equalsIgnoreCase("đã thanh toán")) {
            ServiceResponse<String> response = new ServiceResponse<String>("success", "không áp dụng cho đơn tại quầy");
            return new ResponseEntity<Object>(response, HttpStatus.OK);
        } else if (dh.getTrangThaiDonHang().equalsIgnoreCase("đã hủy")) {
            ServiceResponse<String> response = new ServiceResponse<String>("success", "đơn hàng đã hủy");
            return new ResponseEntity<Object>(response, HttpStatus.OK);
        } else if (loai.equalsIgnoreCase("huyDon")) {
            dh.setTrangThaiDonHang("đã hủy");
            dh.setGhiChu(ghiChu);
            serviceDH.save(dh);
            ServiceResponse<String> response = new ServiceResponse<String>("success", "hủy đơn hàng thành công");
            return new ResponseEntity<Object>(response, HttpStatus.OK);
        }
        dh.setTrangThaiDonHang("chuẩn bị hàng");
        serviceDH.save(dh);
        ServiceResponse<String> response = new ServiceResponse<String>("success", "xác nhận thành công");
        return new ResponseEntity<Object>(response, HttpStatus.OK);
    }

    @GetMapping("/giaoHang/{loai}")
    public ResponseEntity<Object> giaoHang(@RequestParam(value = "phiVC", defaultValue = "0") Double phiVC) {
        DonHang dh = serviceDH.detail(idDHSelect);
        idDHSelect = null;
        if (dh.getTrangThaiDonHang().equalsIgnoreCase("chưa thanh toán") || dh.getTrangThaiDonHang().equalsIgnoreCase("đã thanh toán")) {
            ServiceResponse<String> response = new ServiceResponse<String>("success", "không áp dụng cho đơn tại quầy");
            return new ResponseEntity<Object>(response, HttpStatus.OK);
        } else if (dh.getTrangThaiDonHang().equalsIgnoreCase("đã hủy")) {
            ServiceResponse<String> response = new ServiceResponse<String>("success", "đơn hàng đã hủy");
            return new ResponseEntity<Object>(response, HttpStatus.OK);
        }
        dh.setTrangThaiDonHang("đang giao hàng");
        dh.setPhiVanChuyen(phiVC);
        serviceDH.save(dh);
        ServiceResponse<String> response = new ServiceResponse<String>("success", "đã giao cho đơn vị vận chuyển");
        return new ResponseEntity<Object>(response, HttpStatus.OK);
    }

    @GetMapping("/xnGiaoHang/{loai}")
    public ResponseEntity<Object> xnGiaoHang(@PathVariable("loai") String loai) {
        DonHang dh = serviceDH.detail(idDHSelect);
        idDHSelect = null;
        if (dh.getTrangThaiDonHang().equalsIgnoreCase("chưa thanh toán") || dh.getTrangThaiDonHang().equalsIgnoreCase("đã thanh toán")) {
            ServiceResponse<String> response = new ServiceResponse<String>("success", "không áp dụng cho đơn tại quầy");
            return new ResponseEntity<Object>(response, HttpStatus.OK);
        } else if (dh.getTrangThaiDonHang().equalsIgnoreCase("đã hủy")) {
            ServiceResponse<String> response = new ServiceResponse<String>("success", "đơn hàng đã hủy");
            return new ResponseEntity<Object>(response, HttpStatus.OK);
        }
        if (loai.equalsIgnoreCase("thất bại")) {
            dh.setTrangThaiDonHang("đã hủy");
            serviceDH.save(dh);
        }else {
            dh.setTrangThaiDonHang("thành công");
            serviceDH.save(dh);
        }
        ServiceResponse<String> response = new ServiceResponse<String>("success", "xác nhận thành công");
        return new ResponseEntity<Object>(response, HttpStatus.OK);
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

    @GetMapping("/detailSPCT/{id}")
    public ResponseEntity<?> detailSPCT(@PathVariable("id") UUID id) {
        return ResponseEntity.ok(serviceSPCTMoi.detail(service.detail(id).getSanPhanCT().getId()));
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

    @PutMapping("/update")
    public ResponseEntity<Object> update(@RequestBody DonHangCT donHangCT) {
        DonHangCT dhctCu = service.detail(donHangCT.getId());
        SanPhamCT spct = serviceSPCTMoi.detail(dhctCu.getSanPhanCT().getId());
        if (dhctCu.getSoLuong() == donHangCT.getSoLuong()) {
            ServiceResponse<DonHangCT> response = new ServiceResponse<DonHangCT>("success", dhctCu);
            return new ResponseEntity<Object>(response, HttpStatus.OK);
        }
        if ((spct.getSoLuong() + dhctCu.getSoLuong()) - donHangCT.getSoLuong() >= 0) {
            if (dhctCu.getSoLuong() < donHangCT.getSoLuong() || dhctCu.getSoLuong() > donHangCT.getSoLuong()) {
                spct.setSoLuong((spct.getSoLuong() + dhctCu.getSoLuong()) - donHangCT.getSoLuong());
                dhctCu.setSoLuong(donHangCT.getSoLuong() - 1);
                service.save(dhctCu);
                serviceSPCTMoi.save(spct);
                ServiceResponse<DonHangCT> response = new ServiceResponse<DonHangCT>("success", dhctCu);
                return new ResponseEntity<Object>(response, HttpStatus.OK);
            }
        }
        ServiceResponse<DonHangCT> response = new ServiceResponse<DonHangCT>("error", dhctCu);
        return new ResponseEntity<Object>(response, HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> delete(@PathVariable("id") UUID id) {
        DonHangCT donHangCT = service.detail(id);
        SanPhamCT spct = serviceSPCTMoi.detail(donHangCT.getSanPhanCT().getId());
        spct.setSoLuong(spct.getSoLuong() + donHangCT.getSoLuong());
        serviceSPCTMoi.save(spct);
//        int soLuongXoa = donHangCT.getSoLuong();
//        List<SanPhanCTTuan> listSPCT = serviceSPCT.getAll();
//        for (SanPhanCTTuan spct : listSPCT) {
//            if (spct.getId().equals(donHangCT.getSanPhanCT().getId())) {
//                spct.setSoLuong(spct.getSoLuong() + soLuongXoa);
//                serviceSPCT.save(spct);
//            }
//        }
        service.delete(id);
        return ResponseEntity.ok().build();
    }

}
