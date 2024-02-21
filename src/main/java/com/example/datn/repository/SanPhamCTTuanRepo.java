package com.example.datn.repository;

import com.example.datn.entity.SanPhanCTTuan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;
@Repository
public interface SanPhamCTTuanRepo extends JpaRepository<SanPhanCTTuan, UUID> {


    @Query("select spct.ma from SanPhanCTTuan spct")
    List<String> maSPCT();
}
