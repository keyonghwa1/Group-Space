<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>스페이스</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<jsp:include page="../util/include_css.jsp" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/space/css/space.css?ver=1">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/main/css/include.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/main/css/footer.css">
<jsp:include page="../util/include_js.jsp" />
<script src="${ pageContext.request.contextPath }/resources/main/js/include.js"></script>
<script src="${ pageContext.request.contextPath }/resources/space/js/space.js"></script>
</head>
<body>
	<jsp:include page="board/space_board_write_modal.jsp" />
	<jsp:include page="../main/include.jsp" />
	<div class="space-container">
		<ul id="tabs-swipe-demo" class="space_tab tabs center z-depth-1">
			<li class="tab col s3"><a class="active" href="#test-swipe-1">스페이스 홈</a></li>
			<li class="tab col s3"><a href="#test-swipe-2">게시판</a></li>
			<li class="tab col s3"><a href="#test-swipe-3">회원 목록</a></li>
			<li class="tab col s3"><a href="#test-swipe-4">내가 쓴 글</a></li>
			<c:choose>
				<c:when test="${ sessionScope.member_no eq spaceDTO.member_no }">
					<li class="tab col s3"><a href="#test-swipe-5">설정</a></li>
				</c:when>
				<c:otherwise>
					<li class="tab col s3 disabled"><a href="#test-swipe-5">설정</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		<!-- 스페이스 홈 -->
		<div id="test-swipe-1" class="space-tab-context white">
			<jsp:include page="./space_home.jsp" />
		</div>
		<!-- 스페이스 게시판 -->
		<div id="test-swipe-2" class="space-tab-context row center white">
			<jsp:include page="./board/space_board_list.jsp" />
		</div>
		<!-- 스페이스 회원 목록 -->
		<div id="test-swipe-3" class="space-tab-context white">
			<jsp:include page="./member/space_member_list.jsp"/>
		</div>
		<!-- 스페이스 내가 쓴 글 -->
		<div id="test-swipe-4" class="space-tab-context row center white">
			<jsp:include page="./member/space_myboard_list.jsp"/> 
		</div>
		<!-- 스페이스 설정 -->
		<div id="test-swipe-5" class="space-tab-context white">
			<jsp:include page="./manager/space_setting.jsp"/>
		</div>
	</div>
	<!--<jsp:include page="../main/footer.jsp" />-->
</body>
</html>