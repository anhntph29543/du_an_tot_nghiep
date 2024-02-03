package com.example.datn.service.impl;

import com.example.datn.entity.KhachHang;
import com.example.datn.repository.KhachHangRepository;
import com.example.datn.repository.NhanVienRepository;
import com.example.datn.service.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
@Service
public class KhachHangServiceImpl implements KhachHangService {
    @Autowired
    private KhachHangRepository repository;
    @Override
    public List<KhachHang> getAll() {
        return repository.findAll();
    }

    @Override
    public Page<KhachHang> getData(int page) {
        Pageable pageable= PageRequest.of(page, 5);
        return repository.findAll(pageable);
    }

    @Override
    public Boolean save(KhachHang kh) {
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
    public KhachHang detail(UUID id) {
        return repository.findById(id).get();
    }
}
