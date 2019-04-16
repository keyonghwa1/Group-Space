<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal Structure -->
<div id="space_board_write_modal" class="modal modal-fixed-footer left">
	<div class="modal-content">
		<h5>글쓰기</h5>
		<form id="space_board_form" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="input-field col s12">
					<select>
						<option value="" disabled selected>카테고리를 선택해 주세요.</option>
						<c:forEach var="spaceCategoryDTO" items="${spaceCategoryList }">
							<option value="${ spaceCategoryDTO.space_category_no }">${ spaceCategoryDTO.space_category_name }</option>
						</c:forEach>
					</select>
					<label>카테고리 선택</label>
				</div>
				<div class="input-field col s12">
		          <input id="board_title" type="text" class="validate" name="space_board_title">
		          <label for="board_title">게시글 이름</label>
		        </div>
		        <div class="input-field col s12">
		          <textarea id="context-textarea" class="materialize-textarea" name="space_board_context"></textarea>
		          <label for="context-textarea">내용</label>
		        </div>
				<div class="file-field input-field col s12">
					<div class="btn">
						<span>이미지</span>
						<input type="file" name="space_board_img" multiple>
					</div>
					<div class="file-path-wrapper">
						<input class="file-path validate" type="text" placeholder="이미지 파일을 넣어주세요.">
					</div>
				</div>
				<div class="file-field input-field col s12">
					<div class="btn">
						<span>동영상</span>
						<input type="file" name="space_board_video" multiple>
					</div>
					<div class="file-path-wrapper">
						<input class="file-path validate" type="text" placeholder="동영상 파일을 넣어주세요.">
					</div>
				</div>
				<div class="file-field input-field col s12">
					<div class="btn">
						<span>파일</span>
						<input type="file" name="space_board_file" multiple>
					</div>
					<div class="file-path-wrapper">
						<input class="file-path validate" type="text" placeholder="파일을 넣어주세요.">
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
		<a href="#!" class="modal-close waves-effect waves-green btn-flat">취소</a>
		<a class="board-insert-btn waves-effect waves-green btn-flat">글 등록</a>
	</div>
</div>