package com.example.demo.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.service.BoardService;
import com.example.demo.service.FunctionService;
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

	@Autowired
	private FunctionService functionService;
	
	public UsrFunctionController() {

	}

	// 액션 메서드

	@RequestMapping("/usr/function/painting")
	public String doPaint(HttpServletRequest req,Model model) {

		Rq rq = (Rq) req.getAttribute("rq");
		model.addAttribute("isLogined", (rq != null && rq.isLogined()));
		return "usr/function/painting";
	}

	@RequestMapping("/usr/function/savepainting")
	public Object saveImage(HttpServletRequest req,@RequestBody String imageDataURL, Principal principal) {
		Rq rq = (Rq) req.getAttribute("rq");
		
		 // 양쪽 끝 따옴표 제거
        if (imageDataURL.startsWith("\"") && imageDataURL.endsWith("\"")) {
            imageDataURL = imageDataURL.substring(1, imageDataURL.length() - 1);
        }
        
		 try {
			 int memberId = rq.getLoginedMemberId();
	            functionService.saveImage(memberId, imageDataURL); // 이미지를 데이터베이스에 저장
	            return ResponseEntity.ok("이미지가 성공적으로 업로드되었습니다.");
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("이미지 업로드 중 오류가 발생했습니다.");
	        }
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