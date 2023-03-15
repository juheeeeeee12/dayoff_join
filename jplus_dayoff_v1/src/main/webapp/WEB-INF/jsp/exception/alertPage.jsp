<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="/resources/assets/plugins/jquery/jquery.min.js"></script>
<script src="/resources/js/common.js"></script>

<input type="hidden" id="message" name="message" value="<c:out value='${message}'/>"/>
<input type="hidden" id="goUrl" name="goUrl" value="<c:out value='${goUrl}'/>"/>
<script>
	$(function(){
		var msg = $("#message").val();
		var goUrl = isEmpty($("#goUrl").val()) ? "/main.do" : $("#goUrl").val();
		if(!isEmpty(msg)) alert(msg);
		window.location.href = goUrl;
	})
</script>