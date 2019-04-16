<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>스페이스</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<jsp:include page="../util/include_css.jsp" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/main/css/main.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/main/css/include.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/main/css/footer.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/main/css/modal.css">
<jsp:include page="../util/include_js.jsp" />
<script src="${ pageContext.request.contextPath }/resources/main/js/main.js"></script>
<script src="${ pageContext.request.contextPath }/resources/main/js/include.js"></script>
</head>
<body>
	<!-- 플로팅 버튼 -->
	<a href="./space_create.korea" class="main-floating btn-floating btn-large waves-effect waves-light red"> <i class="material-icons">add</i>
	</a>
	<jsp:include page="include.jsp" />
	<div class="main-container">
		<h5>#${ param.keyword }</h5>
		<!-- 검색된 스페이스 리스트 -->
		<div class="interest-box center">
			<c:choose>
				<c:when test="${empty spaceList }">
					<div class="null-space-box">
						<div class="null-space-box-center">
							<i class="material-icons null-space-icon blue-text darken-2 center-align">highlight_off</i>
							<h3 class="center-align">"#${ param.keyword }"태그에 맞는 스페이스를 찾지 못했습니다.</h3>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="spaceDTO" items="${ spaceList }"  varStatus="status_i">
						<c:set var="spaceDTO" value="${ spaceDTO }" scope="request" />
						<c:set var="hashtagList" value="${ spaceDTO.hashtagList }" scope="request" />
						<c:set var="managerDTO" value="${ spaceDTO.managerDTO }" scope="request" />
						<c:set var="status" value="${ status_i.count }" scope="request" />
						<jsp:include page="space_modal.jsp" />
						<jsp:include page="space_card.jsp" />
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>