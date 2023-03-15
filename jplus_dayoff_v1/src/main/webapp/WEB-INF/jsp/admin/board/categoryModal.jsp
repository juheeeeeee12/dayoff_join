<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Modal_ajax -->
<section id="categoryModal" class="modal" style="width: 30%;">
    <div class="inner">
        <div class="modal_content" style="overflow-y: hidden;">
            <div class="inner" style="overflow: auto;">
                <div class="tblScrollDiv">
	                <table class="board_list_normal">
	                	<colgroup>
	                		<col width="5%">
	                		<col width="*">
	                		<col width="10%">
	                	</colgroup>
	                    <thead>
	                        <tr>
	                            <th></th>
	                            <th>카테고리명</th>
	                            <th>출력 순서</th>
	                        </tr>
	                    </thead>
	                    <tbody id="categoryTbody">
							<c:if test="${!empty categoryList}">
								<c:forEach var="list" items="${categoryList}" varStatus="status">
									<tr id="cate_<c:out value='${list.CATEGORY_SEQ}'/>">
										<td class="num">
			                                <input type="checkbox" name="categorySeq" id="category_<c:out value='${list.CATEGORY_SEQ}'/>" value="<c:out value='${list.CATEGORY_SEQ}'/>" class="custom" onchange="fn_cateChk(this)">
			                                <label for="category_<c:out value='${list.CATEGORY_SEQ}'/>"></label>
			                            </td>
			                            <td class="center"><a href="javascript: void(0);" onclick="fn_chkCheckbox(this);" class="link"><c:out value='${list.CATEGORY_NM}'/></a></td>
			                            <td class="center"><input type="text" class="ipt sortOrder onlyNumber" maxlength="3" disabled></td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty categoryList}">
								<tr>
									<td class="none" colspan="20">등록된 카테고리가 없습니다.</td>
								</tr>
							</c:if>
	                    </tbody>
	                </table>
                </div>
            </div>
        </div>
        <div class="modal_footer">
            <div class="btn_group right">
                <button class="btn black" onclick="fn_saveBoardCategory();">저장</button>
                <button class="btn" onclick="modalFn.hide($('#categoryModal'));">취소</button>
            </div>
        </div>
    </div>
</section>
<script>

	$(function(){
		$.each(boardCategoryArr, function(idx, item){
			var $tr = $("#cate_" + item.categorySeq);
			$tr.find(".custom").prop("checked", true);
			$tr.find(".sortOrder").attr("disabled", false).val(item.sortOrder);
		});
	})

	function fn_chkCheckbox(t) {
		$(t).parents("tr").find(".num .custom").trigger("click");
	}

	function fn_cateChk(t){
		var $tr = $(t).closest("tr");
		if($(t).is(":checked")) {
			$tr.find(".sortOrder").attr("disabled", false);
		} else {
			$tr.find(".sortOrder").val("").attr("disabled", true);
		}
	}

</script>

<style>
	.modal .board_list_normal td {height: auto;}
	.board_list_normal td.num [type="radio"].custom+label {
	    padding-left: 0;
	    height: 16px;
	    min-width: auto;
    }
    .tblScrollDiv {max-height: 500px; overflow-y: auto;}
</style>
