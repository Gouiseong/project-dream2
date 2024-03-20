package com.example.demo.controller;
import java.io.IOException;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.service.FunctionService;

@RestController
public class ImageController {

    private final FunctionService functionService;

    public ImageController(FunctionService functionService) {
        this.functionService = functionService;
    }

    @PostMapping("/usr/function/painting/saveimage")
    public String saveImage(@RequestParam("image") MultipartFile image) {
        try {
            byte[] imageData = image.getBytes();
            functionService.saveImage(imageData);
            return "usr/function/painting";
        } catch (IOException e) {
            e.printStackTrace();
            return "Error saving image";
        }
    }
}