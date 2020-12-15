<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		$(location).attr("href", "/board/write");
	})
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
	
	white-space:nowrap;	
	text-overflow: ellipsis;
	overflow: hidden;
}
</style>

<div class="container">

<h1 class="pull-left">게시판 리스트</h1>
<div class="clearfix"></div>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%">글번호</th>
		<th style="width: 45%">제목</th>
		<th style="width: 20%">작성자</th>
		<th style="width: 10%">조회수</th>
		<th style="width: 15%">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="b">
	<tr>
		<td>${b.boardNo }</td>
		<td><a href="/board/view?boardNo=${b.boardNo }">${b.title }</a></td>
		<td>${b.writerNick }</td>
		<td>${b.hit }</td>
		<td><fmt:formatDate value="${b.writeDate }" pattern="yy-MM-dd HH:mm:ss" /></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-left">total : ${paging.totalCount }</span>

<button id="btnWrite" class="btn btn-primary pull-right">글쓰기</button>

<div class="clearfix"></div>

<jsp:include page="/WEB-INF/views/util/paging.jsp" />

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />











