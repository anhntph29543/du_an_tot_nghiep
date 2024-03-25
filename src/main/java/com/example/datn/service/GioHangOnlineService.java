package com.example.datn.service;

import com.example.datn.entity.GioHangOnline;

import java.util.List;
import java.util.UUID;

public interface GioHangOnlineService {

    List<GioHangOnline> getAll();

    GioHangOnline detail(UUID id);

    Boolean save(GioHangOnline gioHangOnline);

    String tuTaoMa();

    void delete(UUID id);
}
