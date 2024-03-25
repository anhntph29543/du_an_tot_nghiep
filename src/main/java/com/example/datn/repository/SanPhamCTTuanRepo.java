package com.example.datn.repository;

import com.example.datn.entity.SanPhamCTTuan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;
@Repository
public interface SanPhamCTTuanRepo extends JpaRepository<SanPhamCTTuan, UUID> {

    @Query("select  spct from SanPhamCTTuan spct where spct.sanPham.id =?1  order by spct.donGia DESC")
    List<SanPhamCTTuan> tienLonNhatCuaSP(UUID idSP);

    @Query("select spct.ma from SanPhamCTTuan spct")
    List<String> maSPCT();
}
