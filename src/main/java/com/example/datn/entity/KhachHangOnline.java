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
@Table(name = "Khach_Hang")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class KhachHangOnline {

    @Id
    @Column(name = "ID_KhachHang")
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "maKhachHang")
    private String ma;

    @Column(name = "hoTen")
    private String ten;

    @Column(name = "gioiTinh")
    private Boolean gioiTinh;

//    @Column(name = "ngaySinh")
//    private Date ngaySinh;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "email")
    private String email;

    @Column(name = "anh")
    private String anh;

    @Column(name = "ngayThem")
    private Date ngayThem;

    @Column(name = "trangThai")
    private Boolean trangThai;

    @ManyToOne
    @JoinColumn(name = "ID_TaiKhoan" , referencedColumnName = "ID_TaiKhoan")
    private Login login;
}
