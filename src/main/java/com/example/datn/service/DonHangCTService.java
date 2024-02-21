package com.example.datn.service;

import com.example.datn.entity.DonHangCT;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface DonHangCTService {

    List<DonHangCT> getAll();

    Page<DonHangCT> getData(int page);

    DonHangCT detail(UUID id);

    Boolean save(DonHangCT donHangCT);

    String tuTaoMa();

    void delete(UUID id);

}
