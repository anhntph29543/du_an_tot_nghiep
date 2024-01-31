package com.example.datn.service.impl;

import com.example.datn.entity.KichCo;
import com.example.datn.repository.KichCoRepository;
import com.example.datn.service.KichCoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class KichCoServiceImpl implements KichCoService {
    @Autowired
    private KichCoRepository repository;

    @Override
    public List<KichCo> getAll() {
        return repository.findAll();
    }

    @Override
    public Page<KichCo> getData(int page) {
        Pageable pageable= PageRequest.of(page, 5);
        return repository.findAll(pageable);
    }

    @Override
    public Boolean save(KichCo th) {
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
