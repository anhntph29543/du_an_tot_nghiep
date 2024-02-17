package com.example.datn.repository;

import com.example.datn.entity.KichCo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.UUID;

public interface KichCoRepository extends JpaRepository<KichCo, UUID> {

    @Query("select kc.ma from KichCo kc")
    List<String> maKC();

}
