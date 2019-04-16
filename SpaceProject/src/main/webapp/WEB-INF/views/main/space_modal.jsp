<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal Structure -->
<div id="space_modal${ status }" class="modal modal-fixed-footer left">
	<div class="modal-content">
		<div class="thumbnail-wrapper">
			<div class="thumbnail">
				<div class="centered">
					<img class="modal-img" src="${ pageContext.request.contextPath }/resources/upload/${spaceDTO.space_img}">
				</div>
			</div>
		</div>
		<div class="space-content">
			<h5>${ spaceDTO.space_title }</h5>
			<span>${ managerDTO.member_id }</span>
			<h6 class="manager-name">${ managerDTO.member_name }</h6>
			<blockquote>${ spaceDTO.space_context }</blockquote>
			<div class="hashtag-list-box">
				<c:forEach var="hashtagDTO" items="${ hashtagList }">
					<div class="chip">#${ hashtagDTO.hashtag_context }</div>
				</c:forEach>
			</div>
			<div class="space-join-form">
				<form>
					<div class="input-field">
						<textarea name="space_approval_context" class="space-approval-context-textarea materialize-textarea" data-length="120"></textarea>
						<label for="textarea2">가입 신청 내용</label>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class="modal-close waves-effect waves-green btn-flat">취소</a> <a name="${ spaceDTO.space_no }" class="sign-up-btn waves-effect waves-green btn-flat">가입신청</a>
	</div>
</div>