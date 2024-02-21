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

}