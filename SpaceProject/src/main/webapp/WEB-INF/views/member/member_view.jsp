<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="context-box z-depth-1 row">
	<h5>내정보 보기</h5>
	<form action="#">
		<div class="col s12">
			<table class="highlight">
				<tr>
					<td style="width: 200px;">이름</td>
					<td>${ memberdto.member_name }</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>${ memberdto.member_id }</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${ memberdto.member_email }</td>
				</tr>
				<tr>
					<td>자기소개</td>
					<td>${ memberdto.member_context }</td>
				</tr>
				<tr>
					<td>관심사</td>
					<td>
						<c:forEach var="dto" items="${ list }">
							<div class="chip">${dto.interest_context}</div>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>회원 정보 수정</td>
					<td><a id="member-update-btn" class="modal-trigger waves-effect waves-light btn" href="#member_update_modal">회원 정보 수정</a></td>
				</tr>
				<tr>
					<td>회원 탈퇴</td>
					<td><a id="space_delete_btn" class="waves-effect waves-light btn red">회원 탈퇴</a></td>
				</tr>
			</table>
		</div>
	</form>
</div>