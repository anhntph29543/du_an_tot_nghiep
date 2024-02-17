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
import java.util.stream.Stream;

@Service
public class SanPhamServiceImpl implements SanPhamService {

    @Autowired
    private SanPhamRepository repository;
    private String prefix= "SP";

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
    public SanPham detail(UUID id) {
        return repository.findById(id).get();
    }

    @Override
    public Boolean save(SanPham sp) {
        if (sp.getMa()==null){
            sp.setMa(tuTaoMa());
        }
        if (sp.getNgayThem()==null){
            sp.setNgayThem(new java.util.Date());
        }
        repository.save(sp);
        return true;
    }

    @Override
    public String tuTaoMa() {
        Stream<String> ma= repository.maSP().stream();
        Integer max= ma.map(o -> o.replace(prefix, "")).mapToInt(Integer::parseInt).max().orElse(0);
        return prefix+(String.format("%d", max+1));
    }

    @Override
    public void delete(UUID id) {
        repository.deleteById(id);
    }
}
