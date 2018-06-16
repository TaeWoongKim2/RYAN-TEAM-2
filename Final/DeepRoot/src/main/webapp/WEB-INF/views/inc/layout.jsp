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
    
    <!-- Bootstrap Common CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <!-- Bootstrap Common CSS END -->

    <!-- Main Page CSS -->
    <link href="css/mainpage/main.css" rel="stylesheet">
    <link href="css/mainpage/header.css" rel="stylesheet">
    <link href="css/mainpage/footer.css" rel="stylesheet">
    <link href="css/mainpage/list_table.css" rel="stylesheet">
    <link href="css/mainpage/responsive.css" rel="stylesheet">
    <link href="css/mainpage/login-register.css?ver=1" rel="stylesheet" />
    <link href="css/addBookmarkStepModal-register.css" rel="stylesheet" />
    <!-- Main Page CSS END -->
    
    <!-- User Info Page CSS -->
    <link href="css/userinfo/userinfo.css?ver=2" rel="stylesheet">
	<!-- User Info CSS END -->
	
    <!-- Login / roll-in Modal Script Start -->
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="js/script.js"></script>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <!-- Login / roll-in Modal Script Start END -->

    <!-- Category Input Script START -->
    <script src="js/category_insert.js"></script>
    <!-- Category Input Script END -->
    
    <script>
        /**************************  Table Start  **********************************/
        $(function() {
        	$(document).on("dblclick", ".url", function() {
        		window.open(this.dataset.url, '_blank'); 
        	});
            $(document).on("click", ".url", function() { });
            $('.url').on({
                mouseover: function() {
                    $(this).children('.url_link_btn').css('display', 'block')
                },
                mouseleave: function() {
                    $(this).children('.url_link_btn').css('display', 'none')
                }
            });
            $('li').on({
                mouseover: function() {
                    $(this).children('button').css('display', 'block')
                },
                mouseleave: function() {
                    $(this).children('button').css('display', 'none')
                }
            });
            $(document).on("click", ".show_close_img", function() {
                if ($(this).attr('src') == 'icon/all_show.png') {
                    $(this).attr('src', 'icon/all_close.png');
                    $(this).parent().parent().children('ul').hide(500);
                } else {
                    $(this).attr('src', 'icon/all_show.png');
                    $(this).parent().parent().children('ul').show(500);
                }
            });
        });
        /**************************  Table END  **********************************/

        /* ******************** Scroll Shadow Start *************************** */
        $(function() {
            var header = $('#header');
            $(window).scroll(function(e) {
                if (header.offset().top !== 0) {
                    if (!header.hasClass('shadow')) {
                        header.addClass('shadow');
                    }
                } else {
                    header.removeClass('shadow');
                }
            })
        });
        /* ******************** Scroll Shadow END *************************** */
        
        /**************************  Preview Start  **********************************/
    	function preview(abid){
        	$.ajax({
        		url: "preview.do",
				type: "post",
				data : {
					abid : abid // 북마크 ID
				},
				success : function(data){
					
					$('#preview_content').fadeOut(10, function(){
						
						// console.log(data);
						var layout = '<img src="${pageContext.request.contextPath}/images/homepage/' + abid + '.png" style="width:100%; height:100%">';
			        	$("#layout").html(layout);
						var explain = '<img src=' + data.image + ' style="width:100%; height:50%">';
						$("#explain").html(explain);
						var comment = "사이트명 : " + data.title + "<br> 설명 : " + data.description;
						$("#comment").html(comment);
                        $('#preview_content').fadeIn(1000);
                        
                    });
				}
        	});
        };
        
        /**************************  Preview End  **********************************/
        
        /**************************  Category Click Evnet Start  *******************/
        $(function(){
        	var categoryList = categoryListAjax(); // 전체 카테고리 리스트 비동기로 받아오기
			var selectedCategory = [];
			
        	$(document).on("click", ".category", function() {
				var id = $(this).text().trim();
				/* 
					category class를 클릭한 text가 Show All일 경우, 전체 카테고리 리스트를 slideDown!! 
					선택된 카테고리 리스트는 배경색 기존색으로 변경(removeClass)
					Show All 카테고리는 custom색으로 변경		
				*/
				if (id == "Show All") {
					$.each(categoryList, function(index, element) {
						$('li[id="' + element + '"]').slideDown("slow");
					});
					$.each(selectedCategory, function(index, element) {
						$(".category").removeClass("reddiv");
					});

					$("#showall").addClass("reddiv");
					selectedCategory = []; 

				} else {
					/* Show All이 아닌 카테고리 선택시 Show All style 배경색 기존색으로 변경(removeclass)*/
					$("#showall").removeClass("reddiv");
					
					/* 선택된 카테고리를 다시 클릭시 해당 카테고리만 SelectCategory에서 지우기 */
					if($(this).hasClass("reddiv") == true) {
						$(this).removeClass("reddiv");
						
						const idx = selectedCategory.indexOf(id);
						selectedCategory.splice(idx, 1);
						
						// 이미 선택된 카테고리가 1개 이상인 경우
						if(selectedCategory.length > 0){
							$.each(categoryList, function(index, element) {
								$('li[id="' + element + '"]').slideUp("slow");
							});
							$.each(selectedCategory, function(index, element) {
								$('li[id="' + element + '"]').slideDown("slow");
							});
						}else { // 선택된 카테고리가 하나도 없을 경우 Show All로 변경
							$.each(categoryList, function(index, element) {
								$('li[id="' + element + '"]').slideDown("slow");
							});
							$.each(selectedCategory, function(index, element) {
								$(".category").removeClass("reddiv");
							});

							$("#showall").addClass("reddiv");
						}
						
					}else { 
						/* 
							카테고리를 선택한 경우 
							전체 카테고리 리스트 SlideUp, 선택된 카테고리 리스트는 SlideDown
						*/
						selectedCategory.push(id);
						$(this).addClass("reddiv");
						
						$.each(categoryList, function(index, element) {
							$('li[id="' + element + '"]').slideUp("slow");
						});
						
						$.each(selectedCategory, function(index, element) {
							if(index == 0) {
								$('li[id="' + element + '"]').slideDown("slow");
							}else {
								// 선택된 카테고리 보여줄 시 이전 카테고리 위로 insert해서 보여줌
								$('li[id="' + element + '"]').insertBefore($('li[id="' + selectedCategory[index-1] + '"]'));
								$('li[id="' + element + '"]').slideDown("slow");
							}
							
						});
					}
					
				}
				
			});
        });
        
        // 카테고리 리스트 비동기로 받아와서 리턴해주는 함수
        function categoryListAjax() {
        	var categoryListAjax = [];
        	$.ajax({
        		url : "categoryList.do",
        		type : "POST",
        		success : function(data) {
        			//console.log(data); // 카테고리 리스트 확인 콘솔
        			$.each(data, function(index, element) {
        				$.each(element, function(index2, element2){
        					//console.log(element2.acname);
        					categoryListAjax.push(element2.acname);
        				});
        			});
        		},
        		error: function (error) {
        		    alert('error : ' + eval(error));
        		}
        	});
        	return categoryListAjax;
        };
        
        /**************************  Category Click Evnet End  *******************/
        
    </script>
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
	
	
	<!-- Common Script START -->
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/wow.min.js"></script>
    <!-- Script Common END -->

    <!-- Custom Script START -->
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript" src="js/login.js?ver=1"></script>
    <!-- Custom Script END -->
</body>
</html>