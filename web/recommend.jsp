<%@ page contentType = "text/html; charset=utf-8" %>
<!doctype html>
<html>
<head>
	<!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 

    <!-- Bootstrap CSS -->
    <link href="./bootstrap-5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>학년별 추천</title>
</head>
<body>
	<%@ include file="./navbar.jsp" %>
	<div class="container marketing">
    <div class="row">
	<nav class = "navbar navbar-expand-md navbar-secondary bg-light">
		<div class="container">
	    	<div class="row">
	    	 
		    	<p>
					<a class="btn btn-secondary"  data-bs-toggle="collapse" href="#전공" role="button" aria-expanded="false" aria-controls="collapseExample">
				    	전공선택#Click!
				   
				    </a>
				    <a class="btn btn-secondary" data-bs-toggle="collapse" href="#게임" role="button" aria-expanded="false" aria-controls="collapseExample">
				    	게임#Click!
				    </a>
				</p>
				
				<div class="collapse" id="전공">
					<%@ include file="recommend2.jsp" %>
				</div>
				
				<div class="collapse" id="게임">
					<%@ include file="recommend3.jsp" %>
				</div>
	    	</div>
	</nav>
	</div>
	</div>
	</div>
<script src="./bootstrap-5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>