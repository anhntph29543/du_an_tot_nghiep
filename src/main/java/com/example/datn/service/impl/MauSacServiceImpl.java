package com.example.datn.service.impl;

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
import java.util.stream.Stream;

@Service
public class MauSacServiceImpl implements MauSacService {
    @Autowired
    private MauSacRepository repository;
    private String prefix= "MS";

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
    public Boolean save(MauSac ms) {
        if (ms.getMa()==null){
            ms.setMa(tuTaoMa());
        }
        if (ms.getNgayThem()==null){
            ms.setNgayThem(new java.util.Date());
        }
        repository.save(ms);
        return true;
    }

    @Override
    public String tuTaoMa() {
        Stream<String> ma= repository.maMS().stream();
        Integer max= ma.map(o -> o.replace(prefix, "")).mapToInt(Integer::parseInt).max().orElse(0);
        return prefix+(String.format("%d", max+1));
    }

    @Override
    public void delete(UUID id) {
        repository.deleteById(id);
    }

}
