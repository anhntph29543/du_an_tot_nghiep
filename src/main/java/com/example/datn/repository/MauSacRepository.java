package com.example.datn.repository;

import com.example.datn.entity.MauSac;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface MauSacRepository extends JpaRepository<MauSac, UUID> {

    @Query("select ms.ma from MauSac ms")
    List<String> maMS();

    @Query("select ms from MauSac ms order by ms.ngayThem desc")
    List<MauSac> getAllDesc();

}
