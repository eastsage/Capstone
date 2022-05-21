<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page language="java" import="java.sql.*" %> 
<% request.setCharacterEncoding("utf-8"); %>
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
<HEAD><TITLE>글 삭제하기</TITLE>
<link href="filegb.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./bootstrap-4.6.0-dist/css/bootstrap.min.css">
</HEAD>
<BODY style ="background-color:white" >
<%@ include file ="navbar.jsp" %>
<%@ include file="dbconn.jsp" %>
 <div class="container text-center" style="background-color:#FFFFFF">
	
  <div class="form-group row">
		<div class = "my-box" align="center" style = "background-color:#FFFFFF; margin-bottom :30px" ><a href="freeboard_list.jsp?go=<%=request.getParameter("page")%>"><FONT color=black face=굴림 size=10><STRONG>메인으로 돌아가</STRONG></FONT></a></div>
		</div>
		</div>
		

<%
 String sql=null;
 //Connection con= null;
 PreparedStatement st =null;
 ResultSet rs =null;
 int cnt=0;

 int id = Integer.parseInt(request.getParameter("id"));
 
 
 try {
  sql = "select * from freeboard where id=? ";
  st = con.prepareStatement(sql);
  st.setInt(1, id);
  rs = st.executeQuery();
  if (!(rs.next()))  {
   out.println("해당 내용이 없습니다");
  } else {
   String pwd= rs.getString("password"); 
   if (pwd.equals(request.getParameter("password"))) {
    sql = "delete from freeboard where id=?";
    st = con.prepareStatement(sql);
    st.setInt(1, id);
    cnt = st.executeUpdate(); 
    if (cnt >0) 
     out.println("정상적으로 삭제되었습니다.");
    else 
     out.println("삭제되지 않았습니다.");
   } else {
    out.println("비밀번호가 틀립니다.");
   }
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