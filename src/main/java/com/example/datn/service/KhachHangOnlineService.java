package com.example.datn.service;

import com.example.datn.entity.KhachHangOnline;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface KhachHangOnlineService {

    List<KhachHangOnline> getAll();

    Page<KhachHangOnline> getData(int page);

    Boolean save(KhachHangOnline kh);

    void delete(UUID id);

    KhachHangOnline detail(UUID id);
}
