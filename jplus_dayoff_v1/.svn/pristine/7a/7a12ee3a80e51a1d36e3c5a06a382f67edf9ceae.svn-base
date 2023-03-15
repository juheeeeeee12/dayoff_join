<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<body class="lang_kr">
	<form id="menuForm" name="menuForm" method="post" onsubmit="return false;">
		<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>"/>
		<input type="hidden" name="boardSeq" value="<c:out value='${boardSeq}'/>"/>
		<input type="hidden" name="contentsSeq" value="<c:out value='${contentsSeq}'/>"/>
	</form>
	<section data-role="page" class="main">
	<div class="m_menu m_show">
    	<div class="m_menu_logo">
    		<img src="/resources/front/images/sprite/x_icon.png" class="m_menu_closeBtn">
    		<img src="/resources/assets/images/newjplus_logo.png" onclick="javascript: window.location.href='/main.do'" style="cursor: pointer; transition: all .3s;" class="m__logo_over">
    	</div>
    	<ul></ul>
    </div>
    <div class="m_show m_menu_icon">
      <a href="#this" class="gnb__item gnbToggle txtHidden" aria-label="전체메뉴보기">전체메뉴보기
	      <span class="gnbToggle__item"></span>
	      <span class="gnbToggle__item"></span>
	      <span class="gnbToggle__item"></span>
      </a>
    </div>
	<header class="header">
      <div class="header__inner">
          <h2 class="header__logo">
              <a href="/main.do" class="header__logoImg" style="transition: all 0.3s ease 0s; background-image: url(&quot;/resources/assets/images/newjplus_logo.png&quot;);">뉴제이플러스</a>
          </h2>
			 <ul class="header_login">
			 	<c:if test="${empty sessionScope.loginId}">
					<li><a href="/login.do" class="">Login</a></li>
					<li><a href="/join.do" class="">Join</a></li>
				</c:if>
				<c:if test="${!empty sessionScope.loginId}">
					<li class="hello"><c:out value='${sessionScope.loginNm}'/>(<c:out value='${sessionScope.loginId}'/>)님 반갑습니다.</li>
				</c:if>
			  </ul>

          <nav class="gnb" style="position:absolute; right:0; top:0;">
              <a href="#this" class="gnb__item gnbToggle txtHidden" aria-label="전체메뉴보기">전체메뉴보기
                  <span class="gnbToggle__item"></span>
                  <span class="gnbToggle__item"></span>
                  <span class="gnbToggle__item"></span>
              </a>
          </nav>
      </div>
  </header>

<script>
	var menuList;
	$(function(){

		fn_getMenuList();

		$(".m_show.m_menu_icon").click(function(){
			$(".m_show.m_menu").slideDown();
		})
		$(".m_menu_closeBtn").click(function(){
			$(".m_show.m_menu").slideUp();
		})
		$(".m_show.m_menu>ul>li>a").click(function(){
			var thisSubMenu = $(this).parent().find(".m_sub_menu");
			thisSubMenu.slideToggle();
			$(this).toggleClass("m_menu_on")
		})
		$(".menu_closeBtn").click(function(){
			$("body").removeClass("-activeSiteMap");
		})

	})

	function fn_getMenuList(){
		$.ajax({
			type : "POST",
			url : "/getMenuList.do",
			traditional : true,
			dataType : 'json',
			data : {},
			beforeSend: function(){
				$("#loading").show();
			},
			success : function(data) {
				$("#loading").hide();
				if( data.retcode == "SUCC") {
					menuList = data.menuList;

					if(menuList != null) {
						$.each(menuList, function(idx, item){
							var menuUrl = item.MENU_URL;
							if(!isEmpty(menuUrl) && menuUrl != '#') menuUrl = 'javascript: fn_move(\'' + item.MENU_SEQ + '\', \'' + item.MENU_URL + '\', \'' + (item.BOARD_SEQ || '') + '\', \'' + (item.CONTENTS_SEQ || '') + '\')';
							if(item.MENU_DEPTH == 1) { // 대메뉴
								var str = '<li class="m_main_menu" data-menu_seq="' + item.MENU_SEQ + '"><a href="' + menuUrl + '"><span>' + item.MENU_NM + '</span></a><ul class="m_sub_menu"></ul>'
								$(".m_menu ul").append(str);
								if(item.DEPTH2_CHILD == 0) $(".m_main_menu[data-menu_seq=" + item.MENU_SEQ + "] .m_sub_menu").append('<li><a href="' + menuUrl + '"><span>' + item.MENU_NM + '</span></a></li>');

								str = '<div class="gnb__item" data-menu_seq="' + item.MENU_SEQ + '"><a href="' + menuUrl + '" class="gnb__menu"><span>' + item.MENU_NM + '</span></a><nav class="gnb__subMenu"></nav>';
								$("nav.gnb .gnbToggle").before(str);
								if(item.DEPTH2_CHILD == 0) $(".gnb__item[data-menu_seq=" + item.MENU_SEQ + "] .gnb__subMenu").append('<a href="' + menuUrl + '" class="gnb__subItem"><span>' + item.MENU_NM + '</span></a>');
							} else { // 소메뉴
								$(".m_main_menu[data-menu_seq=" + item.P_MENU_SEQ + "] .m_sub_menu").append('<li><a href="' + menuUrl + '"><span>' + item.MENU_NM + '</span></a></li>');
								$(".gnb__item[data-menu_seq=" + item.P_MENU_SEQ + "] .gnb__subMenu").append('<a href="' + menuUrl + '" class="gnb__subItem"><span>' + item.MENU_NM + '</span></a>');
							}
						});

						var nowMenuSeq = $("#menuForm [name=nowMenuSeq]").val();
						if(!isEmpty(nowMenuSeq)) {
							var nowMenuInfo = menuList.find(e => e.MENU_SEQ == nowMenuSeq);
							$(".menuTit").text(nowMenuInfo.MENU_NM);
							var bg = (nowMenuInfo.MENU_DEPTH != 1) ? (menuList.find(e => e.MENU_SEQ == nowMenuInfo.P_MENU_SEQ)).MENU_BANNER_IMG_FILE_PATH_NM : nowMenuInfo.MENU_BANNER_IMG_FILE_PATH_NM;
							$(".subVisual__bg").css("backgroundImage", 'url(' + bg + ')');
						}
					}

				}
			},
			error : function(jqXHR, textStatus, errorThrown){
				$("#loading").hide();
				if(isEmpty($("#sessionId").val())) {
					alert('로그인 후 이용해주세요.');
					location.href='/admin/login.do';
				} else {
		        	alert("문제가 발생하였습니다.\n고객센터에 문의하세요.\n"+ajaxJsonError(jqXHR, textStatus, errorThrown));
				}
		    }
		});
	}

	function fn_move(menuSeq, menuUrl, boardSeq, contentsSeq) {
		$("#menuForm [name=nowMenuSeq]").val(menuSeq);
		$("#menuForm [name=boardSeq]").val(boardSeq);
		$("#menuForm [name=contentsSeq]").val(contentsSeq);
		sbmit("menuForm", menuUrl);
	}

</script>
<c:if test="${!fn:contains(pageContext.request.requestURI, 'main')}">
  <div class="subVisual">
    <div class="subVisual__item">
      <div class="subVisual__bg"></div>
      <h2 class="subVisual__title menuTit"></h2>
    </div>
  </div>
</c:if>
<style>
a {
    color: #000;
}
a:hover {
	color: #1f3c80;
}
</style>