package com.example.datn.service.impl;

import com.example.datn.entity.GioHangOnline;
import com.example.datn.repository.GioHangOnlineRepo;
import com.example.datn.service.GioHangOnlineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Stream;

@Service
public class GioHangOnlineImpl implements GioHangOnlineService {

    @Autowired
    GioHangOnlineRepo gioHangOnlineRepo;
    private String prefix= "GH";

    @Override
    public List<GioHangOnline> getAll() {
        return gioHangOnlineRepo.findAll();
    }

    @Override
    public GioHangOnline detail(UUID id) {
        return gioHangOnlineRepo.findById(id).get();
    }

    @Override
    public Boolean save(GioHangOnline gioHangOnline) {
        if (gioHangOnline.getMa()==null){
            gioHangOnline.setMa(tuTaoMa());
        }
        gioHangOnlineRepo.save(gioHangOnline);
        return true;
    }

    @Override
    public String tuTaoMa() {
        Stream<String> ma= gioHangOnlineRepo.maGH().stream();
        Integer max= ma.map(o -> o.replace(prefix, "")).mapToInt(Integer::parseInt).max().orElse(0);
        return prefix+(String.format("%d", max+1));
    }

    @Override
    public void delete(UUID id) {
        gioHangOnlineRepo.deleteById(id);
    }
}
