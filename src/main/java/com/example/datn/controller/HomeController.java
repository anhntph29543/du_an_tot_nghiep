package com.example.datn.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/datn")
public class HomeController {

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
    public String sanPham(){
        return "/viewQLSanPham/san-pham";
    }

    @GetMapping("/san-pham-chi-tiet")
    public  String sanPhamChiTiet(){
        return "/viewQLSanPham/san-pham-chi-tiet";
    }

    @GetMapping("/them-san-pham")
    public  String themSanPham (){
        return "/viewQLSanPham/them-san-pham";
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

}
