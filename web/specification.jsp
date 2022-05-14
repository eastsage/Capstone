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
<%--        <td>프로그램이름</td>--%>
<%--        <td>카테고리</td>--%>
<%--        <td>지원OS</td>--%>
        <td>CPU</td>
        <td>VGA</td>
<%--        <td>M/B</td>--%>
        <td>RAM</td>
        <td>Storage</td>
<%--        <td>Power</td>--%>
    </tr>

<%
    Statement st = null;
    ResultSet rs = null;
    request.setCharacterEncoding("UTF-8");
    String[] checked = request.getParameterValues("pcheck");

    try {
        st = null;
        st = con.createStatement();
        String view_sql = "create or replace view checkedview as " +
                            "select p_cpu,  p_vga,  p_ram,  p_ssd " +
                            "from Program ";
        view_sql += "where p_name in (";
        view_sql += "\'" + checked[0] + "\'";
        for(int i = 1; i < checked.length; i++) {
            view_sql += ",\'" + checked[i] + "\'";
        }
        view_sql += ")";
        st.executeUpdate(view_sql);

        String sql = "select * from checkedview";
        rs = st.executeQuery(sql);

        if (!(rs.next()))  {
            out.println("일치하는 프로그램이 없습니다.");
        } else {
                do {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("p_cpu") + "</td>");
                    out.println("<td>" + rs.getString("p_vga") + "</td>");
                    out.println("<td>" + rs.getInt("p_ram") + "</td>");
                    out.println("<td>" + rs.getInt("p_ssd") + "</td>");
                    out.println("</tr>");
                }while(rs.next());

        rs.close();
    }

    out.println("</TABLE>");
    st.close();
    con.close();
    } catch (java.sql.SQLException e) {
    out.println(e);
    }


%>

<%--사양 테이블--%>
<%--<table style="text-align: center;" class="table table-striped table-hover table-bordered">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>하드웨어</th>--%>
<%--        <th>최소사양</th>--%>
<%--        <th>권장사양</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <tr>--%>
<%--        <td>OS</td>--%>
<%--        <td>Windows 8</td>--%>
<%--        <td>Windows 10</td>--%>
<%--    </tr>--%>
<%--    <tr class="cpu">--%>
<%--        <td>CPU</td>--%>
<%--        <td>CPU 2.0+GHz (SSE2 이상의 명령어가 지원되는)</td>--%>
<%--        <td>3GHz</td>--%>
<%--    </tr>--%>
<%--    <tr class="ram">--%>
<%--        <td>RAM</td>--%>
<%--        <td>1GB (Windows Vista 또는 7 이용시 2GB)</td>--%>
<%--        <td>4GB</td>--%>
<%--    </tr>--%>
<%--    <tr class="hd">--%>
<%--        <td>HD/SSD</td>--%>
<%--        <td>8GB</td>--%>
<%--        <td>12GB</td>--%>
<%--    </tr>--%>
<%--    <tr class="mainboard">--%>
<%--        <td>M/B</td>--%>
<%--        <td>ㄴㄱㅁ</td>--%>
<%--        <td>ㄴㄱㅁ</td>--%>
<%--    </tr>--%>
<%--    <tr class="graphic">--%>
<%--        <td>Graphic</td>--%>
<%--        <td>Shader 버전 2.0을 지원하는 그래픽 카드, DirectX 9.0을 지원하는 그래픽 카드</td>--%>
<%--        <td>GeForce 8800 또는 동급 그래픽 카드 이상(512MB 이상 비디오 메모리, 전용 GPU가 적용된)</td>--%>
<%--    </tr>--%>
<%--    <tr class="power">--%>
<%--        <td>Power</td>--%>
<%--        <td>500W</td>--%>
<%--        <td>9999KW</td>--%>
<%--    </tr>--%>
<%--    </tbody>--%>
<%--</table>--%>


<%--구매, 돌아가기 버튼--%>
<div class="container">
    <div class="row justify-content-md-center">
        <div class="col col-lg-2">
            <p>
                <a class="btn btn-lg btn-primary" href="#">Purchase</a>
            </p>
        </div>
        <div class="col col-lg-2">
            <p>
                <a class="btn btn-lg btn-secondary" href="#">Return</a>
            </p>
        </div>
    </div>
</div>


    <%@ include file="./footer.jsp"%>

<script src="./bootstrap-5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>