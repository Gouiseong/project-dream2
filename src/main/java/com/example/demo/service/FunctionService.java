package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.FunctionRepository;
import com.example.demo.repository.MemberRepository;

@Service
public class FunctionService {

	@Autowired
	private FunctionRepository functionRepository;
	
	public FunctionService(FunctionRepository functionRepository) {
		this.functionRepository = functionRepository;
	}
	public void saveImage(byte[] imageData) {
		functionRepository.saveImage(imageData);
		
	}
	public String getImageUrl() {
		
		return functionRepository.getImageUrl();
	}
	
}
