<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!-- Header START-->
<header id="header" class="header">
    <div class="navbar navbar-inverse" role="banner">
        <div class="container">
            <div class="navbar-brand">
                <a class="logo-text" href="index.do">뿌리깊은마크</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
			
            <div class="collapse navbar-collapse">
            	<se:authorize access="isAuthenticated()">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="user/mybookmark.do">MyBookmark</a>
                    </li>
                    <li class="dropdown">
                        <a href="#">Group <i class="fa fa-angle-down"></i></a>
                        <ul role="menu" class="sub-menu">
                            <li><a href="#">그룹1</a></li>
                            <li><a href="#">그룹2</a></li>
                            <li><a href="#">그룹 추가 + </a></li>
                        </ul>
                    </li>
                    <li>
                    <!-- Social Link  -->
                        <a href="#">Social</a>
                    <!-- Social Link  -->
                    </li>
                    <li class="dropdown">
                        <a href="#">Notice <i class="fa fa-angle-down"></i></a>
                        <ul role="menu" class="sub-menu">
                            <li>희준이와 아이들에서 초대
                                <input type="checkbox">
                            </li>
                        </ul>
                    </li>
                    <!-- Notice Alarm START -->
                   <li class="dropdown">
                       <a href="#">
                       <img src="icon/alert.png" class="notice-alarm" style="margin-top: -3px;"></a>
                       <ul role="menu" class="sub-menu">
                           <li>토요일 12pm~6pm 서버 점검 예정</li>
                       </ul>
                   </li>
                   <!-- Notice Alarm END -->
                   <!-- USER INFO START -->
                   <li>
                       <a href="#">
                       <img class="dropdown header-ico" 
                       		src="images/profile/${sessionScope.info_userprofile}"
                       		onerror="images/profile.png"> ${sessionScope.info_usernname}</a>
                       <ul role="menu" class="sub-menu">
                           <li><a href="myInfo.do">회원정보수정</a></li>
                           <li><a href='security/logout'>Logout</a></li>
                       </ul>
                   </li>
                   <!-- USER INFO END -->
                </ul>
                </se:authorize>
            </div>
        </div>
    </div>
</header>
<!-- Header END-->