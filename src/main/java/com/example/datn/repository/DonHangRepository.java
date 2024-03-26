package com.example.datn.repository;

import com.example.datn.entity.DonHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;
@Repository
public interface DonHangRepository extends JpaRepository<DonHang, UUID> {

    @Query("select dh.ma from DonHang dh")
    List<String> maDH();

    @Query("select dh from DonHang dh where dh.trangThaiDonHang like ?1 order by dh.ngayTao asc")
    List<DonHang> getCTT(String trangThai);

}
