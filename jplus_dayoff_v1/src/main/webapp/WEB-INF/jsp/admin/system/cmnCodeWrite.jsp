<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../layout/top.jsp"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/sidebar.jsp"%>

	<div class="container-fluid">
		<form id="form" name="form" method="POST">
			<input type="hidden" name="pageIndex" value="<c:out value='${pageIndex}'/>"/>
			<input type="hidden" name="nowMenuSeq" value="<c:out value='${nowMenuSeq}'/>"/>
			<input type="hidden" name="isModify" id="isModify" value="<c:out value='${isModify}'/>" />
			<input type="hidden" name="schGb" id="schGb" value="<c:out value='${schGb}'/>" />
			<input type="hidden" name="schVal" id="schVal" value="<c:out value='${schVal}'/>" />
			<input type="hidden" name="cmnCdInfoList" id="cmnCdInfoList" />

			<div class="row">
				<div class="col-12">
					<div class="card border">
						<div class="card-body">
							<div class="header">
								<h4 class="card-title">그룹코드</h4>
							</div>
							<div class="body">
								<div class="table-responsive">
									<table class="table-bordered">
										<colgroup>
							           		<col width="10%">
							           		<col width="40%">
							           		<col width="10%">
							           		<col width="40%">
							           	</colgroup>
							           	<tbody>
											<tr>
												<th class="req">그룹코드</th>
												<td>
													<input type="text" id="grpCd" name="grpCd" class="ipt form-control form-control-line reqIpt" data-label="그룹코드" value="<c:out value='${grpCdInfo.GRP_CD}'/>" <c:if test="${isModify eq 'Y'}">readonly</c:if> maxlength="20" />
												</td>
												<th class="req">사용여부</th>
												<td class="left">
													<div class="switch">
														<label>
															<input type="hidden" name="useYn" id="useYn" />
															<input type="checkbox" id="useYnChk" class="leverChk" <c:if test="${grpCdInfo.USE_YN ne 'N'}">checked</c:if>>
															<span class="lever"><i class="fa fa-check"></i></span>
														</label>
													</div>
												</td>
											</tr>
											<tr>
						                        <th class="req">그룹코드명</th>
						                        <td colspan="3">
						                        	<input type="text" name="grpCdNm" class="ipt form-control form-control-line reqIpt" data-label="그룹코드명" value="<c:out value='${grpCdInfo.GRP_CD_NM}'/>" maxlength="30"/>
						                        </td>
						                    </tr>
						                    <tr>
						                    	<th>비고</th>
						                    	<td colspan="3">
						                    		<textarea class="ipt form-control form-control-line" name="grpCdDesc" rows="5" maxlength="1000" ><c:out value='${grpCdInfo.GRP_CD_DESC}'/></textarea>
						                    	</td>
						                    </tr>
						                    <c:if test="${isModify eq 'Y'}">
						                    	<tr>
							                    	<th>등록자</th>
							                    	<td class="left"><c:out value='${grpCdInfo.CREATE_BY}'/></td>
							                    	<th>등록일시</th>
							                    	<td class="left"><c:out value='${grpCdInfo.CREATE_DATE}'/></td>
							                    </tr>
						                    	<tr>
							                    	<th>최종수정자</th>
							                    	<td class="left"><c:out value='${grpCdInfo.LAST_UPDATE_BY}'/></td>
							                    	<th>최종수정일시</th>
							                    	<td class="left"><c:out value='${grpCdInfo.LAST_UPDATE_DATE}'/></td>
							                    </tr>
						                    </c:if>
						                </tbody>
						           </table>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<div class="header">
								<div style="float: right;">
									<button class="btn i-co waves-effect waves-light btn-info m-r-10" type="button" onclick="fn_addCmnCd();" style="position: relative; top: -5px;"><i class="ti-plus"></i></button>
								</div>
								<h4 class="card-title">공통코드</h4>
							</div>
							<div class="table-responsive">
								<table id="cmnCdTbl" class="table table-hover contact-list footable-loaded footable user-table">
									<colgroup>
										<col width="13%">
										<col width="13%">
										<col width="8%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="8%">
										<col width="8%">
									</colgroup>
									<thead>
										<tr>
											<th class="req">공통코드</th>
											<th class="req">공통코드명</th>
											<th class="req">정렬순서</th>
											<th>ATTRIBUTE1</th>
											<th>ATTRIBUTE2</th>
											<th>ATTRIBUTE3</th>
											<th>ATTRIBUTE4</th>
											<th>ATTRIBUTE5</th>
											<th class="req">사용여부</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty cmnCdList}">
											<c:forEach items="${cmnCdList}" var="list" varStatus="status">
												<tr class="cmnCdTr">
													<td class="center">
														<input type="text" class="ipt form-control form-control-line reqIpt cmnCdVal" data-label="공통코드" data-name="subCd" value="<c:out value='${list.SUB_CD}'/>" maxlength="20">
													</td>
													<td class="center">
														<input type="text" class="ipt form-control form-control-line reqIpt" data-label="공통코드명" data-name="subCdNm" value="<c:out value='${list.SUB_CD_NM}'/>" maxlength="30">
													</td>
													<td class="center">
														<input type="text" class="ipt form-control form-control-line onlyNumber reqIpt" data-label="정렬순서" data-name="sortOrder" value="<c:out value='${list.SORT_ORDER}'/>" maxlength="3"></td>
													<td class="center">
														<input type="text" class="ipt form-control form-control-line" data-name="attribute1" value="<c:out value='${list.ATTRIBUTE_1}'/>" maxlength="100">
													</td>
													<td class="center">
														<input type="text" class="ipt form-control form-control-line" data-name="attribute2" value="<c:out value='${list.ATTRIBUTE_2}'/>" maxlength="100">
													</td>
													<td class="center">
														<input type="text" class="ipt form-control form-control-line" data-name="attribute3" value="<c:out value='${list.ATTRIBUTE_3}'/>" maxlength="100">
													</td>
													<td class="center">
														<input type="text" class="ipt form-control form-control-line" data-name="attribute4" value="<c:out value='${list.ATTRIBUTE_4}'/>" maxlength="100">
													</td>
													<td class="center">
														<input type="text" class="ipt form-control form-control-line" data-name="attribute5" value="<c:out value='${list.ATTRIBUTE_5}'/>" maxlength="100">
													</td>
													<td class="center">
														<div class="switch">
															<label>
															<input type="hidden" name="" id="Yn">
															<input type="checkbox" id="Yn" class="leverChk useYnChk" <c:if test="${list.USE_YN eq 'Y'}">checked</c:if>>
															<span class="lever"><i class="fa fa-check"></i></span>
															</label>
														</div>
													</td>
													<td class="center">
														<button class="btn waves-effect waves-light btn-danger m-r-10" type="button" onclick="fn_rmvCmnCd(this);">삭제</button>
													</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty cmnCdList}">
											<tr>
												<td class="none no-data" colspan="20" style="">공통코드를 등록해주세요.</td>
											</tr>
										</c:if>
									</tbody>
								</table>
								<div class="btn_group right registAuthArea">
									<c:if test="${isModify ne 'Y'}">
										<button type="button" class="btn btn-info waves-effect waves-light m-r-10" onclick="fn_regist();"><spring:message code="button.create" text="등록"/></button>
									</c:if>
						        	<c:if test="${isModify eq 'Y'}">
							            <button type="button" class="btn waves-effect waves-light btn-danger m-r-10" onclick="fn_delete();"><spring:message code="button.delete" text="삭제"/></button>
						            	<button type="button" class="btn btn-info m-r-10" onclick="fn_regist();"> <i class="fa fa-pencil"></i> <spring:message code="button.modify" text="수정"/></button>
						            </c:if>
						            <button type="button" class="btn btn-inverse waves-effect waves-light f_left" onclick="fn_goList();"><spring:message code="button.list" text="목록"/></button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">

	$(function(){
		fn_enterCmndCdFocusUnderRow();
	});

	function fn_goList(){
		sbmit("form", "/cms/system/cmnCodeList.do");
	}

	function fn_addCmnCd() {
		var str = "";
		$("#cmnCdTbl tr td.none").remove();
		str += '<tr class="cmnCdTr">'
				+ '    <td class="center"><input type="text" class="ipt form-control form-control-line reqIpt cmnCdVal" data-label="공통코드" data-name="subCd" maxlength="20"></td>'
				+ '    <td class="center"><input type="text" class="ipt form-control form-control-line reqIpt" data-label="공통코드명" data-name="subCdNm" maxlength="30"></td>'
				+ '    <td class="center"><input type="text" class="ipt form-control form-control-line onlyNumber reqIpt" data-label="정렬순서" data-name="sortOrder" maxlength="3"></td>'
				+ '    <td class="center"><input type="text" class="ipt form-control form-control-line" data-name="attribute1" maxlength="100"></td>'
				+ '    <td class="center"><input type="text" class="ipt form-control form-control-line" data-name="attribute2" maxlength="100"></td>'
				+ '    <td class="center"><input type="text" class="ipt form-control form-control-line" data-name="attribute3" maxlength="100"></td>'
				+ '    <td class="center"><input type="text" class="ipt form-control form-control-line" data-name="attribute4" maxlength="100"></td>'
				+ '    <td class="center"><input type="text" class="ipt form-control form-control-line" data-name="attribute5" maxlength="100"></td>'
				+ '    <td class="center">'
				+ '    <div class="switch">'
				+ '    	<label>'
				+ '    		<input type="hidden" name="" id="Yn">'
				+ '    		<input type="checkbox" id="Yn" class="leverChk useYnChk" checked>'
				+ '    		<span class="lever"><i class="fa fa-check"></i></span>'
				+ '    	</label>'
				+ '    </div>'
				+ '    </td>'
				+ '    <td class="center">'
				+ '    	<button class="btn waves-effect waves-light btn-danger m-r-10" type="button" onclick="fn_rmvCmnCd(this);">삭제</button>'
				+ '    </td>' + '</tr>';
		$("#cmnCdTbl tbody").append(str);
		fn_enterCmndCdFocusUnderRow();
	}

	function fn_rmvCmnCd(t) {
		$(t).closest("tr").remove();
		if ($("#cmnCdTbl tbody tr.cmnCdTr").length == 0) {
			$("#cmnCdTbl tbody").html('<tr><td class="none no-data" colspan="20" style="">공통코드를 등록해주세요.</td></tr>');
		}
	}

	function fn_enterCmndCdFocusUnderRow(){
		$(".cmnCdTr .ipt").off().on("keyup",function(key){
	        if(key.keyCode==13) {
	            $(".cmnCdTr").eq($(this).parents("tr").index()).find("td").eq($(this).parents("td").index()+1).find(".ipt").focus();
	        }
	    });
	}

	function fn_regist() {

		if (!fn_chkValidation()) {
			return;
		}

		// 코드 정규식 체크
		var regExp = /^[a-zA-Z0-9][a-zA-Z0-9_]+$/;
		if (!regExp.test($("#grpCd").val())) {
			alert("그룹코드는 영어, 숫자, _로만 입력이 가능합니다. (첫 글자는 영어와 숫자만 가능합니다.)");
			return;
		}

		var cmnCdValArr = new Array();
		var loopFlag = true;
		$(".cmnCdVal").each(function() {
			cmnCdValArr.push($(this).val());
			if (!regExp.test($(this).val())) {
				alert("공통코드는 영어, 숫자, _로만 입력이 가능합니다. (첫 글자는 영어와 숫자만 가능합니다.)");
				$(this).focus();
				loopFlag = false;
				return false;
			}
		})
		if (!loopFlag) {
			return;
		}

		if (isDuplicate(cmnCdValArr)) {
			alert("중복된 공통코드는 등록하실 수 없습니다.");
			return false;
		}

		var cmnCdArr = new Array();
		$(".cmnCdTr").each(function() {
			var cmnCdInfo = new Object();
			$(this).find(".ipt").each(function() {
				cmnCdInfo[$(this).data("name")] = $(this).val();
			})
			cmnCdInfo.useYn = $(this).find(".useYnChk").is(":checked") ? "Y" : "N";
			cmnCdArr.push(cmnCdInfo);
		})

		if (cmnCdArr.length > 0) {
			$("#cmnCdInfoList").val(JSON.stringify(cmnCdArr));
		}

		$("#useYn").val($("#useYnChk").is(":checked") ? "Y" : "N");

		if (confirm("저장하시겠습니까?")) {
			$.ajax({
				type : "POST",
				url : "/cms/system/saveCmnCodeAjax.do",
				traditional : true,
				dataType : 'json',
				data : $("#form").serialize(),
				success : function(data) {
					alert(data.message);
					if (data.retcode == "SUCC") {
						fn_goList();
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("문제가 발생하였습니다.\n관리자에게 문의하세요.\n"
							+ ajaxJsonError(jqXHR, textStatus, errorThrown));
				}
			});
		}
	}

	function fn_delete() {
		if (confirm("공통코드 삭제 시 관련된 기능이 작동하지 않을수도 있습니다. 정말로 삭제하시겠습니까?")) {
			$.ajax({
				type : "POST",
				url : "/cms/system/deleteCmnCodeAjax.do",
				traditional : true,
				dataType : 'json',
				data : $("#form").serialize(),
				success : function(data) {
					alert(data.message);
					if (data.retcode == "SUCC") {
						fn_goList();
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("문제가 발생하였습니다.\n관리자에게 문의하세요.\n"
							+ ajaxJsonError(jqXHR, textStatus, errorThrown));
				}
			});
		}
	}
</script>

<%@include file="../layout/footer.jsp"%>