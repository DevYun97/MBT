package com.yun.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yun.project.dao.IuserDAO;
import com.yun.project.dto.User;
import com.yun.project.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	IuserDAO userDao;

	@RequestMapping("login")
	public String login(HttpSession session, HttpServletRequest request, HttpServletResponse response) {		
		int user_idx;
		try {
			user_idx = (int) session.getAttribute("user_idx");
		} catch (NullPointerException e) {
			user_idx = 0;
		}		
		if( user_idx != 0 ) {	
			return "redirect:../user/mypage";
		}	
		return "user/login";	
	}
	
	@RequestMapping("join")
	public String join(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		try {
			// .valueOf() : 어떤객체 =(괄호 안의 객체)를 String으로 형변환시키는 역할
			int	user_idx = Integer.parseInt(String.valueOf(session.getAttribute("user_idx")));
			String errorMessage = "이미 가입된 회원은 회원가입을 이용하실 수 없습니다.";
			log.info("이미 가입된 회원의 회원가입 시도 차단."); //정보성 로그 
			request.setAttribute("errorMessage", errorMessage); 
			 // .setAttribute(String name, Object value) :이름이 name인 속성의 값을 value로 지정
			 // .getAttribute(String name) : 이름이 name인 속성의 값을 구함 지정한 이름의 속성이 존재하지 않을 경우 null을 리턴
			 // .removeAttribute(String name) : 이름이 name인 속성을 삭제 
			
			request.getRequestDispatcher("/user/login").forward(request, response);
			// .getRequestDispatcher() : 클라이언트로부터 최초에 들어온 요청을 JSP/Servlet 내에서 원하는 자원으로 요청을 넘기는(보내는) 역할을 수행하거나, 특정 자원에 처리를 요청하고 처리 결과를 얻어오는 기능을 수행하는 클래스
			 					   //   .forward() : 페이지 출력, 페이지 전환		
			// request.sendRedirect() : 특정 url로 재 요청
		} catch (Exception e) {
			return "user/join";
		}	
		return "user/join";
	}
	
	@RequestMapping("mypage")
	public String mypage() {
		return "user/mypage";
	}
	
	@RequestMapping("userInfo")
	public String userInfo(@RequestParam("user_idx") int user_idx, Model model) {
		User getMemberInfo = userDao.getMemberInfo(user_idx);
		model.addAttribute("user", getMemberInfo);
		return "user/userInfo";
	}
	
	
	//로그인 기능
	@RequestMapping("loginAction")
	@ResponseBody
	public String loginAction(
			@RequestParam("user_id") String user_id,
			@RequestParam("user_pw") String user_pw,
			HttpSession session) {
		String result = userService.login(user_id, user_pw, session);			
		return result;		
	}
	
	//아이디찾기 기능
	@RequestMapping("idFindAction")
	@ResponseBody
	public String idFindAction(
			@RequestParam("user_name") String user_name,
			@RequestParam("user_email") String user_email) {
		String result = userService.idFind(user_name, user_email);			
		return result;		
	}
	
	//비밀번호찾기 기능
	@RequestMapping("pwFindAction")
	@ResponseBody
	public String pwFindAction(
			@RequestParam("user_name") String user_name,
			@RequestParam("user_id") String user_id) {
		String result = userService.pwFind(user_name, user_id);			
		return result;		
	}
	
	@RequestMapping("idCheckAjax")
	@ResponseBody
	public int idCheckAjax(@RequestParam("user_id") String user_id) {
		int result = userService.idCheckAjax(user_id);			
		return result;		
	}
	
	@RequestMapping("pwChkAjax")
	@ResponseBody
	public int pwChkAjax(
			@RequestParam("user_id") String user_id,
			@RequestParam("user_pw") String user_pw ) {
		int result = userService.pwChkAjax(user_id, user_pw, null);			
		return result;		
	}
	
	//회원가입
	@PostMapping("joinAction")
	@ResponseBody
	public String joinAction(@ModelAttribute User user) {
		System.out.println(user);	
		String result = userService.join(user);
		return result;
	}
	
	//마이페이지 유저정보 변경
	@PostMapping("userInfoAction")
	@ResponseBody
	public String userInfoAction(@ModelAttribute User user) {
		
		String result = userService.userUpdate(user);		
		return result;
		
	}
	//마이페이지 비밀번호 변경
	@RequestMapping("pwChangeAction")
	@ResponseBody
	public String pwChangeAction(
			@RequestParam ("user_idx") int user_idx,
			@RequestParam ("user_pw") String user_pw,
			HttpServletRequest request) {		
		//String result = userService.userPwUpdate(user_idx, user_pw, null);	
		int result = userDao.updatePwInfo(user_idx, user_pw);
		if(result == 1) {
			request.getSession().invalidate();
			return "<script>alert('회원정보가 변경되었습니다.');location.href='login';</script>";
		} else {
			return "<script>alert('error: 확인후 다시 시도해주세요.');history.back(-1);</script>";
		}		
	}
	
	//로그아웃 기능
	@RequestMapping("logoutAction")
	@ResponseBody
	public String loginAction(HttpServletRequest request) {
				
		//세션객체 초기화
		request.getSession().invalidate();
		return "<script>alert('로그아웃 되었습니다.'); location.href='/main';</script>";		
	} 
		
	@RequestMapping("quitAction")
	@ResponseBody
	public String quitAction(@RequestParam("user_idx") int user_idx, HttpSession session, HttpServletRequest request ) {
		
		Integer.parseInt(String.valueOf(session.getAttribute("user_idx")));
		String result = userService.quit(user_idx);
		request.getSession().invalidate();
		return result;
	
	}

}
