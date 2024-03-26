package com.example.datn.entity;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class CreateDirectoryExample {
    public static void main(String[] args) {
        // Đường dẫn tới thư mục muốn tạo
        String directoryPath = "/anhduan";

        // Tạo một đối tượng Path từ đường dẫn
        Path path = Paths.get(directoryPath);

        try {
            // Kiểm tra xem thư mục đã tồn tại chưa
            if (!Files.exists(path)) {
                // Nếu thư mục chưa tồn tại, tạo mới
                Files.createDirectories(path);
                System.out.println("Thư mục đã được tạo: " + path);
            } else {
                System.out.println("Thư mục đã tồn tại: " + path);
            }
        } catch (Exception e) {
            // Xử lý nếu có lỗi xảy ra trong quá trình tạo thư mục
            e.printStackTrace();
        }
    }
}
