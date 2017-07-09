<%@ page language="java" import="java.sql.*"%>
<html>
<head>
<title>Stock Details </title>
</head>
<body bgcolor=#99FBFF>
<%
String iname,bname,ch;
int iid, aqnty;float pp,mp;
Connection con = null;
Statement s = null;
ResultSet rs = null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:stock");
s=con.createStatement();
ch=request.getParameter("ch");
if(ch.equals("add"))
{
iid=Integer.parseInt(request.getParameter("iid"));
iname=request.getParameter("iname");
bname=request.getParameter("bname");
pp=Float.parseFloat(request.getParameter("pp"));
mp=Float.parseFloat(request.getParameter("mp"));
aqnty=Integer.parseInt(request.getParameter("aqnty"));
int i=s.executeUpdate("INSERT INTO stock VALUES(" +iid+ ",' "+iname+" ',  ' "+bname+" ' , " +pp+", " +mp+ ", " +aqnty+ ")");
out.println("<h2><br><br><br><center>New Item is added Successfully!\n");
out.println("<a href=http://localhost:8080/priu/stock.html> <br><--- Back </a></center></h2> ");
} 
else if(ch.equals("disp"))
{
rs=s.executeQuery("SELECT * FROM stock");
out.println("<h1><center><br><br>Stock Details</center></h1>");
out.print("<table align=center border=3 cellspacing=0 ><tr><th><font size=4>Item ID</th>");
out.print("<h1><th><font size=4>Item Name</th>");
out.print("<th><font size=4>Brand Name</th>");
out.print("<th><font size=4>Purchase Price</th>");
out.print("<th><font size=4>Market Price</th>");
out.print("<th><font size=4>Available Quantity</th></tr></h1>");
while (rs.next()) 
{
iid=rs.getInt(1);
iname=rs.getString(2);
bname=rs.getString(3);
pp=rs.getFloat(4);
mp=rs.getFloat(5);
aqnty=rs.getInt(6);
out.println("<tr><td><font size=4>"+iid+"</font></td>");
out.print("<td><font size=4>"+iname+"</font></td>");
out.print("<td><font size=4>"+bname+"</font></td>");
out.print("<td><font size=4>"+pp+"</font></td>");
out.print("<td><font size=4>"+mp+"</font></td>");
out.print("<td><font size=4>"+aqnty+"</font></td></tr>");
}
out.println("<br></table>");
out.println("<h2><a href=http://localhost:8080/priu/stock.html><br><br><center> <--- Back </a></center></h2> </center>");}
else if(ch.equals("upd")){
iid=Integer.parseInt(request.getParameter("iid"));
pp=Float.parseFloat(request.getParameter("pp"));
mp=Float.parseFloat(request.getParameter("mp"));
aqnty=Integer.parseInt(request.getParameter("aqnty"));
int i=s.executeUpdate("UPDATE stock set Pprice="+pp+",Mprice="+mp+",Bqnty="+aqnty+" where Iid="+iid+"");
if(i>0){
out.println("<h2><br><br><br><center>Item Updated Successfully!\n");
out.println("<h3><a href=http://localhost:8080/priu/stock.html> <--- Back </a></center></h2> ");}
else
{
out.println("<h2><br><br><br><center>Item does not exist!\n");
out.println("<h3><a href=http://localhost:8080/priu/stock.html> <--- Back </a></center></h2> ");}
}
else
{
iid=Integer.parseInt(request.getParameter("iid"));
int i=s.executeUpdate("DELETE FROM stock where Iid="+iid+"");
if(i>0){
out.println("<h2><br><br><br><center>Item Deleted Successfully!\n");
out.println("<h2><a href=http://localhost:8080/priu/stock.html> <--- Back </a></center></h2> ");}
else
{
out.println("<h2><br><br><br><center>Item does not exist!</h2>\n");
out.println("<h2><center><a href=http://localhost:8080/priu/stock.html> <--- Back </a></center></h2> ");}
}
out.println("<br><h2><center><a href=http://localhost:8080/priu/login.html>Log out</a></h2></center>");
%></body></html>
