package com.example.datn.controller;

import com.example.datn.entity.SanPham;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;

@Controller
@RequestMapping("/datn")
public class SanPhamController {

    @Autowired
    private ThuongHieuService serviceTH;
    @Autowired
    private SanPhamService serviceSP;

    @GetMapping("/san-pham/tim-kiem")
    public String sanPham(@RequestParam(value = "tenSearch",defaultValue = "") String ten,
                          @RequestParam(value = "thSearch",defaultValue = "") UUID idTH,
                          Model model){
        model.addAttribute("tenSearch", ten.trim());
        model.addAttribute("thSearch", idTH);
        model.addAttribute("listTH", serviceTH.getAll());
        model.addAttribute("listSP", serviceSP.search(ten.trim(),idTH));
        return "/viewQLSanPham/san-pham";
    }

    @PostMapping("san-pham/add")
    public String add(@Valid @ModelAttribute("sp") SanPham sp, BindingResult result, Model model){
        if (result.hasErrors()){
            model.addAttribute("listTH", serviceTH.getAll());
            return "/viewQLSanPham/them-san-pham";
        }
        if(!kiemTra(sp,model)){
            model.addAttribute("listTH", serviceTH.getAll());
            return "/viewQLSanPham/them-san-pham";
        }
        sp.setTen(sp.getTen().replaceAll("\\s\\s+", " ").trim());
        serviceSP.save(sp);
        return "redirect:/datn/san-pham";
    }

    @PostMapping("san-pham/update/{id}")
    public String update(@Valid @ModelAttribute("sp") SanPham sp,
                         BindingResult result, @PathVariable("id") UUID id, Model model){
        SanPham spCu= serviceSP.detail(id);
        spCu.setTh(sp.getTh());
        if (result.hasErrors()){
            model.addAttribute("listTH", serviceTH.getAll());
            return "/viewQLSanPham/sua-san-pham";
        }
        if(spCu.getTen().replaceAll("\\s\\s+", " ").trim().equalsIgnoreCase(sp.getTen())){
            spCu.setTen(sp.getTen().replaceAll("\\s\\s+", " ").trim());
            spCu.setTrangThai(sp.getTrangThai());
            serviceSP.save(spCu);
            return "redirect:/datn/san-pham";
        }
        if(!kiemTra(sp,model)){
            model.addAttribute("listTH", serviceTH.getAll());
            return "/viewQLSanPham/sua-san-pham";
        }
        spCu.setTen(sp.getTen().replaceAll("\\s\\s+", " ").trim());
        serviceSP.save(spCu);
        return "redirect:/datn/san-pham";
    }

    private boolean kiemTra(SanPham sp1, Model model){
        if (sp1.getTen().replaceAll("\\s\\s+", " ").trim().length()>50){
            model.addAttribute("tenError", "Tên không được quá 50 kí tự");
            return false;
        }
        for (SanPham sp: serviceSP.getAll()) {
            if(sp.getTen().equalsIgnoreCase(sp1.getTen().replaceAll("\\s\\s+", " ").trim())){
                model.addAttribute("tenError", "Tên đã tồn tại");
                return false;
            }
        }
        return true;
    }

}
