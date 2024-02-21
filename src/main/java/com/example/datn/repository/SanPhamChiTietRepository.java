package com.example.datn.repository;

import com.example.datn.entity.SanPhamCT;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;

import java.util.List;
import java.util.UUID;

@Controller
public interface SanPhamChiTietRepository extends JpaRepository<SanPhamCT,UUID> {

    @Query("select spct from SanPhamCT spct where spct.sp.id=?1")
    List<SanPhamCT> getSP(UUID idSP);

    @Query("select spct.ma from SanPhamCT spct")
    List<String> maSP();

}
