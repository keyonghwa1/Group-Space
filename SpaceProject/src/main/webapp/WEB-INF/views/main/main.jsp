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
		<h5>관심사 관련 스페이스</h5>
		<!-- 관심사 관련 스페이스 리스트 -->
		<div class="interest-box">
			<ul class="collapsible">
				<c:forEach var="interestDTO" items="${ interestList }"  varStatus="status_i">
					<li>
						<div class="collapsible-header">
							<span class="hashtag-icon">#</span><span class="hashtag-text">${ interestDTO.interest_context }</span>
						</div>
						<div class="collapsible-body">
							<c:choose>
								<c:when test="${empty interestDTO.spaceList }">
									<div class="null-space-box">
										<div class="null-space-box-center">
											<i class="material-icons null-space-icon blue-text darken-2 center-align">highlight_off</i>
											<h3 class="center-align">"${ interestDTO.interest_context }"에 관한 스페이스를 찾지 못했습니다.</h3>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<c:forEach var="spaceDTO" items="${ interestDTO.spaceList }" varStatus="status_j">
										<c:set var="spaceDTO" value="${ spaceDTO }" scope="request" />
										<c:set var="hashtagList" value="${ spaceDTO.hashtagList }" scope="request"/>
										<c:set var="managerDTO" value="${ spaceDTO.managerDTO }" scope="request"/>
										<c:set var="status" value="${ status_j.count }${ status_i.count }" scope="request"/>
										<jsp:include page="space_modal.jsp" />
										<jsp:include page="space_card.jsp" />
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="interest-box center">
		</div>
		<hr>
		<h5>내 스페이스</h5>
		<!-- 내 스페이스 리스트 -->
		<div class="myspace-box center">
			<%
				for (int i = 0; i < 10; i++) {
			%>
			<!-- card -->
			<div class="card space-card sticky-action hoverable">
				<div class="card-image waves-effect waves-block waves-light space-card-image-box">
					<a class="modal-trigger" href="#modal1"> <img src="${ pageContext.request.contextPath }/resources/main/img/profile.jpg">
				</div>
				<div class="card-content">
					<span class="card-title activator grey-text text-darken-4">스페이스 이름<i class="material-icons right">more_vert</i></span> <a href="#">#스터디</a><a href="#">#스터디</a><a href="#">#스터디</a>
				</div>
				<div class="card-reveal">
					<span class="card-title grey-text text-darken-4">스페이스 이름<i class="material-icons right">close</i></span>
					<p>안녕하세요 해당 스페이스는 ㅁㅁㅁ 스페이스입니다.</p>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>