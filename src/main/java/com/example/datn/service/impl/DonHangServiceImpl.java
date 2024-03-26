package com.example.datn.service.impl;

import com.example.datn.entity.DonHang;
import com.example.datn.entity.SanPhamCT;
import com.example.datn.entity.SanPhanCTTuan;
import com.example.datn.repository.DonHangCTRepo;
import com.example.datn.repository.DonHangRepository;
import com.example.datn.service.DonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Stream;

@Service
public class DonHangServiceImpl implements DonHangService {

    @Autowired
    private DonHangRepository donHangRepository;
    @Autowired
    private DonHangCTRepo donHangCTRepo;
    private String prefix= "HD";
    @Override
    public List<DonHang> getAll() {
        return donHangRepository.findAll();
    }

    @Override
    public List<DonHang> getCTT() {
        return donHangRepository.getCTT("chưa thanh toán");
    }

    @Override
    public List<DonHang> getDHTT(String trangThai) {
        if(trangThai.equalsIgnoreCase("all")){
            return getAll();
        }
        return donHangRepository.getDHTT(trangThai);
    }

    @Override
    public List<DonHang> search(String loai,String trangThai) {
        Boolean trangThai1 = true;
        if(trangThai.equalsIgnoreCase("0")){
            trangThai1=false;
        }
        List<DonHang> listSearch = new ArrayList<>();
        if(loai.equalsIgnoreCase("") & trangThai.equalsIgnoreCase("3")){
            listSearch= this.getAll();
        }else if(!loai.equalsIgnoreCase("") & trangThai.equalsIgnoreCase("3")){
            listSearch=donHangRepository.searhByLoai("%"+loai+"%");
        }else if(!loai.equalsIgnoreCase("") & !trangThai.equalsIgnoreCase("3")){
            listSearch=donHangRepository.searhByAll("%"+loai+"%",trangThai1);
        }else{
            listSearch=donHangRepository.searhByTrangThai(trangThai1);
        }
        return listSearch;
    }

    @Override
    public List<SanPhanCTTuan> getSPCT(UUID idDH) {
        return donHangCTRepo.getSPCT(idDH);
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
//        donHang.setTongTien(Double.valueOf("0"));
//        donHang.setTienKhachPhaiTra(Double.valueOf("0"));
//        donHang.setTienKhachDua(Double.valueOf("0"));
//        donHang.setTienThua(Double.valueOf("0"));
//        donHang.setGiamGia(Double.valueOf("0"));
//        donHang.setGiamGia(Double.valueOf("0"));
//        donHang.setPhiVanChuyen(Double.valueOf("0"));
//        donHang.setLoaiDon("Đơn tại quầy");
//        donHang.setHinhThucThanhToan(false);
//        donHang.setTrangThaiDonHang(false);
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
