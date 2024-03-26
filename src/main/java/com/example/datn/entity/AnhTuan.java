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
@Table(name = "Anh")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class AnhTuan {

    @Id
    @Column(name = "ID_Anh")
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "maAnh")
    private String ma;

    @ManyToOne
    @JoinColumn(name = "ID_SPCT" , referencedColumnName = "ID_SanPhamChiTiet")
    private SanPhamCTTuan sanPhanCTTuan;



}
