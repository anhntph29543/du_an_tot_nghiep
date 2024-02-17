package com.example.datn.service;

import com.example.datn.entity.ChatLieu;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface ChatLieuService {
    List<ChatLieu> getAll();

    Page<ChatLieu> getData(int page);

    ChatLieu detail(UUID id);

    Boolean save(ChatLieu th);

    String tuTaoMa();

    void delete(UUID id);
}
