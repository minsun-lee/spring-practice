<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section id="board-container" class="container">

        <button id="btn-add" class="btn btn-outline-success" style="float:right; margin-bottom:10px;"
        onclick="location.assign('${path}/board/boardWrite.do')">글쓰기</button>
        	
        <p>총 ${totalContents }건의 게시물이 있습니다.</p>
        
        <table id="tbl-board" class="table table-striped table-hover">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>첨부파일</th>
                <th>조회수</th>
            </tr>
            <c:if test="${not empty boardList }">
            <c:forEach items="${boardList }" var="b">
            <tr>
            	<td><c:out value="${b.boardNo}"/></td>
            	<td>
            		<a href="${path }/board/boardView.do?boardNo=${b.boardNo }">
            			<c:out value="${b.boardTitle }"/>
            		</a>
            	</td>
            	<td><c:out value="${b.boardWriter.userId }"/></td>
            	<td><c:out value="${b.boardDate }"/></td>
            	<td>
            		<c:if test="${b.files.size()>0 }">
            		<img src="${path }/resources/images/file.png" width="10px"/>
            		</c:if>
            	</td>
            	<td><c:out value="${b.boardReadCount }"/></td>
            </tr>
            </c:forEach>
            </c:if>
        </table> 
       
       <div id="pageBar">
       		${pageBar }
       </div>
        
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 