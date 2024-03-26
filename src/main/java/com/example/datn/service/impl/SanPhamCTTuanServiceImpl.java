package com.example.datn.service.impl;

import com.example.datn.entity.SanPhamCTTuan;
import com.example.datn.repository.SanPhamCTTuanRepo;
import com.example.datn.service.SanPhamCTTuanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Stream;

@Service
public class SanPhamCTTuanServiceImpl implements SanPhamCTTuanService {

    @Autowired
    private SanPhamCTTuanRepo sanPhamCTTuanRepo;
    private String prefix= "SPCT";

    @Override
    public List<SanPhamCTTuan> getAll() {
        return sanPhamCTTuanRepo.findAll();
    }

    @Override
    public Page<SanPhamCTTuan> getData(int page) {
        Pageable pageable= PageRequest.of(page, 5);
        return sanPhamCTTuanRepo.findAll(pageable);
    }

    @Override
    public SanPhamCTTuan detail(UUID id) {
        return sanPhamCTTuanRepo.findById(id).get();
    }

    @Override
    public Boolean save(SanPhamCTTuan sanPhanCTTuan) {
        if (sanPhanCTTuan.getMa()==null){
            sanPhanCTTuan.setMa(tuTaoMa());
        }

        sanPhamCTTuanRepo.save(sanPhanCTTuan);
        return true;
    }

    @Override
    public String tuTaoMa() {
        Stream<String> ma= sanPhamCTTuanRepo.maSPCT().stream();
        Integer max= ma.map(o -> o.replace(prefix, "")).mapToInt(Integer::parseInt).max().orElse(0);
        return prefix+(String.format("%d", max+1));
    }

    @Override
    public void delete(UUID id) {

    }
}
