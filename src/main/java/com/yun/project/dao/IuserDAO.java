package com.yun.project.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.yun.project.dto.User;

@Mapper
public interface IuserDAO {

	//로그인
	public String getUserID (String user_id);
	public String getUserPW (String user_id);
	
	public int getUserIDX (String user_id);
	public String getUserRank(String user_id);
	//인덱스정보로 유저 아이디 찾기
	public String idxUserID(int user_idx);
	
	//아이디찾기
	public String getUserIdFind(String user_name, String user_email);
	//비밀번호찾기
	public String getUserPwFind(String user_name, String user_id);
	//회원가입
	public int insertUser(User user);
	//회원탈퇴
	public int deleteUser(int user_idx);
	//회원정보 불러오기
	public User getMemberInfo(int user_idx);
	//회원정보 수정
	public int updateUserInfo(User user);
	//비밀번호 수정
	public int updatePwInfo(int user_idx, String user_pw);
	//유저리스트 - 관리자
	public ArrayList<User> userList(Map<String, Object> map);

}
