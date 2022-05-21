<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.MalformedURLException" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.*" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.parser.JSONParser" %>


<html>
<script src="./jquery/jquery-3.5.1.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="./bootstrap-5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
    <title>최저가</title>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container-fluid row">
    <div class="col-sm-2 border-end border-dark">
        <nav id="spec-sidebar" class="navbar navbar-border bg-border text-dark flex-column align-items-stretch position-fixed">
            <a class="navbar-brand text-dark"><h3>&nbsp&nbsp목차</h3></a>
            <hr>
            <nav class="nav nav-pills flex-column">
                <a class="nav-link ms-3 my-1 text-dark" href="#CPU">CPU</a>
                <a class="nav-link ms-3 my-1 text-dark" href="#Board">Board</a>
                <a class="nav-link ms-3 my-1 text-dark" href="#VGA">VGA</a>
                <a class="nav-link ms-3 my-1 text-dark" href="#RAM">RAM</a>
                <a class="nav-link ms-3 my-1 text-dark" href="#SSD">SSD</a>
                <a class="nav-link ms-3 my-1 text-dark" href="#Power">Power</a>
            </nav>
        </nav>
        </nav>
    </div>
    <div class="container-fluid col-sm-10" data-bs-target="#spec-sidebar">
        <div class="container-fluid row">

            <%!
                public static class naverApi {

                    private static String get(String apiUrl, Map<String, String> requestHeaders){
                        HttpURLConnection con = connect(apiUrl);
                        try {
                            con.setRequestMethod("GET");
                            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                                con.setRequestProperty(header.getKey(), header.getValue());
                            }


                            int responseCode = con.getResponseCode();
                            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                                return readBody(con.getInputStream());
                            } else { // 에러 발생
                                return readBody(con.getErrorStream());
                            }
                        } catch (IOException e) {
                            throw new RuntimeException("API 요청과 응답 실패", e);
                        } finally {
                            con.disconnect();
                        }
                    }


                    private static HttpURLConnection connect(String apiUrl){
                        try {
                            URL url = new URL(apiUrl);
                            return (HttpURLConnection)url.openConnection();
                        } catch (MalformedURLException e) {
                            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
                        } catch (IOException e) {
                            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
                        }
                    }


                    private static String readBody(InputStream body){
                        InputStreamReader streamReader = new InputStreamReader(body);


                        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
                            StringBuilder responseBody = new StringBuilder();


                            String line;
                            while ((line = lineReader.readLine()) != null) {
                                responseBody.append(line);
                            }


                            return responseBody.toString();
                        } catch (IOException e) {
                            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
                        }
                    }
                }

            %>

            <%
                request.setCharacterEncoding("UTF-8");

                String[] nav_arr = new String[6];
                nav_arr[0] = "CPU";
                nav_arr[1] = "Board";
                nav_arr[2] = "VGA";
                nav_arr[3] = "RAM";
                nav_arr[4] = "SSD";
                nav_arr[5] = "Power";
                String[] spec_arr = new String[6];
                String[] apiURL_arr = new String[6];
                String[] response_arr = new String[6];

                spec_arr[0] = request.getParameter("cpu");
                spec_arr[1] = request.getParameter("board") + "보드";
                spec_arr[2] = request.getParameter("vga");
                spec_arr[3] = request.getParameter("ram") + "GB ram";
                int ssd = Integer.parseInt(request.getParameter("ssd"));
                if (ssd >= 1000) {
                    ssd = 1;
                    spec_arr[4] = request.getParameter("ssd") + "TB SSD";
                }
                spec_arr[4] = request.getParameter("ssd") + "GB NVME SSD";
                spec_arr[5] = request.getParameter("power") + "W 파워";

                String clientId = "Qdx_88X1liFRzRrkfaX9"; //애플리케이션 클라이언트 아이디값"
                String clientSecret = "v4IgnP1zCl"; //애플리케이션 클라이언트 시크릿값"
                String text = null;

                for (int i = 0; i < spec_arr.length; i++) {
                    try {
                        text = URLEncoder.encode(spec_arr[i], "UTF-8");
                        apiURL_arr[i] = "https://openapi.naver.com/v1/search/shop?query=" + text; //json
                    } catch (UnsupportedEncodingException e) {
                        throw new RuntimeException("검색어 인코딩 실패", e);
                    }

                }

                Map<String, String> requestHeaders = new HashMap<>();
                requestHeaders.put("X-Naver-Client-Id", clientId);
                requestHeaders.put("X-Naver-Client-Secret", clientSecret);
                for (int i = 0; i < apiURL_arr.length; i++) {

                    response_arr[i] = naverApi.get(apiURL_arr[i],requestHeaders);
                }
                for (int i = 0; i < response_arr.length; i++) {
                    JSONParser parser = new JSONParser();
                    JSONObject obj = (JSONObject)parser.parse(response_arr[i]);

                    JSONArray item = (JSONArray)obj.get("items");
            %>
            <nav class="navbar navbar-dark bg-dark" style="width:100%; text-align:center; border-radius: 10px;">
                <h3 id="<%=nav_arr[i]%>" align="center" style="color:white;">
                    <%=nav_arr[i]%>
                </h3>
            </nav>
            <p>
                    <%
			    for(int j=0;j<item.size();j++){
			        JSONObject tmp = (JSONObject)item.get(j);
			        String title = (String)tmp.get("title");
			        String link = (String)tmp.get("link");
			        String image = (String)tmp.get("image");
			        String lprice = (String)tmp.get("lprice");
			        String mallName = (String)tmp.get("mallName");
			        String maker = (String)tmp.get("maker");
			%>
            <div class="conatiner-fluid col-sm-6">
                <table class="table table-bordered" style="text-align: center;">
                    <tr class="table-dark"><th colspan="3"><%=nav_arr[i]%>
                        <%=(j+1)%>번째 검색 결과</th></tr>
                    <tr class="table-dark">
                        <th width="40%">제목</th>
                        <th width="40%">이미지</th>
                        <th width="20%">최저가</th>
                    </tr>
                    <tr>
                        <td style="vertical-align : middle;"><%=title%></td>
                        <td style="vertical-align : middle;"><img src="<%=image%>" width='150' height='150'></td>
                        <td style="vertical-align : middle;"><%=lprice%></td>
                    </tr>
                    <tr class="table-dark">
                        <th width="40%">판매처</th>
                        <th width="40%">제조사</th>
                        <th width="20%">링크</th>
                    </tr>
                    <tr>
                        <td style="vertical-align : middle;"><%=mallName%></td>
                        <td style="vertical-align : middle;"><%=maker%></td>
                        <td style="vertical-align : middle;"><a class="btn btn-dark" href="<%=link%>">구매 링크</a></td>
                    </tr>
                </table>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</div>
<script src="./bootstrap-5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
