package com.example.datn.service.impl;

import com.example.datn.entity.SanPham;
import com.example.datn.repository.SanPhamRepository;
import com.example.datn.service.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class SanPhamServiceImpl implements SanPhamService {

    @Autowired
    private SanPhamRepository repository;

    @Override
    public List<SanPham> getAll() {
        return repository.findAll();
    }

    @Override
    public Page<SanPham> getData(int page) {
        Pageable pageable= PageRequest.of(page, 5);
        return repository.findAll(pageable);
    }

    @Override
    public Boolean save(SanPham sp) {
        if (sp.getNgayThem()==null){
            sp.setNgayThem(new java.util.Date());
        }
        repository.save(sp);
        return true;
    }

    @Override
    public void delete(UUID id) {
        repository.deleteById(id);
    }
}
