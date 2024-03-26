package com.example.datn.repository;

import com.example.datn.entity.GioHangOnline;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;
@Repository
public interface GioHangOnlineRepo extends JpaRepository<GioHangOnline, UUID> {

    @Query("select gh.ma from GioHangOnline gh")
    List<String> maGH();
}
