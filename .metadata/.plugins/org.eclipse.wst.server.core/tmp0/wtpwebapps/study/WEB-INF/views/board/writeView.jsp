<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<meta charset="UTF-8">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<meta charset="UTF-8">
	<title>게시판</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function(){
			if(fn_valiChk()){
				return false;
			}
			formObj.attr("action", "/board/write");
			formObj.attr("method", "post");
			formObj.submit();
		});
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "/board/list";
		})	
	})
	function fn_valiChk(){
		var writeForm = $("form[name='writeForm'] .chk").length;
		for(var i = 0; i<writeForm; i++){
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}	
	function fn_addFile(){
		var fileIndex = 1;
		//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' 
		//																										id='fileAddBtn'>"+"추가"+"</button></div>");
		$(".fileAdd_btn").on("click", function(){
			$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
		});
		$(document).on("click","#fileDelBtn", function(){
			$(this).parent().remove();
			
		});
	}
</script>
<body>
	<div class="container">
		<header>
			<h1>게시판 글 작성</h1>
		</header>
		<hr/>
		<div>
			<%@include file="nav.jsp" %>
		</div>
		<hr/>
		<section id="container">
			<form name="writeForm" role="form" method="post" action="/board/write" enctype="multipart/form-data">
				<table>
					<tbody>
						<c:if test="${member.userId != null}">
							<div class="form-group">
								<label for="title" class="col-sm-2 control-label">제목</label>
								<div class="col-sm-10">
									<input type="text" id="title" name="title" class="chk form-control"  title="제목을 입력하세요."/>
								</div>
							</div>
							<div class="form-group">
									<label for="content" class="col-sm-2 control-label">내용</label>
									<div class="col-sm-10">
										<textarea id="content" name="content" rows="20" cols="100" class="chk form-control" title="내용을 입력하세요."></textarea>
									</div>
							</div>
							<div class="form-group">
									<label for="writer" class="col-sm-2 control-label">작성자</label>
									<div class="col-sm-10">
										<input type="text" id="writer" name="writer" class="chk form-control" title="작성자를 입력하세요."/>
									</div>
							</div>
							<div class="form-group">
								<div class="col-sm-10">
									<input type="file" name="file">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="write_btn btn-success">작성</button>
									<button type="submit" class="cancel_btn btn-danger">취소</button>
									<button type="button" class="fileAdd_btn btn-primary">파일추가</button>
								</div>
							</div>
						</c:if>
						<c:if test="${member.userId == null}">
							<p>로그인 후에 작성하실 수 있습니다.</p>
						</c:if>
					</tbody>
				</table>
			</form>
		</section>
	</div>
</body>
</html>