<%@page import="com.demoweb.model.dao.BoardDao"%>
<%@page import="com.demoweb.model.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//목록 페이지에서 선택한 글의 번호를 읽어서 변수에 저장
Integer boardNo = null;
try {
	boardNo = Integer.valueOf(request.getParameter("boardno"));
} catch (Exception ex) {}
//글번호가 없다면
if (boardNo == null) {
	//목록으로 이동
	response.sendRedirect("boardlist.jsp");
	return;
}
BoardDao dao = new BoardDao();
Board board = dao.getBoardByBoardNo(boardNo);

if (board == null) {//조회된 글이 없다면
	//목록으로 이동
	response.sendRedirect("boardlist.jsp");
	return;
}

dao.increaseReadCount(boardNo);

String pageNo = "1";
if (request.getParameter("pageno") != null) {
	pageNo = request.getParameter("pageno");
}

Member member = new Member();
if (session.getAttribute("loginuser") != null) {
  member = (Member)session.getAttribute("loginuser");
}

%>

    
<!DOCTYPE html>

<%@page import="com.demoweb.model.dto.Member"%>
<html>
<head>
	<meta charset="UTF-8" />
	<title>글상세</title>
	<link rel="Stylesheet" href="/demoweb/styles/default.css" />
	<link rel="Stylesheet" href="/demoweb/styles/input2.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	function deleteBoard(number, pageno) {
		//confirm : 예/아니오 버튼의 선택에 따라 true/false 반환
		if (confirm(number + "번 글을 삭제할까요?")) {
			//location.href=path -> 지정된 경로로 이동
			location.href='boarddelete.jsp?boardno=' 
				+ number + "&pageno=" + pageno;
		}
	}
	$(document).ready(function(){
		var jsonboardNo = { boardNo : "<%=boardNo%>"};
		GetCommentList(jsonboardNo);
		
		
		$('#commentAdd').on("click",function(){
	        var jsondata = {
	           boardNo  : "<%=boardNo%>",
	           content : $('#comment').val(),
	           writer : "<%= member.getMemberId() %>"
	        };
	        
				$.ajax({
					url : "commentAdd.jsp",
					dataType : "JSON",
					async : true,
					type : "POST",
					data : jsondata,
					success : function(data) {
						GetCommentList(jsonboardNo);
					}
				});
		}); //end comment Add
		
		$(document).on("click", ".commentRemove", function(){
			var idx = $(this).attr("id");
			
	        $.ajax({
	          url : "commentRemove.jsp",
	          dataType : "JSON",
	          async : true,
	          type : "POST",
	          data : { boardNo : idx },
	          success : function(data) {
	            GetCommentList(jsonboardNo);
	          }
	        });
	    }); //end comment Remove

	    
	    $(document).on("click", ".commentModify", function(){
	    	  var idx = $(this).attr("id");
	    	  console.log("content_"+idx);
	        $('#content_'+idx).removeAttr('readonly');
	        console.log($('#content_'+idx).val());
	        $('#content_'+idx).focus();
	            /* $.ajax({
	              url : "commentModify.jsp",
	              dataType : "JSON",
	              async : true,
	              type : "POST",
	              data : { boardNo : idx },
	              success : function(data) {
	                GetCommentList(jsonboardNo);
	              }
	            }); */
	        }); //end comment Modify
		
		function GetCommentList(data){
			 $.ajax({
	        url : "commentList.jsp",
	        dataType : "JSON",
	        data : data ,
	        type : "POST" ,
	        success : function(data){
	        	$('#commentListView').empty();
             var htmlStr = "";
             htmlStr += "<table>";
             for(var i=0 ; i < data.length ; i++){
               htmlStr += "<tr>";
               htmlStr +=   "<td>" + data[i].writer + "</td>";
               htmlStr +=   "<td id='content_"+ data[i].commentNo + "'>";
               htmlStr +=     "<input type='text' value='"+data[i].content+"' readonly>";
               htmlStr +=   "</td>";
               htmlStr +=   "<td>" + data[i].regDate + "</td>";
               htmlStr +=   "<td></td>";
               htmlStr +=   "<td>";
               htmlStr +=     "<button id='" + data[i].commentNo +"' class='commentRemove' type='button'>삭제</button>";
               htmlStr +=     "<button id='" + data[i].commentNo +"' class='commentModify' type='button'>수정</button>";
               htmlStr +=   "</td>";
               htmlStr += "</tr>";
             };
             htmlStr += "</table>"
             
             $('#commentListView').empty();
             $('#commentListView').append(htmlStr);
	        }
	    });
	}; //end GetCommentList
	
});
	</script>
</head>
<body>
	<div id="pageContainer">
	
		<% pageContext.include("/include/header.jsp"); %>
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <div class="inputsubtitle">게시판 글 상세</div>
		        <table>
		            <tr>
		                <th>제목</th>
		                <td colspan="2"><%= board.getTitle() %></td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td colspan="2"><%= board.getWriter() %></td>
		            </tr>
		            <tr>
		                <th>작성일</th>
		                <td colspan="2"><%= board.getRegDate() %></td>
		            </tr>
					       <tr>
		                <th>조회수</th>
		                <td colspan="2"><%= board.getReadCount() + 1 %></td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td colspan="2" style="height:200px;vertical-align:top">		                    
		                    <%= board.getContent().replaceAll(
		                    	"\r\n", "<br />") %>
		                </td>
		            </tr>
		           <% if (member.getMemberId() != null) { %>
		            <tr>
                    <th>댓글입력</th>
                    <td colspan="2" style="height:130px;vertical-align:top">                        
                      <textarea rows="10" cols="100" id="comment" name="comment"></textarea>
                      <button id="commentAdd" type="button" style="float: right;">등록</button>
                    </td>
                </tr>
		        </table>
		        <div id="commentListView">
		        
		        </div>
		        
		        <div class="buttons">
		          <% if (member.getMemberId().equals(board.getWriter())) { %>
                <a href="boardeditform.jsp?boardno=<%= board.getBoardNo() %>&pageno=<%= pageNo %>">편집</a>
                <a href="javascript:deleteBoard(<%= board.getBoardNo() %>, <%= pageNo %>);">삭제</a>
              <% } %>
                <a href="boardreplyform.jsp?boardno=<%= board.getBoardNo() %>&pageno=<%= pageNo %>">댓글쓰기</a>
              <% } else {%>
                </table>
              <% } %>
              <a href="boardlist.jsp?pageno=<%= pageNo %>">목록보기</a>
		        </div>
		    </div>
		</div>
		
	
	</div>
	</div>

</body>
</html>