<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="context-box row">
	<form action="#">
		<div class="col s12">
			<!-- 내 스페이스 리스트 -->

			<ul class="collapsible">
				<li>
					<div class="collapsible-header">
						<i class="material-icons">done_outline</i>가입된 스페이스 목록
					</div>
					<div class="collapsible-body">
						<c:forEach var="spaceDTO" items="${ joinSpaceList }">
							<!-- card -->
							<div class="card space-card sticky-action hoverable">
								<div
									class="card-image waves-effect waves-block waves-light space-card-image-box">
									<a href="space.korea?space_no=${ spaceDTO.space_no }">
										<div class="space_member_box">
											<div>
												<i class="material-icons">done_outline</i> <span>가입된 스페이스</span>
											</div>
										</div> <img class="card-img" src="${ pageContext.request.contextPath }/resources/upload/${spaceDTO.space_img}">
									</a>
								</div>
								<div class="card-content">
									<span class="card-title activator grey-text text-darken-4">${ spaceDTO.space_title }</span>
									<c:forEach var="hashtagDTO" items="${ spaceDTO.hashtagList }">
										<a href="#">#${ hashtagDTO.hashtag_context }</a>
									</c:forEach>
								</div>
								<input type="hidden" name="join_space_no" value="${ spaceDTO.space_no }">
								<input type="hidden" name="join_member_no" value="${ sessionScope.member_no }">
								<a class="space_delete_btn waves-effect waves-light btn">탈퇴</a>
							</div>
						</c:forEach>
					</div>
				</li>
				<li>
					<div class="collapsible-header">
						<i class="material-icons">fingerprint</i>내가 만든 스페이스 목록
					</div>
					<div class="collapsible-body">
						<c:forEach var="spaceDTO" items="${ mySpaceList }">
							<!-- card -->
							<div class="card space-card sticky-action hoverable">
								<div
									class="card-image waves-effect waves-block waves-light space-card-image-box">
									<a href="space.korea?space_no=${ spaceDTO.space_no }">
										<div class="space_member_box">
											<div>
												<i class="material-icons">fingerprint</i> <span>내 스페이스</span>
											</div>
										</div> <img class="card-img" src="${ pageContext.request.contextPath }/resources/upload/${spaceDTO.space_img}">
									</a>
								</div>
								<div class="card-content">
									<span class="card-title activator grey-text text-darken-4">${ spaceDTO.space_title }</span>
									<c:forEach var="hashtagDTO" items="${ spaceDTO.hashtagList }">
										<a href="#">#${ hashtagDTO.hashtag_context }</a>
									</c:forEach>
								</div>
							</div>
						</c:forEach>
					</div>
				</li>
			</ul>

			<div class="myspace-box center">
				
				<%-- <!-- card -->
				<div class="card space-card sticky-action hoverable">
					<div class="card-image waves-effect waves-block waves-light space-card-image-box">
						<a class="modal-trigger" href="#modal1"> <img src="${ pageContext.request.contextPath }/resources/upload/${spaceDTO.space_img}">
					</div>
					<div class="card-content">
						<span class="card-title activator grey-text text-darken-4">${ spaceDTO.space_title }<i class="material-icons right">more_vert</i></span> <a href="#">#스터디</a><a href="#">#스터디</a><a href="#">#스터디</a>
					</div>
					<a class="space_delete_btn waves-effect waves-light btn">탈퇴</a>
					<div class="card-reveal">
						<span class="card-title grey-text text-darken-4">${ spaceDTO.space_title }<i class="material-icons right">close</i></span>
						<p>${ spaceDTO.space_context }</p>
					</div>
				</div> --%>
			</div>
		</div>
	</form>
</div>