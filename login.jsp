<%@ page language="java" import="java.sql.*"%>
<html>
<head>
<title>login</title>
</head>
<body bgcolor=#99FBFF>
<%
String name,password,n,p;int i=0;
Connection con = null;
Statement s = null;
ResultSet rs = null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:login");
s=con.createStatement();
name=request.getParameter("uname");
password=request.getParameter("pass");
rs=s.executeQuery("select * from login");
while(rs.next()){
n=rs.getString(1);
p=rs.getString(2);
if(n.equals(name) && p.equals(password)){
i=1;
if(n.equals("Admin")){
out.println("<center><h2><br><br><br>Welcome "+n+"!<a href=http://localhost:8080/priu/admin.html><br><br><br>Click To Proceed</a></h2></center>");
out.println("<h2><br><br><center><a href=http://localhost:8080/priu/login.html>Log out</a></h2></center>");
}
else{
out.println("<center><h2><br><br><br>Welcome "+n+"!<a href=http://localhost:8080/priu/emp.html><br><br><br>Click To Proceed</a></h2></center>");
out.println("<h2><br><br><center><a href=http://localhost:8080/priu/login.html>Log out</a></h2></center>");}
}}
if(i!=1){
out.println("<h2><center>");
out.println("<br><br>Login Failed!<a href=http://localhost:8080/priu/login.html>Try again</a>");
out.println("</h2></center>");
}
%></body></html>
