<%-- 
    Document   : DoctorChart
    Created on : Mar 15, 2017, 6:43:37 AM
    Author     : SouvikPRAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<%!
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        RequestDispatcher rd=null;
        String patient_name="",patient_type="";
        float patient_time;
        int i=1;
%>
<% 
         try{
         Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorline","root","");
         ps=con.prepareStatement("select name,type,time from patient");
         rs=ps.executeQuery();
                  while(rs.next())
                  {
                      patient_name=rs.getString("name");
                      patient_type=rs.getString("type");
                      patient_time=rs.getFloat("time");
                      out.print("<h3>"+(i++)+". "+patient_name+" "+" ~~~> "+patient_type+"time: "+" "+patient_time);
                  }
                  
         }catch(Exception e)
                 {
                  e.printStackTrace();                  
                 }
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DoctorChart</title>
    </head>
    <body background="doc4.jpg" height="2000px" width="1337px">
      <div align="right">
            <form name="form1" method="post" action="Logout.jsp">
                <input type="submit" value="logout">
            </form>
        </div> 
    </body>
</html>
