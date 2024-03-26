package com.example.datn.service.impl;

import com.example.datn.entity.DiaChiOnline;
import com.example.datn.repository.DiaChiOnlineRepo;
import com.example.datn.service.DiaChiOnlineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Stream;

@Service
public class DiaChiOnlineImpl implements DiaChiOnlineService {

    @Autowired
    private DiaChiOnlineRepo diaChiOnlineRepo;
    private String prefix= "DC";

    @Override
    public List<DiaChiOnline> getAll() {
        return diaChiOnlineRepo.findAll();
    }

    @Override
    public DiaChiOnline detail(UUID id) {
        return diaChiOnlineRepo.findById(id).get();
    }

    @Override
    public Boolean save(DiaChiOnline diaChiOnline) {
        if (diaChiOnline.getMaDiaChi()==null){
            diaChiOnline.setMaDiaChi(tuTaoMa());
        }

        diaChiOnlineRepo.save(diaChiOnline);
        return true;
    }

    @Override
    public String tuTaoMa() {
        Stream<String> ma= diaChiOnlineRepo.maDC().stream();
        Integer max= ma.map(o -> o.replace(prefix, "")).mapToInt(Integer::parseInt).max().orElse(0);
        return prefix+(String.format("%d", max+1));
    }

    @Override
    public void delete(UUID id) {
       diaChiOnlineRepo.deleteById(id);
    }
}
