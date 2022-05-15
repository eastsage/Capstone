<%@ page import="java.util.Vector" %>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="./bootstrap-5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%@ include file="./navbar.jsp"%>
<%@ include file="./dbconn.jsp"%>
<br>
<br>

<table style="text-align: center;" class="table table-striped table-hover table-bordered">
    <tr>
        <td>CPU</td>
        <td>M/B</td>
        <td>VGA</td>
        <td>RAM</td>
        <td>Storage</td>
        <td>Power</td>
    </tr>

<%
    Statement st = null;
    ResultSet rs = null;
    request.setCharacterEncoding("UTF-8");
    String[] checked = request.getParameterValues("pcheck");

    try {
        st = null;
        st = con.createStatement();

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
        String vga_sql = "select distinct ifnull(ch_vga, \"내장 그래픽\") as ch_vga " +
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
        out.println("<tr>");
        rs = st.executeQuery(cpu_sql);
        while (rs.next()) {
            out.println("<td>" + rs.getString("ch_cpu") + "</td>");
            out.println("<td>" + rs.getString("c_board") + "</td>");
        }
        rs = st.executeQuery(vga_sql);
        while (rs.next())
            out.println("<td>" + rs.getString("ch_vga") + "</td>");
        rs = st.executeQuery(ram_sql);
        while (rs.next())
            out.println("<td>" + rs.getInt("ch_ram") + "GB</td>");
        rs = st.executeQuery(ssd_sql);
        while (rs.next())
            out.println("<td>" + rs.getInt("ch_ssd") + "GB</td>");
        rs = st.executeQuery(power_sql);

        // VGA가 내장그래픽이면 '설명서 참조'를 출력
        while (rs.next()) {
            if (rs.getString("v_power") == null)
                out.println("<td>설명서 참조</td>");
            else
            out.println("<td>" + rs.getString("v_power") + "W</td>");
        }
        out.println("</tr>");


        rs.close();


    out.println("</TABLE>");
    st.close();
    con.close();
    } catch (java.sql.SQLException e) {
    out.println(e);
    }

%>


<%--구매, 돌아가기 버튼--%>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col col-lg-2">
            <p>
                <a class="btn btn-lg btn-primary" href="https://shop.danawa.com/virtualestimate/?controller=estimateMain&methods=index&marketPlaceSeq=16">
                    Purchase</a>
            </p>
        </div>
        <div class="col col-lg-2">
            <p>
                <a class="btn btn-lg btn-secondary" href="#" onclick="history.back()">Return</a>
            </p>
        </div>
    </div>
</div>


    <%@ include file="./footer.jsp"%>

<script src="./bootstrap-5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>