<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.demoweb.model.dao.BoardCommentDao" %>
<%@ page import="com.demoweb.model.dto.BoardComment" %>
<%@ page import ="java.util.List" %>
<%@ page import ="java.util.Map" %>
<%@ page import="net.sf.json.JSONArray" %>

<%
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
  System.out.println(boardNo);
	BoardCommentDao dao = new BoardCommentDao();
  List<BoardComment> comments = dao.getBoardCommentList(boardNo);

  JSONArray jsonarray = JSONArray.fromObject(comments);
%>
<%=jsonarray %>









