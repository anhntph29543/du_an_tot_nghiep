package com.example.datn.service.impl;

import com.example.datn.entity.Login;
import com.example.datn.repository.LoginRepo;
import com.example.datn.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginRepo loginRepo;

    @Override
    public List<Login> getAll() {
        return loginRepo.findAll();
    }

    @Override
    public Login detail(UUID id) {
        return loginRepo.findById(id).get();
    }

    @Override
    public Boolean save(Login login) {
        List<Login> list = loginRepo.findAll();
        for (Login login1: list) {
            if(login1.getUser().equals(login.getUser())){
                return false;
            }
        }
        loginRepo.save(login);
        return true;
    }

    @Override
    public void delete(UUID id) {

    }
}
