package com.example.datn.service.impl;

import com.example.datn.entity.NhanVien;
import com.example.datn.repository.NhanVienRepository;
import com.example.datn.service.NhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
@Service
public class NhanVienServiceImpl implements NhanVienService {
    @Autowired
    private NhanVienRepository repository;
    @Override
    public List<NhanVien> getAll() {
        return repository.findAll();
    }

    @Override
    public Page<NhanVien> getData(int page) {
        Pageable pageable= PageRequest.of(page, 5);
        return repository.findAll(pageable);
    }

    @Override
    public Boolean save(NhanVien nv) {
        if (nv.getNgayThem()==null){
            nv.setNgayThem(new java.util.Date());
        }
        repository.save(nv);
        return true;
    }

    @Override
    public void delete(UUID id) {
        repository.deleteById(id);
    }

    @Override
    public NhanVien detail(UUID id) {
        return repository.findById(id).get();
    }
}
