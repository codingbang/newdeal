<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jquery.ajax.comment.CommentDAO" %>
<%@ page import="com.jquery.ajax.comment.CommentVO" %>
<%@ page import ="java.util.List" %>
<%@ page import="net.sf.json.JSONArray" %>

<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	int bbsSeq = Integer.parseInt(request.getParameter("bbsSeq"));
	//System.out.println(bbsSeq + " / " + comment);
	
	CommentDAO dao = CommentDAO.getInstance();
	
	//dao.addComment(comment);
  
	//삭제기능 구현하세요
	dao.removeComment(seq);
	List<CommentVO> commentlist = dao.getCommentList(bbsSeq);
	
	
	JSONArray jsonarray = JSONArray.fromObject(commentlist);
%>
<%=jsonarray %>











