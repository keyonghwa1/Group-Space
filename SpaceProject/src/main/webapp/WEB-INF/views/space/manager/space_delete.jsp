<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="null-space-box">
	<div class="null-space-box-center">
		<i class="material-icons null-space-icon blue-text darken-2 center-align">highlight_off</i>
		<h3 class="center-align">스페이스를 삭제 하시려면 아래 삭제 버튼을 눌러주세요.</h3>
		<td><a id="space_delete_btn" class="waves-effect waves-light btn red">스페이스 삭제</a></td>
		<input id="space_no" type="hidden" value="${ param.space_no }">
	</div>
</div>
