package com.example.datn.service.impl;

import com.example.datn.entity.AnhTuan;
import com.example.datn.repository.AnhTuanRepo;
import com.example.datn.service.AnhTuanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class AnhTuanServiceImpl implements AnhTuanService {

    @Autowired
    AnhTuanRepo anhTuanRepo;


    @Override
    public List<AnhTuan> getAll() {
        List<AnhTuan> getAllAnh=anhTuanRepo.findAll();
        List<AnhTuan> getAnhHienThi=new ArrayList<>();
        List<AnhTuan> getAnhHienThiMS=new ArrayList<>();
        for (int i=0; i<getAllAnh.size();i++) {
                int check=0;
                for(AnhTuan anh:getAnhHienThi){
                    if(getAllAnh.get(i).getSanPhanCTTuan().getId().equals(anh.getSanPhanCTTuan().getId())){
                        check++;
                    }
                }
                if(check==0){
                    getAnhHienThi.add(getAllAnh.get(i));
                }
        }
        for (int i=0;i<getAnhHienThi.size();i++){
            int check=0;
            for (AnhTuan anh:getAnhHienThiMS){
                if(getAnhHienThi.get(i).getSanPhanCTTuan().getSanPham().getId().equals(anh.getSanPhanCTTuan().getSanPham().getId()) &&
                getAnhHienThi.get(i).getSanPhanCTTuan().getMauSac().getId().equals(anh.getSanPhanCTTuan().getMauSac().getId())){
                    check++;
                }
            }
            if(check==0){
                getAnhHienThiMS.add(getAnhHienThi.get(i));
            }
        }

        return getAnhHienThiMS;
    }

    @Override
    public List<AnhTuan> getAllAnhSP() {
        List<AnhTuan> getAllAnh=anhTuanRepo.findAll();
        List<AnhTuan> getAnhHienThi=new ArrayList<>();
        List<AnhTuan> getAnhSanPham=new ArrayList<>();
        for (int i=0; i<getAllAnh.size();i++) {
            int check=0;
            for(AnhTuan anh:getAnhHienThi){
                if(getAllAnh.get(i).getSanPhanCTTuan().getId().equals(anh.getSanPhanCTTuan().getId())){
                    check++;
                }
            }
            if(check==0){
                getAnhHienThi.add(getAllAnh.get(i));
            }
        }
        for(int i=0;i<getAnhHienThi.size();i++){
            int check=0;
            for (AnhTuan anhTuan:getAnhSanPham) {
                if(getAnhHienThi.get(i).getSanPhanCTTuan().getSanPham().getId().equals(anhTuan.getSanPhanCTTuan().getSanPham().getId())){
                    check++;
                }
            }
            if(check==0){
                getAnhSanPham.add(getAnhHienThi.get(i));
            }
        }

        return getAnhSanPham;
    }


    @Override
    public Page<AnhTuan> getData(int page) {
        return null;
    }

    @Override
    public AnhTuan detail(UUID id) {

        return anhTuanRepo.findById(id).get();
    }

    @Override
    public Boolean save(AnhTuan th) {
        return null;
    }

    @Override
    public void delete(UUID id) {

    }
}
