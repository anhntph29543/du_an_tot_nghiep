package com.example.datn.repository;

import com.example.datn.entity.DiaChiOnline;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;
@Repository
public interface DiaChiOnlineRepo extends JpaRepository<DiaChiOnline, UUID> {

    @Query("select diaChi.maDiaChi from DiaChiOnline diaChi")
    List<String> maDC();
}
