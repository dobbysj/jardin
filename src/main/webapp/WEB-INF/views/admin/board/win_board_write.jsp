<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>        
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>당첨자 게시글 작성</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="se2/admin/js/HuskyEZCreator.js" charset="utf-8"></script> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- 페이지 로딩시 초기화 --> 
		<script>
		$(document).ready(function(){
				nhn.husky.EZCreator.createInIFrame({ 
					oAppRef: editor, 
					elPlaceHolder: 'txtContent', 
					sSkinURI: '/plugin/smarteditor2/SmartEditor2Skin.html', 
					fCreator: 'createSEditor2' 
					}); 
				}); 
		
		window.onload=function(){
			${alerttext}
		}
	
		</script>
		<style type="text/css">
			#input_form{
			margin: 20px;	
			}
			table {
				 min-width: 1000px;
			}
			table tr td:NTH-OF-TYPE(1) {
				width: 100px;
				height: 30px;
			}
			#btn_div{
			 text-align: center;
			}
		</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>당첨자 게시글 등록</h1>
			<form action="win_board_insert" name="inputform" method="post">
				<div id="input_form">
					<h1>게시글 작성</h1>
					<table border="1">
						<tr>
							<td>작성자</td>
							<td>${adminGrade }(${adminId })</td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="wb_title"></td>
						</tr>			
						<tr>
							<td>이벤트명</td>
							<td>
								<select name="e_num">
									<option value="0">선택 안 함</option>
									<c:forEach var="event_list" items="${event_list }">
										<option value="${event_list.eventdto.e_num }">${event_list.eventdto.e_title }</option>
									</c:forEach>
								</select>							
								<input type="text" name="event_title">
							</td>
						</tr>														
						<tr>
							<td>내용</td>
							<td>
								<!-- 텍스트에디터로 변경?★★★★★★★★★ -->
								<textarea name="wb_content" id="smartEditor" style="width:100%; height: 412px;"></textarea>
							</td>
						</tr>
					</table>
					
					<div id="btn_div">
						<button type="button" onclick="location.href='win_list'">목록</button>
						<button type="submit" >등록</button>
					</div>
					<input type="hidden" value="${adNum }" name="ad_num">					
				</div>
			</form>
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>