package com.example.datn.repository;

import com.example.datn.entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.UUID;

public interface KhachHangRepository extends JpaRepository<KhachHang, UUID> {
    @Query("select kh.ma from KhachHang kh")
    List<String> maKH();
    @Query("select kh from KhachHang kh where kh.sdt=?1")
    KhachHang getKH(String sdt);
}
