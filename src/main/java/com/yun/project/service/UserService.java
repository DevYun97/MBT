package com.yun.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yun.project.dao.IuserDAO;
import com.yun.project.dto.User;


@Service
public class UserService {
	@Autowired
	IuserDAO userDao;
	@Autowired
	passHashService passHash;
	
	public String login( String user_id, String user_pw, HttpSession session ) {
		
		String result = "<script>alert('로그인 실패!'); history.back(-1);</script>";		
		
		String userID = userDao.getUserID(user_id);
		if(userID == null) {	//아이디가 존재하지 않을 경우
			return result;
		}
		
		String userPw = userDao.getUserPW(user_id);
		user_pw = passHash.passwordHash(user_id, user_pw);
		if(user_pw.equals(userPw)) {
			
			int user_idx = userDao.getUserIDX(user_id);	
			String user_rank = userDao.getUserRank(user_id);
			session.setAttribute("user_rank", user_rank);
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_idx", user_idx);
			result = "<script>alert('로그인 성공!'); location.href='../main';</script>";
		}		
		return result;	// 입력한 아이디와 비밀번호가 일치하지 않을 경우
	}
	
	//아이디 찾기
	public String idFind( String user_name, String user_email) {
		
		String user_id = userDao.getUserIdFind(user_name, user_email);
		if( user_id == null ) {
			return "<script>alert('아이디를 찾을 수 없습니다.'); location.href='login';</script>";			
		} else {
			return "<script>alert('고객님의 아이디는" + user_id + " 입니다.'); location.href='login';</script>";
		}	
	}
	
	//비밀번호 찾기 
	public String pwFind( String user_name, String user_id) {
		
		String user_pw = userDao.getUserPwFind(user_name, user_id);
		if( user_pw == null ) {
			return "<script>alert('비밀번호를 찾을 수 없습니다.'); location.href='login';</script>";			
		} else {
			return "<script>alert('고객님의 비밀번호는" + user_pw + " 입니다.'); location.href='login';</script>";
		}	
	}
	
	//Id 중복확인 Ajax
	public int idCheckAjax(String user_id) {
		String user_ID = userDao.getUserID(user_id);
		if(user_ID == null) {
			return 0;
		} else {
			return 1;
		}
	}
	
	//비밀번호 변경 확인 Ajax
	public int pwChkAjax(String user_id, String user_pw, HttpSession session) {
		
		
		String userPw = userDao.getUserPW(user_id);
		
		user_pw = passHash.passwordHash(user_id, user_pw);
		
		if(user_pw.equals(userPw)) { //	비밀번호 확인		
			return 0;
		} else { // 비밀번호 재확인 필요
			return 1;
		}
	}
	
	//회원가입
	public String join(User user) {
		
		//암호화 도전 - 성공 시 서비스로 코드 이동하는 정리까지 하기!
		// DTO에 저장된 정보 일부 가져오기
		String id = user.getUser_id();
		String pw = user.getUser_pw();
		
		// hashService에서 암호화 걸어서 반환.
		String user_pw = passHash.passwordHash(id ,pw);
		
		// 요리조리 쪼물딱해서 암호화시킨 값을 다시 userDTO에 넣어서 처리할 수 있도록 함.
		user.setUser_pw(user_pw); 
						
		int result = userDao.insertUser(user);		
		if( result == 1 ) {		
			return "<script>alert('회원가입되었습니다.'); location.href='login';</script>";
		}
		else {
			return "<script>alert('회원가입 실패'); history.back(-1);</script>";
		}
	}
	
	//회원정보 수정
	public String userUpdate(User user) {
		int result = userDao.updateUserInfo(user);
		if(result==1) {
			return "<script>alert('회원정보가 변경되었습니다.');location.href='mypage';</script>";
		}else {
			return "<script>alert('error: 확인후 다시 시도해주세요.');history.back(-1);</script>";
		}	
	}
	
	//비밀번호 수정
	public int userPwUpdate(int user_idx, String user_pw, HttpSession session) {
		
		String id = (String) session.getAttribute("user_id");
		user_pw = passHash.passwordHash(id ,user_pw);
		int result = userDao.updatePwInfo(user_idx, user_pw);
		if(result == 1) {
			return 1;
		} else {
			return 0;
		}		
	}
	
	// 회원탈퇴에 대한 Update
	public String quit(int user_idx, String useYN, String user_quit_reason) {
		int result = userDao.updateUseYN(user_idx, useYN, user_quit_reason);
		if(result == 1) {			
			if( useYN.equals("Y") ) { // 관리자의 회원정보 복구 성공일 경우
				return "<script>alert('회원정보 복구에 성공하였습니다.'); location.href='../admin/member';</script>";
			} else { // 일반 회원의 회원탈퇴 성공일 경우
				return "<script>alert('회원탈퇴에 성공하였습니다.'); location.href='../main';</script>";
			}			
		}
		else {
			return "<script>alert('회원탈퇴에 실패하였습니다.'); history.back(-1);</script>";
		}
		
	}
	
	//회원정보 영구 삭제
	public String realQuit(int user_idx) {
		int result = userDao.quit(user_idx);
		if(result == 1) {
				return "<script>alert('회원탈퇴에 성공하였습니다.'); location.href='../admin/member';</script>";
		}
		else {
			return "<script>alert('회원탈퇴에 실패하였습니다.'); history.back(-1);</script>";
		}
		
	}

}
