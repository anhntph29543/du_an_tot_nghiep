package com.example.datn.controller.restcontroller;

import com.example.datn.entity.DonHang;
import com.example.datn.entity.DonHangOnilne;
import com.example.datn.service.DonHangOnlineService;
import com.example.datn.service.DonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/DonHangOnline/api")
public class DonHangOnlineRestController {

    @Autowired
    private DonHangOnlineService donHangOnlineService;

    @Autowired
    private DonHangService service;

    @PostMapping("/tao-don-hang-online-moi")
    public ResponseEntity<?> add(@RequestBody DonHangOnilne dhOnline) {


        return ResponseEntity.ok(donHangOnlineService.save(dhOnline));


    }
}
