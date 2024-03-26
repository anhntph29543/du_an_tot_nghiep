package com.example.datn.controller.restcontroller;

import com.example.datn.entity.KhachHang;
import com.example.datn.entity.NhanVien;
import com.example.datn.repository.NhanVienRepository;
import com.example.datn.service.NhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping("/NhanVien/api")
public class NhanVienRestController {
    @Autowired
    private NhanVienRepository repository;
    @Autowired
    private NhanVienService service;

    @GetMapping()
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(service.getAll());
    }

    @GetMapping("/phantrang")
    public ResponseEntity<?> getData(@RequestParam(value = "page", defaultValue = "0") int page) {
        return ResponseEntity.ok(service.getData(page).getContent());
    }

    @GetMapping("/detail/{id}")
    public ResponseEntity<?> detail(@PathVariable("id") UUID id) {
        try {
            // Tìm kiếm khách hàng theo ID
            Optional<NhanVien> khachHangOptional = repository.findById(id);
            if (khachHangOptional.isPresent()) {
                // Lấy thông tin khách hàng
                NhanVien khachHang = khachHangOptional.get();

                // Tạo một đối tượng Map chứa thông tin chi tiết của khách hàng
                Map<String, Object> response = new HashMap<>();
                response.put("id", khachHang.getId());
                response.put("ma", khachHang.getMa());
                response.put("ten", khachHang.getTen());
                response.put("email", khachHang.getEmail());
                response.put("sdt", khachHang.getSdt());
                response.put("gioiTinh", khachHang.getGioiTinh());
                response.put("anh", UPLOAD_DIR + "/" + khachHang.getAnh());
                response.put("trangThai", khachHang.getTrangThai());

                // Trả về đối tượng ResponseEntity chứa thông tin chi tiết của khách hàng
                return ResponseEntity.ok(response);
            } else {
                // Nếu không tìm thấy khách hàng với ID tương ứng, trả về HTTP status code 404
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Trả về HTTP status code 500 nếu có lỗi xảy ra trong quá trình xử lý
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    private static final String UPLOAD_DIR = "/anhduan";

    // REST endpoint để thêm khách hàng
    @PostMapping("/add")
    public ResponseEntity<NhanVien> addKhachHang(@RequestParam("anh") MultipartFile anhFile,
                                                  @RequestParam("ten") String ten,
                                                  @RequestParam("email") String email,
                                                  @RequestParam("sdt") String sdt,
                                                  @RequestParam("gioiTinh") Boolean gioiTinh) {
        try {
            // Lưu trữ hình ảnh vào thư mục upload
            String fileName = System.currentTimeMillis() + "_" + anhFile.getOriginalFilename();
            Path filePath = Paths.get(UPLOAD_DIR, fileName);
            Files.write(filePath, anhFile.getBytes());

            // Tạo một đối tượng KhachHang mới với thông tin từ yêu cầu
            NhanVien khachHang = new NhanVien();
            khachHang.setAnh(fileName);
            khachHang.setTen(ten);
            khachHang.setEmail(email);
            khachHang.setSdt(sdt);
            khachHang.setGioiTinh(gioiTinh);
            khachHang.setMa(service.tuTaoMa());
            khachHang.setTrangThai(true);
            khachHang.setNgayThem(new Date());
            // Lưu đối tượng KhachHang vào cơ sở dữ liệu
            NhanVien savedKhachHang = repository.save(khachHang);

            // Trả về ResponseEntity với đối tượng KhachHang đã được lưu
            return ResponseEntity.ok(savedKhachHang);
        } catch (IOException e) {
            e.printStackTrace();
            // Trả về ResponseEntity với lỗi nếu có vấn đề xảy ra trong quá trình lưu trữ hình ảnh
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
    @PutMapping("/update/{id}")
    public ResponseEntity<NhanVien> updateKhachHang(@PathVariable("id") UUID id, @RequestBody NhanVien khachHang) {
        try {
            // Retrieve existing customer from the database
            Optional<NhanVien> existingKhachHangOptional = repository.findById(id);
            if (existingKhachHangOptional.isPresent()) {
                NhanVien existingKhachHang = existingKhachHangOptional.get();
                // Update customer information
                existingKhachHang.setTen(khachHang.getTen());
                existingKhachHang.setEmail(khachHang.getEmail());
                existingKhachHang.setSdt(khachHang.getSdt());
                existingKhachHang.setTrangThai(khachHang.getTrangThai());
                // Save the updated customer
                NhanVien updatedKhachHang = repository.save(existingKhachHang);
                // Return ResponseEntity with the updated customer
                return ResponseEntity.ok(updatedKhachHang);
            } else {
                // Return ResponseEntity with status code 404 if customer not found
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Return ResponseEntity with status code 500 for any errors
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }


    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> delete(@PathVariable("id") UUID id) {
        service.delete(id);
        return ResponseEntity.ok().build();
    }
}
