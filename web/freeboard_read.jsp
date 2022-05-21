<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page language="java" import="java.sql.*,java.util.*" %> 

<HTML>
<HEAD>
<TITLE>글 읽기</TITLE>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./bootstrap-4.6.0-dist/css/bootstrap.min.css">
<link href="filegb.css" rel="stylesheet" type="text/css">
<style type="text/css">
.color{
background-color:#000000;
}
.my-box { 
border:4px;
border-style:double none double none ;
padding:5px; 
color:black; 
width : 750;
display: block; 
margin-right: auto;
margin-left: auto;
margin-top: 30px;
}
</style>
</HEAD>
<BODY style = "background-color : #FFFFFF">
<%@ include file  = "navbar.jsp" %>
<%@ include file="dbconn.jsp" %>
<P><div class = "my-box" align="center"><FONT color=black face=굴림 size=10><STRONG>궁금해?</STRONG></FONT></div></P> 
<div></div>
<%
 String sql=null;
// Connection con= null;
 PreparedStatement st =null;
 ResultSet rs =null;

 int id = Integer.parseInt(request.getParameter("id"));
 

 try {
  sql = "select * from freeboard where id=? ";
  st = con.prepareStatement(sql);
  st.setInt(1, id);
  rs = st.executeQuery();
 
  if (!(rs.next()))  {
   out.println("해당 내용이 없습니다");
  } 
  else {
     String em=rs.getString("email");
   if ((em != null) && (!(em.equals(""))) ) 
    em = "<A href=mailto:" +em + ">" + rs.getString("name")+"</A>";
   else
    em = rs.getString("name");
   
   out.println("<table class='table'>");
  

   out.println("<thread>");
      out.println("<tr class='color'>");
         out.println("<th class='color' colspan=\"4\" scope=\"col\"style='border-width:4px;border-color:#000000'><FONT color='white'>제목 : " + rs.getString("subject") + "</th>");
       
         out.println("</thread>");
         out.println("<tboard>");
    
            out.println("<td class='color' colspan=\"4\" scope=\"row\" style='border-width:4px;border-color:#000000'><FONT color='white'>글쓴이 : " + em + "</td>");
       
 
            out.println("<td class='color' colspan=\"4\" scope=\"row\"style='border-width:4px;border-color:#000000'><FONT color='white'>작성일 : " + rs.getString("inputdate") + "</td>");
    
            out.println("<td class='color'colspan=\"4\" scope=\"row\"style='border-width:4px;border-color:#000000'><FONT color='white'>조회 : " + rs.getInt("readcount") + "</td>");
            out.println("</tr>");
            out.println("<tr>");
          
   
            out.println("<td colspan=\"2\" scope=\"row\"style='border-width:4px; border-color:#000000' >" + rs.getString("content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
         out.println("</tr>");
      out.println("</tboard>");
   out.println("</table>");
      
      
      
      
   /* out.println("<table width='600' cellspacing='0' cellpadding='2'>");
   out.println("<tr>");
   out.println("<td height='22'>&nbsp;</td></tr>");
   out.println("<tr align='center'>");
   out.println("<td height='1' bgcolor='#1F4F8F'></td>");
   out.println("</tr>");
   out.println("<tr align='center' bgcolor='#DFEDFF'>");
   out.println("<td class='button' bgcolor='#DFEDFF'>"); 
   out.println("<div align='left'><font size='2'>"+rs.getString("subject") + "</div> </td>");
   out.println("</tr>");
   out.println("<tr align='center' bgcolor='#FFFFFF'>");
   out.println("<td align='center' bgcolor='#F4F4F4'>"); 
   out.println("<table width='100%' border='0' cellpadding='0' cellspacing='4' height='1'>");
   out.println("<tr bgcolor='#F4F4F4'>");
   out.println("<td width='13%' height='7'></td>");
   out.println("<td width='51%' height='7'>글쓴이 : "+ em +"</td>");
   out.println("<td width='25%' height='7'></td>");
   out.println("<td width='11%' height='7'></td>");
   out.println("</tr>");
   out.println("<tr bgcolor='#F4F4F4'>");
   out.println("<td width='13%'></td>");
   out.println("<td width='51%'>작성일 : " + rs.getString("inputdate") + "</td>");
   out.println("<td width='25%'>조회 : "+rs.getInt("readcount")+"</td>");
   out.println("<td width='11%'></td>");
   out.println("</tr>");
   out.println("</table>");
   out.println("</td>");
   out.println("</tr>");
   out.println("<tr align='center'>");
   out.println("<td bgcolor='#1F4F8F' height='1'></td>");
   out.println("</tr>");
   out.println("<tr align='center'>");
   out.println("<td style='padding:10 0 0 0'>");
   out.println("<div align='left'><br>");
   out.println("<font size='3' color='#333333'><PRE>"+rs.getString("content") + "</PRE></div>");
   out.println("<br>");
   out.println("</td>");
   out.println("</tr>");
   out.println("<tr align='center'>");
   out.println("<td class='button' height='1'></td>");
   out.println("</tr>");
   out.println("<tr align='center'>");
   out.println("<td bgcolor='#1F4F8F' height='1'></td>");
   out.println("</tr>");
   out.println("</table>"); */
  %>
  <div class="container" style="display:inline-block; text-align:right;">
   <tr> 
    <td align="right" width="450"><A href="freeboard_list.jsp?go=<%=request.getParameter("page") %>"> 
     <img src="./resources/images/list.jpg" border=0></a></td>
   <td width="70" align="right"><A href="freeboard_rwrite.jsp?id=<%= request.getParameter("id")%>&page=<%=request.getParameter("page")%>"> <img src="./resources/images/reply.jpg" border=0></A></td>
   <td width="70" align="right"><A href="freeboard_upd.jsp?id=<%=id%>&page=1"><img src="./resources/images/edit.jpg" border=0></A></td>
   <td width="70" align="right"><A href="freeboard_del.jsp?id=<%=id%>&page=1"><img src="./resources/images/del.jpg"  border=0></A></td>
   </tr>
  </div>
  <%    
   sql = "update freeboard set readcount= readcount + 1 where id= ?" ;
   st = con.prepareStatement(sql);
   st.setInt(1, id);
   st.executeUpdate();
  }
  rs.close();
  st.close();
  con.close();
 } catch (SQLException e) {
  out.println(e);
 } 
%>

<script src="../bootstrap-4.6.0-dist/jquery/jquery-3.5.1.js"></script>
<script src="..bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js"></script>

</BODY>
</HTML>