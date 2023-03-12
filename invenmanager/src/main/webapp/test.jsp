<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
// JNDI 이름으로 Context 객체를 얻어옵니다.
Context ctx = new InitialContext();
DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/invenmanager");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    // Connection Pool에서 Connection 객체를 얻어옵니다.
    conn = ds.getConnection();

    // SQL 쿼리를 실행합니다.
    String sql = "SELECT * FROM user";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    // 결과를 출력합니다.
    out.println("<table border='1'>");
    out.println("<tr><th>Product ID</th><th>Product Name</th></tr>");
    while (rs.next()) {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        out.println("<tr><td>" + id + "</td><td>" + name + "</td>");
    }
    out.println("</table>");
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    // 자원을 해제합니다.
    try { if (rs != null) rs.close(); } catch (SQLException e) { }
    try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { }
    try { if (conn != null) conn.close(); } catch (SQLException e) { }
}
%>

</body>
</html>