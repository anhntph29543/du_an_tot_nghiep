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
@Table(name = "Dia_Chi")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class DiaChiOnline {

    @Id
    @Column(name = "ID_DiaChi")
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "ID_KhachHang" , referencedColumnName = "ID_KhachHang")
    private KhachHangOnline khachHangOnline;


    @Column(name = "maDiaChi")
    private String maDiaChi;

    @Column(name = "hoTen")
    private String hoTen;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "email")
    private String email;

    @Column(name = "tinhThanhPho")
    private String tinhThanhPho;

    @Column(name = "huyen")
    private String huyen;

    @Column(name = "phuong")
    private String phuong;

    @Column(name = "diaChi")
    private String diaChi;

    @Column(name = "ghiChu")
    private String ghiChu;

    @Column(name = "trangThai")
    private Boolean trangThai;




}
