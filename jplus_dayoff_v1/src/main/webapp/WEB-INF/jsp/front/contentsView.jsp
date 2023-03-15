<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="./layout/frontTop.jsp"  %>
<%@ include file="./layout/frontHeader.jsp"  %>
<article class="subContent investmentPoint">
	<h2 class="subContent__tit menuTit"></h2>
    <div class="centerContent contentsPage">
		<c:if test="${result.CONTENTS_GB eq 'EDITOR'}">
			<c:out value="${result.CONTENTS}" escapeXml="false"/>
		</c:if>
		<c:if test="${result.CONTENTS_GB eq 'FILE'}">
			<script>
				$(".centerContent").load('<c:out value="${result.CONTENTS_SYSTEM_FILE_PATH_NM}"/>')
			</script>
		</c:if>
    </div>
</article>

<%@ include file="./layout/frontFooter.jsp"  %>
</body>
</html>