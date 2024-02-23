package com.example.datn.entity;


import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class DonHangCTAnh {

    private UUID id;

    private UUID idSanPham;

    private String ma;

    private String anh;

    private String tenSanPham;

    private String mauSac;

    private String kichCo;

    private String thuongHieu;

    private String chatLieu;

    private Integer soLuong;

    private Double donGia;

    private Double tongTien;

}
