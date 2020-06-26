<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title> JARDIN SHOP </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN" />
<meta name="keywords" content="JARDIN" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="user/css/reset.css" />
<link rel="stylesheet" type="text/css" href="user/css/content.css" />
<script type="text/javascript" src="user/js/jquery.min.js"></script>
<script type="text/javascript" src="user/js/common.js"></script>
<script type="text/javascript">
$(function() {

	alert(${userNum});
	
});


	function insert_qna() {
		$.ajax({
			  type: 'post',
			  url:"./inquiry_insert",
			  data: $("#updateReview").serialize(), // form에 있는 input값을 controller전송
			  contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			  success:function(data){
			   if(data==1){
			    alert("질문 등록이 완료되었습니다.");
			    parent.$.fancybox.close();
			   }
			   
			  },
			  error:function(request,status,error){
			   alert("실패 : "+error);
			  }
			  
			  });
	}

</script>
</head>
<body>
<div id="layerWrap">

<div class="inputWrap">
		
	<div class="inputBody">
		<div class="title">질문과 답변</div>
		<p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;"><img src="user/images/btn/btn_input_close.gif" alt="닫기" /></a></p>
		
		<form action="inquiry_insert" method="post" name="inquiry" id="inquiry">	
		<div class="checkDivMt">
			<table summary="문의사항을 비밀번호, 제목, 내용 순으로 작성 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
				<caption>질문과 답변</caption>
				<colgroup>
				<col width="19%" class="tw30" />
				<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><span>비밀번호</span></th>
						<td>
							<input type="password" name="qu_pw" class="w134" />
						</td>
					</tr>
					<tr>
						<th scope="row"><span>제목</span></th>
						<td>
							<input type="text" name="qu_title" class="wlong" />
						</td>
					</tr>
					<tr>
						<th scope="row"><span>내용</span></th>
						<td>
							<textarea class="tta"  name="qu_content"></textarea>
							<input type="hidden" name="p_num" value="${p_num}">
							<input type="hidden" name="m_num" value="${userNum}">
						</td>
					</tr>								
				</tbody>
			</table>
		</div>
		</form>
			
		<!-- Btn Area -->
		<div class="btnArea">
			<div class="bCenter">
				<ul>								
					<li><a href="#" onclick="insert_qna()" class="sbtnMini">확인</a></li>
					<li><a onclick="parent.$.fancybox.close();" href="javascript:;" class="nbtnbig">취소</a></li>
				</ul>
			</div>
		</div>
		<!-- //Btn Area -->

	</div>

</div>


</div>
</body>
</html>