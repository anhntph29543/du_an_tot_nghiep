package com.example.datn.controller.restcontroller;

import com.example.datn.entity.KhachHang;
import com.example.datn.entity.Login;
import com.example.datn.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/Login/api")
public class LoginRestController {

    @Autowired
    private LoginService service;

    @PostMapping(value = "/login")
    public ResponseEntity<?> login(@RequestBody Login login){
        List<Login> loginList=service.getAll();
        for (Login login1:loginList) {
            if(login.getUser().equals(login1.getUser())&&login.getPassword().equals(login1.getPassword())){
                return ResponseEntity.ok(login1.getId());
            }
            else if(login.getUser().equals(login1.getUser())&&!login.getPassword().equals(login1.getPassword())){
                return ResponseEntity.ok("0");
            }else if(!login.getUser().equals(login1.getUser())){
                return ResponseEntity.ok("0");
            }
        }

        return ResponseEntity.ok("0");
    }
}
