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
Context ctx = new InitialContext();
DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/invenmanager");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    conn = ds.getConnection();

    String sql = "SELECT * FROM user";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    out.println("<table border='1'>");
    out.println("<tr><th>Id</th><th>Name</th></tr>");
    while (rs.next()) {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        out.println("<tr><td>" + id + "</td><td>" + name + "</td>");
    }
    out.println("</table>");
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    try { if (rs != null) rs.close(); } catch (SQLException e) { }
    try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { }
    try { if (conn != null) conn.close(); } catch (SQLException e) { }
}
%>

</body>
</html>