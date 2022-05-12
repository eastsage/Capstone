<%@ page contentType = "text/html; charset=utf-8" %>
<!doctype html>
<html>
<head>
	<!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 

    <!-- Bootstrap CSS -->
    <link href="./bootstrap-5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>전공 선택</title>
</head>
<body>
	<%@ include file="./navbar.jsp" %>
	<div class="container">
	
	<!-- 이미지 -->
		<div class="container-fulid" style="text-align: center; justify-content: center;">
			<br>
			<a href="./main.jsp">
				<img src="./resources/images/logotext.png" class="img-rounded" alt="Cinque Terre" style="width: 50%">
			</a>
		</div>
		<br>
		
	<!-- 전공선택 컨테이너 -->
		<div class="container text-dark" align="center">
			<br>
			<h2>major</h2>
			<br>
		</div>
		<br>
	
	<!-- 선택 화면 -->
    <div class="row">
		<div class="container">
	    	<div class="row">    	 
				<%@ include file="major.jsp" %>
	    	</div>
		</div>
	</div>
		<div class="container">
			<br><br><br><br><br>
		</div>
	</div>
<script src="./bootstrap-5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>