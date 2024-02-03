package com.example.datn.service;


import com.example.datn.entity.NhanVien;
import org.springframework.data.domain.Page;


import java.util.List;
import java.util.UUID;

public interface NhanVienService {
    List<NhanVien> getAll();

    Page<NhanVien> getData(int page);

    Boolean save(NhanVien nv);

    void delete(UUID id);

    NhanVien detail(UUID id);
}
