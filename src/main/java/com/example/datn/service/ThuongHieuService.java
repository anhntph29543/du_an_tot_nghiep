package com.example.datn.service;

import com.example.datn.entity.ThuongHieu;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface ThuongHieuService {

    List<ThuongHieu> getAll();

    Page<ThuongHieu> getData(int page);

    Boolean save(ThuongHieu th);

    void delete(UUID id);

}
