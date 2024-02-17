package com.example.datn.service.impl;

import com.example.datn.entity.ChatLieu;
import com.example.datn.repository.ChatLieuRepository;
import com.example.datn.service.ChatLieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Stream;

@Service
public class ChatLieuServiceImpl implements ChatLieuService {
    @Autowired
    private ChatLieuRepository repository;
    private String prefix= "CL";

    @Override
    public List<ChatLieu> getAll() {
        return repository.findAll();
    }

    @Override
    public Page<ChatLieu> getData(int page) {
        Pageable pageable= PageRequest.of(page, 5);
        return repository.findAll(pageable);
    }

    @Override
    public ChatLieu detail(UUID id) {
        return repository.findById(id).get();
    }

    @Override
    public Boolean save(ChatLieu cl) {
        if (cl.getMa()==null){
            cl.setMa(tuTaoMa());
        }
        if (cl.getNgayThem()==null){
            cl.setNgayThem(new java.util.Date());
        }
        repository.save(cl);
        return true;
    }

    @Override
    public String tuTaoMa() {
        Stream<String> ma= repository.maCL().stream();
        Integer max= ma.map(o -> o.replace(prefix, "")).mapToInt(Integer::parseInt).max().orElse(0);
        return prefix+(String.format("%d", max+1));
    }

    @Override
    public void delete(UUID id) {
        repository.deleteById(id);
    }
}
