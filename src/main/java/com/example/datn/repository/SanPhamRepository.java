package com.example.datn.repository;

import com.example.datn.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, UUID> {

    @Query("select sp.ma from SanPham sp")
    List<String> maSP();

    @Query("select sp from SanPham sp where sp.ten like ?1 and sp.th.id =?2 ")
    List<SanPham> search(String ten, UUID idTH);

    @Query("select sp from SanPham sp where sp.trangThai=true order by sp.ngayThem desc")
    List<SanPham> dangHoatDong();

    @Query("select sp from SanPham sp order by sp.ngayThem desc")
    List<SanPham> getAllDesc();


}
