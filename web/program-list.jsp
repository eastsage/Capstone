<%@ page import="java.util.*" %>
<%@ page import="jdk.internal.icu.impl.CharacterIteratorWrapper" %>
<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<script src="./jquery/jquery-3.5.1.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
<link href="./bootstrap-5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>ProgramList</title>
<style>
	.searchbar{
		margin-bottom: auto;
		margin-top: auto;
		height: 60px;
		background-color: #353b48;
		border-radius: 20px;
		padding: 10px;
	}
	
	.search_input{
		color: white;
		border: 0;
		outline: 0;
		background: none;
		width: 0;
		caret-color:transparent;
		line-height: 40px;
		transition: width 0.2s linear;
	}
	
	.searchbar:hover > .search_input{
		padding: 0 10px;
		width: 200px;
		caret-color:white;
		transition: width 0.2s linear;
	}
	
	.searchbar:hover > .search_icon{
		background: white;
	}
	
	.search_icon{
		height: 40px;
		width: 40px;
		float: right;
		display: flex;
		justify-content: center;
		align-items: center;
		border-radius: 50%;
		text-decoration:none;
	}
	
</style>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%@ include file="./navbar.jsp" %>
<div class="container-fluid" align="center">
	<br>
	<h2>ProgramList</h2>
	<br>
</div>
<div class="container-fluid bg-dark text-white">
	<div class="row">
		  <div class="col-md-8 themed-grid-col" style="text-align: start"><p>
		  	<h4>CheckList</h4>
		  	<div class="col-sm-8 themed-grid-col bg-light text-dark" style="margin-left: auto; margin-right: auto;text-align: center; border-radius: 20px; margin-bottom:5px;">
		  	항목:
				<a id="result" style="margin-left: auto; margin-right: auto;"></a><%--체크된 프로그램 그림--%>
			</div>
		  </div>
		  <div class="col-12 col-md-4 themed-grid-col">
		 	<div class="d-flex justify-content-center h-100">
		        <div class="searchbar">
		          <input class="search_input" id="Input" onkeyup="SearchFunction()" type="text" placeholder="검색">
		          <a class="search_icon"><img src="./resources/images/searchicon.png" width="30" height="30"><i class="fas fa-search"></i></a>
		        </div>
      		</div><p>
		  </div>
	</div>
</div>

<hr style="margin-left: auto; margin-right: auto; width: 80%;">

<div class="container-fulid col-md-9 themed-grid-col" style="margin-left: auto; margin-right: auto; text-align: center;">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="border-radius: 20px;">
			<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" style="margin-left: auto; margin-right: auto; text-align: center;">
				<button type="button" class="btn btn-outline-light active" data-bs-toggle="button" autocomplete="off" aria-pressed="true">All Program</button>
				<button type="button" class="btn btn-outline-light" data-bs-toggle="button" autocomplete="off">컴퓨터공학과</button>
			</div>	
		</nav>
</div>
<br>
<div class="container-fluid" style="width: 75%;">
	<form action="specification.jsp" method="post">
		<table class="table table-striped" id="Program_Table" style="margin-left: auto; margin-right: auto; text-align: center;">
			<thead>
			<tr>
				<th style="width:5%;"></th>
				<th style="width:5%;"></th>
				<th style="width:30%;">프로그램 이름</th>
				<th style="width:30%;">카테고리</th>
				<th style="width:30%;">OS</th>
			</tr>
			</thead>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				String sql = "select * from Program";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while (rs.next()) {
			%>
			<tr>
				<td><input type="checkbox" name="pcheck" value="<%=rs.getString("p_name")%>"/></td>
				<td><img src="./resources/images/<%=rs.getString("p_name")%>.png" style="width: 30px; height: 30px;"></td>
				<td><%=rs.getString("p_name")%></td>
				<td><%=rs.getString("p_category")%></td>
				<td><%=rs.getString("p_os")%></td>
			</tr>
			<%
				}

				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			%>

		</table>
		<br>
		<button class="btn bg-dark text-white" type="submit" id="selectBtn" style="float: right;">선택완료 &raquo;</button>
	</form>
</div>

<script>
function SearchFunction() {
	var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("Input");
		filter = input.value.toUpperCase();
		table = document.getElementById("Program_Table");
		tr = table.getElementsByTagName("tr");
	for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[2]; // []테이블 열 번호 
		if (td) {
			txtValue = td.textContent || td.innerText;
			if (txtValue.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} 
			else {
				tr[i].style.display = "none";
			}
		}       
	}
}

$("input[type='checkbox']").change(function() {
	var progArr = new Array();
	var checkbox = $("input[name=pcheck]:checked");

	// 체크된 체크박스 값을 가져온다
	checkbox.each(function(i) {
		var tr = checkbox.parent().parent().eq(i);
		var td = tr.children();	
		var pname = td.eq(2).text() + ""; // td.eq(2)= 프로그램이름 행
		progArr.push('<img src=\"./resources/images/'+ pname + '.png\" width=\"25\" height=\"25\">');
	});
	// 출력
	document.getElementById('result').innerHTML
			= progArr;
});


</script>
<script src="./bootstrap-5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>