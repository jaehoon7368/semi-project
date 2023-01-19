<%@page import="com.sh.airbnb.user.model.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User loginUser = (User) session.getAttribute("loginUser");
	String msg = (String) session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg");
	
	Cookie[] cookies = request.getCookies();
	String saveId = null;
	if(cookies != null){
		for(Cookie cookie : cookies){
			String name = cookie.getName();
			String value = cookie.getValue();
			// System.out.println(name + "=" + value);
			if("saveId".equals(name))
				saveId = value;
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alpha</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css" />
<script src="<%= request.getContextPath()%>/js/jquery-3.6.1.js"></script>
</head>

<body>
	<div id="container">
        <header>
            <div class=>
                <h2><a href="<%=request.getContextPath()%>" id="mainTitle">Alpha</a></h2>
            </div>
            
            <div>
            <div id="profile-img" onclick="profileMenu();">
        			<i class="fa-regular fa-user" id="fa-user" ><span> <i class="fa-solid fa-bars" id="fa-bar"></i></span></i>
            </div>
            
            <div id="profile-menu" onclick="profileMenu();">
		        <div id="wrapper">
		            <div id="sign">
		                <ul>
		                    <li><button id="signin" onclick="location.href = '<%= request.getContextPath() %>/user/userLogin';">로그인</button></li>
		                    <li><button id="signup" onclick="location.href = '<%= request.getContextPath() %>/user/userEnroll';">회원가입</button></li>
		                   	<li><button id="btn1">관리자로그인</button></li>
		                </ul>
		            </div>
		            <hr>
		            <div id="board">
		                <ul>
		                    <li><a href=""></a>공지사항</li>
		                    <li><a href=""></a>자주 묻는 질문</li>
		                    <li><a href=""></a>1:1 문의</li>
		                </ul>
		        </div>
		     </div>
        </header> 
        <!-- header 종료 -->
        
       

        <div id="content" class=""></div>
        
<script>
	document.querySelector("#btn1").addEventListener('click',()=>{
	location.href ="<%=request.getContextPath()%>/admin/adminhotelenroll"
	
});

function profileMenu() {
	const Img = document.querySelector("#profile-img");
	const Menu = document.querySelector("#profile-menu");
	
	Img.classList.toggle("active");
	Menu.classList.toggle("active");
} 

window.addEventListener('load', () => {
	
	<% if(msg != null) { %>
		alert("<%= msg %>");
	<% } %>
	
	<% if (loginUser == null) { %>
	document.loginFrm.addEventListener('submit', (e) => {
		const userId = document.querySelector("#userId");
		const password = document.querySelector("#password");
		
		if(!/^\w{4,}$/.test(userId.value)){
			alert("유효한 아이디를 입력하세요.");
			userId.select();
			e.preventDefault(); // 폼제출방지
			return; // 조기리턴
		}
		
		if(!/^\w{4,}$/.test(password.value)){
			alert("유효한 비밀번호를 입력하세요");
			password.select();
			e.preventDefault();
			return;
		}
	});
	<% } %>
	
});

</script>
