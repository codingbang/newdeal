<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jquery.ajax.board.BoardDAO" %>
<%@ page import="com.jquery.ajax.board.BoardVO" %>
<%@ page import ="java.util.List" %>
<%@ page import="net.sf.json.JSONArray" %>

<%
  int seq = Integer.parseInt(request.getParameter("seq"));
	BoardDAO dao = BoardDAO.getInstance();
	BoardVO board = dao.getBoard(seq);

	//JSON 데이터
	JSONObject jsonData = JSONObject.fromObject(board);
%>
<%=jsonData %>











