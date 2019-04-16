<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<div class="col s2">
		<div class="collection category-box left-align">
			<c:forEach var="spaceCategoryDTO" items="${spaceCategoryList }">
				<a href="#!" class="collection-item tab_list1" name="space-category-no_${ spaceCategoryDTO.space_category_no }"> <span class="badge">1</span>${spaceCategoryDTO.space_category_name }
				</a>
			</c:forEach>
		</div>
		<a id="board-write-btn" href="#space_board_write_modal" class="waves-effect waves-light btn modal-trigger">글쓰기</a>
	</div>
	<c:set var="count" value="0" />
	<c:forEach var="spaceCategoryDTO" items="${spaceCategoryList }">
		<c:choose>
			<c:when test="${ count eq 0 }">
				<div class="tabDiv1 board-list-box z-depth-1 col s9" style="display: block;">
					<span>${ spaceCategoryDTO.space_category_name }</span>
					<c:choose>
						<c:when test="${empty spaceCategoryDTO.spaceBoardList }">
							<div class="null-space-box">
								<div class="null-space-box-center">
									<i class="material-icons null-space-icon blue-text darken-2 center-align">highlight_off</i>
									<h3 class="center-align">"${ spaceCategoryDTO.space_category_name }"카테고리에 게시글이 없습니다.</h3>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<form action="#">
								<div>
									<table>
										<thead>
											<tr>
												<th>게시글 이름</th>
												<th>작성자</th>
												<th>작성날짜</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="spaceBoardDTO" items="${ spaceCategoryDTO.spaceBoardList }">
												<tr class="hoverable">
													<td>${ spaceBoardDTO.space_board_title }</td>
													<td>${ spaceBoardDTO.memberDTO.member_name }</td>
													<td>${ spaceBoardDTO.space_board_date }</td>
													<td>${ spaceBoardDTO.space_board_view }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
			</c:when>
			<c:otherwise>
				<div class="tabDiv1 board-list-box z-depth-1 col s9" style="display: none;">
					<span>${ spaceCategoryDTO.space_category_name }</span>
					<c:choose>
						<c:when test="${empty spaceCategoryDTO.spaceBoardList }">
							<div class="null-space-box">
								<div class="null-space-box-center">
									<i class="material-icons null-space-icon blue-text darken-2 center-align">highlight_off</i>
									<h3 class="center-align">"${ spaceCategoryDTO.space_category_name }"카테고리에 게시글이 없습니다.</h3>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<form action="#">
								<div>
									<table>
										<thead>
											<tr>
												<th>게시글 이름</th>
												<th>작성자</th>
												<th>작성날짜</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="spaceBoardDTO" items="${ spaceCategoryDTO.spaceBoardList }">
												<tr class="hoverable">
													<td>${ spaceBoardDTO.space_board_title }</td>
													<td>${ spaceBoardDTO.memberDTO.member_name }</td>
													<td>${ spaceBoardDTO.space_board_date }</td>
													<td>${ spaceBoardDTO.space_board_view }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
			</c:otherwise>
		</c:choose>
		<c:set var="count" value="${ count+1 }" />
	</c:forEach>
</div>