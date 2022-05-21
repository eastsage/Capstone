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
	<%@ include file="dbconn.jsp" %>
	<%@ include file="./navbar.jsp" %>
	<div class="container">
	
	<!-- 이미지 -->
		<div class="container-fulid" style="text-align: center; justify-content: center;">
			<br>
			<a href="index.jsp">
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
    <div class="row">
		<div class="container">
	    	<div class="row">
	    		<form method="post">
					<div class="accordion" id="accordionExample">
						<div class="card bg-dark">
						  <div class="accordion-item">
						    <h2 class="accordion-header" id="heading1">
						      <button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="true" aria-controls="collapseOne">
						        <h4>정보계열</h4>
						      </button>
						    </h2>
						    <div id="collapse1" class="accordion-collapse collapse" aria-labelledby="heading1" data-bs-parent="#accordionExample">
						      <div class="accordion-body bg-light">
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="컴퓨터공학과" formaction="program-list.jsp">컴퓨터공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="정보통신공학과" formaction="program-list.jsp">정보통신공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="정보보안공학과" formaction="program-list.jsp">정보보안공학과</button>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item">
						    <h2 class="accordion-header" id="heading2">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapseTwo">
						        <h4>기계계열</h4>
						      </button>
						    </h2>
						    <div id="collapse2" class="accordion-collapse collapse" aria-labelledby="heading2" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="기계공학과" formaction="program-list.jsp">기계공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="제어계측공학과" formaction="program-list.jsp">제어계측공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="자동차공학과" formaction="program-list.jsp">자동차공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="로봇공학과" formaction="program-list.jsp">로봇공학과</button>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item">
						    <h2 class="accordion-header" id="heading3">
						      <button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="false" aria-controls="collapseThree">
						        <h4>전기계열</H4>
						      </button>
						    </h2>
						    <div id="collapse3" class="accordion-collapse collapse" aria-labelledby="heading3" data-bs-parent="#accordionExample">
						      <div class="accordion-body bg-light">
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="전기공학과" formaction="program-list.jsp">전기공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="원자력공학과" formaction="program-list.jsp">원자력공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="에너지공학과" formaction="program-list.jsp">에너지공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="제어공학과" formaction="program-list.jsp">제어공학과</button>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item">
						    <h2 class="accordion-header" id="heading4">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="false" aria-controls="collapseThree">
						        <h4>화학계열</H4>
						      </button>
						    </h2>
						    <div id="collapse4" class="accordion-collapse collapse" aria-labelledby="heading4" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="화학공학과" formaction="program-list.jsp">화학공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="재료공학과" formaction="program-list.jsp">재료공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="생명공학과" formaction="program-list.jsp">생명공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="식품공학과" formaction="program-list.jsp">식품공학과</button>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item">
						    <h2 class="accordion-header" id="heading5">
						      <button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#collapse5" aria-expanded="false" aria-controls="collapseThree">
						        <h4>토목계열</H4>
						      </button>
						    </h2>
						    <div id="collapse5" class="accordion-collapse collapse" aria-labelledby="heading5" data-bs-parent="#accordionExample">
						      <div class="accordion-body bg-light">
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="건축공학과" formaction="program-list.jsp">건축공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="토목공학과" formaction="program-list.jsp">토목공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="농업토목공학과" formaction="program-list.jsp">농업토목공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="조경학과" formaction="program-list.jsp">조경학과</button>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item">
						    <h2 class="accordion-header" id="heading6">
						      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse6" aria-expanded="false" aria-controls="collapseThree">
						        <h4>교통계열</H4>
						      </button>
						    </h2>
						    <div id="collapse6" class="accordion-collapse collapse" aria-labelledby="heading6" data-bs-parent="#accordionExample">
						      <div class="accordion-body">
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="도시공학과" formaction="program-list.jsp">도시공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="교통공학과" formaction="program-list.jsp">교통공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="철도공학과" formaction="program-list.jsp">철도공학과</button>
						      </div>
						    </div>
						  </div>
						  <div class="accordion-item">
						    <h2 class="accordion-header" id="heading7">
						      <button class="accordion-button collapsed bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#collapse7" aria-expanded="false" aria-controls="collapseThree">
						        <h4>미디어계열</H4>
						      </button>
						    </h2>
						    <div id="collapse7" class="accordion-collapse collapse" aria-labelledby="heading7" data-bs-parent="#accordionExample">
						      <div class="accordion-body bg-light">
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="미디어공학과" formaction="program-list.jsp">미디어공학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="영상미디어학과" formaction="program-list.jsp">영상미디어학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="미디어컨텐츠학과" formaction="program-list.jsp">미디어컨텐츠학과</button>
							      <button class="m-1 btn btn-dark" type="submit" name="major" value="방송미디어학과" formaction="program-list.jsp">방송미디어학과</button>
						      </div>
						    </div>
						  </div>
						</div>
					</div>
				</form>
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