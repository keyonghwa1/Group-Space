<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>스페이스</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <jsp:include page="../util/include_css.jsp"/>
    <!--Import member.css-->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/member/css/member.css">
	<jsp:include page="../util/include_js.jsp"/>
    <!-- Import member_login.js -->
    <script src="${ pageContext.request.contextPath }/resources/member/js/member_join.js"></script>
  </head>
  <body>
 	 <!-- 로그아웃 체크 -->
    <jsp:include page="../util/logout_check.jsp"/>
    <!-- Login Card -->
    <div id="join-card" class="z-depth-2 hoverable">
      <!--Top Text-->
      <div>
        <h4>Space</h4>
        <h6>계정 만들기</h6>
      <div>
      <div>
        <form id="join-form">
          <div class="join-field input-field row">
            <input id="id" type="text" class="validate col s10" name="id"/>
            <label for="id">아이디</label>
            <a id="id-check-btn" class="waves-effect waves-light btn col s2">중복체크</a>
          </div>
          <div class="join-field input-field">
            <input id="pwd" type="password" class="validate" name="pwd"/>
            <label for="pwd">비밀번호</label>
          </div>
          <div class="join-field input-field">
            <input id="pwd_check" type="password" class="validate" name="pwd_check"/>
            <label for="pwd_check">비밀번호 확인</label>
          </div>
          <div class="join-field input-field">
            <input id="name" type="text" class="validate" name="name"/>
            <label for="name">이름 입력</label>
          </div>
          <div class="join-field input-field">
            <input id="email" type="email" class="validate" name="email"/>
            <label for="email">이메일 입력</label>
          </div>
          <div class="join-field input-field">
            <input id="context" type="text" class="validate" name="context"/>
            <label for="context">자기소개 입력</label>
          </div>
          <div id="interest" class="join-field chips chips-placeholder"></div>
          <div>
            <a id="back-btn" class="waves-effect waves-light btn" href="./member_login.html">뒤로가기</a>
            <a id="join-btn" class="waves-effect waves-light btn">회원가입</a>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
