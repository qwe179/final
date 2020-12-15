<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- <%@page import="com.devmg.dto.Chat"%> --%>
<%-- <%@page import="java.util.List"%> --%>
<%-- <%	List<Chat> list = (List<Chat>) request.getAttribute("list"); %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% HttpSession sessionn = request.getSession();%>
<% String id= sessionn.getAttribute("id").toString();%>


<html>
<head>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Simple Chat</title>
</head>
<body>



	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
		</tr>

		<c:forEach items="${list }" var="item">
			<tr>
				<%-- 	<td><button onclick="openSocket(this.value);" value="${item.user_id}">${item.user_id}</button>	</td> --%>
				<td><button onclick="openPopup(this.value);"
						value="${item.user_id}">${item.user_id}</button></td>
				<td>${item.user_name}</td>
			</tr>
		</c:forEach>
	</table>

	<!-- Server responses get written here -->
	<div id="messages"></div>
	<!-- websocket javascript -->


	<script type="text/javascript">

        
        function openPopup(clicked_id){
            
			var id=clicked_id;
        	window.open("/chatroom?id="+id, "a", "width=400, height=300, left=100, top=50");
            

            
        }
        
      
        
  </script>
</body>
</html>