package com.yun.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yun.project.controller.UserController;
import com.yun.project.dao.IuserDAO;
import com.yun.project.dto.User;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class UserService {
	@Autowired
	IuserDAO userDao;

	public String login( String user_id, String user_pw, HttpSession session ) {
		String result = "<script>alert('로그인 실패!'); history.back(-1);</script>";		
		String userID = userDao.getUserID(user_id);
		if(userID == null) {	//아이디가 존재하지 않을 경우
			return result;
		}
		String userPw = userDao.getUserPW(user_id);
		if(user_pw.equals(userPw)) {
			
			int user_idx = userDao.getUserIDX(user_id);	
			String user_rank = userDao.getUserRank(user_id);
			session.setAttribute("user_rank", user_rank);
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_idx", user_idx);
			result = "<script>alert('로그인 성공!'); location.href='../main';</script>";
			return result;
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
		
		if(user_pw.equals(userPw)) {				
			return 0;
		} else {
			return 1;
		}

		
	}
	
	//회원가입
	public String join(User user) {
		
		int result = userDao.insertUser(user);
		System.out.println(result);
		if( result == 1 ) {		
			return "<script>alert('회원가입되었습니다.'); location.href='login';</script>";
		}
		else {
			return "<script>alert('회원가입 실패'); history.back(-1);</script>";
		}
	}
	
	public String userUpdate(User user) {
		int result = userDao.updateUserInfo(user);
		if(result==1) {
			return "<script>alert('회원정보가 변경되었습니다.');location.href='mypage';</script>";
		}else {
			return "<script>alert('error: 확인후 다시 시도해주세요.');history.back(-1);</script>";
		}	
	}
	
	//비밀번호 수정
	public String userPwUpdate(int user_idx, String user_pw, HttpServletRequest request) {
		int result = userDao.updatePwInfo(user_idx, user_pw);
		if(result == 1) {
			request.getSession().invalidate();
			return "<script>alert('회원정보가 변경되었습니다.');location.href='mypage';</script>";
		} else {
			return "<script>alert('error: 확인후 다시 시도해주세요.');history.back(-1);</script>";
		}		
	}
	
	public String quit(int user_idx, String useYN) {
		int result = userDao.updateUseYN(user_idx, useYN);
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
