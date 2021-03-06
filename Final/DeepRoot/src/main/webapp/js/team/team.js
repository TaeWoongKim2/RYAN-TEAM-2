/*team.jsp 에서 gid, uid 를 가져오기 위한 함수*/
var gid;
var uid;

function get_info(gid, uid){
	gid = gid;
	uid = uid;
}


/* 멤버 초대 */
function member_insert(){
    $.confirm({
        title: '멤버 초대',
        content: '' +
        '<form id="insertMember" action="" class="formGroup" method="post" onsubmit="return false;>' +
        '<div class="form-group">' +
        '<label>추가 할 멤버의 이메일을 입력하세요</label>' +
        '<input type="text" name="uid" class="insertUid form-control"/>' +
        '<input type="hidden" name="gid" value="'+gid+'" class="banName form-control"/>' +
        '</div>' +
        '</form>',
        closeIcon: true,
        closeIconClass: 'fa fa-close',
        buttons: {
            formSubmit: {
                text: '초대',
                btnClass: 'btn-success',
                keys: ['enter'],
                action: function () {
                    var toid = this.$content.find('.insertUid').val();
                    if(!toid){
	                    $.alert('닉네임을 적어주세요');
	                    return false;
	                }

                    $.ajax({
                		url: "invite.do",
            			type: "post",
            			data : { toid : toid, gid: gid },
            			success : function(data){
            				var msg = data.result.trim().toUpperCase();
            				if(msg == "SUCCESS") {
            					stompClient.send('/alarm/' + toid , {}, 
            									 	JSON.stringify({
            									 		gid: gid,
            									 		toid: toid,
            									 		fromid: nname,
            									 		gname: gname,
            									 		gmemo: '초대',
            									 		senddate: 'NOW'
            										})
            									);
            					$.alert("초대 쪽지가 전달되었습니다!" + "\n(" + toid + ")");
            					
            				} else if(msg == "FAIL") {
            					$.alert("존재하지 않는 이메일입니다!");
            					
            				} else if(msg == "SELF") {
            					$.alert("본인을 초대하실 수 없습니다!");
            					
            				} else if(msg == "ALREADY") {
            					$.alert("이미 초대된 사용자입니다!");
            					
            				} else {
            					$.alert("잠시후 다시 시도해주세요!");
            					
            				}
            			}
                	});


                }
            },
            '취소': {
                btnClass: 'btn-red',
                action: function () {
                //close
                }
            },
        }
    });
}

/* 그룹 탈퇴 */
function group_leave(){
    $.confirm({
        title: '그룹 탈퇴',
        content: '' +
        '<form id="leaveGroup" action="/bit/user/leaveGroup.do" class="formGroup" method="post" onsubmit="return false;>' +
        '<div class="form-group">' +
        '<label>그룹을 탈퇴하시겠습니까</label>' +
        '<input type="hidden" name="uid" value="'+uid+'" class="leaveUid form-control"/>' +
        '<input type="hidden" name="gid" value="'+gid+'" class="banName form-control"/>' +
        '</div>' +
        '</form>',
        closeIcon: true,
        closeIconClass: 'fa fa-close',
        buttons: {
            formSubmit: {
                text: '탈퇴',
                btnClass: 'btn-success',
                action: function () {
                    var name = this.$content.find('.leaveUid').val();

                    $("#leaveGroup").submit();

                }
            },
            '취소': {
                btnClass: 'btn-red',
                action: function () {
                //close
                }
            },
        },
        onContentReady: function(){
        	// 그룹 탈퇴  ajaxFrom()
        	$("#leaveGroup").ajaxForm({
        		success: function(data, statusText, xhr, $form){
        			
        			$.alert("현재 그룹에서 탈퇴하셨습니다!");
        			setTimeout(function(){ 
        				location.href= "/bit/user/mybookmark.do"; 
        			}, 1000);
        		}
        	});
        }
    });
}

/* 그룹 완료 */
function group_complete(){
    $.confirm({
        title: '그룹 완료',
        content: '' +
        '<form id="completeGroup" action="/bit/user/completedGroup.do" class="formGroup" method="post" onsubmit="return false;>' +
        '<div class="form-group">' +
        '<label>해시태그를 입력하세요</label>' +
        '<input type="text" name="htag" class="htagName form-control" required/>' +
        '<input type="hidden" name="gid" value="'+gid+'" class="banName form-control"/>' +
        '</div>' +
        '</form>',
        closeIcon: true,
        closeIconClass: 'fa fa-close',
        buttons: {
            formSubmit: {
                text: '완료',
                btnClass: 'btn-success',
                action: function () {
                    var name = this.$content.find('.htagName').val();
                    if(!name){
	                    $.alert('해시태그를 적어주세요');
	                    return false;
	                }

                    $("#completeGroup").submit();

                }
            },
            '취소': {
                btnClass: 'btn-red',
                action: function () {
                //close
                }
            },
        },
        onContentReady: function(){
        	// 그룹 완료  ajaxFrom()
        	$("#completeGroup").ajaxForm({
        		success: function(data, statusText, xhr, $form){
        			
        			stompClient.send('/alarm' , {}, 
						 	JSON.stringify({
						 		gid: gid,
						 		fromid: nname,
						 		gname: gname,
						 		gmemo: '완료',
						 		senddate: 'NOW'
							})
						);
        			
        			$.alert("현재 그룹이 완료되었습니다!");
        			setTimeout(function(){ 
        				location.href= "/bit/user/mybookmark.do"; 
        			}, 1000);
        		}
        	});
        }
    });
}



/* 마우스 오른쪽 이벤트 (회원강퇴) 추가*/
function myContextMenu() {
	if( grid == 1 ){
		$.contextMenu({
	        selector: '.member', 
	        callback: function(key, opt) {
	            var targetNname = opt.$trigger.text().trim();
	            var hisGrid = opt.$trigger.eq(0).attr("data-grid");
	            
	            if(key == "ban"){
	            	member_ban(targetNname, hisGrid);
	            }
	            else {
					member_auth(key, targetNname, hisGrid);
	            }
	        },
	        items: {
	            "manager": {name: "매니저 승급"/*, icon: "far fa-edit"*/},
	            "member": {name: "매니저 강등"/*, icon: "fas fa-eraser"*/},
	            "sep1": "---------",
	            "ban": {name: "강퇴"/*, icon: "fas fa-ban"*/}
	        }
	    });   
	}
	
	if( grid == 2 ){
		$.contextMenu({
	        selector: '.member', 
	        callback: function(key, opt) {
	            var targetNname = opt.$trigger.text().trim();
	            var hisGrid = opt.$trigger.eq(0).data("grid");
	            
	            if(key == "ban"){
	            	member_ban(targetNname, hisGrid);
	            }
	        },
	        items: {
	            "ban": {name: "강퇴", icon: "fas fa-ban"}
	        }
	    });   
	}
}

/* 멤버 권한 관리 START */
function member_auth(key, targetNname, hisGrid){   	
	//console.log(key + "/" + targetNname + "/" + hisGrid);
	// 그룹원 권한 권리  Ajax
	$.ajax({
		url: "giveGorupRole.do",
		type: "post",
		data : { key: key, nname: targetNname, gid: gid, grid: hisGrid },
		success : function(data){
			var recv_data = data.result;
			
			if(recv_data == 'fail') { $.alert('잠시후 다시 시도해주세요!'); }
			else if(recv_data == 'master') { $.alert('그룹장이십니다!'); }
			else if(recv_data == 'manager') { $.alert('이미 매니저입니다!'); }
			else if(recv_data == 'member') { $.alert('이미 그룹원입니다!'); }
			else if(data.result == "success") { 
				$.alert("해당 권한이 부여되었습니다");
				$("#"+targetNname).attr("data-grid", (key=="manager" ? 2 : 3));
				
				stompClient.send('/alarm', {}, 
					 	JSON.stringify({
					 		gid: gid,
					 		toid: targetNname,
					 		fromid: uid,
					 		gname: gname,
					 		gmemo: key,
					 		senddate: 'NOW'
						})
				);
				
				stompClient.send('/chat/' + gid, {}, 
					 	JSON.stringify({
					 		nname: "시스템",
					 		content: "'" + targetNname + "'님이 " + (key=="manager" ? "매니저" : "그룹원") + "이 되셨습니다!",
					 		profile: "system.png"
						})
				);
			}
			else {
				$.alert("잠시후 다시 시도해주세요!");
			}
		}
	});
}
/* 멤버 권한 관리 END */

/* 멤버 강퇴 START */
function member_ban(targetNname, hisGrid){
    $.confirm({
        title: '멤버 강퇴',
        content: '' +
        '<form id="banMember" action="banMember.do" class="formGroup" method="post" onsubmit="return false;">' +
        '<div class="form-group">' +
        '<label>['+targetNname+'] 회원을 강퇴하시겠습니까</label>' +
        '<input type="hidden" name="nname" value="' + targetNname + '" class="banName form-control"/>' +
        '<input type="hidden" name="gid" value="' + gid + '" class="banName form-control"/>' +
        '<input type="hidden" name="grid" value="' + hisGrid + '" class="banName form-control"/>' +
        '<input type="hidden" name="mygrid" value="' + grid + '" class="banName form-control"/>' +
        '</div>' +
        '</form>',
        closeIcon: true,
        closeIconClass: 'fa fa-close',
        buttons: {
            formSubmit: {
                text: '강퇴',
                btnClass: 'btn-success',
                action: function () {
                    $("#banMember").submit();
                    
                }
            },
            '취소': {
                btnClass: 'btn-red',
                action: function () {
                //close
                }
            },
        },
        onContentReady: function(){
        	
        	// 그룹원 강퇴 ajaxFrom()
        	$("#banMember").ajaxForm({
        		success: function(data, statusText, xhr, $form){
        			var recv_data = data.result;
        			
        			if(recv_data == 'fail') { $.alert('잠시후 다시 시도해주세요!'); }
        			else if(recv_data == 'empty') { $.alert('해당 그룹원이 존재하지 않습니다!'); }
        			else if(recv_data == 'master') { $.alert('그룹장이십니다!'); }
        			else if(recv_data == 'manager') { $.alert('매니저입니다!'); }
        			else {
        				var toid = recv_data;
        				
        				stompClient.send('/alarm/' + toid , {}, 
						 	JSON.stringify({
						 		gid: gid,
						 		toid: toid,
						 		gname: gname,
						 		gmemo: '강퇴',
						 		senddate: 'NOW'
							})
						);
        				
        				$("#" + targetNname).remove();
        				$.alert('해당 그룹원이 강퇴되었습니다!');
        				
        			}
        		}
        	});
        }

    });
}

/* 멤버 강퇴 END */

	