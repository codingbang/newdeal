<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.demoweb.model.dao.BoardCommentDao" %>
<%@ page import="com.demoweb.model.dto.BoardComment" %>
<%@ page import ="java.util.List" %>
<%@ page import ="java.util.Map" %>
<%@ page import="net.sf.json.JSONObject" %>

<%
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));

	BoardCommentDao dao = new BoardCommentDao();

  dao.deleteBoardComment(boardNo);
	
%>
<%=boardNo %>











