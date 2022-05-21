<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<script src="./jquery/jquery-3.5.1.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
<link href="./bootstrap-5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./proglist.css" />
<meta charset="UTF-8">
<title>ProgramList</title>
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
		  		<a id="result" style="margin-left: auto; margin-right: auto;"></a>
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
<br>
<div class="container-fluid" style="width: 75%;">
	<form action="specification.jsp" name="checkform" method="post">
		<table class="table table-hover table-light" id="Program_Table" style="margin-left: auto; margin-right: auto; text-align: center;">
			<thead>
					<tr>
						<th style="width:5%; vertical-align : middle;"></th>
						<th style="width:5%; vertical-align : middle;"></th>
						<th style="width:30%; vertical-align : middle;">프로그램 이름</th>
						<th style="width:30%; vertical-align : middle;">Category
						<button class="btn btn-sm dropdown-toggle" type="button" id="categoryDrop" data-bs-toggle="dropdown" aria-expanded="false"></button>
						  <ul class="dropdown-menu dropdown-menu-dark Category">
						    <li><a class="dropdown-item" id="allprogBTN">All Program</a></li>
						    <li><a class="dropdown-item" id="developers">developers</a></li>
						    <li><a class="dropdown-item" id="music">music</a></li>
						    <li><a class="dropdown-item" id="productivity">productivity</a></li>
						    <li><a class="dropdown-item" id="video">video</a></li>
						    <li><a class="dropdown-item" id="photos">photos</a></li>
						  </ul>
						</th>
						<th style="width:30%; vertical-align : middle;">OS</th>
					</tr>
			</thead>
			<tbody id="progtbody">
			<%
				request.setCharacterEncoding("UTF-8");
				String major = request.getParameter("major");
				
				Statement st = null;
				ResultSet rs = null;
				st = con.createStatement();

				String major_sql = "select m_prog from Major ";
				major_sql = major_sql + "where m_name = \"" + major +"\"";
				rs = st.executeQuery(major_sql);
				ArrayList<String> major_arr = new ArrayList<String>();

//				resultset의 내용중 m_prog들을 arrList에 추가
				while (rs.next()){
					major_arr.add(rs.getString("m_prog"));
				}
				
				PreparedStatement pstmt = null;
				rs = null;
				
				String sql = "select * from Program";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
			%>
				<tr>
					<td><input type="checkbox" name="pcheck" value="<%=rs.getString("p_name")%>"
					<%--arrList에 (?) 같은 값이 있다면 true반환--%>
					<%
						if (major_arr.contains(rs.getString("p_name"))) {
							out.print(" checked");
						}
					%>
					/></td>
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
			</tbody>
		</table>
		<div>
			<button class="btn bg-dark text-white" onclick="nocheck()" type="submit" id="selectBtn" style="float: right;">선택완료 &raquo;</button>
		</div>
	</form>
</div>
<p>
<br>
<br>
<%@ include file="footer.jsp" %>
<script>
/* 검색 행 숨김 */
function SearchFunction() {
	var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("Input");
		filter = input.value.toUpperCase();
		table = document.getElementById("progtbody");
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


/* 버튼 카테고리 부분 */
var button = document.querySelectorAll("ul.Category > li"), //Category클래스를 가진 div에 모든 button엘리민트의 리스트
	table = document.getElementById("progtbody"),
	tr = table.getElementsByTagName("tr"), i, j;
for(i = 0; i < button.length; i++){
	button[i].addEventListener("click", function(id) {
		var btn = id.target.id
		if (btn == "allprogBTN") {
		  	for (j = 0; j < tr.length; j++) {
		    	tr[j].style.display = ""
		  	}
		} 
		else {
		  	for(j = 0; j < tr.length; j++) {
		  		tr[j].style.display = ""
				if (tr[j].childNodes[7].innerText != btn) {
			  		tr[j].style.display = "none"
				}
		  	}
		}
	})
}
/* 체크박스 선택리스트 이미지 출력 */
 $("input[type='checkbox']").ready(function() {
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
function nocheck() {
	if ($("input:checkbox[name='pcheck']").is(":checked")==false) {
		alert("최소 하나의 프로그램을 선택하세요.");
		return;
	}
}
</script>
<script src="./bootstrap-5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>