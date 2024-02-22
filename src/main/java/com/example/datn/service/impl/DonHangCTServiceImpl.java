package com.example.datn.service.impl;

import com.example.datn.entity.DonHangCT;
import com.example.datn.repository.DonHangCTRepo;
import com.example.datn.repository.DonHangRepository;
import com.example.datn.service.DonHangCTService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class DonHangCTServiceImpl implements DonHangCTService {

    @Autowired
    private DonHangCTRepo donHangCTRepo;


    @Override
    public List<DonHangCT> getAll() {
        return donHangCTRepo.findAll();
    }

    @Override
    public Page<DonHangCT> getData(int page) {
        Pageable pageable= PageRequest.of(page, 5);
        return donHangCTRepo.findAll(pageable);
    }

    @Override
    public DonHangCT detail(UUID id) {
        return donHangCTRepo.findById(id).get();
    }

    @Override
    public Boolean save(DonHangCT donHangCT) {

        List<DonHangCT> list= getAll();
        for (DonHangCT dhct: list){
            if(dhct.getSanPhanCT().getId().equals(donHangCT.getSanPhanCT().getId()) && donHangCT.getDonHang().getId().equals(dhct.getDonHang().getId())){
                dhct.setSoLuong(dhct.getSoLuong()+1);
                ResponseEntity.ok(donHangCTRepo.save(dhct));
                return true;
            }
        }
        donHangCTRepo.save(donHangCT);
        return true;
    }

    @Override
    public String tuTaoMa() {



        return null;
    }

    @Override
    public void delete(UUID id) {
        donHangCTRepo.deleteById(id);
    }
}
