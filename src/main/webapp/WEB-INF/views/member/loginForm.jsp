<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/porfolio/member/login" method="post">
	<ul>
	    <li>아이디(e-mail)<input type="text" name="member_email" ></li>
	    <li>비밀번호<input type="password" name="member_pw" ></li>
	    <li><span class="svr_msg" id="svr_smg">${svr_msg }</span></li>
	    <li><button id="loginBtn">로그인</button></li>
    </ul>
  </form>
</body>
</html>