<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body {
  font-family: 'Montserrat', sans-serif;
}

div.header {
	background: #000000;
	background-image: linear-gradient(to right, #232526, #454747, #232526);
  background-size: 100%;
  background-position: 50% 100%;
  background-repeat: no-repeat;
  position: relative;
  height: 15em;
}

div.header-menu {
  position: absolute;
  top: 20px;
  left: 0; 
  right: 0; 
  min-height: 5em;
  margin-left: 35em; 
  margin-right: 35em;
  display: inline-block;
  border-radius: 0.35em;
  box-shadow: inset 0px 0px 1px 1px rgba(255, 255, 255, 0.25);
}




.menu_list {
  width: 220px;
}

.menu_category {
  padding: 5px 10px;
  cursor: pointer;
  position: relative;
  font-weight: bold;
  background-color: #43464c;
  color: white;
}

.menu_body {
  display:none;
  text-align: left;
  color: white; 
}

.menu_body a {
  display: block;
  background: #60646d;
  padding: 10px;
  text-decoration: none;
  color: white; 
}

.menu_body a:hover {
  color: steelblue;
  text-decoration: underline;
}
</style>

<script type="text/javascript">
$(document).ready(function () {
	$("#boardmenu p.menu_category").click(function() {
		$(this).next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
	})
});

</script>
</head>
<body>
<div class="header">
  <div class="header-menu"></div>
</div>



<div id="boardmenu" align="center" class="menu_list">
  <c:set var="idx" value="0"/>
  
  <c:forEach var="board" items="${menu }" varStatus="loop">
    <c:if test="${board.ccode != idx}">
    
      <p class="menu_category">${board.cname }</p>
      <c:set var="idx" value="${board.ccode}"/>
      <div class="menu_body">
      
    </c:if>
      <a href="${root}/${board.control}/list.bit?bcode=${board.bcode }&pg=1&key=&word=">${board.bname }</a>
      <c:if test="${loop.index < menu.size() -1 }">
        <c:if test="${idx != menu.get(loop.index + 1).ccode }">
          </div>
        </c:if>
      </c:if>
  </c:forEach>
  
</div>


</body>
</html>