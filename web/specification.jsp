<%@ page import="java.util.Vector" %>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="./bootstrap-5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>권장사양</title>
</head>
<body>
<%@ include file="./navbar.jsp"%>
<%@ include file="dbconn.jsp"%>
<br>
<br>
<form method="post" action="naverApi.jsp">
	<div class="conatiner-fluid" style="text-align: center; margin-left: auto; margin-right: auto; width: 80%;">
		<table class="table table-striped table-hover table-bordered">
			<tr class="table-dark">
				<th colspan="2">선택프로그램 최종 권장사양</th>
			</tr>
		<%
		    Statement st = null;
		    ResultSet rs = null;
		    request.setCharacterEncoding("UTF-8");
		    String[] checked = request.getParameterValues("pcheck");
		
		    try {
		        st = null;
		        st = con.createStatement();
				
		     	// mysql 현재 세션의 설정을 수정함
		        String setup_sql = "SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))";
		        st.execute(setup_sql);
		
		        // check된 프로그램들의 view table을 대체하거나 생성산다
		        String view_sql = "create or replace view checkedview as " +
		                            "select p_cpu ch_cpu,  p_vga ch_vga,  p_ram ch_ram,  p_ssd ch_ssd " +
		                            "from Program ";
		        view_sql += "where p_name in (";
		        view_sql += "'" + checked[0] + "'";
		        for(int i = 1; i < checked.length; i++) {
		            view_sql += ",'" + checked[i] + "'";
		        }
		        view_sql += ")";
		        st.executeUpdate(view_sql);
		
		        // 각각의 정보를 불러오는 SQL Query
		        String cpu_sql = "select ch_cpu, c_board, max(c_score) " +
		                            "from checkedview " +
		                            "inner join CPU on ch_cpu = c_name";
		
		        // VGA가 null이면 '내장 그래픽' 출력
		        String vga_sql = "select distinct ifnull(ch_vga, \"내장그래픽\") as ch_vga " +
		                            "from checkedview, VGA " +
		                            "group by v_name " +
		                            "having max(v_score)";
		
		        String ram_sql = "select max(ch_ram) as ch_ram " +
		                            "from checkedview ";
		
		        String ssd_sql = "select max(ch_ssd) as ch_ssd " +
		                            "from checkedview";
		
		        String power_sql = "select ch_vga, v_power, max(v_score) " +
		                            "from checkedview " +
		                            "inner join VGA on ch_vga = v_name";
		
		
		        //테이블에 쿼리에서 받은 정보들을 넣는다
		        
		        rs = st.executeQuery(cpu_sql);
		        while (rs.next()) {
		        	out.println("<tr><th>CPU</th>");
		            out.println("<td><input type='hidden' name='cpu' value=" + rs.getString("ch_cpu") + "></input>" + rs.getString("ch_cpu") + "</td>");
		            out.println("</tr>");
		            out.println("<tr><th>M/B</th>");
		            out.println("<td><input type='hidden' name='board' value=" + rs.getString("c_board") + "></input>" + rs.getString("c_board") + "</td>");
		            out.println("</tr>");
		        }
		        
		        rs = st.executeQuery(vga_sql);
		        while (rs.next()) {
		        	out.println("<tr><th>VGA</th>");
		            out.println("<td><input type='hidden' name='vga' value=" + rs.getString("ch_vga") + "></input>" + rs.getString("ch_vga") + "</td>");
		       		out.println("</tr>");
		        }
		     	
		        rs = st.executeQuery(ram_sql);
		        while (rs.next()) {
		        	out.println("<tr><th>RAM</th>");
		            out.println("<td><input type='hidden' name='ram' value=" + rs.getInt("ch_ram") + "></input>" + rs.getInt("ch_ram") + "GB</td>");
		        	out.println("</tr>");
		        }
		        
		        rs = st.executeQuery(ssd_sql);
		        while (rs.next()) {
		        	out.println("<tr><th>SSD</th>");
		            out.println("<td><input type='hidden' name='ssd' value=" + rs.getInt("ch_ssd") + "></input>" + rs.getInt("ch_ssd") + "GB</td>");
		        	out.println("</tr>");
		        }
		        
		        rs = st.executeQuery(power_sql);
		        while (rs.next()) {
		            if (rs.getString("v_power") == null) {
		                out.println("<tr><th>POWER</th>");
		                out.println("<td><input type='hidden' name='power' value='500'></input>500W</td>");
		            }
		            else {
		            	out.println("<tr><th>POWER</th>");
		            	out.println("<td><input type='hidden' name='power' value=" + rs.getString("v_power") + "></input>" + rs.getString("v_power") + "W</td>");
		            }
		        }
		        out.println("</tr>");
		        
		        rs.close();    	
			    st.close();
			    con.close();
		    } 
		    catch (java.sql.SQLException e) {
		    out.println(e);
		    }
		
		%>
		</table>
	</div>
	
	<%--구매, 돌아가기 버튼--%>
	<div class="container-fulid row justify-content-md-center">
	    <div class="col col-lg-2">
	        <p>
	            <button class="btn btn-lg btn-primary" type="submit">최저가모아보기</button>
	        </p>
	    </div>
	    <div class="container-fulid col col-lg-2">
	        <p>
	            <a class="btn btn-lg btn-secondary" href="#" onclick="history.back()">Return</a>
	        </p>
	    </div>
	</div>
</form>

<%@ include file="./footer.jsp"%>

<script src="./bootstrap-5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>