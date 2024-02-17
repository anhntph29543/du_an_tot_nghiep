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
import java.util.stream.Stream;

@Service
public class KichCoServiceImpl implements KichCoService {
    @Autowired
    private KichCoRepository repository;
    private String prefix= "KC";

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
    public KichCo detail(UUID id) {
        return repository.findById(id).get();
    }

    @Override
    public Boolean save(KichCo kc) {
        if (kc.getMa()==null){
            kc.setMa(tuTaoMa());
        }
        if (kc.getNgayThem()==null){
            kc.setNgayThem(new java.util.Date());
        }
        repository.save(kc);
        return true;
    }

    @Override
    public String tuTaoMa() {
        Stream<String> ma= repository.maKC().stream();
        Integer max= ma.map(o -> o.replace(prefix, "")).mapToInt(Integer::parseInt).max().orElse(0);
        return prefix+(String.format("%d", max+1));
    }

    @Override
    public void delete(UUID id) {
        repository.deleteById(id);
    }
}
