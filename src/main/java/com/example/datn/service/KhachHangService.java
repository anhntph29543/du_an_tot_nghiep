package com.example.datn.service;

import com.example.datn.entity.KhachHang;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface KhachHangService {
    List<KhachHang> getAll();

    Page<KhachHang> getData(int page);

    Boolean save(KhachHang kh);

    void delete(UUID id);

    KhachHang detail(UUID id);
}
