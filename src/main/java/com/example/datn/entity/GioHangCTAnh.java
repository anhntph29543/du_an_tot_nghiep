package com.example.datn.entity;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.util.UUID;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class GioHangCTAnh {


    private UUID idGioHangCT;

    private UUID idGIoHang;

    private UUID idSPCT;

    private String tenSPCT;

    private String anh;

    private String mauSac;

    private String kichCo;

    private String thuongHieu;

    private String chatLieu;

    private Integer soLuong;

    private Double giaSanPham;

    private Double tongTien;



}
