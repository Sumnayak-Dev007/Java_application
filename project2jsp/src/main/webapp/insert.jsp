<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Using JDBC to Insert Data into Database</h3>
<%
int rollNo=Integer.parseInt(request.getParameter("rollNO"));
String name=request.getParameter("name");
String prog=request.getParameter("prog");
String url="jdbc:mysql://localhost:3306/sum";
String sql="insert into student (Roll_No,name,Program) values(?,?,?)";
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con =DriverManager.getConnection(url,"root","*******");
	
	if (con!= null){
		PreparedStatement smtp= con.prepareStatement(sql);
		smtp.setInt(1,rollNo );
		smtp.setString(2, name);
		smtp.setString(3, prog);
		smtp.executeUpdate();
	}
}
catch (SQLException e){out.println("SQL:"+e.getMessage());}
catch (Exception es){out.println("Exception:"+es.getMessage());}
%>
</body>
</html>