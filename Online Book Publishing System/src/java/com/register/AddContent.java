package com.register;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.sql.*;

@WebServlet("/AddContent")
@MultipartConfig(maxFileSize = 16177215)
public class AddContent extends HttpServlet {

    private String dbURL = "jdbc:mysql://localhost:3306/searchengine";
    private String dbUser = "root";
    private String dbPass = "";

    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
    {

        String content = request.getParameter("content");
        String description = request.getParameter("description");
        
        
        
        String url = request.getParameter("url");
        String rank="0";
    
        InputStream inputStream = null;
        Part filePart = request.getPart("image");
        if (filePart != null) {

            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());


            inputStream = filePart.getInputStream();
        }

        Connection conn = null;
        String message = null;

        try {

           Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String sql = "INSERT INTO content (id, content,description,url,rank,image) values (?,?, ?, ?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, null);
            statement.setString(2, content);
            statement.setString(3, description); 
      statement.setString(4, url);
        statement.setString(5, rank);
      
           
            

            if (inputStream != null) {
                statement.setBlob(6, inputStream);
            }

            int row = statement.executeUpdate();
            if (row > 0) {

                System.out.println("image upload sucess");
                response.sendRedirect("AddContent.jsp?reg= Content Added success");
            } else {
                response.sendRedirect("AddRestaurants.jsp?reg= Content Adding Failed");

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddContent.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}