<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- card -->
<div class="card space-card sticky-action hoverable">
	<div class="card-image waves-effect waves-block waves-light space-card-image-box">
		<c:choose>
			<c:when test="${ spaceDTO.member_no eq sessionScope.member_no  }">
				<!-- 자신이 개설한 스페이스 -->
				<a href="space.korea?space_no=${ spaceDTO.space_no }">
					<div class="space_member_box">
						<div>
							<i class="material-icons">fingerprint</i> <span>내 스페이스</span>
						</div>
					</div> <img class="card-img" src="${ pageContext.request.contextPath }/resources/upload/${spaceDTO.space_img}">
				</a>
			</c:when>
			<c:when test="${ spaceDTO.spaceApprovalCheck }">
				<!-- 가입 신청을 한 스페이스 -->
				<div class="space_approval_box">
					<div>
						<i class="material-icons">hourglass_full</i> <span>가입 승인을 기다리는중...</span>
					</div>
				</div>
				<a href="#"> <img class="card-img" src="${ pageContext.request.contextPath }/resources/upload/${spaceDTO.space_img}">
				</a>
			</c:when>
			<c:when test="${ spaceDTO.spaceMemberCheck }">
				<!-- 가입이 된 스페이스 -->
				<a href="space.korea?space_no=${ spaceDTO.space_no }">
					<div class="space_member_box">
						<div>
							<i class="material-icons">done_outline</i> <span>가입된 스페이스</span>
						</div>
					</div> <img class="card-img" src="${ pageContext.request.contextPath }/resources/upload/${spaceDTO.space_img}">
				</a>
			</c:when>
			<c:otherwise>
				<!-- 스페이스 -->
				<a class="modal-trigger" href="#space_modal${ status }"> <img class="card-img" src="${ pageContext.request.contextPath }/resources/upload/${spaceDTO.space_img}">
				</a>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="card-content">
		<span class="card-title activator grey-text text-darken-4">${ spaceDTO.space_title }</span>
		<c:forEach var="hashtagDTO" items="${ spaceDTO.hashtagList }">
			<a href="#">#${ hashtagDTO.hashtag_context }</a>
		</c:forEach>
	</div>
</div>