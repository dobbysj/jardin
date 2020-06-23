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
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="user/css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="user/css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="user/css/content.css?v=Y" />
<script type="text/javascript" src="user/js/jquery.min.js"></script>
<script type="text/javascript" src="user/js/top_navi.js"></script>
<script type="text/javascript" src="user/js/left_navi.js"></script>
<script type="text/javascript" src="user/js/main.js"></script>
<script type="text/javascript" src="user/js/common.js"></script>
<script type="text/javascript" src="user/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="user/js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="user/js/jquery.anchor.js"></script>
<script type="text/javascript" src="admin/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="user/js/html5.js"></script>
<script type="text/javascript" src="user/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">

	$(document).ready(function() {
		
		// 체크박스 
		$("#checkAll").click(function(){
			// 전체 선택 체크박스가 체크된 상태일 경우
			if($('#checkAll').prop('checked')){
				// 해당 화면에 있는 모든 checkbox들 체크
				$('input[name=chk]:checkbox').each(function(){
					$(this).prop('checked', true);
				});
				
				var sum = 0;
		 		var count= $('input[name=chk]:checkbox').length;
		 		for(var i=0; i<count; i++){
						var p_price1 = $('.td1').eq(i).text();
			 			var p_price2 = p_price1.substring(0,(p_price1.length-1));
						sum += Number(p_price2);
		 		}
		 		$('#sum1').text(sum);
				
		 		if(sum>=30000){
		 			$('#del_price').text("0");
		 		}else{
		 			$('#del_price').text("3000");
		 		}
		 		var deliv_price = Number($('#del_price').text());
		 		var final_price = sum + deliv_price;
		 		$('#sum2').text(final_price);
		 		var total_point = sum * 0.01;
		 		$('#total_m').text(total_point);
				
				// 전체 선택 체크박스 해제된 경우
			}else{
				// 해당 화면에 있는 모든 checkbox들 체크 해제
				$('input[name=chk]:checkbox').each(function(){
					$(this).prop('checked', false);
				});
				
				$('#sum1').text("0");
				$('#del_price').text("0");
				$('#sum2').text("0");
				$('#total_m').text("0");
			}
		});
		
		$(".chk").click(function(){
			var checkboxLength = $('input:checkbox[name="chk"]').length;
			var checkedLength = $('input:checkbox[name="chk"]:checked').length;
			if(checkboxLength == checkedLength){
				$('#checkAll').prop('checked', true);
			}else {
				$('#checkAll').prop('checked', false);
			}
			
		});
		
		// 전체 선택 버튼 클릭 시, 
		$("#selectbtn").click(function(){
				// 해당 화면에 있는 모든 checkbox들 체크
				$('#checkAll').prop('checked', true);
				$('input:checkbox[name="chk"]').each(function(){
					$(this).prop('checked', true);
				});
		});
	
	});
	
	// 수량 변경에 따른 해당 제품 총합계 변경
	function ch1(price, num){
		var id = document.getElementById("ipt_"+num);
		$('#td1_'+num).text(price * id.value+"원");
		var total_price = 0;
		
		itemSum();
	}	
	
	// 체크한 상품 총 주문금액 & 적립 포인트
	function itemSum(){
		
		var sum = 0;
		var count = $('input[name=chk]:checkbox').length;
		for(var i=0; i<count; i++ ){
			if($('input[name=chk]:checkbox').eq(i).is(":checked")==true){
				var p_price1 = $('.td1').eq(i).text();
	 			var p_price2 = p_price1.substring(0,(p_price1.length-1));
				sum += Number(p_price2);
			}
		}
		
		$('#sum1').text(sum);
		if(sum>=30000){
			$('#del_price').text("0");
		}else{
			$('#del_price').text("3000");
		}
		var deliv_price = Number($('#del_price').text());
		var final_price = sum + deliv_price;
		$('#sum2').text(final_price);
		var total_point = sum * 0.01;
		$('#total_m').text(total_point);
		
	}
	
	// 바로구매 
	function buyNow(p_num, m_num){
		var	p_amt = $('#ipt_'+p_num).val();
		var arrData = [m_num, p_num, p_amt];
		
		$.ajax({
	        	type:"POST",
	        	url : "cartUpdate",
	        	data: JSON.stringify(arrData),
	         	contentType: "application/json",
	            success : function(data){
	                        if(data == 1){
		    	       	}
		        	  },
			error:function(){
					alert("서버통신실패");
				  }
		});

		window.location.href="payment?m_num="+m_num;
	}
	
	// 선택한 제품 장바구니에서 삭제
    function cart_del(p_num, m_num) {

    	var arrData = [p_num, m_num]; 
    	
        if(confirm("선택하신 상품을 장바구니에서 삭제하시겠습니까?")){
           
        	$.ajax({
                url : "cart_del",
                method : "POST",
                data: JSON.stringify(arrData),
                dataType : "json",
                contentType: "application/json",
                success : function(val){
                   if(val == 1){
                      location.reload();
                   }
                },
                error : function(){
                   alert("서버통신실패");
                }
             });
        }
     }
	
    // 체크한 제품 한 번에 삭제
    function chk_del(m_num){
    	var count = $('input:checkbox[name="chk"]:checked').length;
		if(count>0){
			if(confirm("선택하신 상품을 장바구니에서 삭제하시겠습니까?")){
				$("input[name=chk]:checked").each(function(){
			  		var chk_value =$(this).attr('id');  //id = chk_${p_num}
			    	var p_num = parseInt(chk_value.substring(4,chk_value.length));
			    	var arrData = [p_num, m_num]
			    	$.ajax({
			        	type:"POST",
			        	url : "cart_del",
			        	data: JSON.stringify(arrData),
			         	contentType: "application/json",
			            success : function(data){
			                        if(data == 1){
			                           location.reload();
			                        }
			                      },
			            error:function(){
			                   alert("서버통신실패");
			            }
			        });
				});
			}
		}else {
			alert("선택하신 상품이 없습니다. 삭제하실 상품을 먼저 선택해주시기 바랍니다.");
		}
	}
    
    // 전체상품 주문하기
    function orderAll(m_num){
    	// 전체상품 주문하기 버튼 클릭 시, 모든 상품의 체크박스 checked
    	$('#checkAll').prop('checked', true);
		$('input[name=chk]:checkbox').each(function(){
			$(this).prop('checked', true);
		});
	
    	$('input:checkbox[name=chk]:checked').each(function(){
    		var chk_value =$(this).attr('id');  //id = chk_${p_num}
    		var p_num = parseInt(chk_value.substring(4,chk_value.length));
	    	var	p_amt = $('#ipt_'+p_num).val();
			var arrData = [m_num, p_num, p_amt];
			
		$.ajax({
	        	type:"POST",
	        	url : "cartUpdate",
	        	data: JSON.stringify(arrData),
	         	contentType: "application/json",
	            success : function(data){
	                        if(data == 1){
		    	       	}
		        	  },
			error:function(){
					alert("서버통신실패");
				  }
		});
	});
    	location.href="payment?m_num="+m_num;
    }

    
 // 선택상품 주문하기
    function orderSel(m_num){
	 
    	var count = $('input:checkbox[name="chk"]:checked').length;
		if(count>0){

	    	$('input:checkbox[name=chk]:checked').each(function(){
	    		var chk_value =$(this).attr('id');  //id = chk_${p_num}
	    		var p_num = parseInt(chk_value.substring(4,chk_value.length));
		    	var	p_amt = $('#ipt_'+p_num).val();
				var arrData = [m_num, p_num, p_amt];
				
				$.ajax({
			        	type:"POST",
			        	url : "cartUpdate",
			        	data: JSON.stringify(arrData),
			         	contentType: "application/json",
			            success : function(data){
			                        if(data == 1){
				    	       	}
				        	  },
					error:function(){
							alert("서버통신실패");
						  }
				});
			});
	    	window.location.href="payment?m_num="+m_num;
		}else {
			alert("선택하신 상품이 없습니다. 주문하실 상품을 먼저 선택해주시기 바랍니다.");
		}
	}
    

    
</script>
</head>
<body>



<!--익스레이어팝업-->
<div id="ieUser" style="display:none">
	<div class="iewrap">	
		<p class="img"><img src="user/images/ico/ico_alert.gif" alt="알림" /></p>
		<p class="txt">IE버전이 낮아 홈페이지 이용에 불편함이 있으므로 <strong>IE9이상이나 다른 브라우저</strong>를 이용해 주세요. </p>
		<ul>
			<li><a href="http://windows.microsoft.com/ko-kr/internet-explorer/download-ie" target="_blank"><img src="user/images/ico/ico_ie.gif" alt="IE 최신브라우저 다운" ></a></li>
			<li><a href="https://www.google.com/intl/ko/chrome/browser" target="_blank"><img src="user/images/ico/ico_chrome.gif" alt="IE 최신브라우저 다운" ></a></li>
			<li><a href="http://www.mozilla.org/ko/firefox/new" target="_blank"><img src="user/images/ico/ico_mozila.gif" alt="MOZILA 최신브라우저 다운" ></a></li>
			<li><a href="http://www.apple.com/safari" target="_blank"><img src="user/images/ico/ico_safari.gif" alt="SAFARI 최신브라우저 다운" ></a></li>
			<li><a href="http://www.opera.com/ko/o/ie-simple" target="_blank"><img src="user/images/ico/ico_opera.gif" alt="OPERA 최신브라우저 다운" ></a></li>		
		</ul>
		<p class="btn" onclick="msiehide();"><img src="user/images/ico/ico_close.gif" alt="닫기" /></p>
	</div>
</div>
<!--//익스레이어팝업-->
<!--IE 6,7,8 사용자에게 브라우저 업데이터 설명 Div 관련 스크립트-->
 <script type="text/javascript">

     var settimediv = 200000; //지속시간(1000= 1초)
     var msietimer;

     $(document).ready(function () {
         msiecheck();
     });

     var msiecheck = function () {
         var browser = navigator.userAgent.toLowerCase();
         if (browser.indexOf('msie 6') != -1 ||
                browser.indexOf('msie 7') != -1 ||
				 browser.indexOf('msie 8') != -1) {
             msieshow();			 
         }
         else {
             msiehide();
         }
     }

     var msieshow = function () {
        $("#ieUser").show();
        msietimer = setTimeout("msiehide()", settimediv);
     }

     var msiehide = function () {
		$("#ieUser").hide();
        clearTimeout(msietimer);
     }
</script>

<div id="allwrap">
<div id="wrap">

	<jsp:include page="../header.jsp" />

	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">MY PAGE</a></li>
				<li class="last">장바구니</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title">MY PAGE<span>마이페이지</span></div>
				<ul>	
					<li><a href="#" id="leftNavi1">주문/배송 조회</a></li>
					<li><a href="#" id="leftNavi2">반품/배송 현황</a></li>
					<li><a href="cart?m_num=${memDto.m_num }" id="leftNavi3">장바구니</a></li>
					<li><a href="wishlist?m_num=${memDto.m_num }" id="leftNavi4">위시리스트</a></li>
					<li><a href="mycoupon?m_num=${memDto.m_num }" id="leftNavi5">나의 쿠폰</a></li>
					<li><a href="mypoint?m_num=${memDto.m_num }" id="leftNavi6">나의 포인트</a></li>
					<li><a href="#" id="leftNavi7">1:1문의</a></li>
					<li><a href="#" id="leftNavi8">회원정보 수정</a></li>
					<li class="last"><a href="#" id="leftNavi9">회원 탈퇴</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(3,0);</script>

			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>장바구니</strong><span>장바구니에 담긴 상품을 확인해보세요.</span></h2>
					
					<div class="myInfo">
						<ul>
							<li class="info"><strong>${m_id }</strong> 님의 정보를 한눈에 확인하세요.</li>
							<li>보유 쿠폰<br/><span class="num">${coupon }</span> <span class="unit">장</span></li>
							<fmt:formatNumber var="mypoint" value="${memDto.m_point }" type="number"/>
							<li class="point">내 포인트<br/><span class="num">${mypoint }</span> <span class="unit">P</span></li>
							<li class="last">진행중인 주문<br/><span class="num">${order }</span> <span class="unit">건</span></li>
						</ul>
					</div>

				<!-- 장바구니에 상품이 있을경우 -->
					<!-- 장바구니 상품 -->
					<h3>장바구니에 담긴 상품 <span>장바구니에 담긴 상품은 30일간 보관됩니다.</span></h3>
					<div class="orderDivNm">
						<table summary="장바구니에 담긴 상품들을 전체선택, 상품명, 가격/포인트, 수량, 합계, 주문 순으로 조회 및 주문을 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>장바구니 상품목록</caption>
							<colgroup>
							<col width="7%"/>
							<col width="*" />
							<col width="14%" class="tnone" />
							<col width="10%" class="tw14"/>
							<col width="14%" class="tw28"/>
							<col width="14%" class="tnone" />
							</colgroup>
							<thead>
								<th scope="col"><input type="checkbox" checked id="checkAll"/></th>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격/포인트</th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
								<th scope="col" class="tnone">주문</th>
							</thead>
							<tbody>
								<c:forEach var="cartlist" items="${cartlist }">
								<tr>
									<td><input type="checkbox" checked class="chk" name="chk" id="chk_${cartlist.pDto.p_num }" onclick="itemSum()"/></td>
									<td class="left">
										<p class="img"><img src="user/images/img/sample_product.jpg" alt="상품" width="66" height="66" /></p>

										<ul class="goods">
											<li>
												<a href="detail?p_num=${cartlist.pDto.p_num }">${cartlist.pDto.p_name }</a>
											</li>
										</ul>
									</td>
									<td class="tnone">${cartlist.pDto.p_price } 원<br/><span class="pointscore">${cartlist.pDto.p_point } Point</span></td>
									<td><input id="ipt_${cartlist.pDto.p_num}" class="spinner" onblur="ch1(${cartlist.pDto.p_price }, ${cartlist.pDto.p_num})" value="${cartlist.ca_amount }" maxlength="3" /></td>
									<td class="td1" id="td1_${cartlist.pDto.p_num}">${cartlist.pDto.p_price * cartlist.ca_amount  }원</td>
									<td class="tnone">
										<ul class="order">	
											<li><a href="#" onclick="buyNow(${cartlist.pDto.p_num }, ${memDto.m_num })" class="obtnMini iw70">바로구매</a></li>
											<li><a href="#" onclick="cart_del(${cartlist.pDto.p_num }, ${memDto.m_num })" class="nbtnMini iw70">상품삭제</a></li>
										</ul>
									</td>
								</tr>
								<c:set var="sum" value="${sum + cartlist.pDto.p_price * cartlist.ca_amount }" />
								<c:set var="sumpoint" value="${sumpoint + cartlist.pDto.p_point * cartlist.ca_amount}"/>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<div class="btnArea">
						<div class="bRight">
							<ul>
								<li><a id="selectbtn" class="selectbtn">전체선택</a></li>
<!-- 								<li><a href="#" class="selectbtn2">선택수정</a></li> -->
								<li><a id="selectbtn2" class="selectbtn2" onclick="chk_del(${memDto.m_num })">선택삭제</a></li>
							</ul>
						</div>
					</div>
					<!-- //장바구니 상품 -->
					

					<!-- 총 주문금액 -->
					<div class="amount">
						<h4>총 주문금액</h4>
						<ul class="info">
							<li>
								<span class="title">상품 합계금액</span>
								<span class="won"><strong id="sum1">${sum }</strong> 원</span>
							</li>
							<li>
								<span class="title">배송비</span>
								<span class="won"><strong id="del_price">
									<c:if test="${sum < 30000 }">
										<c:out value="3000"/>
									</c:if>
									<c:if test="${sum >= 30000 }">
										<c:out value="0"/>
									</c:if>
								</strong> 원</span>
							</li>
						</ul>
						<ul class="total">
							<li class="mileage">(적립 마일리지 <strong id="total_m"><c:out value="${sumpoint }"/></strong> Point) </li>
							<li class="txt"><strong>결제 예정 금액</strong></li>
							<li class="money"><span id="sum2">${sum }</span> 원</li>
						</ul>
					</div>
					<!-- //총 주문금액 -->

					<div class="cartarea">
						<ul>
							<li><a class="ty1" onclick="orderSel(${memDto.m_num })">선택상품 <span>주문하기</span></a></li>
							<li><a class="ty2" onclick="orderAll(${memDto.m_num })">전체상품 <span>주문하기</span></a></li>
							<li class="last"><a href="#" class="ty3">쇼핑 <span>계속하기</span></a></li>
						</ul>
					</div>

				<!-- //장바구니에 상품이 있을경우 -->


				<!-- 장바구니에 상품이 없을경우
					<div class="noting">
						<div class="point"><span class="orange">장바구니</span>에 담긴 상품이 없습니다.</div>

						<p>장바구니에 담긴 상품은 30일간만 보관됩니다.<br/>더 오래 보관하고 싶은 상품은 <u>위시리스트</u>에 담아주세요.</p>

						<a href="#">쇼핑 계속하기</a>
					</div>
				 //장바구니에 상품이 없을경우 -->

				</div>
			</div>
			<!-- //contents -->


<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<style type="text/css">
.ui-corner-all{border-bottom-right-radius:0 !important; border-bottom-left-radius:0 !important; border-top-left-radius:0 !important; border-top-right-radius:0 !important;}
.ui-widget-content{border:0;}
.ui-spinner-input{width:44px; margin:0; border:1px #ddd solid; padding:2px 0 2px 5px; font-family:'Nanum Gothic' !important; font-size:12px !important;}
</style>

<script type="text/javascript">
$(function() {
	var spinner = $( ".spinner" ).spinner({ min: 1, max: 999 });
});
</script>



		</div>
	</div>
	<!-- //container -->




	<jsp:include page="../footer.jsp" />



</div>
</div>
</body>
</html>