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

@Service
public class ThuongHieuServiceImpl implements ThuongHieuService {

    @Autowired
    private ThuongHieuRepository repository;

    @Override
    public List<ThuongHieu> getAll() {
        return repository.findAll();
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
