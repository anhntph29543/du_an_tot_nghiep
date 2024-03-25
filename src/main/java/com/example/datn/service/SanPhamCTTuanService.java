package com.example.datn.service;

import com.example.datn.entity.SanPhamCTTuan;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface SanPhamCTTuanService {

    List<SanPhamCTTuan> getAll();

    Page<SanPhamCTTuan> getData(int page);

    SanPhamCTTuan detail(UUID id);

    Boolean save(SanPhamCTTuan sanPhanCTTuan);

    String tuTaoMa();

    void delete(UUID id);
}
