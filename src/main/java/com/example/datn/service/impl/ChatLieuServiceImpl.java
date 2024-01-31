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

@Service
public class ChatLieuServiceImpl implements ChatLieuService {
    @Autowired
    private ChatLieuRepository repository;

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
    public Boolean save(ChatLieu th) {
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
