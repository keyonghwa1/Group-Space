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
    <script src="${ pageContext.request.contextPath }/resources/member/js/member_login.js"></script>
  </head>
  <body>
  	<!-- 로그아웃 체크 -->
    <jsp:include page="../util/logout_check.jsp"/>
    <div>
      <h2 class="center-align white-text">스페이스에 오신것을 환영합니다.</h2>
    </div>
    <!-- Login Card -->
    <div id="login-card" class="z-depth-2 hoverable">
      <!--Top Text-->
      <div>
        <h4 class="center-align">Space</h4>
        <h5 class="center-align">로그인</h5>
      <div>
      <div>
        <form>
          <div class="login-field input-field">
            <input id="last_name" type="text" class="validate" name="id"/>
            <label for="last_name">아이디</label>
          </div>
          <div class="login-field input-field">
            <input id="password" type="password" class="validate" name="pwd"/>
            <label for="password">비밀번호</label>
          </div>
          <div>
            <a id="login-password-find" href="#">비밀번호를 잊으셨나요?</a>
            <a id="login-join-link" href="./join_form.korea">계정 만들기</a>
          </div>
          <div>
            <a id="login-btn" class="waves-effect waves-light btn">로그인</a>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
