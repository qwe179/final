<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style type="text/css">
.header {
	text-align: center;
}

.footer {
	text-align: center;
}

/* 이미지 슬라이더 박스(div) */
#sliderbox {
	position: relative; width : 600px;
	height: 400px;
	border: 1px solid #ccc;
	/* 외부정렬: 가운데 */
	margin: 0 auto;
	/* div영역을 벗어난 부분 안보이게 처리하기 */
	overflow: hidden;
	width: 600px;
	/* 	overflow: visible; */
}

/* 이미지 목록 ( ul ) */
#slider {
	/* ul태그의 기본 스타일 없애기 */
	padding: 0;
	margin: 0;
	list-style: none;
	/* 자식요소 absolute박스의 기준점으로 설정 */
	position: relative;
}

/* 이미지 항목 */
#slider li {
	/* 자유롭게 위치를 이동시킬 수 있게 설정 */
	position: absolute;
}

/* 이미지 */
#slider li img {
	/* 모든 이미지를 같은 크기로 고정하기 */
	width: 600px;
	height: 400px;
}

.aa {
	width: 600px;
	height: 400px;
	position: relative;
	margin: 0 auto;
}

.pre {
	position: relative;
	left: -90px;
	top: 200px;
	font-size: 40px;
}

.next {
	position: relative;
	left: 680px;
	bottom: 260px;
	font-size: 40px;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
	$(document).ready(
			
			
			
			function() {
				
		        $('#file').change(function() {
	                addPreview($(this)); //preview form 추가하기
	        });
		        var $slider_list
				
			    function addPreview(input) {
			        if (input[0].files) {
			            //파일 선택이 여러개였을 시의 대응
			            for (var fileIndex = 0 ; fileIndex < input[0].files.length ; fileIndex++) {
			                var file = input[0].files[fileIndex];
			                var reader = new FileReader();
			 
			                reader.onload = function (img) {
			                	
			                	$( "#slide" ).empty();
			                    //div id="preview" 내에 동적코드추가.
			                    //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
			                    $("#slider").append(
			                        "<li><img src=\"" + img.target.result + "\"\/></li>"
			                    );
			                };
			                
			                reader.readAsDataURL(file);
			            }
			        } else alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
			     
			        
			    }
			    

			    
			    
			    
				var sliderClick = function() {

					
					//클릭 이벤트 발생시키기
					$("#sliderbox").click();
				}
				var curSlide = 0;
				var flag=0;
				$("#pre").click(function() {
					
					   var $slider_list = $("#slider li");
					if (flag==0){
						$slider_list.css("left", $("#sliderbox").css("width"))

						$slider_list.eq(0).css("left", 0)
						flag++;
					}
					console.log("flag" + flag)
					
					// 클릭이 될 때마다 타이머 객체를
					//제거하고 다시 등록
					//	-> 클릭을 하면 3초 타이머가 
					//	 처음부터 다시 시작된다
					// 		clearInterval( tid )
					// 		tid = setInterval( sliderClick, 3000 );

					//다음 슬라이드 인덱스
					var nextSlide = curSlide - 1;

					
					//이미지 개수만큼으로 인덱스 보정(nextSlide)
					nextSlide %= $slider_list.length;
					if (curSlide==0){
						return;
// 						nextSlide=$slider_list.length-1;
					}

					//순환구조 확인
					console.log(curSlide + " : " + nextSlide)

					//** .animate() 함수로 효과넣기

					//현재 슬라이드 숨기기 - curSlide
					//	-> <div>태그의 왼쪽으로 보내기
					// 		$slider_list.eq(curSlide).animate({"변경할속성": "속성값 변화량"});
					$slider_list.eq(curSlide).animate({
						"left" : "+=" + $("#sliderbox").css("width")
					});

					//보여줄 다음 슬라이드 준비시키기 - nextSlide
					//	-> <div>태그의 오른쪽으로 보내기
					$slider_list.eq(nextSlide).css("right",
							$("#sliderbox").css("width"))

					//다음 슬라이드 보여주기 - nextSlide
					//	-> <div>안쪽으로 보내기
					$slider_list.eq(nextSlide).animate({
						"left" : "+=" + $("#sliderbox").css("width")
					});

					//순환구조 만들기 (증가식)
					curSlide--;
					
					if (curSlide==-1){
						curSlide=$slider_list.length-1;
					}
// 					console.log("curSlide2 b: " + curSlide)

					//이미지 개수만큼으로 인덱스 보정(curSlide)
// 					if (curSlide <0){
// 					curSlide %= $slider_list.length;
// 					curSlide= -curSlide;
// 					}else
					curSlide %= $slider_list.length;
					console.log("real : "+curSlide + " : " + nextSlide);
					
					
				});

				//3초마다 #sliderbox에 클릭이벤트 발생시키기
				// 	var tid = setInterval( sliderClick, 3000 );

				/* #sliderbox를 클릭할 때마다 이미지 교체 */

				//현재 슬라이드 인덱스
				var curSlide = 0;
				$("#next").click(function() {
					
					   var $slider_list = $("#slider li");
					if (flag==0){
						$slider_list.css("left", $("#sliderbox").css("width"))

						$slider_list.eq(0).css("left", 0)
					}
					flag++

							// 클릭이 될 때마다 타이머 객체를
							//제거하고 다시 등록
							//	-> 클릭을 하면 3초 타이머가 
							//	 처음부터 다시 시작된다
							// 		clearInterval( tid )
							// 		tid = setInterval( sliderClick, 3000 );

							//다음 슬라이드 인덱스
							var nextSlide = curSlide + 1;
							//슬라이드 끝에  도달하면 리턴
							if (curSlide==$slider_list.length-1){
								return;
							}

							//이미지 개수만큼으로 인덱스 보정(nextSlide)
							nextSlide %= $slider_list.length;

							//순환구조 확인
							console.log(curSlide + " : " + nextSlide)

							//** .animate() 함수로 효과넣기

							//현재 슬라이드 숨기기 - curSlide
							//	-> <div>태그의 왼쪽으로 보내기
							// 		$slider_list.eq(curSlide).animate({"변경할속성": "속성값 변화량"});
							$slider_list.eq(curSlide).animate({
								"left" : "-=" + $("#sliderbox").css("width")
							});

							//보여줄 다음 슬라이드 준비시키기 - nextSlide
							//	-> <div>태그의 오른쪽으로 보내기
							$slider_list.eq(nextSlide).css("left",
									$("#sliderbox").css("width"))

							//다음 슬라이드 보여주기 - nextSlide
							//	-> <div>안쪽으로 보내기
							$slider_list.eq(nextSlide).animate({
								"left" : "-=" + $("#sliderbox").css("width")
							});

							//순환구조 만들기 (증가식)
							curSlide++;

							//이미지 개수만큼으로 인덱스 보정(curSlide)
							curSlide %= $slider_list.length;
							console.log("real : "+curSlide + " : " + nextSlide);
						});

			});
</script>


</head>
<body>

	<c:import url="/WEB-INF/views/header.jsp" />
	
	<div>
		<select name="classifier" id="classifier">
			<option value="" disabled selected>분류를 선택하세요</option>
			<option value="1">가전제품</option>
			<option value="2">가전제품</option>
			<option value="3">가전제품</option>
		</select>
	</div>


	<div class="aa">
		<div class="pre"><a href="#" id="pre">&lt;</a></div>
		<div id="sliderbox">
			<ul id="slider">
<!-- 				<li><img src="/resources/img/01.jpg" /></li> -->
<!-- 				<li><img src="/resources/img/02.jpg" /></li> -->
<!-- 				<li><img src="/resources/img/03.jpg" /></li> -->
<!-- 				<li><img src="/resources/img/04.jpg" /></li> -->
<!-- 				<li><img src="/resources/img/05.jpg" /></li> -->
				
			</ul>
		</div>
		<div class="next"><a href="#" id="next">&gt;</a></div>
	</div>
	
	<form action="/trade/resister" method="post" enctype="multipart/form-data">
	<label for = "title"> 제목</label>
	<input type="text" name="title" id="title" /><br>
	<label for = "file">첨부파일</label>
	<input type="file" multiple="multiple" name="file" id="file" /> <br><br>
	
<!-- 해당 위치 안에 이미지가 쌓이게 된다. -->
    <div id="preview">
    </div>
	

	
	<button>전송</button>
</form>

	<div>
	등록페이지 입니다.
	</div>

<c:import url="/WEB-INF/views/footer.jsp" />
