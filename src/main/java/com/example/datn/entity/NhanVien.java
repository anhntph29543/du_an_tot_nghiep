package com.example.datn.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.Date;
import java.util.UUID;

@Entity
@Table(name = "Nhan_Vien")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class NhanVien {
    @Id
    @Column(name = "ID_NhanVien")
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "maNhanVien")
    private String ma;

    @Column(name = "hoTen")
    private String ten;

    @Column(name = "gioiTinh")
    private Boolean gioiTinh;

    @Column(name = "ngaySinh")
    private Date ngaySinh;

    @Column(name = "cccd")
    private String cccd;

    @Column(name = "email")
    private String email;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "anh")
    private String anh;

    @Column(name = "ngayThem")
    private Date ngayThem;

    @Column(name = "trangThai")
    private Boolean trangThai;
}
