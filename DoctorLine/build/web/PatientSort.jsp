<%-- 
    Document   : PatientSort
    Created on : Mar 15, 2017, 11:09:16 AM
    Author     : SouvikPRAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*,selection.Item"%>
<%!
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        RequestDispatcher rd=null;
        Queue<Item> items = new PriorityQueue<Item>();
        int priority;float time;
        int temp_prio;
        float temp_time;
        public class SortPatient implements Comparable{
            public void queueCheck(PriorityQueue<Item> item)
            {
                  if(item.isEmpty())
                    out.print("<h1>queue is empty</h3>"); 
            }   
            public void compareTo(Object obj)
            {
            }   
}
             
%>
<%
        try{
         Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doctorline","root","");
         ps=con.prepareStatement("select time,priority from patient");
         rs=ps.executeQuery();
                  while(rs.next())
                  {
                     time=rs.getFloat("time");
                     priority=rs.getInt("priority");
                     items.add(new Item(priority,time));
                  }
                  out.println("<h3>Before Sorting</h3>");
                  out.println("<h3>"+items+"</h3>");
            
        }catch(Exception e)
         {
             e.printStackTrace();
             System.err.println(e);
         }
%>
