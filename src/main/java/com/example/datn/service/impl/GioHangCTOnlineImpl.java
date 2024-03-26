package com.example.datn.service.impl;

import com.example.datn.entity.GioHangCTOnline;
import com.example.datn.repository.GioHangCTOnlineRepo;
import com.example.datn.service.GioHangCTOnlineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class GioHangCTOnlineImpl implements GioHangCTOnlineService {

    @Autowired
    private GioHangCTOnlineRepo gioHangCTOnlineRepo;

    @Override
    public List<GioHangCTOnline> getAll() {
        return gioHangCTOnlineRepo.findAll();
    }

    @Override
    public GioHangCTOnline detail(UUID id) {
        return gioHangCTOnlineRepo.findById(id).get();
    }

    @Override
    public Boolean save(GioHangCTOnline gioHangCT) {
        gioHangCTOnlineRepo.save(gioHangCT);
        return true;
    }

    @Override
    public String tuTaoMa() {
        return null;
    }

    @Override
    public void delete(UUID id) {
        gioHangCTOnlineRepo.deleteById(id);
    }
}
