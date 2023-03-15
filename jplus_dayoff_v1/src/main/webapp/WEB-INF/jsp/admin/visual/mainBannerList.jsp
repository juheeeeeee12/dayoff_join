<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../layout/top.jsp"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/sidebar.jsp"%>

<div class="container-fluid">
    <form id="form" name="form" method="POST">
		<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>"/>
		<input type="hidden" id="bannerSeq" name="bannerSeq" value="<c:out value='${bannerSeq}'/>"/>
		<input type="hidden" name="isModify" id="isModify"/>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
				            <table id="sortingTbl" class="table table-hover contact-list footable-loaded footable user-table" data-page-size="7">
	                            <colgroup>
						            <col width="8%">
				                    <col width="12%">
				                    <col width="*">
				                    <col width="8%">
				                    <col width="8%">
				                    <col width="8%">
				                    <col width="8%">
				                    <col width="8%">
				                    <col width="8%">
						        </colgroup>
                                <thead>
                                    <tr>
                                        <th class="center footable-sortable">노출 순서<span class="footable-sort-indicator"></span></th>
                                        <th class="center footable-sortable">이미지<span class="footable-sort-indicator"></span></th>
                                        <th class="footable-sortable">배너 제목<span class="footable-sort-indicator"></span></th>
                                        <th class="center footable-sortable">등록자<span class="footable-sort-indicator"></span></th>
                                        <th class="center footable-sortable">등록일<span class="footable-sort-indicator"></span></th>
                                        <th class="center footable-sortable">최종수정자<span class="footable-sort-indicator"></span></th>
                                        <th class="center footable-sortable">최종수정일<span class="footable-sort-indicator"></span></th>
                                        <th class="center footable-sortable">사용여부<span class="footable-sort-indicator"></span></th>
                                        <th class="center footable-sortable registAuthArea">Up / Down<span class="footable-sort-indicator"></span></th>
                                    </tr>
                                </thead>
                                <tbody>
									<c:if test="${not empty resultList}">
				                		<c:forEach items="${resultList}" var="list" varStatus="status">
				                			<tr id="<c:out value='${list.BANNER_SEQ}'/>" class="showYn_<c:out value='${list.SHOW_YN}'/>">
						                        <td class="num center"><c:out value='${status.count}'/></td>
						                        <td class="listImg"><img src="<c:out value='${list.BANNER_IMG_FILE_PATH_NM}'/>"></td>
						                        <td>
						                        	<a href="javascript:fn_detail('Y', '<c:out value='${list.BANNER_SEQ}'/>');"><c:out value='${list.BANNER_TITLE}'/></a>
						                        </td>
						                        <td class="center"><c:out value='${list.CREATE_BY}'/></td>
						                        <td class="center"><c:out value='${list.CREATE_DATE}'/></td>
						                        <td class="center"><c:out value='${list.LAST_UPDATE_BY}'/></td>
						                        <td class="center"><c:out value='${list.LAST_UPDATE_DATE}'/></td>
						                        <td class="state">
						                            <span class="<c:if test="${list.SHOW_YN eq 'Y'}">complete</c:if>"><c:out value="${list.SHOW_YN eq 'Y' ? '사용' : '미사용'}"/></span>
						                        </td>
						                        <td class="center registAuthArea">
						                        	<c:if test="${list.SHOW_YN eq 'Y'}">
							                        	<button type="button" class="btn i-co waves-effect waves-light btn-info square m-r-5" onclick="fn_chgOrder(this, 'up');"><i class="mdi mdi-arrow-up"></i></button>
							                        	<button type="button" class="btn i-co waves-effect waves-light btn-info square" onclick="fn_chgOrder(this, 'down');"><i class="mdi mdi-arrow-down"></i></button>
						                        	</c:if>
						                        </td>
						                    </tr>
				                		</c:forEach>
				                	</c:if>
				                	<c:if test="${empty resultList}">
				                		<tr>
					                        <td class="none" colspan="20">데이터가 없습니다.</td>
					                    </tr>
				                	</c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="right registAuthArea">
	           		<button id="write" class="btn btn-success" type="button" onclick="fn_detail('N');">등록</button>
	           	</div>
            </div>
        </div>
    </div>
	</form>
</div>
<script type="text/javascript">

$(function(){
})

function fn_detail(isModify, bannerSeq){
	$("#isModify").val(isModify);
	if(isModify == 'Y') $("#bannerSeq").val(bannerSeq);
	sbmit("form", "/cms/visual/mainBannerWrite.do");
}

function fn_chgOrder(t, gb) {
	var ord = $(t).parents("tbody tr").index() + 1;
	var len = $(".showYn_Y").length;
	if(gb == "up") {
		if(ord == 1) { alert("이미 첫번째 순서입니다."); return false; }
		$("#sortingTbl tbody tr:nth-child(" + ord + ")").insertBefore("#sortingTbl tbody tr:nth-child(" + (--ord) + ")");
	} else if(gb == "down") {
		if(ord == len) { alert("이미 마지막 순서입니다."); return false; }
		$("#sortingTbl tbody tr:nth-child(" + ord + ")").insertAfter("#sortingTbl tbody tr:nth-child(" + (++ord) + ")");
	}

	var rnum = 0;
	var reOrderArr = new Array();
	$("#sortingTbl tbody").find('tr.showYn_Y').each(function(idx, e) {
		$(this).find(".num").text(++rnum);
		var tmpObj = new Object();
		tmpObj.chgOrder = (idx + 1);
		tmpObj.reOrdId = $(this).attr("id");
		reOrderArr.push(tmpObj);
	})
	if(reOrderArr.length > 0) {
		$.ajax({
			type : "POST",
			url : "/cms/visual/reOrderBannerOrderAjax.do",
			traditional : true,
			dataType : 'json',
			data : {
				"reOrderArr" : JSON.stringify(reOrderArr),
			},
			beforeSend: function(){
				$("#loading").show();
			},
			success : function(data) {
				$("#loading").hide();
				if( data.retcode != "SUCC") {
					alert(data.message);
				}
			},
			error : function(jqXHR, textStatus, errorThrown){
				$("#loading").hide();
		        alert("문제가 발생하였습니다.\n고객센터에 문의하세요.\n"+ajaxJsonError(jqXHR, textStatus, errorThrown));
		    }
		});
	}
}
</script>
<%@include file="../layout/footer.jsp"%>