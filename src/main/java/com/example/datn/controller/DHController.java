package com.example.datn.controller;

import com.example.datn.service.DonHangCTService;
import com.example.datn.service.DonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.UUID;

@Controller
public class DHController {

    @Autowired
    private DonHangService service;
    @Autowired
    private DonHangCTService serviceDHCT;

    @GetMapping("/datn/don-hang/search")
    public String getAll(@RequestParam(value = "loaiDon",defaultValue = "") String loai,
                         @RequestParam(value = "trangThai",defaultValue = "3") String trangThai,
                         Model model){
        model.addAttribute("listDH",service.search(loai,trangThai));
        model.addAttribute("trangThai",trangThai);
        model.addAttribute("loaiDon",loai);
        return "/viewQLDonHang/don-hang";
    }

    @GetMapping("/datn/don-hang/chi-tiet/{id}")
    public String chiTiet(@PathVariable("id") UUID idDH,
                          Model model){
        model.addAttribute("dh",service.detail(idDH));
        model.addAttribute("listDHCT",serviceDHCT.getDHCT(idDH));
        return "/viewQLDonHang/don-hang-chi-tiet";
    }

}
