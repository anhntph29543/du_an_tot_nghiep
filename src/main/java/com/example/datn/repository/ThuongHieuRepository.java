package com.example.datn.repository;

import com.example.datn.entity.ThuongHieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ThuongHieuRepository extends JpaRepository<ThuongHieu, UUID> {

    @Query("select th.ma from ThuongHieu th")
    List<String> maTH();

    @Query("select th from ThuongHieu th where th.trangThai = true")
    List<ThuongHieu> getHoatDong();

}
