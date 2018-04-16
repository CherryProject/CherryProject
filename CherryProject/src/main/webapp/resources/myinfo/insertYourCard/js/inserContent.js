/**
 * 
 */

// 이미지 정보들을 담을 배열
var sel_files = [];
var firstImg = true;
var index = 0;
var num = 0;			// <input ~~> 들의 id 구분 변수
var totalLen = 0;		// 전체 이미지들의 갯수
var inputTypeNum = 0;	// inputType의 갯수


/*
 *	@comment	:	 
 */
$(document).ready(function() {
	
	$("#input_imgs").on("change", handleImgFileSelect);
});


/*
 *	@comment	:	 파일 업로드 버튼과 복수의 <input type="file" /> 태그의 연결 메소드
 */
function fileUploadAction() {
	
	var	inputTag = "<input type='file' class='fileUploadBtn' id='input_imgs" + num + "' multiple />";

	$("#input_imgs").append(inputTag);		// input Tag 생성
	$("#input_imgs" + num).trigger("click");	// input Tag 실행
	
	num++;
}


/*
 *	@comment	:	업로드한 이미지들의 미리보기 화면 생성 메소드
 */ 
function handleImgFileSelect(e) {
	
	// 이미지 정보들을 초기화
	sel_files = [];
	
	// <div class="imgs_wrap"> 의 영역을 비워준다.
	if(firstImg == true){
		 
		$(".imgs_wrap").empty();
		firstImg = false;
	};
	
	var files = e.target.files; 						// 업로드한 이미지 파일을 담을 변수
	var filesArr = Array.prototype.slice.call(files); 	// 업로드한 이미지 파일들을 담을 리스트
	
	filesArr[index];
	
	var inputLen = 0;		// input으로 업로드한 이미지의 갯수.
	
	filesArr.forEach(function(f) {
		
		
		if(!f.type.match("image.*")) {
			
			alert("이미지 파일만 가능합니다.");
			return;
		};
		
		$("#comment").hide();		// <P>NO IMAGES , PLEASE CLICK YOUR IMAGES</P> 감추기
		
		sel_files.push(f);
		var reader = new FileReader();
		reader.onload = function(e) {
			
			var src = e.target.result;
			
			// 업로드한 이미지의 미리보기 영역 생성
			var makeImgPreview = "<div class='imgPreview'>";
					makeImgPreview += "<a href='javascript:void(0)' onclick='moveToDiv(\"" + src + "\"," + (num-1) + "," + inputLen + "," + index + ")' id='img_id_" + index + "'>";
						makeImgPreview += "<img style='width : 200px;' src='" + e.target.result + "' data-file='" + f.name + "' class='selProductFile' id='ocrImg_" + index + "'>";
					makeImgPreview += "</a>";
				makeImgPreview += "</div>";
			
			$(".imgs_wrap").append(makeImgPreview);
			index++;
			inputLen++;
		};
	
		// 이미지 파일을 보여주기
		reader.readAsDataURL(f);
		
		// 
		if(inputLen <= $("#input_imgs"+(num-1))[0].files.length) {
			
			inputLen = 0;
		}
	});
	
}


/*
 *	@comment			:	업로드한 이미지들의 미리보기 화면 생성 메소드
 *	@param	src			:	업로드한 이미지의 바이너리 경로(경로자체가 이미지 파일)
 *			inputTagNum	:	동적 생성된 <input type="file" />의 수
 *			inputNum	:	동적 생성된 <input type="file" />에서 업로드한 이미지 파일의 수
 *			index		:	사용자가 업로드한 전체 이미지의 수
 */ 
function moveToDiv(src, inputTagNum, inputNum, index){
			 
	//  업로드한 이미지 파일을 나타내는 경로를 <div class='selectedImg img' src=''> 에 추가한다.
	$(".selectedImg img").attr("src", src);
	
	// 이미지 미리보기를 선택할 경우 이미지에 테두리를 나타나게 한다.
	$("#ocrImg_" + index).css('border', 'solid 10px red');
	$("#ocrImg_" + index).trigger("create");
	
	var form = $('#tempUpload')[0];
	var formData = new FormData(form);
	
	var filename = $("#input_imgs"+inputTagNum)[0].files[inputNum].name;  	// 실제 리스트에 올라간 name
	var fileLen = $("#input_imgs"+inputTagNum)[0].files.length;				// 실제 리스트의 파일갯수

	var dataFileName = $("#ocrImg_"+index).attr("data-file");				// 화면 이미지의 파일명.
	
	// 화면과 실제 리스트의 파일명을 맞춰주기 위한 반복문
	for(var i=0; i<fileLen; i++) {
		
		if(dataFileName === $("#input_imgs"+inputTagNum)[0].files[i].name) {
			
			formData.append("fileObj", $("#input_imgs"+inputTagNum)[0].files[i]);
		}
	} 

	// 이미지 미리보기를 하는 순간 OCR 분석을 위해 이미지를 서버로 전송.
	$.ajax({
	 
		url : "tempUpload"
		, processData: false
		, contentType: false
		, type : "post"
		, data : formData
		, success : function(ocrImage) {
			 
			// 이미지 전송이 성공함과 동시에 OCR분석
			$.ajax({
			
				url : "detectTextFromImage"
				, type : "GET"
				, data : {
				
					"ocrImage" : ocrImage
				}
				, success : function (detectResult) {	// detectResult : OCR 분석 결과 String.
					
					$("#cardInfo").html('');
					console.log(detectResult);
					$("#comment").show();		// 나중에 삭제
					$("#cardBtn").show();
					
					
					var str = detectResult;
					$("#comment").html(str);	// 나중에 삭제
					
					//OCR 분석 자료
					resultInput(detectResult);
					
					// Ajax 후 CSS 적용을 위한 이벤트 발생
					$("#cardInfo").trigger("create");
					
				}
				, error : function (e) {
			
					alert("실패: "+e);
				}
			});
		}
		, error : function(e) {
			console.log(e);
		}
	});

}


 /*
  *	@comment	:	OCR분석 결과를 텍스트에 집어넣기
  */
	 function resultInput(detectResult) {
		 
		// 엔터키 기준으로 OCR 분석 결과 자르기
		var detectResultArr = detectResult.split('\n');
		var detectResultArrLen = detectResultArr.length;
		inputTypeNum = detectResultArrLen;
		
		// 회원ID를 hidden으로 추가
		$("#cardInfo").append("<input type='hidden' name='userid' />");
		$("#cardInfo").append("<input type='file' name='fileUpload' />");
		var htmlCode = '';
		var keyName = '';
		
		// 정규표현식들
		//var regExp = /\s/g;					//모든 공백 체크 정규식
		//var numberRegExp = /^[0-9]+$/;		//숫자만 체크 정규식
		
		var urlRegExp = /^(((http(s?))\:\/\/)?)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?$/;	//도메인 형태, http:// https:// 포함안해도 되고 해도 되고	
		var eMailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var phoneRegExp =  /^\d{3}-\d{3,4}-\d{4}$/;
		var telRegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
		
		for(var i=0; i<detectResultArrLen; i++) {
			
			console.log(detectResultArr[i]);
			
			if(detectResultArr[i].length == 0 || detectResultArr[i] == null) {
				
				continue;
			}
			
			keyName += "<select class='selectMenu' id='selectMenu_" + i + "'>";
				keyName += "<option>선택</option>";
				keyName += "<option value='name1'>이름(국문)</option>";
				keyName += "<option value='name2'>이름(영문)</option>";
				keyName += "<option value='name3'>이름</option>";
				keyName += "<option value='company'>회사</option>";
				keyName += "<option value='job'>직급</option>";
				keyName += "<option value='department'>부서</option>";
				keyName += "<option value='address'>주소</option>";
				keyName += "<option value='tel'>전화번호</option>";
				keyName += "<option value='phone'>휴대폰번호</option>";
				keyName += "<option value='email'>E-Mail</option>";
				keyName += "<option value='fax'>Fax</option>";
				keyName += "<option value='memo'>Memo</option>";
				keyName += "<option value='otherinfo'>Etc</option>";
			keyName += "</select>";
			
			htmlCode += "<div class='input-group'>";
				htmlCode += "<span class='input-group-addon'>" + keyName + "</span>";
				htmlCode += "<textarea class='form-control' name='' id='cardInfo_" + i + "' >" + detectResultArr[i] +  "</textarea>";
			htmlCode += "</div>";
			
			$("#cardInfo").append(htmlCode);
			// htmlCode 초기화
			htmlCode='';
			keyName='';
				
			}
	 }
 
// Select Menu 추가하기
/*
 function selectMenuAdd1() {
	 
	var keyName1 = "<select class='selectMenu'>";
			keyName1 += "<option>정보승</option>";
			keyName1 += "<option value='name1'>이름(국문)</option>";
			keyName1 += "<option value='name2'>이름(영문)</option>";
			keyName1 += "<option value='name3'>이름</option>";
			keyName1 += "<option value='company'>회사</option>";
			keyName1 += "<option value='job'>직급</option>";
			keyName1 += "<option value='department'>부서</option>";
			keyName1 += "<option value='address'>주소</option>";
			keyName1 += "<option value='tel'>전화번호</option>";
			keyName1 += "<option value='phone'>휴대폰번호</option>";
			keyName1 += "<option value='email'>E-Mail</option>";
			keyName1 += "<option value='fax'>Fax</option>";
			keyName1 += "<option value='memo'>Memo</option>";
			keyName1 += "<option value='otherinfo'>Etc</option>";
		keyName1 += "</select>";
	 
	 var selectMenu_ = "<div class='input-group'>";
			 selectMenu_ += "<span class='input-group-addon'>" + keyName1 + "</span>";
			 selectMenu_ += "<textarea class='form-control' name='' id=''></textarea>";
	 	 selectMenu_ += "</div>";
	 
	 $("#cardInfo").append(selectMenu_);
 }		 
*/

// Submit 
function cardInfoSubmit() {
	
	//$("#cardInfo").trigger("create");
	console.log("값값값 : " + $("#selectMenu_0").val());
	for(var i=0; i<inputTypeNum; i++) {
		
		$("#cardInfo_"+i).attr("name", $("#selectMenu_"+i).val());
		console.log($("#selectMenu_"+i).val());
	}
	
	$("#cardInfoForm").submit();
}
		