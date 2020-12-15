<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- <%@page import="com.devmg.dto.Chat"%> --%>
<%-- <%@page import="java.util.List"%> --%>
<%-- <%	List<Chat> list = (List<Chat>) request.getAttribute("list"); %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
         <% HttpSession sessionn = request.getSession();%>
         <% String id= sessionn.getAttribute("id").toString();%>


<html>
<head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Simple Chat</title>
</head>
<body>

<!-- --------------안쓰는페이지------------- -->

<table>
<tr>
	<th>아이디</th>
	<th>이름</th>
</tr>

<c:forEach items="${list }" var="item">
<tr>
	<td><button onclick="openSocket(this.value);" value="${item.user_id}">${item.user_id}</button>	</td>
	<td>${item.user_name}	</td>
</tr>
</c:forEach>


</table>





<div>
채팅 상대 아이디 입력 : <input type="text" id="chatuser" value="" onchange="openSocket();"><br>
</div>
    <!-- Server responses get written here -->
    <div id="messages">
    </div>
    <!-- websocket javascript -->
    <div>

<!--         <button type="button" onclick="openSocket();" id = "btn1" value="ksj1645">채팅 방</button> -->
<!--         <button type="button" onclick="openSocket();" id ="btn2" value="rlatkdwls57">채팅 방</button> -->
        
        
       
    	<br/><br/><br/>
  		메세지 입력 : 
        <input type="text" id="sender" value="${sessionScope.id}" style="display: none;">
        <input type="text" id="messageinput" onchange="send();">
        <button type="button" onclick="send();">메세지 전송</button>
        <button type="button" onclick="javascript:clearText();">대화내용 지우기</button>
         <button type="button" onclick="closeSocket();">대회방 나가기</button>
    </div>

    <script type="text/javascript">
        var ws;
        var messages = document.getElementById("messages");
        
        function openSocket(clicked_id){
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
                writeResponse("WebSocket is already opened.");
                return;
            }
            
//             var btn=document.getElementById('chatuser').value;
				var btn=clicked_id;
            
//             var btn = document.getElementById('btn').value;

            
            console.log(btn)

            //웹소켓 객체 만드는 코드
            //WebSocketChat이랑 연결
            ws = new WebSocket("ws://localhost:8088/echo.do/"+"<%=id%>"+"/"+btn);
            
            //대화방열기
            ws.onopen = function(event){
                if(event.data === undefined){
              		return;
                }
                writeResponse(event.data);
            };
            
            ws.onmessage = function(event){
                console.log('writeResponse');
                console.log(event.data)
                writeResponse(event.data);
            };
            
            ws.onclose = function(event){
            	
            	
            	
                writeResponse("대화 종료");
            }
            
        }
        
        function endmessage(){
        	var text= "접속이 끊어졌습니다"+","+document.getElementById("sender").value;
        	 ws.send(text);
        }
        
        function send(){
           // var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
            var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value;
            ws.send(text);
            text = "";
            document.getElementById("messageinput").value=""
            
            
//             	var parentDiv = document.getElementById('#messages');

            
//             var nodes = document.querySelectorAll('h3');
//             var first = nodes[0];
//             var last = nodes[nodes.length- 1];
//             console.log(last)
//             	var location = last.offsetTop;
//             	window.scrollTo({top:location, behavior:'smooth'});
          
        }
        
        function closeSocket(){
        	endmessage();
        	setTimeout("ws.close()", 3000);

//             ws.close();
        }
        
        function writeResponse(text){
            messages.innerHTML += "<br/>"+text;
        }

        function clearText(){
            console.log(messages.parentNode);
            messages.parentNode.removeChild(messages)
      	}
        
  </script>
</body>
</html>