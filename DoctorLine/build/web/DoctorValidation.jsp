<%-- 
    Document   : DoctorValidation
    Created on : Mar 15, 2017, 6:40:30 AM
    Author     : SouvikPRAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<%!
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        RequestDispatcher rd=null;
        int id=0;
        String username="",password="",sid="";
%>


        <% 
         try{
         Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorline","root","");
         String userinputname=request.getParameter("doc_name");
         String userinputpassword=request.getParameter("doc_pass");
         ps=con.prepareStatement("select name,password from doctor");
         rs=ps.executeQuery();
                  if(rs.next())
                  {
                      username=rs.getString("name");
                      password=rs.getString("password");
                  }
                  if(username.equals(userinputname) && password.equals(userinputpassword))
                  {
                       session.setAttribute("userIDKey", username); 
                       session.setAttribute("userIDPass", password);
                       rd=request.getRequestDispatcher("DoctorChart.jsp");
                       rd.forward(request, response);
                  }
                  else
                  {
                      out.print("<h3>Sorry wrong username and password</h3>");
                      out.print("<div align='center'><a href='index.html'><button type='button'>Back</button></a></div>");
                  }
         }catch(Exception e)
                 {
                  e.printStackTrace();                  
                 }
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DoctorValidation</title>
    </head>
    <body>
    </body>
</html>
