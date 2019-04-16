<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Modal Structure -->
<div id="member_update_modal" class="modal modal-fixed-footer left">
	<div class="modal-content">
		<h5>내정보 수정</h5>
		<form action="#">
			<div class="col s12">
				<table class="highlight">
					<tr>
						<td>아이디</td>
						<td><span id="id">${ memberdto.member_id }</span></td>
							<input type="hidden" name="no" value="${ memberdto.member_no }" />
					</tr>
					<tr>
						<td style="width: 200px;">이름</td>
						<td>
							<div class="input-field">
								<input id="name" type="text" class="validate" name="name" value="${ memberdto.member_name }"/> <label for="name">이름</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<div class="input-field">
								<input id="email" type="email" class="validate" name="email" value="${ memberdto.member_email }" /> <label for="email">이메일</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>자기소개</td>
						<td>
							<div class="input-field">
								<input id="context" type="text" class="validate" name="context" value="${ memberdto.member_context }" /> <label for="context">자기소개</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>관심사</td>
						<td>
							<script>
								
							</script>
							<c:forEach var="dto" items="${ list }">
								<input name="interest_value" type="hidden" value="${ dto.interest_context }"/>
							</c:forEach>
							<div id="interest" class="join-field chips chips-placeholder">
							</div>
						</td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td>
							<div class="input-field">
								<input id="pwd_check" type="password" class="validate" name="pwd_check" /> <label for="pwd_check">비밀번호 확인</label>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<a href="#!" class="modal-close waves-effect waves-green btn-flat">취소</a>
		<a id="member_update_btn" class="waves-effect waves-green btn-flat">회원정보 수정</a>
	</div>
</div>