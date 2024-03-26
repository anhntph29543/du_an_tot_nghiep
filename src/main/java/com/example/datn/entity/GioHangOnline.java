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
@Table(name = "Gio_Hang")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class GioHangOnline {

    @Id
    @Column(name = "ID_GioHang")
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "maGioHang")
    private String ma;

    @ManyToOne
    @JoinColumn(name = "ID_KhachHang" , referencedColumnName = "ID_KhachHang")
    private KhachHangOnline khachHangOnline;
}
