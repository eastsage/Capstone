<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" import="java.sql.*,java.util.*" %> 
<HTML>
<style type="text/css">
.my-box { 
border:4px;
border-style:double none double none ;
padding:5px; 
color:black; 
width : 750;
display: block; 
margin-right: auto;
margin-left: auto;

}
</style>  
<HEAD>
<SCRIPT language="javascript">
function check(){
 with(document.msgrewrite){
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
  document.msgrewrite.submit();
 }
}
</SCRIPT> 
<link href="filegb.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./bootstrap-4.6.0-dist/css/bootstrap.min.css">
</HEAD>
<BODY 	>
<%@ include file ="navbar.jsp" %>
<%@ include file="dbconn.jsp" %>

<P>

<%
 String sql=null;
// Connection con= null;
 Statement st =null;
 ResultSet rs =null;
 int pos=0;
 String sub=null;
 String cont=null;
 int step=0;
 int rnum=0;
 int mid=0;
 int id = Integer.parseInt(request.getParameter("id"));
 
 
 try {
  sql = "select * from freeboard where id="+id ;
  st = con.createStatement();
  rs = st.executeQuery(sql);
  if (!(rs.next()))  {
   out.println("해당 내용이 없습니다");
  } else {
   cont = ">" + rs.getString("content") ;
   while ((pos=cont.indexOf("\n", pos)) != -1) {
    String left=cont.substring(0, pos+1);
    String right=cont.substring(pos+1, cont.length());
    cont = left + ">" + right;
    pos += 2;
   }
   sub = "Re:" + rs.getString("subject");
   step = rs.getInt("step");
   mid = rs.getInt("masterid");                                     
   rnum = rs.getInt("replynum");                             
  %>
  <FORM name='msgrewrite'  method=POST action="freeboard_rsave.jsp?id=<%=id%>&page=<%=request.getParameter("page")%>">
  <div class="container text-center" style="background-color:#FFFFFF">
	
  <div class="form-group row">
		<div class = "my-box" align="center" style = "background-color:#FFFFFF; margin-bottom :30px" ><A href="freeboard_list.jsp"><FONT color=black face=굴림 size=10><STRONG>질문 답변</STRONG></FONT></A></div>
		</div>
		<div class="form-group row"  style="margin-left:170px;">
			<div class="col-6">
				<input type="text" id="name"  name="name" class="form-control"style="border-color:#000000;"placeholder="이름을 입력하세요">
			</div>
		</div>
		<div class="form-group row"style="margin-left:170px"  >
		
			<div class="col-6">
				<input type="text" id="email"  name="email" class="form-control"style="border-color:#000000;"placeholder="Email을 입력하세요">
			</div>
		</div>
		<div class="form-group row" style="margin-left:170px" >
			
			<div class="col-10">
				<input type="text" id="subject"  name="subject" class="form-control" value="Re :<%=rs.getString("subject")%>" style="border-color:#000000;"placeholder="제목을 입력하세요">
			</div>
		</div>		
		<div class="form-group row"  style="margin-left:170px">
			
			<div class="col-10">
				<textarea cols="65" rows="10" id="content"  name="content" class="form-control" style="border-color:#000000"placeholder="답변 내용을 입력하세요"></textarea>
			</div>
		</div>
		<div class="form-group row" style="margin-left:170px">
			
			<div class="col-5">
				<input type="password" id="password"  name="password" class="form-control"style="border-color:#000000; "placeholder="PassWord을 입력하세요"></div>
			<div class="offset-md-2 col-12"style = "color:#bdbebd">(정확한 비밀번호를 입력해야만 수정이 됩니다.)</div>
		</div>
	
		<div class="form-group row">
			<div class="col-12" style="display:inline-block; text-align:center;">
			<a href="#" onClick="check();"><img src="./resources/images/ok.gif" border="0" class="img-fluid"></a>
			&nbsp;&nbsp;
			<a href="#" onClick="history.go(-1)"><img src="./resources/images/cancle.gif" border="0" class="img-fluid"></a>
			&nbsp;&nbsp;
			<A href="freeboard_list.jsp?go=<%=request.getParameter("page") %>"> <img src="./resources/images/list.jpg" border=0 class="img-fluid"></a>
				
			</div>
		</div>
		</div>
	     
	
	
	
   
   <INPUT type="hidden" name="step" value="<%=step%>">
   <INPUT type="hidden" name="mid" value="<%=mid%>">
   <INPUT type="hidden" name="rnum" value="<%=rnum%>">
   </FORM>
  
<%
  }
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