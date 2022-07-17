//팝업창 숨기기&보이기 기능
function popupHideAndShow(target) {
  const targetWindow = document.getElementById(String(target)); // id가 String(문자열) 'target' 호출
    // Element.classList : 엘리먼트의 클래스 속성의 컬렉션인 활성 DOMTokenList를 반환하는 읽기 전용 프로퍼티.
    // classList 사용은 공백으로 구분된 문자열인 element.className 을 통해 엘리먼트의 클래스 목록에 접근하는 방식을 대체하는 간편한 방법.
    // Element.classList 자체는 읽기 전용 프로퍼티지만 add() remove() 메서드를 이용하여 변형 가능
  if(targetWindow.classList.contains("d-none")){ // .contains : 지정한 클래스 값이 엘리먼트의 class속성에 존재하는지 확인    
      targetWindow.classList.add("d-block"); //지정한 클래스 값을 추가
      targetWindow.classList.remove("d-none"); //지정한 클래스 값 제거
  }else if(targetWindow.classList.contains("d-block")){
      targetWindow.classList.add("d-none");
      targetWindow.classList.remove("d-block");
  }
};

//ajax을 이용한 id 중복체크 여부기능 
function idCheck() {
	const user_id = $('#user_id').val();
	if(!user_id){
		alert("아이디 중복체크 후 회원가입이 가능합니다");
		return false;
		}
	
	// 아이디 유효성 검사(1보다 같거나 크면 중복 / 0 이면 중복안됨)
	$.ajax(
			{
				url: 'http://localhost:8085/user/idCheckAjax?user_id='+ user_id,	
	    		type: 'get',
	    		success: function(data) {
	    			console.log('통신 성공, data:' + data);
	    			
	    			let data_num = Number( data );
	    			if( data_num >= 1 ) {
	    				//아이디가 중복됨.
	    				alert("중복된 아이디입니다.");
	    				$('#al1').css('display','block');
	        			$('#al2').css('display','none');	    				
						$('#isIDChecked').val('no');

						$('#user_id').focus();
	    			}else{
	    				//아이디가 중복 안됨. 사용 가능.
	    				alert("사용가능한 아이디입니다.");
	    				$('#al1').css('display','none');
	        			$('#al2').css('display','block');
						$('#isIDChecked').val('ok');
	    			}    			
	    		},
	    		error: function(){
	    			console.log('통신 실패');
	    		}	
			}    		
	);
}

//회원가입약관 팝업창과 체크박스 연결
function joinCheck(joinCheckBox){
   let joinCkBox = document.getElementById(joinCheckBox);
   joinCkBox.checked = true;
   popupHideAndShow(target);
}

// null값 체크 ( 체크박스 포함 )
function nullChecker(){
	const target = document.getElementsByClassName('nullcheck');
 	for(i=0; i<target.length; i++){
    	if(target[i].value == ''){
        	alert(target[i].placeholder);
        	target[i].focus();
        	return false;
    	}else if(target[i].type == 'checkbox' && target[i].checked == false){
      	alert('체크사항을 확인 해 주세요');
      	return false;
    	}
  	}
  	return true;
};

// kakao 주소 api
function sample6_execDaumPostcode() {
	new daum.Postcode({
    	oncomplete: function(data) {
        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            let addr = ''; // 주소 변수
            let extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
};

// 회원가입페이지 모든 체크사항 체크
function joinCheckAll(){
    	
	const isIDChecked = $('#isIDChecked').val();			
	const userNull = nullChecker();
		
	if( isIDChecked == 'no'){
		alert("아이디 중복확인 후 회원가입이 가능합니다.");
		return false;
	}	
	if( userNull == false) {
		return false;
	}		
	const address1 = $('#sample6_address').val();
	const address2 = $('#sample6_detailAddress').val();
	$('#user_address').val( address1 + " " + address2 ); 
		
	document.forms[0].submit();
	return true;
 }
 
// user 페이지 ==
//userInfo  
function userInfoUpdate(){
    		
	if( $('#userUpdate').val() =="no" ){ //정보 수정하기로 변경
    			
    	$('.disabledChk').removeAttr("disabled");
        /* 주소 */
        $('#address1').css('display','none');
        $('#address2').css('display','block');
        /* 버튼 */
        $('#userInfoBtn1').css('display','none');
        $('#userInfoBtn2').css('display','block');
        /*  */
    	$('#userUpdate').val("ok");

    } else { // 수정하기 취소상태로 변경     		   			
    	$('.disabledChk').attr("disabled");
        /* 주소 */
        $('#address1').css('display','block');
        $('#address2').css('display','none');
        /* 버튼 */
        $('#userInfoBtn1').css('display','block');
        $('#userInfoBtn2').css('display','none');
        /*  */
    	$('#userUpdate').val("no");
    }
}

// 주소 합치기
function addressAdd(){
    const address1 = $('#sample6_address').val();
	const address2 = $('#sample6_detailAddress').val();
	$('#user_address').val( address1 + " " + address2 );
	return true;
}
        
// 비밀번호 수정 스크립트
$("#pwChangeFrm").keyup(function(){ 

	const pw1 = $('#pw1').val();
    const pw2 = $('#pw2').val();
      
    if( !pw1 || !pw2){      //null 체크
        $('#pwCkOk').css('display','none');   
        $('#pwCkNo').css('display','none');
	}
    else if( pw1 != pw2 ) { //비밀번호 수정이 일치하지 않을 경우
    	$('#pwCkNo').css('display','block');
        $('#pwCkOk').css('display','none');   		
    }
    else if(pw1 == pw2){  //비밀번호 수정이 일치
        $('#pwCkNo').css('display','none');
        $('#pwCkOk').css('display','block');
    }
});


// 마이페이지 _ 회원탈퇴
function userQuit(){
    var message = "회원탈퇴를 진행하시겠습니까?";
    result = window.confirm(message);
    if(result == true ){
    	location.href = '../user/quitAction?user_idx=${user_idx}&&useYN=N';
    } else {
    }
}

// customer 폴더 
//공지사항 작성
function noticeWriteBtn(){
    $("#noticeFrm").attr("action", "noticeWriteAction").attr("method","post").submit(); 		
}

// 공지사항 수정
function noticeUpdateBtn(){
    $("#noticeFrm").attr("action", "noticeModifyAction").attr("method","post").submit(); 		
}

// board 폴더
// 게시판 작성
function boardWriteBtn(){
    $("#boardFrm").attr("action", "boardWriteAction").attr("method","post").submit();
    //$("#boardFile").attr("action", "boardFileAction").attr("method","post").submit(); 		
 		
}

// 게시판 수정
function boardUpdateBtn(){
    $("#boardFrm").attr("action", "boardUpdateAction").attr("method","post").submit(); 		
}

// admin 폴더
// 관리자_ 회원의 영구 탈퇴 이벤트
function realQuit(){
    var message = "회원정보를 영구 삭제하시겠습니까? 삭제된 정보는 복구가 불가능합니다.";  	
    result = window.confirm(message);
    if(result == true ){
    	location.href = '../admin/realQuit?user_idx=${mem.user_idx}';
    } else {
    }
}

// 관리자_ 회원 계정 복구
function restoreUser(){
    	 
    var message = "회원정보를 복구 하시겠습니까?";
    result = window.confirm(message);
    if(result == true ){
    	location.href = '../admin/memUseUpdate?user_idx=${mem.user_idx}&&useYN=Y';
    } else {
	}
} 

// 회원 리스트 select 검색
$( function() {
  	$("#useType").change(function(){
  		$.ajax({		
  			url:"memAjax",  // action
  			type:"get",  	 // method 
  			data : $("#memFrm").serialize( ),  // controller 로 보내고 싶은 값  json 이라는 방식과 serialize( ) 방식
  			success: function(date){								
  				$("#memList").html(date);  // 호출받아서 실행되는 부분. 			
  			},		
  			error:function(){
  				alert("error");
  			}
  		})
	})
})

// QnA 리스트 select 검색
$( function() {
  	$("#qnaType").change(function(){
  		$.ajax({		
  			url:"qnaAjax",  // action
  			type:"get",  	 // method 
  			data : $("#qnaFrm").serialize( ),  // controller 로 보내고 싶은 값  json 이라는 방식과 serialize( ) 방식
  			success: function(date){								
  				$("#qnaList").html(date);  // 호출받아서 실행되는 부분. 			
  			},		
  			error:function(){
  				alert("error");
  			}
  		})
	})
})