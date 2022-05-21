<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page language="java" import="java.sql.*" %> 
<HTML>
<link href="fboard.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./bootstrap-4.6.0-dist/css/bootstrap.min.css">
<HEAD>
<SCRIPT language="javascript">
function check() {
 with(document.msgwrite){
  if(subject.value.length == 0){
   alert("제목을 입력해 주세요!!");
   subject.focus();
   return false;
  }
  if(name.value.length == 0){
   alert("이름을 입력해 주세요!!");
   name.focus();
   return false;
  }
  if(password.value.length == 0){
   alert("비밀번호를 입력해 주세요!!");
   password.focus();
   return false;
  }
  if(content.value.length == 0){
   alert("내용을 입력해주세요!!");
   content.focus();
   return false;
  }
  document.msgwrite.submit();
 }
}
</SCRIPT> 
<link href="filegb.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY style= "background-color:#FFFFFF ">
<%@ include file="dbconn.jsp" %>
<%@ include file="navbar.jsp" %>

<P>
<%
 String sql=null;
// Connection con= null;
 PreparedStatement st =null;
 ResultSet rs =null;
 int cnt=0;
 int id = Integer.parseInt(request.getParameter("id"));
 String p= request.getParameter("page");
 
 
 try {
  sql = "select * from freeboard where id=? ";
  st = con.prepareStatement(sql);
  st.setInt(1, id);
  rs = st.executeQuery();
  if (!(rs.next()))  {
   out.println("해당 내용이 없습니다");
  } else {
%>
<FORM name="msgwrite" method=POST action="freeboard_upddb.jsp?id=<%=id%>&page=<%=p%>">
<div class="container text-center" style="background-color:#FFFFFF">
	<form name="msgwrite" action="freeboard_save.jsp?table=gallery" class="form-horizontal" method="post">
		<div class="form-group row">
		<div class = "my-box" align="center" style = "background-color:#FFFFFF; margin-bottom :30px" ><A href="freeboard_list.jsp"><FONT color=black face=굴림 size=10><STRONG>글 수정</STRONG></FONT></A></div>
		</div>
		<div class="form-group row"  style="margin-left:170px;">
			<div class="col-6">
				<input type="text" id="name"  name="name" class="form-control"value="<%=rs.getString("name")%>"style="border-color:#000000;"placeholder="이름을 입력하세요">
			</div>
		</div>
		<div class="form-group row"style="margin-left:170px"  >
		
			<div class="col-6">
				<input type="text" id="email"  name="email" class="form-control"value="<%=rs.getString("email")%>"style="border-color:#000000;"placeholder="Email을 입력하세요">
			</div>
		</div>
		<div class="form-group row" style="margin-left:170px" >
			
			<div class="col-10">
				<input type="text" id="subject"  name="subject" class="form-control" value="<%=rs.getString("subject")%>"style="border-color:#000000;"placeholder="제목을 입력하세요">
			</div>
		</div>		
		<div class="form-group row"  style="margin-left:170px">
			
			<div class="col-10">
			
				<textarea cols="65" rows="10" id="content"  name="content" class="form-control" style="border-color:#000000"placeholder="내용을 입력하세요"><%=rs.getString("content")%></textarea>
			</div>
		</div>
		<div class="form-group row" style="margin-left:170px">
			
			<div class="col-5">
			
				<input type="password" id="password"  name="password" class="form-control"style="border-color:#000000; "placeholder="PassWord을 입력하세요"><br>(정확한 비밀번호를 입력해야만 수정이 됩니다.)</div>
			
		</div>
	
		<div class="form-group row">
			<div class="col-12" style="display:inline-block; text-align:center;">
			<a href="#" onClick="check();"><img src="./resources/images/ok.gif" border="0"class="img-fluid"></a>
			&nbsp;&nbsp;
			<a href="#" onClick="history.go(-1)"><img src="./resources/images/cancle.gif"  border="0" class="img-fluid"></a>
			&nbsp;&nbsp;
			<A href="freeboard_list.jsp?go=<%=request.getParameter("page") %>"> <img src="./resources/images/list.jpg" border=0 class="img-fluid"></a>
				
				
				
			</div>
		</div>
	</form>
</div>	     
 
 
</FORM>

<%
  }
  rs.close();
  st.close();
  con.close();
 } catch (SQLException e) {
  out.println(e);
 } 

%>
 <script src="./bootstrap-4.6.0-dist/jquery/jquery-3.5.1.js"></script>
 <script src="./bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js"></script>
</BODY>
</HTML>