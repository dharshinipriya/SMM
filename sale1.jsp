<%@ page language="java" import="java.sql.*"%>
<html>
<head>
<title>Sales Details </title>
</head>
<body bgcolor=#99FBFF>
<%
String cid,dat,iid,qnty,tc,prft;
Connection con = null;
Statement s=null;
ResultSet rs = null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:sal");
s=con.createStatement();
 rs=s.executeQuery("SELECT * from sal");
out.println("<html><body><br><br><h2><center>************************************************************<br>Sales Details<br>************************************************************</h2></center>");
out.print("<table align=center border=3 cellspacing=0 ><tr><th><font size=4>Customer ID</th>");
out.print("<h1><th><font size=4>Date Of Sale</th>");
out.print("<th><font size=4>Item ID</th>");
out.print("<th><font size=4>Quantity Sold</th>");
out.print("<th><font size=4>Sold Amount</th>");
out.print("<th><font size=4>Profit</th></tr>");
while(rs.next()){
 cid=rs.getString(1);
dat=rs.getString(2);
iid=rs.getString(3);
qnty=rs.getString(6);
tc=rs.getString(7);
prft=rs.getString(8);
out.println("<tr><td><font size=4>"+cid+"</font></td>");
out.print("<td><font size=4>"+dat+"</font></td>");
out.print("<td><font size=4>"+iid+"</font></td>");
out.print("<td><font size=4>"+qnty+"</font></td>");
out.print("<td><font size=4>"+tc+"</font></td>");
out.print("<td><font size=4>"+prft+"</font></td></tr>");
}
out.println("<br></table>");
        
out.println("<a href=http://localhost:8080/priu/admin.html><center><h2><--- Back</h2></a></center>");  
out.println("<br><h2><center><a href=http://localhost:8080/priu/login.html>Log out</a></h2></center>");
 %></body></html>   