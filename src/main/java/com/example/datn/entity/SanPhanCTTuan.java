package com.example.datn.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Entity
@Table(name = "San_Pham_Chi_Tiet")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class SanPhanCTTuan {
    @Id
    @Column(name = "ID_SanPhamChiTiet")
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "ID_SanPham" , referencedColumnName = "ID_SanPham")
    private SanPham sanPham;

    @Column(name = "maSPCT")
    private String ma;

    @Column(name = "moTa")
    private String ten;

    @ManyToOne
    @JoinColumn(name = "ID_ChatLieu" , referencedColumnName = "ID_ChatLieu")
    private ChatLieu chatLieu;

    @ManyToOne
    @JoinColumn(name = "ID_MauSac" , referencedColumnName = "ID_MauSac")
    private MauSac mauSac;

    @ManyToOne
    @JoinColumn(name = "ID_KichCo" , referencedColumnName = "ID_KichCo")
    private KichCo kichCo;

    @Column(name = "donGia")
    private Double donGia;

    @Column(name = "soLuong")
    private Integer soLuong;

    @Column(name = "trangThai")
    private Boolean trangThai;





}
