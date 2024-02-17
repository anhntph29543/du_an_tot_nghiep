package com.example.datn.service;

import com.example.datn.entity.ThuongHieu;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface ThuongHieuService {

    List<ThuongHieu> getAll();

    Page<ThuongHieu> getData(int page);

    ThuongHieu detail(UUID id);

    Boolean save(ThuongHieu th);

    String tuTaoMa();

    void delete(UUID id);

}
