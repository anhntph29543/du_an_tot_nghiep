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

import java.util.Date;
import java.util.UUID;

@Entity
@Table(name = "Gio_Hang_Chi_Tiet")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class GioHangCTOnline {
    @Id
    @Column(name = "ID_GioHangChiTiet")
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID idGioHangCT;

    @ManyToOne
    @JoinColumn(name = "ID_GioHang" , referencedColumnName = "ID_GioHang")
    private GioHangOnline gioHangOnline;

    @ManyToOne
    @JoinColumn(name = "ID_SanPhamChiTiet" , referencedColumnName = "ID_SanPhamChiTiet")
    private SanPhamCTTuan sanPhamCT;

    @Column(name = "tenSPCT")
    private String tenSPCT;

    @Column(name = "soLuong")
    private Integer soLuong;

    @Column(name = "giaSanPham")
    private Double giaSanPham;

    @Column(name = "ngayThem")
    private Date ngayThem;
}
