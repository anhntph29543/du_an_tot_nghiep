package com.example.datn.service.impl;

import com.example.datn.entity.DonHangOnilne;
import com.example.datn.repository.DonHangOnlineRepo;
import com.example.datn.service.DonHangOnlineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Stream;

@Service
public class DonHangOnlineImpl implements DonHangOnlineService {

    @Autowired
    DonHangOnlineRepo donHangOnlineRepo;

    private String prefix= "HD";

    @Override
    public List<DonHangOnilne> getAll() {
        return donHangOnlineRepo.findAll();
    }

    @Override
    public Page<DonHangOnilne> getData(int page) {
        Pageable pageable= PageRequest.of(page, 5);
        return donHangOnlineRepo.findAll(pageable);
    }

    @Override
    public DonHangOnilne detail(UUID id) {
        return donHangOnlineRepo.findById(id).get();
    }

    @Override
    public Boolean save(DonHangOnilne donHangOnilne) {
//        if (donHangOnilne.getMa()==null){
//            donHangOnilne.setMa(tuTaoMa());
//        }
        if (donHangOnilne.getNgayTao()==null){
            donHangOnilne.setNgayTao(new java.util.Date());
        }
        if (donHangOnilne.getNgayThanhToan()==null){
            donHangOnilne.setNgayThanhToan(new java.util.Date());
        }

        donHangOnlineRepo.save(donHangOnilne);
        return true;
    }

    @Override
    public String tuTaoMa() {
        Stream<String> ma= donHangOnlineRepo.maDHOnline().stream();
        Integer max= ma.map(o -> o.replace(prefix, "")).mapToInt(Integer::parseInt).max().orElse(0);
        return prefix+(String.format("%d", max+1));
    }

    @Override
    public void delete(UUID id) {
        donHangOnlineRepo.deleteById(id);
    }
}
