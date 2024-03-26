package com.example.datn.repository;

import com.example.datn.entity.DonHangCT;
import com.example.datn.entity.SanPhamCTTuan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface DonHangCTRepo extends JpaRepository<DonHangCT, UUID> {

    @Query("select dhct from DonHangCT dhct where dhct.donHang.id=?1")
    List<DonHangCT> getDHCT(UUID idDH);

    @Query("select dhct.sanPhanCT from DonHangCT dhct where dhct.donHang.id=?1")
    List<SanPhamCTTuan> getSPCT(UUID idDH);

}
