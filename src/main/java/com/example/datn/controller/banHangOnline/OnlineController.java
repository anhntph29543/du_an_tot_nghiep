package com.example.datn.controller.banHangOnline;

import com.example.datn.entity.GioHangOnline;
import com.example.datn.entity.KhachHangOnline;
import com.example.datn.entity.SanPham;
import com.example.datn.entity.SanPhamCTTuan;
import com.example.datn.repository.SanPhamCTTuanRepo;
import com.example.datn.service.GioHangOnlineService;
import com.example.datn.service.KhachHangOnlineService;
import com.example.datn.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/ban-hang-online/datn")
public class OnlineController {

    @Autowired
    private SanPhamService service;

    @Autowired
    private SanPhamCTTuanRepo sanPhamCTTuanRepo;

    @Autowired
    private KhachHangOnlineService khachHangOnlineService;

    @Autowired
    private GioHangOnlineService gioHangOnlineService;

    private String idLogin="123";

    private String idGioHang="123";

    private String name="Tuansiretert";

    @GetMapping("/trang-chu")
    public String trangChu(Model model){
        model.addAttribute("idLogin",idLogin);
        model.addAttribute("idGioHang",idGioHang);
        return "/viewBanHangOnline/viewTrangChu/trangChu";
    }

    @GetMapping("/trang-chu/{id}")
    public String trangChu(@PathVariable("id") String id, Model model){
        idLogin=id;
        List<GioHangOnline> listGh=gioHangOnlineService.getAll();
        for (GioHangOnline gioHangOnline: listGh) {
            if(String.valueOf(gioHangOnline.getKhachHangOnline().getLogin().getId()).equals(idLogin)){
                idGioHang=String.valueOf(gioHangOnline.getId());
            }
        }
        return "redirect:/ban-hang-online/datn/trang-chu";
    }

    @GetMapping("/cua-hang")
    public String cuaHang(Model model){
        model.addAttribute("idLogin",idLogin);
        model.addAttribute("idGioHang",idGioHang);

        return "/viewBanHangOnline/viewCuaHang/cua-hang";

    }

    @GetMapping("/tra-cuu-don-hang")
    public String traCuuHoaDon( Model model){
        model.addAttribute("idLogin",idLogin);
        model.addAttribute("idGioHang",idGioHang);

        return "/viewBanHangOnline/viewTraCuuDonHang/tra-cuu-don-hang";

    }
    @GetMapping("/dang-nhap-dang-ky")
    public String dangNhapDangKy(Model model){
        idLogin="123";
        idGioHang="123";
        model.addAttribute("idLogin",idLogin);
        model.addAttribute("idGioHang",idGioHang);

        return "/viewBanHangOnline/viewDangNhap/dang-nhap-dang-ky";
    }



    @GetMapping("/detail-san-pham/{id}")
    public String detailSanPham(@PathVariable("id") UUID id, Model model){
        SanPham sanPham=service.detail(id);
        List<SanPhamCTTuan> listSPCT=sanPhamCTTuanRepo.tienLonNhatCuaSP(id);
        Double tienNhoNhat=listSPCT.get(0).getDonGia();
        Double tienLonNhat=listSPCT.get(listSPCT.size()-1).getDonGia();
        model.addAttribute("tenSP",sanPham.getTen());
        model.addAttribute("thuongHieu",sanPham.getTh().getTen());
        model.addAttribute("idSP",id);
        model.addAttribute("tienNhoNhat",tienNhoNhat);
        model.addAttribute("tienLonNhat",tienLonNhat);
        model.addAttribute("idLogin",idLogin);
        model.addAttribute("idGioHang",idGioHang);

        return "/viewBanHangOnline/viewDetailSanPham/detail-san-pham";

    }

    @GetMapping("/gio-hang")
    public String gioHang(Model model){
        model.addAttribute("idLogin",idLogin);
        model.addAttribute("idGioHang",idGioHang);

        return "/viewBanHangOnline/viewGioHang/gio-hang";

    }

    @GetMapping("/thanh-toan")
    public String thanhToan(Model model){
        model.addAttribute("idLogin",idLogin);
        model.addAttribute("idGioHang",idGioHang);

        return "/viewBanHangOnline/viewThanhToan/thanhToan";

    }
    @GetMapping("/lien-he")
    public String lienHe(Model model){
        model.addAttribute("idLogin",idLogin);
        model.addAttribute("idGioHang",idGioHang);

        return "/viewBanHangOnline/viewLienHe/lien-he";

    }

}
