<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${ pageContext.request.contextPath }/resources/space/js/space_category_update.js"></script>
<form action="#">
	<div>
		<table id="category_table">
			<thead>
				<tr>
					<th>카테고리 이름</th>
					<th>비공개/공개</th>
					<th>카테고리 삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="spaceCategoryDTO" items="${ spaceCategoryList }">
					<tr name="category_tr" class="hoverable">
						<td> ${spaceCategoryDTO.space_category_name }</td>
						<td>
							<div class="switch">
								<label> 비공개 <input checked type="checkbox"> <span class="lever"></span> 공개
								</label>
							</div>
						</td>
						<td>
							<input id="space_category_no" name="space_category_no" type="hidden" value="${spaceCategoryDTO.space_category_no }">
							<input id="space_no" name="space_no" type="hidden" value="${spaceCategoryDTO.space_no }">
							<a name="category_delete_btn" class="waves-effect waves-light btn">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a name="category_add_btn" class="waves-effect waves-light btn">카테고리 추가</a>
	</div>
</form>
