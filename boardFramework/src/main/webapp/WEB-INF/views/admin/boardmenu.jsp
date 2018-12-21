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
  background: #2a2a2a;
}

.container {
  margin: 60px auto;
  width: 500px;
  text-align: center;
}

.container h2{
  color: white;
}

.progress {
  padding: 6px;
  background: rgba(0, 0, 0, 0.25);
  border-radius: 6px;
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.08);
}

.progress-bar { 
  height: 18px;
  background-color: #ee303c;  
  border-radius: 4px; 
  transition: 0.4s linear;  
  transition-property: width, background-color;    
}

.progress-striped .progress-bar {   
  background-color: #FCBC51; 
  width: 100%; 
  background-image: linear-gradient(
        45deg, rgb(252,163,17) 25%, 
        transparent 25%, transparent 50%, 
        rgb(252,163,17) 50%, rgb(252,163,17) 75%,
        transparent 75%, transparent); 
  animation: progressAnimationStrike 6s;
}

@keyframes progressAnimationStrike {
     from { width: 0 }
     to   { width: 100% }
}
 


@keyframes progressAnimation {
  0% { width: 5%; background-color: #F9BCCA;}
  100% { width: 85%; background-color: #EF476F; }
}

$green: #4cd964;
$turquoise: #5ac8fa;
$blue: #007aff;
$light-blue: #7DC8E8;
$purple: #5856d6;
$red: #ff2d55;


@keyframes colorAnimation {
  0% { 
    background-image: 
    linear-gradient(to right, $green, $turquoise, $blue, $light-blue, $purple, $red);
  }
  20% { 
    background-image: 
    linear-gradient(to right, $turquoise, $blue, $light-blue, $purple, $red, $green);
  }
  40% { 
    background-image: 
    linear-gradient(to right, $blue, $light-blue, $purple, $red, $green, $turquoise);
  }
  60% { 
    background-image: 
    linear-gradient(to right, $light-blue, $purple, $red, $green, $turquoise, $blue);
  }
  100% { 
    background-image: 
    linear-gradient(to right, $purple, $red, $green, $turquoise, $blue, $light-blue);
  }
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
<div class="container">
  <h2>boardMenu</h2>
  <div class="progress progress-striped">
    <div class="progress-bar">
    </div>
  </div> 
</div>



<div id="boardmenu" align="center" class="menu_list">
  <c:set var="idx" value="0"/>
  
  <c:forEach var="board" items="${menu }" varStatus="loop">
    <c:if test="${board.ccode != idx}">
    
      <p class="menu_category">${board.cname }</p>
      <c:set var="idx" value="${board.ccode}"/>
      <div class="menu_body">
      
    </c:if>
      <a href="${root}/${board.control}/write.bit?bcode=${board.bcode }&pg=1&key=&word=">${board.bname }</a>
      <c:if test="${loop.index < menu.size() -1 }">
        <c:if test="${idx != menu.get(loop.index + 1).ccode }">
          </div>
        </c:if>
      </c:if>
  </c:forEach>
  
</div>


</body>
</html>