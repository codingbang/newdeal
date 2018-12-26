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

/* div.header-menu {
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
} */

#nav {
  position: absolute;
  display: block;
  top: 2.5em;
  left: 0;
  width: 100%;
  text-align: center;
}

#nav > ul {
  display: inline-block;
  border-radius: 0.35em;
  box-shadow: inset 0px 0px 1px 1px rgba(255, 255, 255, 0.25);
  padding: 0 1.5em 0 1.5em;
}

#nav > ul > li {
  display: inline-block;
  text-align: center;
  padding: 0 1.5em 0 1.5em;
}

#nav > ul > li > ul {
  display: none;
}

#nav > ul > li > a, #nav > ul > li > span {
  display: block;
  color: #eee;
  color: rgba(255, 255, 255, 0.75);
  text-transform: uppercase;
  text-decoration: none;
  font-size: 0.8em;
  letter-spacing: 0.25em;
  height: 5em;
  line-height: 5em;
  transition: all .25s ease-in-out;
  outline: 0;
}

#nav > ul > li:hover > a {
  color: #fff;
}

#nav > ul > li.active > a, #nav > ul > li.active > span {
  color: #fff;
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

li a, .dropbtn {
  display: inline-block;
  text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
  background-color: gray;
}

li.dropdown {
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>

<script type="text/javascript">
$(document).ready(function () {
	$("#boardmenu p.menu_category").click(function() {
		$(this).next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
	});
	
});

</script>
</head>
<body>
	<div class="header">
		<div class="header-menu">
			<nav id="nav">
				<ul>
					<li class="current"><a href="/">Home</a></li>
					<li class="dropdown"><a href="javascript:void(0)">Dropdown</a>
					
						<ul class="dropdown-content">
							<li><a href="#">Lorem ipsum</a></li>
							<li><a href="#">Magna veroeros</a></li>
							<li><a href="#">Etiam nisl</a></li>
							<li><a href="#">Sed consequat</a>
								<ul>
									<li><a href="#">Lorem dolor</a></li>
									<li><a href="#">Amet consequat</a></li>
									<li><a href="#">Magna phasellus</a></li>
									<li><a href="#">Etiam nisl</a></li>
									<li><a href="#">Sed feugiat</a></li>
								</ul></li>
							<li><a href="#">Nisl tempus</a></li>
						</ul></li>
					<li><a href="#">Left Sidebar</a></li>
					<li><a href="#">Right Sidebar</a></li>
					<li><a href="#">No Sidebar</a></li>
				</ul>
			</nav>
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