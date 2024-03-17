package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.service.BoardService;
import com.example.demo.service.ReactionPointService;
import com.example.demo.service.ReplyService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Board;
import com.example.demo.vo.Reply;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrFunctionController {

	public UsrFunctionController() {

	}

	// 액션 메서드

	@RequestMapping("/usr/function/painting")
	public String doPaint() {

		return "usr/function/painting";
	}

	@RequestMapping("/usr/function/savepainting")
	public Object saveImage() {
		
		System.out.println("하이");
		System.out.println(123123);
		return "usr/function/painting";
	}
	
	
	@RequestMapping("/usr/function/psychological_test")
	public String doPsycho_Test() {

		return "usr/function/psychological_test";
	}
	

	@RequestMapping("/usr/function/calendar")
	public String showCalendar() {
		return "usr/function/calendar";
	}
	
}