package com.example.datn.repository;

import com.example.datn.entity.AnhTuan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface AnhTuanRepo extends JpaRepository<AnhTuan, UUID> {
}
