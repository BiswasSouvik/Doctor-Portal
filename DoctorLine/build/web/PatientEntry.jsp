<%-- 
    Document   : PatientEntry
    Created on : Mar 15, 2017, 6:38:57 AM
    Author     : SouvikPRAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"import="java.sql.*"%>
<!DOCTYPE html>
 <%!
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String name="",type="",error="",disp="";
        int id,age;
        float time;
        boolean flag=false;
        static final int MAX=3,NORMAL=2,MIN=1;
        %>
        <% 
         try{
         Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorline","root","");
                  id=Integer.parseInt(request.getParameter("id"));
                  name=request.getParameter("patient_name");
                  age=Integer.parseInt(request.getParameter("patient_age"));
                  type=request.getParameter("type");
                  time=Float.parseFloat(request.getParameter("patient_time"));
         ps=con.prepareStatement("insert into patient (name,age,type,time,priority) values(?,?,?,?,?)");
         ps.setString(1,name);
         ps.setInt(2,age);
         ps.setString(3,type);
         ps.setFloat(4,time);
         if(type.equals("Adult"))
             ps.setInt(5,MIN);
         else if(type.equals("Geriatric"))
             ps.setInt(5,NORMAL);
         if(type.equals("Pediatric"))
             ps.setInt(5,MAX);
         int i=ps.executeUpdate();
         if(i>0)
         {
             flag=true;
             disp="successfully upadated";
         }
         else
         {
             error="please try again";
         }
         }catch(Exception e)
                 {
                    out.println(e);
                    e.printStackTrace();  
                 }
        %>
       
        <%
            if(flag)
            {
                out.println("<h3>"+disp+"</h3>");
                out.println("<a href='secretary.html'>Back</a>");
            }
            else
            {
                out.println("<h3>"+error+"</h3>");
            }
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PatientEntry</title>
    </head>
    <body background="doc6.jpg" height="2000px" width="1337px">
    </body>
</html>
