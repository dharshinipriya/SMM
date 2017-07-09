<%@ page language="java" import="java.sql.*"%>
<html>
<head>
<title>Sales Details </title>
</head>
<body bgcolor=#99FBFF>
<%
float tc,mp,pp,prft;int qnty,iid;String cid;java.util.Date d=new java.util.Date();
Connection con = null;
Statement s=null;
ResultSet rs = null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:sal");
s=con.createStatement();
 cid= request.getParameter("cid");
 iid=Integer.parseInt(request.getParameter("iid"));
 qnty= Integer.parseInt(request.getParameter("qnty"));
pp= Float.parseFloat(request.getParameter("pp"));
  mp= Float.parseFloat(request.getParameter("mp"));
 tc=mp*qnty;
prft=mp*qnty-pp*qnty;
s.executeUpdate("INSERT INTO sal VALUES('"+cid+"','"+d+"',"+iid+","+mp+","+pp+","+qnty+","+tc+","+prft+" )");
        out.println("<html><body><br><br><br><h2><center>Sales Details Added Successfully</h2></center><a href=http://localhost:8080/priu/admin.html><center><h2><--- Back</h2></a></center>");
out.println("<h2><center><a href=http://localhost:8080/priu/login.html>Log out</a></h2></center>");  
 %></body></html>   