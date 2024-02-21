package com.example.datn.service.impl;

import com.example.datn.entity.ThuongHieu;
import com.example.datn.repository.ThuongHieuRepository;
import com.example.datn.service.ThuongHieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Stream;

@Service
public class ThuongHieuServiceImpl implements ThuongHieuService {

    @Autowired
    private ThuongHieuRepository repository;
    private String prefix= "TH";

    @Override
    public List<ThuongHieu> getAll() {
        return repository.findAll();
    }

    @Override
    public List<ThuongHieu> getHoatDong() {
        return repository.getHoatDong();
    }

    @Override
    public Page<ThuongHieu> getData(int page) {
        Pageable pageable= PageRequest.of(page, 5);
        return repository.findAll(pageable);
    }

    @Override
    public ThuongHieu detail(UUID id) {
        return repository.findById(id).get();
    }

    @Override
    public Boolean save(ThuongHieu th) {
        if (th.getMa()==null){
            th.setMa(tuTaoMa());
        }
        if (th.getNgayThem()==null){
            th.setNgayThem(new java.util.Date());
        }
        repository.save(th);
        return true;
    }

    @Override
    public String tuTaoMa() {
        Stream<String> ma= repository.maTH().stream();
        Integer max= ma.map(o -> o.replace(prefix, "")).mapToInt(Integer::parseInt).max().orElse(0);
        return prefix+(String.format("%d", max+1));
    }

    @Override
    public void delete(UUID id) {
        repository.deleteById(id);
    }

}
