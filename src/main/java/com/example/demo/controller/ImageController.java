package com.example.demo.controller;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.service.FunctionService;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class ImageController {

	@Autowired
	private Rq rq;
	
    private final FunctionService functionService;

    public ImageController(FunctionService functionService) {
        this.functionService = functionService;
    }

    @PostMapping("/usr/function/painting/saveimage")
    public String saveImage(@RequestParam("image") MultipartFile image,HttpServletRequest req) {
    	
    	Rq rq = (Rq) req.getAttribute("rq");
    	
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