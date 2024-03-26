package com.example.datn.service;

import com.example.datn.entity.DonHang;
import com.example.datn.entity.SanPhamCT;
import com.example.datn.entity.SanPhamCTTuan;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface DonHangService {

    List<DonHang> getAll();

    List<DonHang> getCTT();

    List<DonHang> getDHTT(String trangThai);

    List<DonHang> search(String loai,String trangThai);

    List<SanPhamCTTuan> getSPCT(UUID idDH);

    Page<DonHang> getData(int page);

    DonHang detail(UUID id);

    Boolean save(DonHang th);

    String tuTaoMa();

    void delete(UUID id);
}
