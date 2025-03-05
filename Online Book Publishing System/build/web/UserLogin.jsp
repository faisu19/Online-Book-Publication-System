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
     ResultSet rs=st.executeQuery("select * from customer where username='"+username+"' and password='"+password+"' and utype='User'");
    if(rs.next())
    {
        String id=rs.getString("id");
        session.setAttribute("id",id);
        %>
        <script type="text/javascript">
            window.alert("User Login Sucessfully");
            window.location="UserHome.jsp";
            </script>
        <%
        
    }
    else
    {
        %>
        <script type="text/javascript">
            window.alert("User Login Failes");
            window.location="User.jsp";
            </script>
        <%  
    }   
    
    
    }
    catch(Exception e)
    {
     out.println(e);   
    }
    %>