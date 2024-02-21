package com.example.datn.service.impl;

import com.example.datn.entity.DonHang;
import com.example.datn.repository.DonHangRepository;
import com.example.datn.service.DonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Stream;

@Service
public class DonHangServiceImpl implements DonHangService {

    @Autowired
    private DonHangRepository donHangRepository;
    private String prefix= "HD";
    @Override
    public List<DonHang> getAll() {
        return donHangRepository.findAll();
    }

    @Override
    public Page<DonHang> getData(int page) {
        Pageable pageable= PageRequest.of(page, 5);
        return donHangRepository.findAll(pageable);
    }

    @Override
    public DonHang detail(UUID id) {
        return donHangRepository.findById(id).get();
    }

    @Override
    public Boolean save(DonHang donHang) {
        if (donHang.getMa()==null){
            donHang.setMa(tuTaoMa());
        }
        if (donHang.getNgayTao()==null){
            donHang.setNgayTao(new java.util.Date());
        }
        if (donHang.getNgayThanhToan()==null){
            donHang.setNgayThanhToan(new java.util.Date());
        }
        donHang.setTongTien(Double.valueOf("0"));
        donHang.setTienKhachPhaiTra(Double.valueOf("0"));
        donHang.setTienKhachDua(Double.valueOf("0"));
        donHang.setTienThua(Double.valueOf("0"));
        donHang.setGiamGia(Double.valueOf("0"));
        donHang.setGiamGia(Double.valueOf("0"));
        donHang.setPhiVanChuyen(Double.valueOf("0"));
        donHang.setLoaiDon("Đơn tại quầy");
        donHang.setHinhThucThanhToan(false);
        donHang.setTrangThaiDonHang(false);
        donHangRepository.save(donHang);
        return true;
    }

    @Override
    public String tuTaoMa() {
        Stream<String> ma= donHangRepository.maDH().stream();
        Integer max= ma.map(o -> o.replace(prefix, "")).mapToInt(Integer::parseInt).max().orElse(0);
        return prefix+(String.format("%d", max+1));
    }

    @Override
    public void delete(UUID id) {
        donHangRepository.deleteById(id);
    }
}
