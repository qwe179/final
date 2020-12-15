<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	HttpSession sessionn = request.getSession();
%>
<%
	String id = sessionn.getAttribute("id").toString();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<hr>
	<h1>채팅방입니다</h1>

	<!-- Server responses get written here -->
	<div id="messages">
	
		<c:forEach items="${list}" var="item">
<%-- 				발신자 : ${item.sender} , --%>
				${item.message}
<%-- 				수신자 : ${item.reciever} --%>
				<br>
		</c:forEach>
	</div>
	<!-- websocket javascript -->



	<div>
		<br />
		<br />
		<br /> 메세지 입력 : <input type="text" id="sender"
			value="${sessionScope.id}" style="display: none;"> <input
			type="text" id="messageinput" onchange="send();">
		<button type="button" onclick="send();">메세지 전송</button>
		<button type="button" onclick="javascript:clearText();">대화내용
			지우기</button>
<!-- 		<button type="button" onclick="closeSocket();">대회방 나가기</button> -->
	</div>







	<script type="text/javascript">
    var ws;
    var messages = document.getElementById("messages");
	
	
	
	window.onload = function(){

	    if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
	        writeResponse("WebSocket is already opened.");
	        return;
	    }
	    
	    var btn=getParameterByName("id");
	    console.log(btn)

	    //웹소켓 객체 만드는 코드
	    //WebSocketChat이랑 연결
	    //---------------------------------이부분 아이피 고쳐써야함!!!--------------------------------
	    ws = new WebSocket("ws://119.197.63.167:8088/echo.do/"+"<%=id%>"+ "/" + btn);

			//대화방열기
			ws.onopen = function(event) {
				if (event.data === undefined) {
					return;
				}
				writeResponse(event.data);
			};

			ws.onmessage = function(event) {
				console.log('writeResponse');
				console.log(event.data)
				writeResponse(event.data);
			};

			ws.onclose = function(event) {

				writeResponse("대화 종료");
			}

		}

		function getParameterByName(name) {
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
					.exec(location.search);
			return results === null ? "" : decodeURIComponent(results[1]
					.replace(/\+/g, " "));
		}

		function endmessage() {
			var text = "접속이 끊어졌습니다" + ","
					+ document.getElementById("sender").value;
			ws.send(text);
		}

		function send() {
			// var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
			var text = document.getElementById("messageinput").value + ","
					+ document.getElementById("sender").value;
			ws.send(text);
			text = "";
			document.getElementById("messageinput").value = ""

			var parentDiv = document.getElementById('#messages');

			var nodes = document.querySelectorAll('h3');
			var first = nodes[0];
			var last = nodes[nodes.length - 1];
			console.log(last)
			var location = last.offsetTop;
			window.scrollTo({
				top : location,
				behavior : 'smooth'
			});

		}

		function closeSocket() {
			endmessage();
// 			setTimeout("ws.close()", 3000); 수정

			//             ws.close();
		}

		function writeResponse(text) {
			messages.innerHTML += "<br/>" + text;
		}

		function clearText() {
			console.log(messages.parentNode);
			messages.parentNode.removeChild(messages)
		}
	</script>
</body>
</html>