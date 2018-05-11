<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
      
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>
			<!-- title 영역 -->
			<tiles:getAsString name="title" />
		</title>
			<!-- <link href="join.css" type="text/css" rel="stylesheet" /> -->
			<!--  css 영역-->
		<link href='<tiles:getAsString name="css" />' type="text/css" rel="stylesheet" />	
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ></script>

		<script>
			$(document).ready(function(){
				$("#btnCheckUid").click(function(){
					if($("#inputUid").val() !== "") {
						$.ajax({
							type : 'post',
							url : "idcheck.htm",
							data : {"userid" : $("#inputUid").val()},
							dataType : "json",
							contentType: "application/json; charset=utf-8",
							success : function(data) {
								alert(data);
							},
							error : function(request, status, error) {
								alert("loading error:" + request.status);
							}
						});
					} else {
						alert("아이디를 입력해주세요");
					}
				});
			});
		</script>
	</head>
	<body>
		<!-- Header 영역 -->
		<tiles:insertAttribute name="header" />
		<!-- Visual 영역 -->
		<tiles:insertAttribute name="visual" />
		<div id="main">
			<div class="top-wrapper clear">
				<!-- Content 영역  -->
				<tiles:insertAttribute name="content" />
				<!-- Aside (Navi) 영역 -->
				<tiles:insertAttribute name="aside" />
			</div>		
		</div>
		<!-- Footer 영역 -->
		<tiles:insertAttribute name="footer" />		
	</body>
</html>