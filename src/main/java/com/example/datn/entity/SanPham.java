package com.example.datn.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.util.UUID;

@Entity
@Table(name = "San_Pham")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class SanPham {

    @Id
    @Column(name = "ID_SanPham")
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "maSanPham")
    private String ma;

    @Column(name = "tenSanPham")
    @NotBlank(message = "Không được trống")
    private String ten;

    @Column(name = "ngayThem")
    private Date ngayThem;

    @Column(name = "trangThai")
    private Boolean trangThai;

    @ManyToOne
    @JoinColumn(name = "ID_ThuongHieu" , referencedColumnName = "ID_ThuongHieu")
    private ThuongHieu th;

}
