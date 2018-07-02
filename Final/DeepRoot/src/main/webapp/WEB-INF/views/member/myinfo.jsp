<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
	
	<!-- Edit User Info START -->
	<section class="userinfo">
        <div class="container">
            <div class="row">
                <div class="form">
                	<h1>개인정보 수정 </h1>
                	<p>Edit membership information</p>
                    <hr>
                	<div class="error"></div>
                	<form id="re-confirm-form">
                		<label class="control-label" for="pwd_check">Password check</label>
                        <input id="pwd_check" class="form-control" type="password" placeholder="Password check" name="pwd" required>
                		<center>
                            <input id="re-confirm-password-btn" type="button" class="btn btn-default confirm" value="확인">
                            <input type="button" class="btn btn-default cancel" value="취소" onclick="location.href='index.do'">
                        </center>
                	</form>
                
                    <form id="edit-info-form" action="myInfo.do" method="post" enctype="multipart/form-data" style="display: none;">   
                        <label class="control-label" for="photo">Profile Photo</label>
                        <br>  
                        <center>
                            <img class="currentProfileImg" id="currentProfileImg" src="images/profile/${sessionScope.info_userprofile}" onerror="images/profile.png">
                            <input type="file" id="profileImg" name="uploadFile" accept="image/jpeg, image/png" style="display: none;" onchange="profileImgUpLoad(this)">
                        </center>
                            
                        <label class="control-label" for="uid_edit">Email</label>
                        <input id="uid_edit" class="form-control" type="text" name="uid" value="${sessionScope.info_userid}" readonly><br>

                        <label class="control-label" for="nname_edit">Nickname</label>
                        <input id="nname_edit" class="form-control" type="text" name="nname" value="${sessionScope.info_usernname}" readonly><br>

                        <label class="control-label" for="pwd_edit">Password</label>
                        <input id="pwd_edit" class="form-control" type="password" placeholder="Enter Password" name="pwd" required><br>

                        <label class="control-label" for="pwd_confirmation">Repeat Password</label>
                        <input id="pwd_confirmation" class="form-control" type="password" placeholder="Repeat Password" name="pwd_confirmation" required><br>

                        <center>
                            <input id="edit-who-info-btn" type="submit" class="btn btn-default confirm" value="수정">
                            <input type="button" class="btn btn-default cancel" value="취소" onclick="location.href='index.do'">
                        </center>
                        
                        <a id="rollout-member" href="rollout.do?uid=${sessionScope.info_userid}" style="float: right;">회원탈퇴를 하시겠습니까?</a>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Edit User Info END -->
    
    <script type="text/javascript">
    
    
        
    $(function() {
	    $('#re-confirm-password-btn').dblclick(function(){});
		$('#re-confirm-password-btn').click(function(){
			$.ajax({ 
	    		url:"reconfirm.do",
	            type:"POST",
	            data: {	"uid": '${sessionScope.info_userid}', "pwd": $('#pwd_check').val() },
	            dataType:"json",
	            success:function(data){
	            	if(data.result == 'pass') {
	            		$('#re-confirm-form').css('display', 'none');
	            		$('#edit-info-form').css('display', 'block');
	            	}
	            	else {
	            		alert('비밀번호를 재확인 해주세요');
	            		$('#pwd_check').val('');
	            	}
	            },
	            error:function(e){  
	            	console.log("Error: " + e.responseText); 
	            }
	        });
		});
		$("#currentProfileImg").click(function(){
            $("input[id='profileImg']").click();
        })
        
       	/* $("#rollout-member").dblclick(function(){});
		$("#rollout-member").click(function(){
			
			
		}); */
    });
    $(function() {
        //비밀번호 길이 확인 함수
        $('#pwd_edit').keyup(function() {
            if (($('#pwd_edit').val().trim() == "") || !($('#pwd_edit').val().length >= 5 && $('#pwd_edit').val().length <= 15)) {
                $('.error').addClass('alert alert-danger').html("비밀번호는 5자~15자 사이로 만들어야 합니다.");
                $("#edit-who-info-btn").prop("disabled", true);
            } else if(!($('#pwd_edit').val().length >= 5 && $('#pwd_edit').val().length <= 15) || !($('#pwd_edit').val() == $('#pwd_confirmation').val())) {
                    $('.error').addClass('alert alert-danger').html("입력한 비밀번호가 다릅니다.");
                    $("#edit-who-info-btn").prop("disabled", true);
            } else {
                $('.error').removeClass('alert alert-danger').html('');
                $("#edit-who-info-btn").prop("disabled", false);
            }
        });

      	//비밀번호 동일 확인 함수
        $('#pwd_confirmation').keyup(function() {
            if (!($('#pwd_edit').val() == $('#pwd_confirmation').val())) {
                $('.error').addClass('alert alert-danger').html("입력한 비밀번호가 다릅니다.");
                $("#edit-who-info-btn").prop("disabled", true);
            } else if(($('#pwd_edit').val().trim() == "") || !($('#pwd_edit').val().length >= 5 && $('#pwd_edit').val().length <= 15)) {
                $('.error').addClass('alert alert-danger').html("비밀번호는 5자~15자 사이로 만들어야 합니다.");
                $("#edit-who-info-btn").prop("disabled", true);
            } else {
                $('.error').removeClass('alert alert-danger').html('');
                $("#edit-who-info-btn").prop("disabled", false);
            }
        });
        
    });

   
    
    function profileImgUpLoad(img) {
        if(img.files && img.files[0]){
            var reader = new FileReader();
                reader.onload=function(e){
                    $('#currentProfileImg').attr('src', e.target.result);
                    $('#currentProfileImg').attr('width', '150px');
                    $('#currentProfileImg').attr('height', '150px');
                }
                reader.readAsDataURL(img.files[0]);
        }
    }
    
    /* $("#edit-who-info-btn").prop("disabled", true);
    
    $("#edit-who-info-btn").on("dblclick", function(){});
	$("#edit-who-info-btn").on("click", function(){
		console.log("xxxx");
			if($('#pwd_edit').hasClass('form-control')
			== $('#pwd_confirmation').hasClass('form-control')) {
				$("#edit-who-info-btn").prop("disabled", false);
			}else {
			
			alert("비밀번호를 모두 작성해주세요");
			$("#edit-who-info-btn").prop("disabled", true);
			}
		
	}); */
	</script>