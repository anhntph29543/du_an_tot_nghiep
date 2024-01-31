package com.example.datn.service;

import com.example.datn.entity.MauSac;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface MauSacService {

    List<MauSac> getAll();

    Page<MauSac> getData(int page);

    Boolean save(MauSac th);

    void delete(UUID id);

}
