package com.example.datn.service;

import com.example.datn.entity.AnhTuan;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface AnhTuanService {
    List<AnhTuan> getAll();

    List<AnhTuan> getAllAnhSP();

    Page<AnhTuan> getData(int page);

    AnhTuan detail(UUID id);

    Boolean save(AnhTuan th);

    void delete(UUID id);
}
