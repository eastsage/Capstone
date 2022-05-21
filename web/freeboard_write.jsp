<%@ page contentType="text/html; charset=utf-8"%>
<HTML>                                         
<HEAD>  
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
<SCRIPT language="javascript">                              
function check(){                                         
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
<link href="./filegb.css" rel="stylesheet" type="text/css">   
</HEAD>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./bootstrap-4.6.0-dist/css/bootstrap.min.css">                                       
<BODY style = "background-color:#FFFFFF">   
<%@ include file="navbar.jsp" %>                                     
<P>               
                             
<FORM name="msgwrite" method="post" action="freeboard_save.jsp">    
                      <div class="container text-center" style="background-color:#FFFFFF">
	<form name="msgwrite" action="freeboard_save.jsp?table=gallery" class="form-horizontal" method="post">
		<div class="form-group row">
		<div class = "my-box" align="center" style = "background-color:#FFFFFF; margin-bottom :30px" ><A href="freeboard_list.jsp"><FONT color=black face=굴림 size=10><STRONG>글 쓰기</STRONG></FONT></A></div>
		</div>
		<div class="form-group row"  style="margin-left:170px;">
			<div class="col-6">
				<input type="text" id="name"  name="name" class="form-control"style="border-color:#000000;"placeholder="이름을 입력하세요">
			</div>
		</div>
		<div class="form-group row" style="margin-left:170px"  >
		
			<div class="col-6">
				<input type="text" id="email"  name="email" class="form-control"style="border-color:#000000;"placeholder="Email을 입력하세요">
			</div>
		</div>
		<div class="form-group row" style="margin-left:170px" >
			
			<div class="col-10">
				<input type="text" id="subject"  name="subject" class="form-control" style="border-color:#000000;"placeholder="제목을 입력하세요">
			</div>
		</div>		
		<div class="form-group row"  style="margin-left:170px">
			
			<div class="col-10">
				<textarea cols="65" rows="10" id="content"  name="content" class="form-control" style="border-color:#000000"placeholder="내용을 입력하세요"></textarea>
			</div>
		</div>
		<div class="form-group row" style="margin-left:170px">
			
			<div class="col-5">
				<input type="password" id="password"  name="password" class="form-control"style="border-color:#000000; "placeholder="PassWord을 입력하세요"></div>
			<div class="offset-md-2 col-12"style = "color:#bdbebd">(비밀번호를 입력하면 수정 또는 삭제가 가능합니다.)</div>
		</div>
	
		<div class="form-group row">
			<div class="col-12" style="display:inline-block; text-align:center;">
				<a href="freeboard_list.jsp" onClick="history.go(-1)"><img src="./resources/images/cancle.gif" class="img-fluid"></a>
				&nbsp;&nbsp;
				<a href="#" onClick="check();"><img src="./resources/images/ok.gif"  class="img-fluid"></a>
			</div>
		</div>
	</form>
</div>	                

	
                                                           
</FORM>  
<script src="../bootstrap-4.6.0-dist/jquery/jquery-3.5.1.js"></script>
<script src="../bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js"></script>                                      
</BODY>                                        
</HTML>  