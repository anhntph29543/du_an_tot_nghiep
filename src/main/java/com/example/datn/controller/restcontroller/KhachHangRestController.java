package com.example.datn.controller.restcontroller;

import com.example.datn.entity.KhachHang;

import com.example.datn.repository.KhachHangRepository;
import com.example.datn.service.KhachHangService;

import java.io.ByteArrayInputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import jakarta.servlet.annotation.MultipartConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@MultipartConfig
@RestController
@RequestMapping("/KhachHang/api")
public class KhachHangRestController {

    @Autowired
    private KhachHangService service;
    @Autowired
    private KhachHangRepository repository;

    @GetMapping()
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(service.getAll());
    }

    @GetMapping("/phantrang")
    public ResponseEntity<?> getData(@RequestParam(value = "page", defaultValue = "0") int page) {
        return ResponseEntity.ok(service.getData(page).getContent());
    }

    // Update the method signature to accept MultipartFile for file upload
    @PostMapping("/add")
    public ResponseEntity<?> add(@RequestPart("anh") MultipartFile anh,
                                 @RequestPart("ten") String ten,
                                 @RequestPart("email") String email,
                                 @RequestPart("sdt") String sdt,
                                 @RequestPart("ngaySinh") String ngaySinh,
                                 @RequestPart("gioiTinh") Boolean gioiTinh) {
        // Convert ngaySinh from String to Date
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date parsedNgaySinh = null;
        try {
            parsedNgaySinh = dateFormat.parse(ngaySinh);
        } catch (ParseException e) {
            e.printStackTrace();
            // Handle parsing exception
        }

        // Create a KhachHang object with the provided data
        KhachHang kh = KhachHang.builder()
                .id(UUID.randomUUID())  // Generate a unique ID
                .ten(ten)
                .gioiTinh(gioiTinh)
                .ngaySinh(parsedNgaySinh)
                .sdt(sdt)
                .email(email)
                .anh("path/to/default/image")  // You may want to save the image path in the database
                .ngayThem(new Date())
                .trangThai(true)  // Assuming the default status is active
                .build();

        // Save the KhachHang object to the database (you need to implement this method in your service)
        KhachHang savedKhachHang = repository.save(kh);

        // Handle file upload (save the image to a directory or storage system)
        // Here, we save the image with the KhachHang ID as the filename, assuming the ID is a string
        String fileName = savedKhachHang.getId().toString();
        String uploadDir = "path/to/your/image/directory";
        try {
            Path path = Paths.get(uploadDir, fileName);
            Files.copy(anh.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
            savedKhachHang.setAnh(fileName);  // Update the KhachHang object with the image path
            service.save(savedKhachHang);  // Save the updated KhachHang object with the image path
        } catch (IOException e) {
            e.printStackTrace();
            // Handle file upload exception
        }

        return ResponseEntity.ok(savedKhachHang);
    }


    @PutMapping("/update/{id}")
    public ResponseEntity<?> update(@PathVariable("id") UUID id, @RequestBody KhachHang kh) {
        KhachHang khc = service.detail(id);
        khc.setMa(kh.getMa());
        khc.setTen(kh.getTen());
        khc.setTrangThai(kh.getTrangThai());
        return ResponseEntity.ok(service.save(khc));
    }

    @GetMapping("/detail/{id}")
    public ResponseEntity<?> detail(@PathVariable("id") UUID id) {
        return ResponseEntity.ok(service.detail(id));
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> delete(@PathVariable("id") UUID id) {
        service.delete(id);
        return ResponseEntity.ok().build();
    }
}
