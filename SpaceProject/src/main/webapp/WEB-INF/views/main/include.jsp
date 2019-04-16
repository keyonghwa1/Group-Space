<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- SDIE nav -->
<ul id="slide-out" class="sidenav sidenav-fixed">
	<li>
		<div class="user-view">
			<div class="background">
				<img src="${ pageContext.request.contextPath }/resources/member/img/login_background.jpg">
			</div>
			<a href="#user"><img class="circle" src="${ pageContext.request.contextPath }/resources/main/img/profile.jpg"></a>
			<a href="#name"><span class="white-text name">${ sessionScope.member_name }</span></a>
			<a href="#email"><span class="white-text email">${ sessionScope.member_email }</span></a>
		</div>
	</li>
	<li><a href="./main.korea"><i class="material-icons">home</i>홈으로 가기</a></li>
	<li><a id="my-space-list-btn" href="#"><i class="material-icons">language</i>내 스페이스</a></li>
	<li><a id="my-member-view-btn" href="#"><i class="material-icons">person</i>내정보 보기</a></li>
	<a href="#" class="logout-link">로그아웃</a>
</ul>
<!-- topBar -->
<nav class="topbar">
	<a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>
	<div class="nav-wrapper">
		<a id="logo" href="./main.korea" class="brand-logo">Space</a>
		<form id="search-form" class="center" action="search.korea" method="GET">
			<div class="input-field">
				<input id="search" type="search" name="keyword" class="chips chips-placeholder" required>
				<label id="search-icon" class="label-icon" for="search">
				<i class="material-icons">search</i>
				</label>
				<i id="close-icon" class="material-icons">close</i>
			</div>
		</form>
		<ul id="nav-mobile" class="right hide-on-med-and-down">
			<li><i id="notice-icon" class="material-icons">notifications</i></li>
		</ul>
	</div>
</nav>
<!-- 로그인 체크 -->
<jsp:include page="../util/login_check.jsp"/>