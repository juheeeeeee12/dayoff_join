<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="./layout/frontTop.jsp"  %>
<%@ include file="./layout/frontHeader.jsp"  %>
<style>
.main .main__infoItem__tit{width:390px;}
.main .mainSubSlide .slide__item{width:20% !important;}
.main .mainSubSlide .bx-controls-direction a{display:none;}
.main .mainSubSlide .bx-viewport{margin:0 auto !important;}
.main .mainSubSlide .slide{width:100% !important;}
.main .mainSubSlide .bx-wrapper{width:100% ;}
.main .mainSubSlide .centerContent{width:100%!important;}
.main__section .centerContent .mainNews{width:100% !important;}
.main .br_show{display:none}
.footer__inner { margin-top: 0; }
@media(min-width:1820px){
	.main .br_show{display:block;}
	/*2021-11-24*/
body.lang_en .main__slider .slide__item .slide__cover {
position:absolute;
right:0;
left:0;
top:300px;
}
}
/* @media(max-width:375px){
	body.lang_en .mobileTestSlide .m-item02 .text {top:-55px;}
} */

.backgroundPopup {
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background-color: rgba(0,0,0,0.5);
	z-index: 999;
	transition: all .3s
}

.mainPopup {
	position: absolute;
	top: 98px;
	left: 106px;
	width:506px;
	z-index: 9999;
	display: none;
		background-color: white;
}
.mainPopup.-active {
	display: block;
}
.mainPopup__label {
	display: inline-block;
	width: 414px;
	height: 25px;
	cursor: pointer;
	font-size: 12px;
	margin: -3px 10px 0 0;

}
.mainPopup__close {
	font-size: 12px;
}

.mainPopup__footer {
	margin-left:20px;
}
</style></head>

<style>
body.lang_en .gnb__menu .txtlang-en{font-family:'notokr-medium'; letter-spacing:-0.4px;}
body.lang_en .gnb__item.-menu05 a{margin-left:15px;}
</style>

<section class="main__slider">
	<img src="/resources/assets/images/newjplus_logo.png" class="m_show m_main_header_logo" onclick="javascript:location.href='/ereits/main.do'">
	<h3 class="txtHide">메인슬라이더</h3>
	<div class="slide">
		<c:if test="${not empty mainBannerList}">
            <c:forEach var="list" items="${mainBannerList}" varStatus="status">
            	<c:set var="slideSeq" value="${status.count}" />
            	<c:choose>
                	<c:when test="${empty list.BANNER_IMG_FILE_PATH_NM}">
						<div class="slide__item -type0<c:out value='${slideSeq}'/>" style='background-color: #ccc;'>
					</c:when>
					<c:otherwise>
						<%-- <div class="slide__item -type0${slideSeq}" style='background-image: url("/upload/${list.file_path}/${list.file_nm}");'> --%>
						<div class="slide__item -type0<c:out value='${slideSeq}'/>">
					</c:otherwise>
				</c:choose>
					<div class="slide__cover">
						<p class="main__sliderSubTit"><c:out value='${list.BANNER_SUB_TITLE}'/></p>
						<h4 class="main__sliderTit"><c:out value='${list.BANNER_TITLE}'/></h4>
						<p class="main__sliderTxt" style="white-space:pre-line;"><c:out value='${list.BANNER_CNTNT}'/></p>
					</div>
				</div>
			</c:forEach>

		</c:if>
	</div>
	<div class="main__sliderNum">
		<p class="main__sliderNumCover">01</p>
	</div>
	<div class="main__sliderControl">
		<button type="button" class="main__sliderControlBtn -prev">
			<span class="txtlang-kr">이전</span>
			<span class="txtlang-kr">prev</span>
		</button>
		<button type="button" class="main__sliderControlBtn -next">
			<span class="txtlang-kr">다음</span>
			<span class="txtlang-en">next</span>
		</button>
		<span class="main__sliderControlLoading -auto -active"></span>
	</div>
</section>

<%@ include file="./layout/frontFooter.jsp"  %>

<c:if test="${!empty popupList}">
	<div class="pop-lay" id="pop01" style="display: none;">
	    <div class="pop-wrap">
	        <div class="pop-bx">
	            <div class="pop-con">
	                <div class="slide-bx">
	                    <div class="swiper-wrapper">
	                    	<c:forEach var="list" items="${popupList}" varStatus="status">
		                        <div class="swiper-slide" <c:if test="${!empty list.POPUP_URL}">style="cursor: pointer;" onclick="window.location.href='<c:out value='${list.POPUP_URL}'/>'"</c:if>>
		                        	<c:if test="${list.POPUP_GB_CD ne '02'}">
		                        		<div class="popupTit"><c:out value='${list.POPUP_TITLE}'/></div>
		                        	</c:if>
		                        	<c:if test="${list.POPUP_GB_CD ne '01'}">
	 		                        	<img src="<c:out value='${list.POPUP_IMG_FILE_PATH_NM}'/>">
		                        	</c:if>
		                        	<c:if test="${list.POPUP_GB_CD ne '02'}">
		                        		<div class="popupCntnt"><c:out value='${list.POPUP_CNTNT}'/></div>
		                        	</c:if>
		                        </div>
	                    	</c:forEach>
	                    </div>
	                    <div class="pag"></div>
	                </div>
	            </div>
	            <div class="pop-bot">
	                <button type="button" class="today" onclick="fn_popupTodayNotOpen();">오늘 하루 보지 않기</button>
	                <button type="button" class="close">닫기</button>
	            </div>
	        </div>
	    </div>
	</div>
</c:if>



<div class="loader">
  <div class="loader__item">
    <div class="loader__text">
      <p class="loader__txt">
      	<span class="txtlang-kr">데이터를 불러오는 중입니다<br>잠시만 기다려 주세요</span>
		<span class="txtlang-en">Data is being loaded.<br>Please wait.</span>
      </p>
      <img src="/resources/front/images/common/loading.gif" alt="로딩 막대바" class="loader__bar">
    </div>
  </div>

</div>

	</section>

	<script src="/resources/front/js/vendor/jquery-1.12.0.min.js"></script>
	<script src="/resources/front/js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="/resources/front/js/vendor/jquery.easing.1.3.js"></script>
	<script src="/resources/front/js/vendor/jquery.bxslider.min.js"></script>
	<script src="/resources/front/js/plugins.js"></script>
	<script src="/resources/front/js/main.js"></script>
	<script>
		var i = 0;

		<c:forEach var="list" items="${mainBannerList}" varStatus="status">
			if("<c:out value='${list.BANNER_IMG_FILE_PATH_NM}'/>" == "") $('head').append("<style>.main__slider .slide__item.-type0"+(++i)+"::after{background-image: url('<c:out value='${list.BANNER_IMG_FILE_PATH_NM}'/>')}.main__slider .mobile_main_slider.slide__item.-type0"+(i)+"::after{background-image: url('<c:out value='${list.BANNER_IMG_FILE_PATH_NM}'/>') !important}</style>");
			else $('head').append("<style>.main__slider .slide__item.-type0"+(++i)+"::after{background-image: url('<c:out value='${list.BANNER_IMG_FILE_PATH_NM}'/>')}.main__slider .mobile_main_slider.slide__item.-type0"+(i)+"::after{background-image: url('<c:out value='${list.BANNER_IMG_FILE_PATH_NM}'/>') !important}</style>");
		</c:forEach>
		$(function(){
			if( $(window).width() <= 768 ) $(".main__slider .slide__item").addClass("mobile_main_slider");
			else $(".main__slider .slide__item").removeClass("mobile_main_slider");
			$( window ).resize( function() {
			  if( $(window).width() <= 768 ) $(".main__slider .slide__item").addClass("mobile_main_slider");
			  else $(".main__slider .slide__item").removeClass("mobile_main_slider");
			});

			$(".mainNews.m_show .mainInfoBox__tabList").click(function(){
				$(".mainNews.m_show .mainInfoBox__tabList").removeClass("-active");
				$(".mainNews.m_show .mainInfoBox__tabContent").removeClass("-active");
				$(this).addClass("-active");
				if($(this).hasClass("tab01")) $(".mainNews.m_show div#tab01").addClass("-active")
				else if($(this).hasClass("tab02")) $(".mainNews.m_show div#tab02").addClass("-active")
			})
			$(".gnb__item.gnbToggle.txtHidden").click(function(){
				$(".siteMap").toggleClass("on");
			})

			$(".pop-lay .close").click(function(){
				$(this).parents(".pop-lay").fadeOut(300);
			})
			//상단 메인 슬라이더
			var $sliderNum = $(".main__sliderNum");
			var $loading = $(".main__sliderControlLoading");
			var mainSlide;
			var subSlide;
			 var testSlide_m_show;

			function slideEvent() {
				//메인슬라이드
				mainSlide = new $(".main__slider .slide").bxSlider({
					auto : true,
					infiniteLoop : true,
					stopAutoOnClick : true,
					pause : 5000,
					touchEnabled : true,
					controls : false,
					onSlideBefore : function($slideElement, oldIndex,
							newIndex) {
						$(".main__sliderNumCover").text(
								"0" + (newIndex + 1));
						$loading.removeClass("-active");
					},
					onSlideAfter : function() {
						$sliderNum.removeClass("-next -prev");
						$loading.addClass("-active");
					},
					onSlideNext : function() {
						$sliderNum.addClass("-next");
					},
					onSlidePrev : function() {
						$sliderNum.addClass("-prev");
					}
				});
				//서브 슬라이더
				 subSlide = new $(".mainSubSlide .slide").bxSlider({
					 	infiniteLoop : false,
						stopAutoOnClick : true,
						pager : false,
						slideWidth : 384,
						slideMargin : 0,
						maxSlides : 5,
						minSlides : 5,
						moveSlides : 1,
						touchEnabled : false

				});
				//서브모바일test
				 testSlide_m_show = new $(".slideshow-container").bxSlider({
					 touchEnabled : true,
					 auto:true,
					 mode : 'fade',
					 infiniteLoop:true
				});
			}
			;
			slideEvent()

			//이전다음 버튼클릭시 모션 추가
			$(".main__sliderControlBtn").on("click", function() {
				mainSlide.stopAuto();
				if ($(this).hasClass("-next")) {
					mainSlide.goToNextSlide();
				} else {
					mainSlide.goToPrevSlide();
				}
			});

			//이동버튼 클릭시 로딩 에니메이션 삭제
			$(".main__slider .bx-pager-link,.main__sliderControlBtn").on("click", function() {
				$loading.removeClass("-auto -active");
			})


			// 팝업 노출
			if($("#pop01").length > 0) {
				var popSlide = new Swiper(".pop-con .slide-bx", {
			        autoplay: {
			          delay: 2500,
			          disableOnInteraction: false,
			        },
			        pagination: {
			            el: ".pop-con .slide-bx .pag",
			            clickable: true,
			        },
			    });

			    $("#pop01 .close").click(function() {
			        $(this).parents("#pop01").fadeOut(100);
			    });

			    function callPop(){
			        $("#pop01").fadeIn(100);
			        popSlide.update();
			    }

			    var cookieid = getCookie("noOpenPopup");
			    if(isEmpty(cookieid)) callPop();
			}


		});


		function fn_popupTodayNotOpen(){
			var expdate = new Date();
			expdate.setTime(expdate.getTime() + 1000 * 3600 * 24);
	        setCookie("noOpenPopup", "noOpenMainPopup", expdate);
	        var cookieid = getCookie("noOpenPopup");
	        $("#pop01").fadeOut(100);
		}

		function setCookie(name, value, expiredays) {
			document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
		}

		function getCookie(Name) {
		    var search = Name + "=";

		    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
		        offset = document.cookie.indexOf(search);
		        if (offset != -1) { // 쿠키가 존재하면
		            offset += search.length;
		            // set index of beginning of value
		            end = document.cookie.indexOf(";", offset);
		            // 쿠키 값의 마지막 위치 인덱스 번호 설정
		            if (end == -1)
		                end = document.cookie.length;

		            return unescape(document.cookie.substring(offset, end));
		        }
		    }
		    return "";
		}

	</script>

</body></html>