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
@Table(name = "Dia_Chi")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class DonHangOnilne {

    @Id
    @Column(name = "ID_DonHang")
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "maDonHang")
    private String ma;

    @ManyToOne
    @JoinColumn(name = "ID_DIaChi" , referencedColumnName = "ID_DIaChi")
    private DiaChiOnline diaChiOnline;

    @ManyToOne
    @JoinColumn(name = "ID_KhachHang" , referencedColumnName = "ID_KhachHang")
    private KhachHangOnline khachHangOnline;

    @ManyToOne
    @JoinColumn(name = "ID_NhanVien" , referencedColumnName = "ID_NhanVien")
    private NhanVien nhanVien;

    @Column(name = "loaiDon")
    private String loaiDon;

    @Column(name = "ngayTao")
    private Date ngayTao;

    @Column(name = "ngayThanhToan")
    private Date ngayThanhToan;

    @Column(name = "tongTien")
    private Double tongTien;

    @Column(name = "giamGia")
    private Double giamGia;

    @Column(name = "phiVanChuyen")
    private Double phiVanChuyen;

    @Column(name = "tienKhachPhaiTra")
    private Double tienKhachPhaiTra;

    @Column(name = "tienKhachDua")
    private Double tienKhachDua;

    @Column(name = "tienThua")
    private Double tienThua;

    @Column(name = "hinhThucThanhToan")
    private Boolean hinhThucThanhToan;

    @Column(name = "trangThaiDonHang")
    private String trangThaiDonHang;
}
