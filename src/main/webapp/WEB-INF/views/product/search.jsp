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
<!--[if lt IE 9]>
<script type="text/javascript" src="user/js/html5.js"></script>
<script type="text/javascript" src="user/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
$(document).ready(function() {
	


});
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

	<div id="header">
		
		<div id="snbBox">
			<h1><img src="user/images/txt/logo.gif" alt="JARDIN SHOP" /></h1>
			<div id="quickmenu">
				<div id="mnaviOpen"><img src="user/images/btn/btn_mnavi.gif" width="33" height="31" alt="메뉴열기" /></div>
				<div id="mnaviClose"><img src="user/images/btn/btn_mnavi_close.gif" width="44" height="43" alt="메뉴닫기" /></div>
				<ul>
					<li><a href="#">EVENT</a></li>
					<li><a href="#">CUSTOMER</a></li>
					<li><a href="#">COMMUNITY</a></li>
				</ul>
			</div>
			<div id="snb">
				<ul>
					<li><a href="#">LOGIN</a></li>
					<li><a href="#">JOIN</a></li>
					<li><a href="#">MY PAGE</a></li>
					<li><a href="#">CART</a></li>
				</ul>

				<div id="search">
					<input type="text" class="searchType" />
					<input type="image" src="user/images/btn/btn_main_search.gif" width="23" height="20" alt="검색하기" />
				</div>
			</div>
		</div>
	</div>


	<!-- GNB -->
	<div id="gnb">
		
		<div id="top">
			<ul>
				<li class="brand t1"><a href="#" id="topNavi1">JARDIN’s BRAND</a>
					<ul id="topSubm1">
						<li><a href="#">클래스</a></li>
						<li><a href="#">홈스타일 카페모리</a></li>
						<li><a href="#">드립커피백</a></li>
						<li><a href="#">카페리얼 커피</a></li>
						<li><a href="#">오리지널커피백</a></li>
						<li><a href="#">카페리얼 음료</a></li>
						<li><a href="#">마일드커피백</a></li>
						<li><a href="#">워터커피</a></li>
						<li><a href="#">카페포드</a></li>
						<li><a href="#">모히또파티</a></li>
						<li><a href="#">테이크아웃 카페모리</a></li>
						<li><a href="#">포타제</a></li>
					</ul>
				</li>
				<li class="t2"><a href="#" id="topNavi2">원두</a>
					<ul id="topSubm2">
						<li><a href="#">클래스</a></li>
						<li><a href="#">로스터리샵</a></li>
						<li><a href="#">커피휘엘</a></li>
						<li><a href="#">산지별 생두</a></li>
					</ul>
				</li>
				<li class="t1"><a href="#" id="topNavi3">원두커피백</a>
					<ul id="topSubm3">
						<li><a href="#">드립커피 로스트</a></li>
						<li><a href="#">오리지널커피백</a></li>
						<li><a href="#">마일드커피백</a></li>
					</ul>
				</li>
				<li class="t2"><a href="#" id="topNavi4">인스턴트</a>
					<ul id="topSubm4">
						<li><a href="#">까페모리</a></li>
						<li><a href="#">홈스타일카페모리</a></li>
						<li><a href="#">포타제</a></li>
					</ul>
				</li>
				<li class="t1"><a href="#" id="topNavi5">음료</a>
					<ul id="topSubm5">
						<li><a href="#">까페리얼</a></li>
						<li><a href="#">워터커피</a></li>
						<li><a href="#">모히또</a></li>
					</ul>
				</li>
				<li class="t2"><a href="#" id="topNavi6">커피용품</a>
					<ul id="topSubm6">
						<li><a href="#">종이컵</a></li>
						<li><a href="#">커피필터</a></li>
						<li><a href="#">머신 등</a></li>
					</ul>
				</li>
				<li class="t1"><a href="#" id="topNavi7">선물세트</a></li>
				<li class="t2"><a href="#" id="topNavi8">대량구매</a></li>
			</ul>
		</div>

		<script type="text/javascript">initTopMenu();</script>
	</div>
	<!-- //GNB -->

	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li>원두커피</li>
				<li class="last">원두</li>
			</ol>
		</div>
					
		<!-- maxcontents -->
		<div id="maxcontents">
			
			<div class="sContents">
				<p><strong><span class="orange">‘원두커피백’</span>에 대한 검색 결과입니다.</strong></p>
				<p>다른 상품을 검색하시려면 다시 한번 검색어를 입력하신 후 검색 버튼을 클릭하세요.</p>

				<div class="searchForm">
					<input type="text" class="reSearchType" onfocus="this.className='reSearchfocus'" onblur="if (this.value.length==0) {this.className='reSearchType'}else {this.className='reSearchfocusnot'}" />
					<div class="btn"><a href="#"><img src="user/images/btn/btn_result_search.gif" alt="검색" /></a></div>
					<p class="rechk"><input type="checkbox" /><label for="">결과 내 재검색</label></p>
				</div>
			</div>

			<div class="tabCategory">
				<div class="cateLeft"><span class="orange">‘원두커피백’</span> 검색 결과 <span class="orange">15</span>건 </div>
				<div class="cateRight">
					<ul>
						<li class="first"><a href="#" class="on">인기도순</a></li>
						<li><a href="#">신상품순</a></li>
						<li><a href="#">높은 가격순</a></li>
						<li class="last"><a href="#">낮은 가격순</a></li>
					</ul>
				</div>
			</div>

			<div class="brandList">
				<ul>
					<!-- 반복 -->
					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>
					<!-- //반복 -->

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>
				</ul>
			</div>

		</div>
		<!-- //maxcontents -->

	</div>
	<!-- //container -->




	<div id="footerWrap">
		<div id="footer">
			<div id="fnb">
				<ul>
					<li class="left"><a href="#">개인정보취급방침</a></li>
					<li><a href="#">이용약관</a></li>
					<li class="left"><a href="#">이메일무단수집거부</a></li>
					<li><a href="#">고객센터</a></li>
					<li class="left brand"><a href="#">쟈뎅 브랜드 사이트</a></li>
				</ul>
			</div>
			
			<div id="finfo">
				<div id="flogo"><img src="user/images/txt/flogo.gif" alt="JARDIN THE COFFEE CREATOR, SINCE 1984" /></div>
				<address>
					<ul>
						<li>㈜쟈뎅</li>
						<li>대표자 윤영노</li>
						<li class="tnone">주소 서울시 강남구 논현동 4-21번지 영 빌딩</li>
						<li class="webnone">소비자상담실 02)546-3881</li>
						<li>사업자등록번호 211-81-24727</li>
						<li class="tnone">통신판매신고 제 강남 – 1160호</li>
						<li class="copy">COPYRIGHT © 2014 JARDIN <span>ALL RIGHTS RESERVED.</span></li>
					</ul>
				</address>

				<div id="inicis"><img src="user/images/ico/ico_inicis.png" alt="이니시스 결제시스템" /></div>
			</div>
		</div>
	</div>



</div>
</div>
</body>
</html>