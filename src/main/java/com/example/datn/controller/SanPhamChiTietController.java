package com.example.datn.controller;

import com.example.datn.entity.SanPhamCT;
import com.example.datn.service.ChatLieuService;
import com.example.datn.service.KichCoService;
import com.example.datn.service.MauSacService;
import com.example.datn.service.SanPhamCTService;
import com.example.datn.service.SanPhamService;
import com.example.datn.service.ThuongHieuService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;

@Controller
public class SanPhamChiTietController {

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
    private ThuongHieuService serviceTH;

    @GetMapping("/datn/san-pham-chi-tiet/them")
    public  String viewSanPhamCT(@RequestParam(value = "idSP", defaultValue = "") String id, Model model){
        SanPhamCT spct = new SanPhamCT();
        if (!id.trim().isEmpty()){
            spct.setSp(serviceSP.detail(UUID.fromString(id)));
        }
        model.addAttribute("listTH",serviceTH.getAll());
        model.addAttribute("listSP",serviceSP.dangHoatDong());
        model.addAttribute("listMS",serviceMS.getAll());
        model.addAttribute("listCL",serviceCL.getAll());
        model.addAttribute("listKC",serviceKC.getAll());
        model.addAttribute("spct1",spct);
        return "/viewQLSanPham/them-san-pham-ct";
    }

    @GetMapping("/datn/san-pham-chi-tiet/sua/{id}")
    public  String viewUpdateSanPhamCT(@PathVariable("id") UUID id, Model model){
        SanPhamCT spct = serviceSPCT.detail(id);
        model.addAttribute("listSP",serviceSP.dangHoatDong());
        model.addAttribute("listMS",serviceMS.getAll());
        model.addAttribute("listCL",serviceCL.getAll());
        model.addAttribute("listKC",serviceKC.getAll());
        model.addAttribute("listTH",serviceTH.getAll());
        model.addAttribute("spct1",spct);
        return "/viewQLSanPham/sua-san-pham-ct";
    }

    @PostMapping("/datn/san-pham-ct/add")
    public String addSanPhamCT(@Valid @ModelAttribute("spct1") SanPhamCT spct1,
                      BindingResult result,
                      Model model){
        if(result.hasErrors()){
            model.addAttribute("listSP",serviceSP.dangHoatDong());
            model.addAttribute("listMS",serviceMS.getAll());
            model.addAttribute("listCL",serviceCL.getAll());
            model.addAttribute("listKC",serviceKC.getAll());
            model.addAttribute("listTH",serviceTH.getAll());
            return "/viewQLSanPham/them-san-pham-ct";
        }
        spct1.setMoTa(spct1.getMoTa().replaceAll("\\s\\s+", " ").trim());
        serviceSPCT.save(spct1);
        return "redirect:/datn/san-pham-chi-tiet/"+spct1.getSp().getId().toString();
    }

    @PostMapping("/datn/san-pham-ct/update/{id}")
    public String updateSanPhamCT(@PathVariable("id") UUID idCu,@Valid @ModelAttribute("spct1") SanPhamCT spct1,
                               BindingResult result,
                               Model model){
        SanPhamCT spct = serviceSPCT.detail(idCu);
        spct1.setId(idCu);
        spct1.setMa(spct.getMa());
        if(result.hasErrors()){
            model.addAttribute("listSP",serviceSP.dangHoatDong());
            model.addAttribute("listMS",serviceMS.getAll());
            model.addAttribute("listCL",serviceCL.getAll());
            model.addAttribute("listKC",serviceKC.getAll());
            model.addAttribute("listTH",serviceTH.getAll());
            return "/viewQLSanPham/sua-san-pham-ct";
        }
        spct1.setMoTa(spct1.getMoTa().replaceAll("\\s\\s+", " ").trim());
        serviceSPCT.save(spct1);
        return "redirect:/datn/san-pham-chi-tiet/"+spct1.getSp().getId().toString();
    }

}
