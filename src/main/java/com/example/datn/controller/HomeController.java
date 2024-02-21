package com.example.datn.controller;


import com.example.datn.entity.SanPham;
import com.example.datn.entity.SanPhamCT;
import com.example.datn.service.ChatLieuService;
import com.example.datn.service.KichCoService;
import com.example.datn.service.MauSacService;
import com.example.datn.service.SanPhamCTService;
import com.example.datn.service.SanPhamService;
import com.example.datn.service.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/datn")
public class HomeController {

    @Autowired
    private ThuongHieuService serviceTH;
    @Autowired
    private SanPhamService serviceSP;
    @Autowired
    private MauSacService serviceMS;
    @Autowired
    private ChatLieuService serviceCL;
    @Autowired
    private KichCoService serviceKC;
    @Autowired
    private SanPhamCTService serviceSPCT;

    List<String> listHD=new ArrayList<>();

    @GetMapping("/home")
    public String home(Model model){

        return "redirect:/datn/trang-chu";
    }
    @PostMapping("/tao-hoa-don/add")
    public String taoHoaDon(Model model){
        listHD.add("25");
        model.addAttribute("listHD",listHD);
        return  "redirect:/datn/ban-hang";
    }
    @GetMapping("/trang-chu")
    public String trangChu(){
        return "/viewTrangChu/trang-chu";
    }

    @GetMapping("/ban-hang")
    public String banHang(Model model){
        model.addAttribute("listHD",listHD);
        return "/viewQLBanHang/ban-hang";
    }

    @GetMapping("/don-hang")
    public String donHang(){
        return "/viewQLDonHang/don-hang";
    }

    @GetMapping("/san-pham")
    public String sanPham(Model model){
        model.addAttribute("listTH", serviceTH.getAll());
        model.addAttribute("listSP", serviceSP.getAll());
        return "/viewQLSanPham/san-pham";
    }

    @GetMapping("/san-pham-chi-tiet/{idSP}")
    public  String sanPhamChiTiet(@PathVariable("idSP")UUID idSP,Model model){
        model.addAttribute("sp", serviceSP.detail(idSP));
        model.addAttribute("listSPCT",serviceSPCT.getSPCT(idSP));
        return "/viewQLSanPham/san-pham-chi-tiet";
    }

    @GetMapping("/them-san-pham")
    public  String themSanPham (Model model){
        model.addAttribute("sp", new SanPham());
        model.addAttribute("listTH", serviceTH.getHoatDong());
        return "/viewQLSanPham/them-san-pham";
    }

    @GetMapping("/sua-san-pham/{id}")
    public  String suaSanPham (@PathVariable("id") UUID id, Model model){
        model.addAttribute("sp", serviceSP.detail(id));
        model.addAttribute("listTH", serviceTH.getHoatDong());
        return "/viewQLSanPham/sua-san-pham";
    }

    @GetMapping("/giam-gia")
    public String giamGia(){
        return "/viewQLGiamGia/giam-gia";
    }

    @GetMapping("/khach-hang")
    public String khachHang(){
        return "/viewQLKhachHang/khach-hang";
    }

    @GetMapping("/nhan-vien")
    public String nhanVien(){
        return "/viewQLNhanVien/nhan-vien";
    }

    @GetMapping("/chat-lieu")
    public String chatLieu(){
        return "/viewQLSanPham/viewQLChatLieu/chat-lieu";
    }

    @GetMapping("/thuong-hieu")
    public String thuongHieu(){
        return "/viewQLSanPham/viewQLThuongHieu/thuong-hieu";
    }

    @GetMapping("/mau-sac")
    public String mauSac(){
        return "/viewQLSanPham/viewQLMauSac/mau-sac";
    }

    @GetMapping("/kich-co")
    public String kichCo(){
        return "/viewQLSanPham/viewQLKichCo/kich-co";
    }

}
