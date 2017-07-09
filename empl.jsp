<%@ page language="java" import="java.sql.*"%>
<html>
<head>
<title>Employee Details </title>
</head>
<body bgcolor=#99FBFF>
<%
String eid,ename,address,doj,ch,contact ;float salary;
Connection con = null;
Statement s = null;
ResultSet rs = null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:emp");
s=con.createStatement();
ch=request.getParameter("ch");
if(ch.equals("add"))
{
eid=request.getParameter("eid");
ename=request.getParameter("ename");
doj=request.getParameter("doj");
salary=Float.parseFloat(request.getParameter("sal"));
contact=request.getParameter("con");
address=request.getParameter("add");
int i=s.executeUpdate("INSERT INTO emp VALUES('" +eid+ "',' "+ename+" ',  ' "+doj+" ' , " +salary+",' " +contact+ "',' " +address+ " ')");
out.println("<h2><br><br><br><center>New Employee is added Successfully!\n");
out.println("<a href=http://localhost:8080/priu/empl.html> <br><--- Back </a></center></h2> ");
} 
else if(ch.equals("disp"))
{
rs=s.executeQuery("SELECT * FROM emp");
out.println("<h1><center><br><br>Employee Details</center></h1>");
out.print("<table align=center border=3 cellspacing=0 ><tr><th><font size=4>Employee ID</th>");
out.print("<h1><th><font size=4>Employee Name</th>");
out.print("<th><font size=4>Date of Join</th>");
out.print("<th><font size=4>Salary</th>");
out.print("<th><font size=4>Contact No.</th>");
out.print("<th><font size=4>Address </th></tr></h1>");
while (rs.next()) 
{
eid=rs.getString(1);
ename=rs.getString(2);
doj=rs.getString(3);
salary=rs.getFloat(4);
contact=rs.getString(5);
address=rs.getString(6);
out.println("<tr><td><font size=4>"+eid+"</font></td>");
out.print("<td><font size=4>"+ename+"</font></td>");
out.print("<td><font size=4>"+doj+"</font></td>");
out.print("<td><font size=4>"+salary+"</font></td>");
out.print("<td><font size=4>"+contact+"</font></td>");
out.print("<td><font size=4>"+address+"</font></td></tr>");
}
out.println("<br></table>");
out.println("<h2><a href=http://localhost:8080/priu/empl.html><br><br><center> <--- Back </a></center></h2> </center>");}
else if(ch.equals("upd")){
eid=request.getParameter("eid");
salary=Float.parseFloat(request.getParameter("sal"));
contact=request.getParameter("con");
address=request.getParameter("add");
int i=s.executeUpdate("UPDATE emp set salary="+salary+",contact='"+contact+"',address='"+address+"'  where Eid='"+eid+"'");
if(i>0){
out.println("<h2><br><br><br><center>Employee Updated Successfully!\n");
out.println("<h3><a href=http://localhost:8080/priu/empl.html> <--- Back </a></center></h2> ");}
else
{
out.println("<h2><br><br><br><center>Employee does not exist!\n");
out.println("<h3><a href=http://localhost:8080/priu/empl.html> <--- Back </a></center></h2> ");}
}
else
{
eid=request.getParameter("eid");
int i=s.executeUpdate("DELETE FROM emp where Eid='"+eid+"'");
if(i>0){
out.println("<h2><br><br><br><center> Employee Deleted Successfully!\n");
out.println("<h3><a href=http://localhost:8080/priu/empl.html> <--- Back </a></center></h2> ");}
else
{
out.println("<h2><br><br><br><center>Employee does not exist!\n");
out.println("<h3><a href=http://localhost:8080/priu/empl.html> <--- Back </a></center></h2> ");}
}
out.println("<br><h2><center><a href=http://localhost:8080/priu/login.html>Log out</a></h2></center>");
%></body></html>
