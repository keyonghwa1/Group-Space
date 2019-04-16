<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="context-box z-depth-1 row">
	<h5>스페이스 정보</h5>
	<form action="#">
		<div class="col s6">
			<!-- 스페이스 이미지 -->
			<div class="thumbnail-wrap">
				<div class="thumbnail">
					<div class="centered">
						<img id="space_img" class="portrait" src="${ pageContext.request.contextPath }/resources/upload/${ spaceDTO.space_img }">
					</div>
				</div>
			</div>
		</div>
		<div class="col s6">
			<table class="highlight">
				<tr>
					<td style="width: 200px;">스페이스 이름</td>
					<td>${ spaceDTO.space_title }</td>
				</tr>
				<tr>
					<td>매니저 아이디</td>
					<td>${ managerDTO.member_id }</td>
				</tr>
				<tr>
					<td>매니저 이름</td>
					<td>${ managerDTO.member_name }</td>
				</tr>
				<tr>
					<td>스페이스 설명</td>
					<td>${ spaceDTO.space_context }</td>
				</tr>
				<tr>
					<td>해시태그</td>
					<td>
						<c:forEach var="hashtagDTO" items="${ hashtagList }">
							<div class="chip">${ hashtagDTO.hashtag_context }</div>
						</c:forEach>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>