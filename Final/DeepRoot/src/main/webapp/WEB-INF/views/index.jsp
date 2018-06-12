<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
	<!-- Home slider START-->
    <section id="home-slider">
        <div class="container">
            <div class="row">
                <div class="main-slider">
                    <div class="slide-text">
                        <!-- introduce text START -->
                        <div class="introduce-text">
							개발자들에게 필요한 사이트들을 제공해줍니다<br>
							자신만의 북마크 사이트를 추가하고<br>
							다른사람들과 공유해보세요<br>
                        </div>
                        <!-- introduce text END -->
                        <!-- Login / Roll in Button START -->
                        <se:authorize access="!hasRole('ROLE_USER')">
                        <a href="javascript:void(0)" data-toggle="modal" onclick="openLoginModal();" class="btn btn-common">LOG IN</a>
                        <a href="javascript:void(0)" data-toggle="modal" onclick="openRegisterModal();" class="btn btn-common">SIGN UP</a>
                        </se:authorize>
                        <!-- Login / Roll in Button END -->
                    </div>
                    <!-- Login / Roll in / password find modal START -->
                    <div class="modal fade login" id="loginModal">
                        <div class="modal-dialog login animated">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Login with</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="box">
                                        <div class="content">
                                            <div class="social">
                                                <a class="circle github" href="/auth/github">
                                                        <i class="fa fa-github fa-fw" ></i>
                                                    </a>
                                                <a id="google_login" class="circle google" href="/auth/google_oauth2">
                                                        <i class="fa fa-google-plus fa-fw"></i>
                                                    </a>
                                                <a id="facebook_login" class="circle facebook" href="/auth/facebook">
                                                        <i class="fa fa-facebook fa-fw"></i>
                                                    </a>
                                            </div>
                                            <div class="division">
                                                <div class="line l"></div>
                                                <span>or</span>
                                                <div class="line r"></div>
                                            </div>
                                            <div class="error"></div>
                                            <div class="form loginBox">
                                                <!-- Login START -->
                                                <form action='<c:url value="/security/login" />' method="POST">
                                                    <input id="uid" class="form-control" type="text" placeholder="Email" name="uid">
                                                    <input id="pwd" class="form-control" type="password" placeholder="Password" name="pwd">
                                                    <input id="loginAjax" class="btn btn-default btn-login" type="submit" value="Login">
                                                </form>
                                                <!-- Login END -->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box">
                                        <div class="content registerBox" style="display:none;">
                                            <!-- Roll in START -->
                                            <div class="form">
                                                <form action="/main.do" method="post" html="{:multipart=>true}" data-remote="true" accept-charset="UTF-8">
                                                    <input id="uid_join" class="form-control" type="text" placeholder="Email@example.com" name="uid">
                                                    <input id="nname_join" class="form-control" type="text" placeholder="Nickname" name="nname">
                                                    <input id="pwd_join" class="form-control" type="password" placeholder="Password" name="pwd">
                                                    <input id="pwd_confirmation" class="form-control" type="password" placeholder="Repeat Password" name="pwd_confirmation">
                                                    <input id="profile_join" class="form-control" type="text" placeholder="Greetings" name="profile">
                                                    <input class="btn btn-default btn-register" type="submit" value="Create account" name="commit">
                                                </form>
                                            </div>
                                            <!-- Roll in END -->
                                        </div>
                                    </div>
                                    <div class="box">
                                        <div class="content findBox" style="display:none;">
                                            <!-- password find START -->
                                            <div class="form">
                                                <form method="post" action="/find" accept-charset="UTF-8">
                                                    <input id="uid_find" class="form-control" type="text" placeholder="Email" name="uid">
                                                    <input class="btn btn-default btn-find" type="submit" value="Find account" name="commit">
                                                </form>
                                            </div>
                                            <!-- password find END -->
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="forgot login-footer">
                                        <span>아직 계정이 없으신가요?
                                                 <a class="login-form" href="javascript: showRegisterForm();">회원가입</a>
                                            </span><br>
                                        <span>비밀번호를 잊으셨나요?
                                                 <a class="login-form" href="javascript: showFindForm();">비밀번호 찾기</a>
                                            </span>
                                    </div>
                                    <div class="forgot register-footer" style="display:none">
                                        <span>이미 계정을 가지고 계신가요?</span>
                                        <a class="login-form" href="javascript: showLoginForm();">로그인</a>
                                    </div>
                                    <div class="forgot find-footer" style="display:none">
                                        <span></span>
                                        <a class="login-form" href="javascript: showLoginForm();">돌아가기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Login / Roll in / password find modal END -->
                    <img src="images/home/slider/hill.png" class="slider-hill" alt="slider image">
                </div>
            </div>
        </div>
        <div class="preloader"><i class="fa fa-sun-o fa-spin"></i></div>
    </section>
    <!-- Home slider END-->
    
    <!-- Admin bookmark & Preview START -->
    <section class="main-admin-category">
        <div class="container">
            <div class="row">
                <!-- Admin Bookmark & Category Area START -->
                <div class="col-sm-12">
                    <!-- Admin Bookmark & Search Area START -->
                    <span class="bookmark-title">
                        <img src="icon/bookmark2.jpg" style="margin-right:5px; width:30px">
                        Admin Bookmark
                    </span>
                    <div id="custom-search-input">
                        <div class="input-group">
                            <input class="search-input" type="text" name="search" placeholder="Search..." />
                            <span class="input-group-btn">
                          </span>
                        </div>
                    </div>
                    <hr class="hr-clear">
                    <!-- Admin Bookmark & Search Area END -->

                    <!-- Category Area START -->
                    <div class="col-sm-12">
                        <div class="category-div">
                            <span class="bookmark-category">
                            <img src="icon/category.png" style="margin-right:5px; width:25px">
                            Category
                          </span>
                        </div>
                        <div id="category-display" class="col-sm-12 category-items">
                            <div id="showall" class="category">
                                <span>Show All</span></div>
                            <c:forEach items="${categoryList}" var="cList">
                            	<div data-category="${cList.acname}" class="category">
                                <span>${cList.acname}</span></div>
                            </c:forEach>
                        </div>
                    </div>
                    <hr class="hr-clear">
                    <!-- Category Area END -->
                </div>
                <!-- Admin Bookmark & Category Area END -->

                <!-- URL Table Area START -->
                <div class="col-sm-6">
                    <ul class="ul-table">
                    	<c:forEach items="${categoryList}" var="cList">
                    	<li id="${cList.acname}">
                            <div class="component">
                                <h2 class="component_title color4">
                                    <img class="show_close_img" src="icon/all_show.png">
                                    <span class="title">${cList.acname}</span>
                                </h2>
                                <ul>
                                	<c:forEach items="${bookList}" var="bList">
                                	<c:choose>
                                		<c:when test="${cList.acid == bList.acid}">
                               			<li>
	                                        <button class="url_hover_btn" type="button"><img class="zoom_img" src="icon/url_save.png" data-toggle="modal" onclick="openUrlModal()"></button>
	                                        <button class="url_hover_btn" type="button"><img class="zoom_img" src="icon/open_preview.png"></button>
	                                        <img class="favicon" src="https://www.google.com/s2/favicons?domain=${bList.url}" alt="">
	                                        <p class="url" data-url="${bList.url}"
	                                        			   data-regdate="${bList.regdate}"
	                                        			   data-views="${bList.view}">${bList.urlname}<img class="url_link_btn" src="icon/open_link.png"></p>
	                                    </li>
                                		</c:when>
                                	</c:choose>
                                    </c:forEach>
                                </ul>
                            </div>
                        </li>
                    	</c:forEach>
                    </ul>
                </div>
                <!-- URL Table Area END -->

                <!--Preview Floating Box Area START -->
                <div class="col-sm-6">

                    <div id="floatMenu">
                        <div id="preview_title">
                            <h2>
                                <img class="preview_img" src="icon/open_previewB.png">
                                <span class="title">Preview</span>
                            </h2>
                        </div>
                        <div id="preview_content">
                            <div id="layout">미리보기: Page Image</div>
                            <div id="explain">상세정보: Today Visitors, Using Flow</div>
                            <div id="comment">설명 Details</div>
                        </div>
                        <div id="advertise_content">

                        </div>
                    </div>
                </div>
                <!--Preview Floating Box Area END -->
            </div>
        </div>
    </section>
    <!-- Admin bookmark & My bookmark END -->
    
    <!-- Bookmark url input START -->
    <div class="modal fade addBookmark" id="addBookmarkModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <form name="add" method="post" action="/addBookmark" accept-charset="UTF-8">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"></h4>
                    </div>

                    <div class="modal-body">
                        <div class="box">
                            <!--one floor insert-->
                            <div class="content">
                                <div class="form urlBox">
                                    <label class="control-label" for="url">URL을 입력하세요</label>
                                    <input id="url" class="form-control" type="text" placeholder="URL" name="url"><br>

                                </div>
                            </div>
                        </div>

                        <div class="box">
                            <!-- Two floor -->
                            <div class="content categoryBox" style="display:none;">
                                <div class="form">
                                    <label class="control-label" for="urlname">제목</label>
                                    <input id="urlname" class="form-control" type="text" placeholder="URLNAME" name="urlname"><br>
                                    <label class="control-label" for="pid">카테고리(임시)</label><br>
                                    <select id="pid" class="form-control" name="pid">
                                            <option>카테고리 1-1</option>
                                            <option>카테고리 1-2</option>
                                        </select>
                                        <select id="ubid" class="form-control" name="ubid">
                                            <option>카테고리 2-1</option>
                                            <option>카테고리 2-2</option>
                                        </select><br><br>
                                    <div>
                                        <label class="control-label" for="share">공유</label>
                                        &nbsp;&nbsp;
                                        <input id="share" type="checkbox" name="share" value="share">
                                    </div>
                                    <br>
                                </div>
                            </div>
                        </div>

                        <div class="box">
                            <!-- Three floor -->
                            <div class="content shareBox" style="display:none;">
                                <div class="form">
                                    <label class="control-label" for="sname">공유제목</label>
                                    <input id="sname" class="form-control" type="text" placeholder="SNAME" name="sname"><br>
                                    <label class="control-label" for="htag_input">해시태그</label>
                                    <input id="htag_input" class="form-control" type="text" placeholder="HTAG_input" name="htag_input" onkeydown="addHashtag()"><br>
                                    <div id="htag_append"></div><br>
                                    <input id="htag" class="form-control" type="hidden" placeholder="HTAG" name="htag"><br>
                                </div>
                            </div>
                        </div>
                        <!--</form>-->
                    </div>

                    <div class="modal-footer">
                        <div class="url-footer">
                            <input class="btn btn-default btn-next" type="button" value="다음" onclick="showCategoryForm()">
                        </div>
                        <div class="category_unshared-footer" style="display:none">
                            <input class="btn btn-default btn-prev" type="button" value="이전" onclick="showUrlForm()">
                            <input class="btn btn-default btn-comp" type="button" value="등록" onclick="addBookmarkButton()">
                        </div>

                        <div class="category_share-footer" style="display:none">
                            <input class="btn btn-default btn-prev" type="button" value="이전" onclick="showUrlForm()">
                            <input class="btn btn-default btn-next" type="button" value="다음" onclick="showShareForm()">
                        </div>
                        <div class="share-footer" style="display:none">
                            <input class="btn btn-default btn-prev" type="button" value="이전" onclick="showCategoryForm()">
                            <input class="btn btn-default btn-comp" type="button" value="등록" onclick="addBookmarkButton()">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Bookmark url input END -->