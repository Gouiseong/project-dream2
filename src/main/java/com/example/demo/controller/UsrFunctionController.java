package com.example.demo.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.FunctionService;

@Controller
public class UsrFunctionController {

	@Autowired
	private FunctionService functionService;

	public UsrFunctionController(FunctionService functionService) {
		this.functionService = functionService;
	}

	// 액션 메서드

	@RequestMapping("/usr/function/painting")
	public String doPaint() {

		return "usr/function/painting";
	}

	@RequestMapping("")
	public String saveQuestion(@RequestParam("result") String analysisResult) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String url = "jdbc:mysql://localhost:3306/DBMS_gus";
		String username = "root";
		String password = "";

		try {
			// 데이터베이스 연결
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, username, password);

			// SQL 쿼리 작성 및 실행
//			String sql = "INSERT INTO psychological_test SET answer = "아따맘마",
//    memberId = 2;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, analysisResult);
			pstmt.executeUpdate();

			System.out.println("분석 결과가 성공적으로 저장되었습니다.");
		} catch (Exception e) {
			System.out.println("오류: " + e.getMessage());
			// 연결 해제
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException ex) {
				System.out.println("오류: " + ex.getMessage());
				// 예외 발생 시 처리할 내용을 작성합니다.
			}
		}
		return "123";
	}
//	@RequestMapping("/usr/function/savepainting")
//	public String showList(HttpServletRequest req, Model model, @RequestParam(defaultValue = "1") int boardId,
//			@RequestParam(defaultValue = "1") int page,
//			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
//			@RequestParam(defaultValue = "") String searchKeyword) {
//
//		Rq rq = (Rq) req.getAttribute("rq");
//
//		Board board = boardService.getBoardById(boardId);
//
//		int articlesCount = articleService.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);
//
//		if (board == null) {
//			return rq.historyBackOnView("없는 게시판이야");
//		}
//
//		// 한페이지에 글 10개씩이야
//		// 글 20개 -> 2 page
//		// 글 24개 -> 3 page
//		int itemsInAPage = 10;
//
//		int pagesCount = (int) Math.ceil(articlesCount / (double) itemsInAPage);
//
//		List<Article> articles = articleService.getForPrintArticles(boardId, itemsInAPage, page, searchKeywordTypeCode,
//				searchKeyword);
//
//		model.addAttribute("board", board);
//		model.addAttribute("boardId", boardId);
//		model.addAttribute("page", page);
//		model.addAttribute("pagesCount", pagesCount);
//		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
//		model.addAttribute("searchKeyword", searchKeyword);
//		model.addAttribute("articlesCount", articlesCount);
//		model.addAttribute("articles", articles);
//
//		return "usr/article/list";
//	}

	@RequestMapping("/usr/function/psychological_test")
	public String doPsycho_Test() {

		return "usr/function/psychological_test";
	}

	@RequestMapping("/usr/function/calendar")
	public String showCalendar() {
		return "usr/function/calendar";
	}

	// 이건 url만 가져오는거 나중에 배열로 만들어서 이미지랑 등록날짜
	// 회원번호까지 가져오게 할수있을듯
	@RequestMapping("/usr/function/testimage")
	public String testimg(Model model) {
		String imageUrl = functionService.getImageUrl();
		model.addAttribute("imageUrl", imageUrl);

		return "usr/function/testimage";
	}

}