<%@ page contentType = "text/html; charset=utf-8" %>
<!doctype html>
<html>
<head>
	<!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 

    <!-- Bootstrap CSS -->
    <link href="./bootstrap-5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>설명 페이지</title>
	
	<style>
		img { 
 		    float: left;
		}
		p1 {
			font-size: 18px
		}
	</style>
<%--
			        <img src="./resources/images/CPU.png" class="img-rounded" alt="Cinque Terre" style="width: 11%">
			        <h1 class="display-1">CPU</h1>
			--%>	
</head>
<body>
	<%@ include file="./navbar.jsp" %>
	
	<div class="container-fluid">
		<div class="row">
		
			<!-- 사이드바 -->
			<div class="col-2 border-end border-dark">
				<nav id="manual-sidebar" class="navbar navbar-border bg-border text-dark flex-column align-items-stretch p-5 position-fixed">
			       <a class="navbar-brand text-dark"><h3>&nbsp&nbsp목차</h3></a>
			       <hr>
			       <nav class="nav nav-tabs flex-column">
			         <a class="nav-link text-dark" href="#">&raquo; 사용법</a>
			         <nav class="nav nav-tabs flex-column">
			           <a class="nav-link ms-3 my-1 text-dark" href="#manual-manual">컴공친구?</a>
			         </nav>
			         <a class="nav-link text-dark" href="#manual-cpu">&raquo; 부품</a>
			         <nav class="nav nav-pills flex-column">
			           <a class="nav-link ms-3 my-1 text-dark" href="#manual-cpu">CPU</a>
			           <a class="nav-link ms-3 my-1 text-dark" href="#manual-gpu">GPU</a>
			           <a class="nav-link ms-3 my-1 text-dark" href="#manual-ram">RAM</a>
			           <a class="nav-link ms-3 my-1 text-dark" href="#manual-mb">MB</a>
			           <a class="nav-link ms-3 my-1 text-dark" href="#manual-ssd">SSD</a>
			         </nav>
			       </nav>
			     </nav>
			</div>
			<div class="col-1"></div>
			
			<!-- 본문 -->
			<div class="col-6">
				<div class="my-auto" style="height: 80px" id="manual-manual"></div>
	        	<h1 class="display-4 text-center" id="manual">컴공친구?</h1>
	        	<p>컴공친구 사용 설명서</p>
	        	<hr>
	        	<div class="my-4"></div>
	        	<p1>
	        		&nbsp&nbsp&nbsp컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용
	        	</p1>
	        	<div class="my-auto" style="height: 400px"></div>
	        	<div class="my-auto" style="height: 100px" id="manual-cpu"></div>
	        	<h1 class="display-4 text-center">CPU</h1>
	        	<p>CPU</p>
	        	<hr>
	        	<div class="my-4"></div>
	        	<p1>
	        		&nbsp&nbsp&nbsp컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용
	        	</p1>
	        	<div class="my-auto" style="height: 400px"></div>
	        	<div class="my-auto" style="height: 100px" id="manual-gpu"></div>
	        	<h1 class="display-4 text-center" id="gpu">GPU</h1>
	        	<p>GPU</p>
	        	<hr>
	        	<div class="my-4"></div>
	        	<p1>
	        		&nbsp&nbsp&nbsp컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용
	        	</p1>
	        	<div class="my-auto" style="height: 400px"></div>
	        	<div class="my-auto" style="height: 100px" id="manual-ram"></div>
	        	<h1 class="display-4 text-center" id="ram">RAM</h1>
	        	<p>RAM</p>
	        	<hr>
	        	<div class="my-4"></div>
	        	<p1>
	        		&nbsp&nbsp&nbsp컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용
	        	</p1>
	        	<div class="my-auto" style="height: 400px"></div>
	        	<div class="my-auto" style="height: 100px" id="manual-mb"></div>
	        	<h1 class="display-4 text-center" id="mb">MB</h1>
	        	<p>MB</p>
	        	<hr>
	        	<div class="my-4"></div>
	        	<p1>
	        		&nbsp&nbsp&nbsp컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용
	        	</p1>
	        	<div class="my-auto" style="height: 400px"></div>
	        	<div class="my-auto" style="height: 100px" id="manual-ssd"></div>
	        	<h1 class="display-4 text-center" id="ssd">SSD</h1>
	        	<p>SSD</p>
	        	<hr>
	        	<div class="my-4"></div>
	        	<p1>
	        		&nbsp&nbsp&nbsp컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용 컴공친구 본문 내용
	        	</p1>
	        	<div class="my-auto" style="height: 500px"></div>
			</div>
			<div class="col-3"></div>
		</div>
	</div>
<script src="./bootstrap-5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>