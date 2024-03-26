package com.example.datn.controller.banHangOnline;


import com.example.datn.entity.SanPham;
import com.example.datn.entity.SanPhamCTTuan;
import com.example.datn.repository.SanPhamCTTuanRepo;
import com.example.datn.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/ban-hang-online/datn")
public class OnlineControllerTaiKhoan {


    @Autowired
    private SanPhamService service;

    @Autowired
    private SanPhamCTTuanRepo sanPhamCTTuanRepo;

    private UUID idLogin;

    private String name="Tuansiretert";

//    @GetMapping("/trang-chu/{id}")
//    public String trangChu(@PathVariable("id") UUID id, Model model){
//        idLogin=id;
//        model.addAttribute("idLogin",idLogin);
//        return "/viewBanHangOnline/viewTrangChu/trangChu";
//    }
//
//    @GetMapping("/cua-hang")
//    public String cuaHang(Model model){
//        model.addAttribute("name",name);
//        return "/viewBanHangOnline/viewCuaHang/cua-hang";
//
//    }

//    @GetMapping("/tra-cuu-don-hang")
//    public String traCuuHoaDon(){
//        return "/viewBanHangOnline/viewTraCuuDonHang/tra-cuu-don-hang";
//
//    }
//    @GetMapping("/dang-nhap-dang-ky")
//    public String dangNhapDangKy(){
//        return "/viewBanHangOnline/viewDangNhap/dang-nhap-dang-ky";
//    }
//
//
//
//    @GetMapping("/detail-san-pham/{id}")
//    public String detailSanPham(@PathVariable("id") UUID id, Model model){
//        SanPham sanPham=service.detail(id);
//        List<SanPhamCTTuan> listSPCT=sanPhamCTTuanRepo.tienLonNhatCuaSP(id);
//        Double tienNhoNhat=listSPCT.get(0).getDonGia();
//        Double tienLonNhat=listSPCT.get(listSPCT.size()-1).getDonGia();
//        model.addAttribute("tenSP",sanPham.getTen());
//        model.addAttribute("thuongHieu",sanPham.getTh().getTen());
//        model.addAttribute("idSP",id);
//        model.addAttribute("tienNhoNhat",tienNhoNhat);
//        model.addAttribute("tienLonNhat",tienLonNhat);
//
//        return "/viewBanHangOnline/viewDetailSanPham/detail-san-pham";
//
//    }
//
//    @GetMapping("/gio-hang")
//    public String gioHang(){
//        return "/viewBanHangOnline/viewGioHang/gio-hang";
//
//    }
//
//    @GetMapping("/thanh-toan")
//    public String thanhToan(){
//        return "/viewBanHangOnline/viewThanhToan/thanh-toan";
//
//    }
//    @GetMapping("/lien-he")
//    public String lienHe(){
//        return "/viewBanHangOnline/viewLienHe/lien-he";
//
//    }
}
