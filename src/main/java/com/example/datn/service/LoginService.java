package com.example.datn.service;

import com.example.datn.entity.Login;

import java.util.List;
import java.util.UUID;

public interface LoginService {

    List<Login> getAll();

    Login detail(UUID id);

    Boolean save(Login login);

    void delete(UUID id);
}
