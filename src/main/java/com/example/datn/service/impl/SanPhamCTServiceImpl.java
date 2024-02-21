package com.example.datn.service.impl;

import com.example.datn.entity.SanPhamCT;
import com.example.datn.repository.SanPhamChiTietRepository;
import com.example.datn.service.SanPhamCTService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Stream;

@Service
public class SanPhamCTServiceImpl implements SanPhamCTService {

    @Autowired
    private SanPhamChiTietRepository repository;
    private String prefix= "SPCT";

    @Override
    public List<SanPhamCT> getSPCT(UUID idSP) {
        return repository.getSP(idSP);
    }

    @Override
    public String tuTaoMa() {
        Stream<String> ma= repository.maSP().stream();
        Integer max= ma.map(o -> o.replace(prefix, "")).mapToInt(Integer::parseInt).max().orElse(0);
        return prefix+(String.format("%d", max+1));
    }

    @Override
    public List<SanPhamCT> search(String ten, UUID idTH) {
        return null;
    }

    @Override
    public Page<SanPhamCT> getData(int page) {
        return null;
    }

    @Override
    public SanPhamCT detail(UUID id) {
        return repository.findById(id).get();
    }

    @Override
    public Boolean save(SanPhamCT spct) {
        if (spct.getMa()==null){
            spct.setMa(tuTaoMa());
        }
//        if (spct.getNgayThem()==null){
//            spct.setNgayThem(new java.util.Date());
//        }
        repository.save(spct);
        return true;
    }

    @Override
    public void delete(UUID id) {

    }
}
