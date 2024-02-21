package com.example.datn.service;

import com.example.datn.entity.SanPhanCTTuan;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface SanPhamCTTuanService {

    List<SanPhanCTTuan> getAll();

    Page<SanPhanCTTuan> getData(int page);

    SanPhanCTTuan detail(UUID id);

    Boolean save(SanPhanCTTuan sanPhanCTTuan);

    String tuTaoMa();

    void delete(UUID id);
}
