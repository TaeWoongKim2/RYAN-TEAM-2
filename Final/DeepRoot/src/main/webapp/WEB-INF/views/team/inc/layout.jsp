<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>뿌리깊은마크</title>

	<!-- Latest compiled Bootstrap Common CSS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- Bootstrap Common CSS END -->
    
    <!-- jQuery Confirm START -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<!-- jQuery Confirm END -->

	<!-- Common Script JavaScript & CSS START -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <!-- Common Script JavaScript & CSS END -->
    
    <!-- Group Page CSS START -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/team/team.css?ver=2" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/mainpage/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/mainpage/footer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/mainpage/responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jstreeTeam.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/team/header_icon_zoom.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/team/jquery.contextMenu.css" />
    <!-- Group Page CSS START -->
    
    <!--Script Start -->
    <script src="${pageContext.request.contextPath}/js/jstree.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/team/stomp.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/team/jquery.contextMenu.js?ver=2"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/team/team_alarm.js?ver=2"></script>
    <!-- Script END -->
    
    <!-- Header Socket JS -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/header/alarm.js?ver=1"></script>
	<!-- Header Socket JS END -->
    
    <!-- jQuery Ajax Form START -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>
	<!-- jQuery Ajax Form START -->
	
</head>
<body>
	
	<div id="main-header">
		<tiles:insertAttribute name="header" />
	</div>
	
	<div id="main">
		<tiles:insertAttribute name="content" />
	</div>
	
	<div id="main-footer">
		<tiles:insertAttribute name="footer" />
	</div>
    
    <!-- Custom Script START -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/team/team.js?ver=1"></script>
    <script src="${pageContext.request.contextPath}/js/team/chat_contents.js?ver=2"></script>
    <script src="${pageContext.request.contextPath}/js/team/header_icon_zoom.js?ver=2"></script>
    <!-- Custom Script END -->
    
    <!-- jstree Script -->
	<script type="text/javascript"  src="${pageContext.request.contextPath}/js/team/teamcategory.js"></script>
	
    <!-- URL 추가 모달 -->
    
    	<!-- URL 추가 모달 -->
	<div id="linkAdd_btn" class="modal fade" role="dialog">
		<div class="jstree-modal-center">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<b>URL 추가</b>
						</h4>
					</div>
	
					<div class="modal-body">
						<form id="form_btn">
							<table class="table">
								<colgroup>
									<col width="30%">
									<col width="70%">
								</colgroup>
								<tr class="addUrlLevel1">
									<td class="info" style="vertical-align: middle;">URL :</td>
									<td><input type="text" id="url_btn" name="url_btn"
										class="form-control"></td>
								</tr>
								<tr class="addUrlLevel2">
									<td class="info" style="vertical-align: middle;">제목 :</td>
									<td><input type="text" id="title_btn" name="title_btn"
										class="form-control"></td>
								</tr>
								<tr class="addUrlLevel2">
									<td class="info" style="vertical-align: middle;">카테고리 :</td>
									<td><input type="text" id="category_btn" name="category_btn"
										class="form-control" readonly="readonly"></td>
								</tr>
							</table>
						</form>
						<div class="modal-footer">
							<!-- type="submit" value="Submit" -->
							<button type="button" class="btn btn-default btn-sm addUrlLevel1" onclick="openAddUrlLevel2()">다음</button>
							<button type="button" class="btn btn-default btn-sm addUrlLevel2" onclick="addUrlLevel1()">이전</button>
							<button class="btn btn-default btn-sm addUrlLevel2" onclick="addUrl()">추가하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- URL 수정 모달 -->
	<div class="modal fade" id="editurl" role="dialog">
		<div class="jstree-modal-center">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<b>URL 변경</b>
						</h4>
					</div>
	
					<div class="modal-body">
						<form id="form3">
							<table class="table">
								<colgroup>
									<col width="30%">
									<col width="70%">
								</colgroup>
								<tr>
									<td class="info" style="vertical-align: middle;">URL</td>
									<td><input type="text" id="editurlval" name="editurlval"
										class="form-control"></td>
								</tr>
							</table>
						</form>
						<div class="modal-footer">
							<!-- type="submit" value="Submit" -->
							<button type="button" class="btn btn-default btn-sm"
								data-dismiss="modal">취소</button>
							<button class="btn btn-default btn-sm" id="editurlsubmit">수정하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
</body>
</html>