package com.example.datn.service;

import com.example.datn.entity.ChatLieu;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface ChatLieuService {
    List<ChatLieu> getAll();

    Page<ChatLieu> getData(int page);

    Boolean save(ChatLieu th);

    void delete(UUID id);
}
