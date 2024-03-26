package com.example.datn.service;

import com.example.datn.entity.DiaChiOnline;

import java.util.List;
import java.util.UUID;

public interface DiaChiOnlineService {

    List<DiaChiOnline> getAll();


    DiaChiOnline detail(UUID id);

    Boolean save(DiaChiOnline diaChiOnline);

    String tuTaoMa();

    void delete(UUID id);
}
