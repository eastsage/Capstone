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
					<a class="btn btn-secondary"  data-bs-toggle="collapse" href="#컴퓨터" role="button" aria-expanded="false" aria-controls="collapseExample">
				    	컴퓨터 공학
				   
				    </a>
				  
				</p>
				
				<div class="collapse" id="컴퓨터">
					<%@ include file="computer.jsp" %>
				</div>
				
				
	    	</div>
	</nav>
	</div>
	</div>
	</div>
<script src="./bootstrap-5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>