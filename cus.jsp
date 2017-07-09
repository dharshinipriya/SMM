<%@ page language="java" import="java.sql.*"%>
<html>
<head>
<title>Customer Details </title>
</head>
<body bgcolor=#99FBFF>
<%
String cid,cname,contact,email,ch;
Connection con = null;
Statement s = null;
ResultSet rs = null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:cus");
s=con.createStatement();
ch=request.getParameter("ch");
if(ch.equals("add"))
{
cid=request.getParameter("cid");
cname=request.getParameter("cname");
contact=request.getParameter("con");
email=request.getParameter("ema");
int i=s.executeUpdate("INSERT INTO cus VALUES('" +cid+ "',' "+cname+" ',  ' " +contact+ "',' " +email+ " ')");
out.println("<h2><br><br><br><center>New Customer is added Successfully!\n");
out.println("<a href=http://localhost:8080/priu/cus.html> <br><--- Back </a></center></h2> ");
} 
else if(ch.equals("disp"))
{
rs=s.executeQuery("SELECT * FROM cus");
out.println("<h1><center><br>Customer Details</center></h1>");
out.print("<table align=center border=3 cellspacing=0 ><tr><th><font size=2>Customer ID</th>");
out.print("<h1><th><font size=2>Customer Name</th>");
out.print("<th><font size=2>Contact No.</th>");
out.print("<th><font size=2>Email </th></tr></h1>");
while (rs.next()) 
{
cid=rs.getString(1);
cname=rs.getString(2);
contact=rs.getString(3);
email=rs.getString(4);
out.println("<tr><td><font size=4>"+cid+"</font></td>");
out.print("<td><font size=4>"+cname+"</font></td>");
out.print("<td><font size=4>"+contact+"</font></td>");
out.print("<td><font size=4>"+email+"</font></td></tr>");
}
out.println("<br></table>");
out.println("<h2><a href=http://localhost:8080/priu/cus.html><br><br><center> <--- Back </a></center></h2> </center>");}
else if(ch.equals("upd")){
cid=request.getParameter("cid");
contact=request.getParameter("con");
email=request.getParameter("ema");
int i=s.executeUpdate("UPDATE cus set contact='"+contact+"',email='"+email+"'  where Cid='"+cid+"'");
if(i>0){
out.println("<h2><br><br><br><center>Customer Updated Successfully!\n");
out.println("<h3><a href=http://localhost:8080/priu/cus.html> <--- Back </a></center></h2> ");}
else
{
out.println("<h2><br><br><br><center>Customer does not exist!\n");
out.println("<h3><a href=http://localhost:8080/priu/cus.html> <--- Back </a></center></h2> ");}
}
else
{
cid=request.getParameter("cid");
int i=s.executeUpdate("DELETE FROM cus where Cid='"+cid+"'");
if(i>0){
out.println("<h2><br><br><br><center> Customer Deleted Successfully!\n");
out.println("<h3><a href=http://localhost:8080/priu/cus.html> <--- Back </a></center></h2> ");}
else
{
out.println("<h2><br><br><br><center>Customer does not exist!\n");
out.println("<h3><a href=http://localhost:8080/priu/cus.html> <--- Back </a></center></h2> ");}
}
out.println("<h2><center><a href=http://localhost:8080/priu/login.html>Log out</a></h2></center>");
%></body></html>
