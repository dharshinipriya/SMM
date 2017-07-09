import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.net.*;
import java.lang.*;
public class bill extends HttpServlet
{
   public void doGet (HttpServletRequest req, HttpServletResponse res)
       throws ServletException, IOException
   {
 try
      {        
   HttpSession session = req.getSession (true);
Connection con = null;
Statement s=null;
ResultSet rs = null;
String c= req.getParameter("cid");
      ArrayList iid = (ArrayList) session.getAttribute ("iid");
      ArrayList qnty = (ArrayList) session.getAttribute ("qnty");
ArrayList mp = (ArrayList) session.getAttribute ("mp");
ArrayList<Float> tc=(ArrayList) session.getAttribute ("ct");
      PrintWriter out = res.getWriter ();
      if (c!=null && iid== null && qnty==null && mp==null )
      {
         iid = new ArrayList ();
         session.setAttribute ("iid", iid);
qnty =new ArrayList ();
         session.setAttribute ("qnty", qnty);
mp =new ArrayList ();
         session.setAttribute ("mp", mp); 
tc =new ArrayList ();
 session.setAttribute ("ct", tc);
        }
      res.setContentType ("text/html");
           String[] j;String[] q;String[] m;
      String itm, qn,p;float ct, gt=0;
 j= req.getParameterValues ("iid");
 q= req.getParameterValues ("qnty");
m= req.getParameterValues ("mp");
  if(c!= null && j!= null && q!= null && m!=null)
           {  
      for (int i=0; i<j.length; i++)
         {
             itm =j[i];
            iid.add (itm);
             qn = q[i];
            qnty.add (qn);
p = m[i];
           mp.add (p);
ct=Float.parseFloat(p)*Float.parseFloat(qn);
 tc.add(ct);
         }     
      }   
           out.println ("<HTML>");
           out.println ("<BODY bgcolor=#99FBFF>");
  Iterator iterator1 = iid.iterator(); 
 Iterator iterator2 = qnty.iterator();   
 Iterator iterator3 = mp.iterator(); 
Iterator iterator4 =tc.iterator();
 for (int i=0; i<tc.size(); i++)
         {
gt+=tc.get(i);}
 String iname;java.util.Date date=new java.util.Date();  
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:stock");
s=con.createStatement();
out.println("<h2><center>");
out.println("Purchase Bill Details<br>");
out.println("******************************************************************<br>");
out.println("Date:"+date);
out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
out.println("Customer ID:"+c);
out.println("<br>******************************************************************</h2>");
out.println("<table align=center border=3 cellspacing=0><tr><th><font size=4>Item Name</th>");
out.println("<th><font size=4>Unit Cost</th>");
out.println("<th><font size=4>Quantity</th>");
out.println("</tr><br>");
while (iterator1.hasNext())
{ 
rs=s.executeQuery("SELECT * FROM stock where Iid="+iterator1.next()+"");
while(rs.next()) 
{
iname=rs.getString(2);
out.println("<tr><td><font size=4>"+iname+"</td>");
out.println("<td><font size=4>"+iterator3.next()+"</td>");
out.println("<td><font size=4>"+iterator2.next()+"</td></tr>");
}}
out.println("</table>");
out.println("<center><h2>Total Cost: "+gt+"</h2>");
out.println("<h2><center>******************************************************************<br>");
out.println("Thank you.Visit Again!");
out.println("<br>******************************************************************<br></h2></center>");
    out.println("<center><FORM action='bill.html'>");
for (int i=0; i<j.length; i++)
         {
out.print("<button TYPE=submit><h3> Add More Items </h3></button> ");    
out.print("<button onclick=window.print()><h3> Print Bill</h3></center></button>");  
out.println("<h2><center><a href=http://localhost:8080/priu/bill.html><-- Back</a></h2></center>"); 
out.println("<h2><center><a href=http://localhost:8080/priu/login.html>Log out</a></h2></center>");   
out.println ("</form>");
out.println("</h2>");
out.println ("</BODY>");
     out.println ("</HTML>");
         }}
             catch(Exception e)
             {
               e.printStackTrace();
                }
}

}
 