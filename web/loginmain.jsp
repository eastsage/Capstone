<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
<link href="./bootstrap-5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%@ include file="./navbar.jsp" %>
	<div class="container-fluid">
		<style>
		.jumbotron {
			background-color: #ffffff; /*점보트론배경색*/
		}
		</style>
		<div class="continer-fulid" style="text-align: center; justify-content: center;">
			<a href="./main.jsp">
				<img src="./resources/images/logotext.png" class="img-rounded" alt="Cinque Terre" style="width: 50%">
			</a>
		</div>
	</div>
	<br>
	<br>
	<div class="container-fluid" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h2 class="form-signin-heading">로그인</h2><p>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="j_security_check" method="post">
				<div class="mb-3">
					<label for="inputUserName" class="sr-only">User Name</label> 
					<input	type="text" class="form-control" placeholder="ID"	name='j_username' required autofocus>
				</div>
				<div class="mb-3">
					<label for="inputPassword" class="sr-only">Password</label> 
					<input 	type="password" class="form-control" placeholder="Password" name='j_password' required>
				</div>
				<button class="btn btn-primary" type="submit">로그인</button>
				<button class="btn btn-secondary" type="submit">회원가입</button>
			</form>
		</div>
		<hr>
		<a href="#"><u>비밀번호를 잊어버렸나요?</u></a>
	</div>
<%@ include file="footer.jsp" %>
<script src="./bootstrap-5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>