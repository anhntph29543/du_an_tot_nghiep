package com.example.datn.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;


@Entity
@Table(name = "Don_Hang_Chi_Tiet")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class DonHangCT {

    @Id
    @Column(name = "ID_DonHangChiTiet")
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "ID_DonHang" , referencedColumnName = "ID_DonHang")
    private DonHang donHang;

    @ManyToOne
    @JoinColumn(name = "ID_SPCT" , referencedColumnName = "ID_SanPhamChiTiet")
    private SanPhamCTTuan sanPhanCT;

    @Column(name = "tenSPCT")
    private String tenSPCT;

    @Column(name = "soLuong")
    private Integer soLuong;

    @Column(name = "giaSanPham")
    private Double giaSanPham;

    @Column(name = "trangThai")
    private Boolean trangThai;


}
