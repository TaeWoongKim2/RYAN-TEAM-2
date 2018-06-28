<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<script>
	/* Chatting Start */
	var stompClient = null;
	var gid = '<c:out value="${gid}"/>';
	var nname = '<c:out value="${nname}"/>';
	var profile = '<c:out value="${profile}"/>';
	
	console.log(gid);
	$(function(){
		connect();
		
		$('#chatt_input').keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13') {
				sendMessage();
			}
			event.stopPropagation();
		});
		$('#sendBtn').click(function() {
			sendMessage();
		});
	});
	
	// 채팅방 연결
	function connect() {
	    console.log("connect");
	    // WebSocketMessageBrokerConfigurer의 registerStompEndpoints() 메소드에서 설정한 endpoint("/endpoint")를 파라미터로 전달
	    var ws = new SockJS("http://192.168.0.21:8090/bit/endpoint");
	    stompClient = Stomp.over(ws);
	    stompClient.connect({}, function(frame) {
	        // 메세지 구독
	        // WebSocketMessageBrokerConfigurer의 configureMessageBroker() 메소드에서 설정한 subscribe prefix("/subscribe")를 사용해야 함
	        stompClient.subscribe('/subscribe/chat/' + gid, function(message) {
	        	//console.log(message.body);
	        	
	        	var new_chat = JSON.parse(message.body);
	        	//console.log(new_chat.nname);
	        	var chat_div = "";
	        	chat_div += '<img class="chatting_profile_img" src="${pageContext.request.contextPath}/images/profile/' + new_chat.profile + '">';
	        	chat_div += '<div class="chatting_text_div">';
	        	chat_div += '<p class="chatting_userid">';
	        	chat_div += new_chat.nname + '<span class="chatting_time">' + new_chat.datetime + '</span>';
	        	chat_div += '</p>';
	        	chat_div += '<span class="chatting_text">';
                chat_div += new_chat.content;
                chat_div += '</span>';
                chat_div += '</div>';  	

                console.log(chat_div);
                $(".chatting_contents").append(chat_div);
	        	
	        });        
	    });
	    
	}
	 
	// 채팅 메세지 전달
	function sendMessage() {
		console.log("click");
		
	    var str = $("#chat_textbox_text").text();
	    str = str.replace(/ /gi, '&nbsp;')
	    str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
	    console.log(str);
	    if(str.length > 0) {
	        // WebSocketMessageBrokerConfigurer의 configureMessageBroker() 메소드에서 설정한 send prefix("/")를 사용해야 함
	        stompClient.send("/chat/" + gid, {}, JSON.stringify({
	           	content: str,
	           	nname: nname,
	           	profile: profile
	        }));
	    }
	}
	 
	// 채팅방 연결 끊기
	function disconnect() {
	    stompClient.disconnect();
	}

	/* Chatting End */

</script>

	<!-- 전체 Body Div START -->
    <div class="container-fluid team-container">
        <div id="main-row" class="row">
            <div class="col-sm-12 whole-body">

    <!-- body TOP div START -->
    <section class="my">
        <div class="container-fluid top">
            <div class="row">
                <div class="col-sm-12 top-content">
                    <div class="col-sm-7">
                         	위에 뭐가 뜨는 영역
                    </div>
                    <div class="col-sm-5 option">
                        <span class="option-ico">
                                <i class="fas fa-plus-circle team-ico team-insert dropdown"></i>

                                <i class="fas fa-minus-circle team-ico team-ban dropdown" onclick="group_leave();"></i>

                                <i class="fas fa-cog team-ico team-option dropdown"  onclick="group_complete();"></i>
                        </span>
                    </div>
                </div>
            </div>
        </div>
     </section>
    <!-- body TOP div END -->

    <!-- body Content START -->
    <div class="container-fluid content">
        <div class="row">
            <!-- Group Category div START -->
            <section class="col-sm-3 group-category">
                <div class="group-category-div">
                    <div class="group-category-header">
                        <span><i class="fas fa-chalkboard-teacher"></i> Group Category</span>
                    </div>
                    <div class="group-category-body">
                        <div class="jstree-from">
                            <ul>
                                <li><i class="fa fa-folder-o"></i> 카테고리 시작</li>
                                    <ul>
                                        <li><img src="https://www.google.com/s2/favicons?domain=https://www.naver.com/"><a href="https://www.naver.com" target="_blank">네이버</a></li>
                                        <li><img src="https://www.google.com/s2/favicons?domain=https://www.daum.net/"><a href="https://www.daum.net" target="_blank">다음</a></li>
                                    </ul>
                            </ul>
                        </div>
                    </div>
                    <div class="group-category-footer">

                    </div>
                </div>
            </section>
            <!-- Group Category div END -->

            <!-- Group Chart div START -->
            <section class="col-sm-6 chat">
                <div class="chat-content-div">
                    <div class="chat-header">
                        <span class="chatting-roomname"><i class="far fa-comments"></i>&nbsp;&nbsp;ALL</span>
                        <div class="user-status">
                            <span><i class="far fa-star"></i></span>
                        </div>
                        <div class="header-divider"><hr class="left"/><span id="header-date">today</span><hr class="right"/></div>
                    </div>

                    <div class="chat-element">
                        <!-- 날짜 변경되면 나오는 친구 -->
                        <div id="2018-06-27" class="divider"><hr class="left"/><span>2018-06-27</span><hr class="right"/></div>
                        <div class="chatting-contents">
                            <img class="chatting-profile-img" src="https://s3.amazonaws.com/uifaces/faces/twitter/GavicoInd/128.jpg">

                            <div class="chatting-text-div">
                                <p class="chatting-userid">
					                                   정민재 <span class="chatting-time">12시 27분</span><br>
					                                </p>
					                                <span class="chatting-text">
					                                    희준이는 토게피<br>
					                                    아니 채팅창을 만들어본적이 없는데 어떻게 만들란 거야?? 응???
                                </span>
                            </div>
                        </div>
                        
                        <div id="2018-06-28" class="divider"><hr class="left"/><span>today</span><hr class="right"/></div>
                    </div>

                    <div class="chat-inputbox-div">
                        <div class="chat-inputbox-bg">
                            <div class="chat-textbox">
                                <div id="chat-textbox-text">

                                </div>
                            </div>
                            <div id="chat-textbox-icon">
                                <i class="fas fa-share-square"></i>
                            </div>
                        </div>
                    </div>
                </div>



            </section>
            
            <!-- Group Chart div END -->

            <!-- Group Member div START -->
            <section class="col-sm-2 group-member">
                <div class="group-member-content">
                    <div>
                        <div class="group-member-header">
                            <p><i class="far fa-address-card"></i> Member <i class="fas fa-user-plus" onclick="member_insert();"></i></p>
                        </div>
                    </div>
                    <div class="onoffline-content">
                        <div class="online-content">
                            <div class="online">
                                <span><i class="fas fa-toggle-on"></i>online</span>
                            </div>
                            <div class="online-member">
                                <p class="member">
                                    <img class="member-ico" src="https://s3.amazonaws.com/uifaces/faces/twitter/GavicoInd/128.jpg" alt="images/profile.png">김태웅
                                </p>
                                <p class="member">
                                    <img class="member-ico" src="https://s3.amazonaws.com/uifaces/faces/twitter/GavicoInd/128.jpg" alt="images/profile.png">김희준
                                </p>
                                <p class="member">
                                    <img class="member-ico" src="https://s3.amazonaws.com/uifaces/faces/twitter/GavicoInd/128.jpg" alt="images/profile.png">정민재
                                </p>
                            </div>
                        </div>
                        <div class="offline-content">
                            <div class="offline">
                                <span><i class="fas fa-toggle-off"></i>offline</span>
                            </div>
                            <div class="offline-member">
                                <p class="member"><img class="member-ico" src="<%= request.getContextPath() %>/images/team/offline.png">정진수</p>
                                <p class="member"><img class="member-ico" src="<%= request.getContextPath() %>/images/team/offline.png">김명수</p>
                                <p class="member"><img class="member-ico" src="<%= request.getContextPath() %>/images/team/offline.png">방준석</p>
                            </div>
                        </div>
                    </div>    
                </div>
            </section>
            <!-- Group Member div END -->
        </div>
    </div>
    <!-- body Content END -->
            </div>
        </div>
    </div>
    <!-- 전체 Body Div End-->