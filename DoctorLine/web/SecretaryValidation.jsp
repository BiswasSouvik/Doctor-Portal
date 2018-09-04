<%-- 
    Document   : SecretaryValidation
    Created on : Mar 15, 2017, 3:25:56 AM
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
         //out.println("<h1>connected</h1>");
         sid=request.getParameter("id");
         id=Integer.parseInt(sid);
         String userinputname=request.getParameter("sec_name");
         String userinputpassword=request.getParameter("sec_pass");
         ps=con.prepareStatement("select name,password from secretary where id=("+id+")");
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
                       rd=request.getRequestDispatcher("secretary.html");
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
        <title>SecretaryValidation</title>
    </head>
    <body>
    </body>
</html>
