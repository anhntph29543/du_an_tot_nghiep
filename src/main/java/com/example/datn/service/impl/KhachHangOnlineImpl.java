package com.example.datn.service.impl;

import com.example.datn.entity.KhachHang;
import com.example.datn.entity.KhachHangOnline;
import com.example.datn.repository.KhachHangOnlineRepo;
import com.example.datn.service.KhachHangOnlineService;
import com.example.datn.service.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class KhachHangOnlineImpl implements KhachHangOnlineService {

    @Autowired
    private KhachHangOnlineRepo repository;
    @Override
    public List<KhachHangOnline> getAll() {
        return repository.findAll();
    }

    @Override
    public Page<KhachHangOnline> getData(int page) {
        Pageable pageable= PageRequest.of(page, 5);
        return repository.findAll(pageable);
    }

    @Override
    public Boolean save(KhachHangOnline kh) {
        if (kh.getNgayThem()==null){
            kh.setNgayThem(new java.util.Date());
        }
        repository.save(kh);
        return true;
    }

    @Override
    public void delete(UUID id) {
        repository.deleteById(id);
    }

    @Override
    public KhachHangOnline detail(UUID id) {
        return repository.findById(id).get();
    }
}
