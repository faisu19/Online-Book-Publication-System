<%-- 
    Document   : CustomerLogin
    Created on : Sep 24, 2020, 6:59:29 PM
    Author     : Venkat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="dbcon.Dbconnection" %>
<%
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    session.setAttribute("username", username);
    try
    {
     Connection con=Dbconnection.getConnection();
     Statement st=con.createStatement();
     ResultSet rs=st.executeQuery("select * from admin where username='"+username+"' and password='"+password+"'");
    if(rs.next())
    {
        
        %>
        <script type="text/javascript">
            window.alert("Admin Login Sucessfully");
            window.location="AdminHome.jsp";
            </script>
        <%
        
    }
    else
    {
        %>
        <script type="text/javascript">
            window.alert("Admin Login Failes");
            window.location="index.html";
            </script>
        <%  
    }   
    
    
    }
    catch(Exception e)
    {
     out.println(e);   
    }
    %>