package com.example.demo.vo;

import java.io.IOException;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import com.example.demo.service.MemberService;
import com.example.demo.util.Ut;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;

@Component
@Scope(value = "request", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Rq {
	@Getter
	private boolean isLogined; // 로그인 여부를 저장하는 변수
	@Getter
	private int loginedMemberId; // 로그인된 멤버의 ID를 저장하는 변수
	@Getter
	private Member loginedMember; // 로그인된 멤버 객체를 저장하는 변수

	private HttpSession session; // 세션 객체를 저장하는 변수
	private HttpServletRequest req; // 요청 객체를 저장하는 변수
	private HttpServletResponse resp; // 응답 객체를 저장하는 변수

	public Rq(HttpServletRequest req, HttpServletResponse resp, MemberService memberService) {
		this.req = req; // 요청 객체를 초기화
		this.resp = resp; // 응답 객체를 초기화
		this.session = req.getSession(); // 세션 객체를 초기화

		HttpSession httpSession = req.getSession(); // 세션 객체를 가져옴

		if (httpSession.getAttribute("loginedMemberId") != null) {
			// 세션에 "loginedMemberId" 속성이 있는 경우
			isLogined = true; // 로그인 상태로 설정
			loginedMemberId = (int) httpSession.getAttribute("loginedMemberId"); // 로그인된 멤버 ID를 저장
			loginedMember = memberService.getMember(loginedMemberId); // 로그인된 멤버 객체를 저장
		}

		this.req.setAttribute("rq", this); // 요청 객체에 현재 객체를 속성으로 저장
	}

	public void printHistoryBack(String msg) throws IOException {
		// 브라우저에서 뒤로 가기 스크립트를 출력하는 메소드
		resp.setContentType("text/html; charset=UTF-8"); // 응답의 콘텐츠 타입을 설정
		println("<script>"); // 스크립트 시작 태그를 출력
		if (!Ut.isEmpty(msg)) {
			// 메시지가 비어 있지 않으면
			System.err.println("alert('" + msg + "');");
			println("alert('" + msg + "');"); // 경고 창을 출력하는 스크립트를 출력
		}
		println("history.back();"); // 뒤로 가기 스크립트를 출력
		println("</script>"); // 스크립트 종료 태그를 출력
	}

	private void println(String str) {
		// 문자열을 출력하고 줄바꿈
		print(str + "\n");
	}

	private void print(String str) {
		// 문자열을 출력
		try {
			resp.getWriter().append(str); // 응답 객체의 출력 스트림에 문자열을 추가
		} catch (IOException e) {
			e.printStackTrace(); // 예외가 발생하면 스택 트레이스를 출력
		}
	}

	public void logout() {
		// 로그아웃 메소드
		session.removeAttribute("loginedMemberId"); // 세션에서 로그인된 멤버 ID 속성을 제거
		session.removeAttribute("loginedMember"); // 세션에서 로그인된 멤버 객체 속성을 제거
	}

	public void login(Member member) {
		// 로그인 메소드
		session.setAttribute("loginedMemberId", member.getId()); // 세션에 로그인된 멤버 ID를 저장
		session.setAttribute("loginedMember", member); // 세션에 로그인된 멤버 객체를 저장
	}

	public void initBeforeActionInterceptor() {
		// 인터셉터 초기화 메소드 (내용 없음)
	}

	public String historyBackOnView(String msg) {
		// 뷰에서 뒤로 가기 스크립트를 출력하는 메소드
		req.setAttribute("msg", msg); // 요청 객체에 메시지를 속성으로 저장
		req.setAttribute("historyBack", true); // 요청 객체에 뒤로 가기 플래그를 속성으로 저장
		return "usr/common/js"; // 공통 JavaScript 뷰를 반환
	}

	public String getCurrentUri() {
		// 현재 URI를 반환하는 메소드
		String currentUri = req.getRequestURI(); // 현재 요청 URI를 저장
		String queryString = req.getQueryString(); // 현재 요청의 쿼리 문자열을 저장

		System.err.println(currentUri); // 현재 URI를 출력
		System.err.println(queryString); // 쿼리 문자열을 출력

		if (currentUri != null && queryString != null) {
			// URI와 쿼리 문자열이 모두 있는 경우
			currentUri += "?" + queryString; // URI에 쿼리 문자열을 추가
		}

		System.out.println(currentUri); // 최종 URI를 출력

		return currentUri; // 최종 URI를 반환
	}
}
