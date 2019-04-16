<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="context-box z-depth-1 row">
	<form action="#">
		<div>
			<c:choose>
				<c:when test="${empty spaceApprovalList }">
					<div class="null-space-box">
						<div class="null-space-box-center">
							<i class="material-icons null-space-icon blue-text darken-2 center-align">highlight_off</i>
							<h3 class="center-align">"${ sessionScope.member_name }"님의 스페이스 가입 신청 목록이 없습니다.</h3>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<table>
						<thead>
							<tr>
								<th>스페이스 이름</th>
								<th>신청 내용</th>
								<th>신청 날짜</th>
								<th>취소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="spaceApprovalDTO" items="${ spaceApprovalList }">
								<tr class="hoverable">
									<input type="hidden" name="approval_space_no" value="${ spaceApprovalDTO.space_no }" />
									<input type="hidden" name="approval_member_no" value="${ spaceApprovalDTO.member_no }" />
									<c:forEach var="spaceDTO" items="${ spaceApprovalInfoList }">
										<c:choose>
											<c:when test="${ spaceApprovalDTO.space_no eq spaceDTO.space_no }">
												<td>${ spaceDTO.space_title }</td>
											</c:when>
										</c:choose>
									</c:forEach>
									<td>${ spaceApprovalDTO.space_approval_context }</td>
									<td>${ spaceApprovalDTO.space_approval_date }</td>
									<td><a class="space-approval-cancel-btn waves-effect waves-light btn">취소</a></td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
					<ul class="pagination center">
						<li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
						<li class="active"><a href="#!">1</a></li>
						<li class="waves-effect"><a href="#!">2</a></li>
						<li class="waves-effect"><a href="#!">3</a></li>
						<li class="waves-effect"><a href="#!">4</a></li>
						<li class="waves-effect"><a href="#!">5</a></li>
						<li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</form>
</div>