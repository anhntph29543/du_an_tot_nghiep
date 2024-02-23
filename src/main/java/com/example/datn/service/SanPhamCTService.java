package com.example.datn.service;

import com.example.datn.entity.SanPham;
import com.example.datn.entity.SanPhamCT;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface SanPhamCTService {

    List<SanPhamCT> getSPCT(UUID idSP);

    String tuTaoMa();

    List<SanPhamCT> search(String ten, UUID idTH);

    Page<SanPhamCT> getData(int page);

    SanPhamCT detail(UUID id);

    Boolean save(SanPhamCT spct);

    void delete(UUID id);

}
