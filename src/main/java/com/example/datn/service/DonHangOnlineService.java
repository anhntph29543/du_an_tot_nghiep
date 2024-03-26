package com.example.datn.service;


import com.example.datn.entity.DonHangOnilne;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface DonHangOnlineService {

    List<DonHangOnilne> getAll();

    Page<DonHangOnilne> getData(int page);

    DonHangOnilne detail(UUID id);

    Boolean save(DonHangOnilne donHangOnilne);

    String tuTaoMa();

    void delete(UUID id);
}
