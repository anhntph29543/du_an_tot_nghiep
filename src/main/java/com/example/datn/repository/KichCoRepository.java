package com.example.datn.repository;

import com.example.datn.entity.KichCo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface KichCoRepository extends JpaRepository<KichCo, UUID> {
}
