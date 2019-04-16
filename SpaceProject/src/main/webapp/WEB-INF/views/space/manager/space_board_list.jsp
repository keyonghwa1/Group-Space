<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<div class="collection category-box col s2 left-align">
		<c:forEach var="spaceCategoryDTO" items="${spaceCategoryList }">
			<a href="#!" class="collection-item tab_list3" name="space-category-no_${ spaceCategoryDTO.space_category_no }">
				<span class="badge">1</span>${spaceCategoryDTO.space_category_name }
			</a> 
		</c:forEach>
	</div>
	
	<c:set var="count" value="0"/>
	<c:forEach var="spaceCategoryDTO" items="${spaceCategoryList }">
		<c:choose>
			<c:when test="${ count eq 0 }">
				<div class="tabDiv3 board-list-box z-depth-1 col s9" style="display:block;">
					<span>${ spaceCategoryDTO.space_category_name }</span>
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
									<%
										for (int i = 0; i < 10; i++) {
									%>
									<tr class="hoverable">
										<td>스페이스 규칙입니다!</td>
										<td>NickName</td>
										<td>2019-02-01</td>
										<td>999+</td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<div class="tabDiv3 board-list-box z-depth-1 col s9" style="display:none;">
					<span>${ spaceCategoryDTO.space_category_name }</span>
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
									<%
										for (int i = 0; i < 10; i++) {
									%>
									<tr class="hoverable">
										<td>스페이스 규칙입니다!</td>
										<td>NickName</td>
										<td>2019-02-01</td>
										<td>999+</td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</form>
				</div>
			</c:otherwise>
		</c:choose>
		<c:set var="count" value="${ count+1 }" />
	</c:forEach>
</div>