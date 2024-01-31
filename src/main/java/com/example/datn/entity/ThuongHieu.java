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

import java.util.Date;
import java.util.UUID;

@Entity
@Table(name = "Thuong_Hieu")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class ThuongHieu {

    @Id
    @Column(name = "ID_ThuongHieu")
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "maThuongHieu")
    private String ma;

    @Column(name = "tenThuongHieu")
    private String ten;

    @Column(name = "ngayThem")
    private Date ngayThem;

    @Column(name = "trangThai")
    private Boolean trangThai;

}
