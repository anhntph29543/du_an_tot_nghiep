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
@Table(name = "Tai_Khoan")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class Login {

    @Id
    @Column(name = "ID_TaiKhoan")
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "[user]")
    private String user;

    @Column(name = "password")
    private String password ;


}
