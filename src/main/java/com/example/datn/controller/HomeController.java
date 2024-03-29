package com.example.datn.controller;


import com.example.datn.entity.KhachHang;
import com.example.datn.entity.SanPham;
import com.example.datn.entity.SanPhamCT;
import com.example.datn.service.ChatLieuService;
import com.example.datn.service.KhachHangService;
import com.example.datn.service.KichCoService;
import com.example.datn.service.MauSacService;
import com.example.datn.service.SanPhamCTService;
import com.example.datn.service.SanPhamService;
import com.example.datn.service.ThuongHieuService;
import com.example.datn.entity.DonHang;
import com.example.datn.entity.DonHangCT;
import com.example.datn.service.DonHangCTService;
import com.example.datn.service.DonHangService;
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
    @Autowired
    private DonHangService service;
    @Autowired
    private DonHangCTService donHangCTService;
    @Autowired
    private KhachHangService khachHangService;

    List<String> listHD=new ArrayList<>();

    @GetMapping("/home")
    public String home(Model model){
        return "redirect:/datn/trang-chu";
    }
    @PostMapping("/tao-hoa-don/add")
    public String taoHoaDon(Model model){
        UUID idKH = UUID.fromString("127DC100-1761-4B01-AAE3-CA005E215D7D");
        DonHang donHang=new DonHang();
        donHang.setTongTien(Double.valueOf("0"));
        donHang.setTienKhachPhaiTra(Double.valueOf("0"));
        donHang.setTienKhachDua(Double.valueOf("0"));
        donHang.setTienThua(Double.valueOf("0"));
        donHang.setGiamGia(Double.valueOf("0"));
        donHang.setGiamGia(Double.valueOf("0"));
        donHang.setPhiVanChuyen(Double.valueOf("0"));
        donHang.setLoaiDon("Đơn tại quầy");
        donHang.setHinhThucThanhToan(false);
        donHang.setTrangThaiDonHang("chưa thanh toán");
        KhachHang kh = khachHangService.detail(idKH);
        donHang.setKh(kh);
        System.out.println("-----------------------");
        System.out.println(kh.getTen());
        service.save(donHang);
        return  "redirect:/datn/ban-hang";
    }
    @GetMapping("/trang-chu")
    public String trangChu(){
        return "/viewTrangChu/trang-chu";
    }

    @GetMapping("/ban-hang")
    public String banHang(Model model){
        model.addAttribute("listHD",service.getCTT());
        if (service.getCTT().size()!=0){
            model.addAttribute("idDHFirst", service.getCTT().get(0).getId());
        }
        return "/viewQLBanHang/ban-hang";
    }

    @GetMapping("/delete-don-hang/{id}")
    public String deleteDonHang(Model model,@PathVariable("id") UUID id){
        List<DonHangCT> listDHCT=donHangCTService.getDHCT(id);
        for (DonHangCT donHangCT:listDHCT) {
            SanPhamCT sanPhamChiTiet = serviceSPCT.detail(donHangCT.getSanPhanCT().getId());
            sanPhamChiTiet.setSoLuong(sanPhamChiTiet.getSoLuong() + donHangCT.getSoLuong());
            serviceSPCT.save(sanPhamChiTiet);
            donHangCTService.delete(donHangCT.getId());
        }
        service.delete(id);
        return "redirect:/datn/ban-hang";
    }

    @GetMapping("/don-hang")
    public String getAll(Model model){
        model.addAttribute("listDH",service.getAll());
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

    @GetMapping("/anh")
    public String anh(){
        return "/viewQLSanPham/anh";
    }

}
