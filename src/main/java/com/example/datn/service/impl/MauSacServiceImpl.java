package com.example.datn.service.impl;

import com.example.datn.entity.MauSac;
import com.example.datn.entity.MauSac;
import com.example.datn.repository.MauSacRepository;
import com.example.datn.service.MauSacService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class MauSacServiceImpl implements MauSacService {
    @Autowired
    private MauSacRepository repository;

    @Override
    public List<MauSac> getAll() {
        return repository.findAll();
    }

    @Override
    public Page<MauSac> getData(int page) {
        Pageable pageable= PageRequest.of(page, 5);
        return repository.findAll(pageable);
    }

    @Override
    public MauSac detail(UUID id) {
        return repository.findById(id).get();
    }

    @Override
    public Boolean save(MauSac th) {
        if (th.getNgayThem()==null){
            th.setNgayThem(new java.util.Date());
        }
        repository.save(th);
        return true;
    }

    @Override
    public void delete(UUID id) {
        repository.deleteById(id);
    }

}
