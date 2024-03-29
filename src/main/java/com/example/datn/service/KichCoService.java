package com.example.datn.service;

import com.example.datn.entity.KichCo;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface KichCoService {
    List<KichCo> getAll();

    Page<KichCo> getData(int page);

    KichCo detail(UUID id);

    Boolean save(KichCo th);

    String tuTaoMa();

    void delete(UUID id);
}
