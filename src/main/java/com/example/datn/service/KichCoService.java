package com.example.datn.service;

import com.example.datn.entity.KichCo;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface KichCoService {
    List<KichCo> getAll();

    Page<KichCo> getData(int page);

    Boolean save(KichCo th);

    void delete(UUID id);
}
