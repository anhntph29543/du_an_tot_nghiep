package com.example.datn.repository;

import com.example.datn.entity.DonHangOnilne;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;
@Repository
public interface DonHangOnlineRepo extends JpaRepository<DonHangOnilne, UUID > {

    @Query("select dh.ma from DonHangOnilne dh")
    List<String> maDHOnline();
}
