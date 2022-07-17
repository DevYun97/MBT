package com.yun.project.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {

	private static String SAVE_PATH = "/upload/";
	private static String PREFIX_URL = "/upload/";
	
	
	public String uploadFile(MultipartFile multipartFile) {
		
		String url = null;
		String saveFileName = "";
		
		try {
			String savepath = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			System.out.println("savepath1:"+savepath);
			savepath = savepath.replace("\\", "/");
			System.out.println("savepath2:"+savepath);
			savepath = savepath.replace("/bin/main/static", "/src/main/resources/static");
			System.out.println("savepath3:"+savepath);
			SAVE_PATH = savepath;
			PREFIX_URL = savepath;
			
			//파일정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName
				= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = multipartFile.getSize();
			
			// 서버에서 저장 할 파일 이름
			//"20210114121803123.jpg"
			saveFileName = genSaveFileName(extName);
			
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			
			writeFile(multipartFile, saveFileName);
			url = PREFIX_URL + "/" + saveFileName;
		} catch (IOException e) {
			
		}
		
		return "/upload/" + saveFileName;
	}


	private void writeFile(MultipartFile multipartFile, String saveFileName) throws IOException {
		System.out.println("savefile:" + SAVE_PATH + "/" + saveFileName );
		
		//C:/Users/i7D/Documents/springboot/ex13_FileUploadWithParam/src/main/resources/static/upload/20210114121803123.jpg
		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();
		
		return;
		
	}


	private String genSaveFileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}

}
