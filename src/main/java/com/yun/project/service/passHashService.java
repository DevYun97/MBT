package com.yun.project.service;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Component;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Component
@AllArgsConstructor
@Getter
@Builder
@ToString
public class passHashService {

	public String passwordHash (String id ,String pw) {
		
		// 패스워드 지정
		String plainText = id+pw;	// 평문
		String sha256 = "" ;
				
		try {
			/* MessageDigest 클래스의 getInstance() 메소드의 매개변수에 "SHA-256" 알고리즘 이름을 지정함으로써 
			해당 알고리즘에서 해시값을 계산하는 MessageDigest를 구할 수 있다 */
			MessageDigest mdSHA256 = MessageDigest.getInstance("SHA-256");
					
			// 데이터(패스워드 평문)를 한다. 즉 '암호화'와 유사한 개념
			mdSHA256.update(plainText.getBytes("UTF-8"));
					
			// 바이트 배열로 해쉬를 반환한다.
			byte[] sha256Hash = mdSHA256.digest();
					
			// StringBuffer 객체는 계속해서 append를 해도 객체는 오직 하나만 생성된다. => 메모리 낭비 개선
			StringBuffer hexSHA256hash = new StringBuffer();
					
			// 256비트로 생성 => 32Byte => 1Byte(8bit) => 16진수 2자리로 변환 => 16진수 한 자리는 4bit
			for(byte b : sha256Hash) {
				String hexString = String.format("%02x", b);
				hexSHA256hash.append(hexString);
			}
			sha256 = hexSHA256hash.toString();
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return sha256;
	}
}
