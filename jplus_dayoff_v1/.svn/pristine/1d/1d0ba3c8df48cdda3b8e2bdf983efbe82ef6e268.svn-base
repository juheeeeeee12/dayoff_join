<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="./layout/frontTop.jsp"  %>
<%@ include file="./layout/frontHeader.jsp"  %>
<article class="subContent investmentPoint">
	    <div class="searchBox">
	      <form id="form" name="form" method="post" onsubmit="return false;">
	        <fieldset>
	          <legend>검색폼</legend>
	          <div class="selectBox">
	            <label for="searchBoxSelect"></label>
	            <select title="카테고리 선택" id="s_type" name="s_type">
					<option value="all" 	 <c:if test="${param.s_type eq 'all' }">selected="selected"</c:if> >전체</option>
					<option value="title"	 <c:if test="${param.s_type eq 'title' }">selected="selected"</c:if>>제목</option>
					<option value="contents" <c:if test="${param.s_type eq 'contents' }">selected="selected"</c:if>>내용</option>
				</select>
	          </div>
	          <div class="searchBox__inpWrap">
	            <input type="text" maxlength="20" title="검색어 입력" id="s_text" name="s_text"  class="searchBox__inp"
	            	placeholder="검색어를 입력해 주세요." value="<c:out value='${param.s_text}'/>" title="게시물검색">
	            <button type="submit" class="searchBox__submit">검색</button>
	          </div>

	        </fieldset>
	      </form>
	    </div>
		<section class="bbsList centerContent">
			<div class="row el-element-overlay">
              <div class="col-lg-3 col-md-6">
                  <div class="card">
                      <div class="el-card-item">
                          <div class="el-card-avatar el-overlay-1"> <img src="/resources/assets/images/users/1.jpg" alt="user"></div>
                          <div class="el-card-content">
                              <h3 class="box-title">Genelia Deshmukh</h3> <small>Managing Director</small>
                              <br> </div>
                      </div>
                  </div>
              </div>
              <div class="col-lg-3 col-md-6">
                  <div class="card">
                      <div class="el-card-item">
                          <div class="el-card-avatar el-overlay-1"> <img src="/resources/assets/images/users/2.jpg" alt="user"></div>
                          <div class="el-card-content">
                              <h3 class="box-title">Genelia Deshmukh</h3> <small>Managing Director</small>
                              <br> </div>
                      </div>
                  </div>
              </div>
              <div class="col-lg-3 col-md-6">

              </div>

          </div>


          <div id="previewList" class="row">
	          <div class="col-12">
	              <ul class="list-unstyled">
	                  <li class="media" style="flex: 1;">
                      	  <img class="d-flex mr-3" src="/resources/assets/images/users/1.jpg" alt="Generic placeholder image">
                          <div class="media-body">
                              <h5 class="mt-0 mb-1">List-based media object</h5> Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                          </div>
                      </li>
	              </ul>
	          </div>
	      </div>




	      <c:forEach items="${resultList}" var="list" varStatus="status">
	      	<a href="javascript: fn_detail('<c:out value='${list.POST_SEQ}'/>');" class="bbsList__item">
	        <p class="bbsList__num">
		        <c:choose>
		        	<c:when test="${list.FIX_YN eq 'Y'}">
		        		공지
		        	</c:when>
		        	<c:otherwise>
		        		<c:out value="${(paginationInfo.totalRecordCount - status.index) - ( (paginationInfo.currentPageNo - 1)  *  paginationInfo.recordCountPerPage ) }"/>
		        	</c:otherwise>
		        </c:choose>
	        </p>
	        <h2 class="bbsList__tit"><c:out value='${list.POST_TITLE}'/></h2>
	        <p class="bbsList__file <c:if test="${list.FILE_CNT eq 0}">-noFile</c:if>">첨부파일</p>
	        <p class="bbsList__date">등록일 <c:out value='${list.CREATE_DATE}'/></p>
	        <p class="bbsList__count">조회수 <c:out value='${list.VIEW_CNT}'/></p>
	      </a>
	      </c:forEach>
	      <c:if test="${empty resultList}">
			<p class="noText">내용이 없습니다.</p>
		  </c:if>
		  <div class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="frontPage" jsFunction="listThread" />
		  </div>
		</section>
	</div>
</article>

<%@ include file="./layout/frontFooter.jsp"  %>
</body>
</html>