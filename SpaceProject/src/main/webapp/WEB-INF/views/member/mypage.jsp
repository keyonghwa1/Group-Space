<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>스페이스</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<jsp:include page="../util/include_css.jsp" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/member/css/mypage.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/main/css/include.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/main/css/footer.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/member/css/member_update_modal.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/member/css/message_view_modal.css">
<jsp:include page="../util/include_js.jsp" />
<script src="${ pageContext.request.contextPath }/resources/main/js/include.js"></script>
<script src="${ pageContext.request.contextPath }/resources/member/js/mypage.js"></script>
</head>
<body>
	<jsp:include page="../main/include.jsp" />
	<jsp:include page="member_update_modal.jsp" />
	<jsp:include page="../message/message_view_modal.jsp" />
	<div class="mypage-container">
		<ul id="tabs-swipe-demo" class="mypage_tab tabs center z-depth-1">
			<li class="tab col s3"><a class="active" href="#test-swipe-1">내정보 보기</a></li>
			<li class="tab col s3"><a href="#test-swipe-2">내 스페이스 관리</a></li>
			<li class="tab col s3"><a href="#test-swipe-3">쪽지 목록</a></li>
			<li class="tab col s3"><a href="#test-swipe-4">스페이스 가입 신청</a></li>
		</ul>
		<!-- 내정보 -->
		<div id="test-swipe-1" class="mypage-tab-context white">
			<jsp:include page="./member_view.jsp" />
		</div>
		<!-- 내 스페이스 관리 -->
		<div id="test-swipe-2" class="mypage-tab-context row center white">
			<jsp:include page="./member_space_management.jsp" />
		</div>
		<!-- 쪽지 목록 -->
		<div id="test-swipe-3" class="mypage-tab-context white">
			<jsp:include page="../message/message_list.jsp" />
		</div>
		<!-- 스페이스 가입 신청 -->
		<div id="test-swipe-4" class="mypage-tab-context row center white">
			<jsp:include page="./space_approval_list.jsp" />
		</div>
	</div>
	<!--<jsp:include page="../main/footer.jsp" />-->
</body>
</html>