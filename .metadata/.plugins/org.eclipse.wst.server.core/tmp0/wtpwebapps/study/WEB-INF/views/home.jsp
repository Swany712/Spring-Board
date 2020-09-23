<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>Home</title>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		//로그아웃
		$(".logout").on("click", function(){
			location.href="member/logout";
		})
		
		//회원가입
		$(".sign").on("click", function(){
			location.href="member/sign";
		})
		
		//회원정보 수정
		$(".memberUpdate").on("click", function(){
			location.href="member/memberUpdateView";
		})
		
		//회원정보 수정
		$(".memberDelete").on("click", function(){
			location.href="member/memberDeleteView";
		})
	})
</script>
<body>
	<div class="container">
		<header>
			<h1>로그인</h1>
		</header>
		<hr/>
		<h2>
			<a href="/board/list">게시판</a>
		</h2>
		<hr/>
		<form name='homeForm' method="post" action="/member/login">
			<c:if test="${member == null}">
				<div class="form-group">
					<label for="userId" class="col-sm-2 control-label">아이디</label>
					<input type="text" id="userId" name="userId"/>
				</div>
				<div class="form-group">
					<label for="userPass" class="col-sm-2 control-label">비밀 번호</label>
					<input type="password" id="userPass" name="userPass"/>
				</div>
				<hr/>
				<div class="form-group">
					<button type="submit" class="submit btn btn-success">로그인</button>
					<button type="button" class="sign btn btn-primary">회원가입</button>
				</div>
			</c:if>
			<c:if test="${member != null }">
				<div class="form-group">
					<h2>
						${member.userId}님 환영 합니다.
					</h2>
					<button class="memberUpdate btn btn-primary" type="button">회원정보 수정</button>
					<button class="memberDelete btn btn-danger" type="button">회원 탈퇴</button>
					<button class="logout btn btn-warning" type="button">로그아웃</button>
				</div>
			</c:if>
			<c:if test="${msg == false}">
				<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
			</c:if>
		</form>
	</div>
</body>
</html>
