package com.example.datn.service;

import com.example.datn.entity.DonHang;
import com.example.datn.entity.GioHangCTOnline;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface GioHangCTOnlineService {

    List<GioHangCTOnline> getAll();

    GioHangCTOnline detail(UUID id);

    Boolean save(GioHangCTOnline gioHangCT);

    String tuTaoMa();

    void delete(UUID id);
}
