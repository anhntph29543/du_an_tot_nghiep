package com.example.datn.service;

import com.example.datn.entity.SanPham;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface SanPhamService {

    List<SanPham> getAll();

    Page<SanPham> getData(int page);

    SanPham detail(UUID id);

    Boolean save(SanPham sp);

    String tuTaoMa();

    void delete(UUID id);

}
