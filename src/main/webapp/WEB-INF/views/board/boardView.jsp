<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
 
 <section>
 	<div id="board-container">
        <input type="text" class="form-control" placeholder="제목" name="boardTitle" id="boardTitle" 
        	value="${board.boardTitle }"  readonly required>
        <input type="text" class="form-control" name="boardWriter"
        	value="${board.boardWriter.userId }" readonly required>
		<c:if test="${not empty board.files }">
			<c:forEach items="${board.files }" var="a">
                <button type="button" 
                    class="btn btn-outline-success btn-block"
                    onclick="location.assign('${path}/board/download.do?oriName=${a.originalFilename}&reName=${a.renamedFilename}')">
                  <c:out value="${a.originalFilename }"/>
            	</button>
            </c:forEach>
        </c:if>
        
        <textarea class="form-control" name="boardContent" placeholder="내용" required readonly>
        	<c:out value="${board.boardContent }"/>
        </textarea>
    </div>
</section>
    
    <style>
    div#board-container{width:400px; margin:0 auto; text-align:center;}
    div#board-container input,div#board-container button{margin-bottom:15px;}
    div#board-container label.custom-file-label{text-align:left;}
    </style>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 