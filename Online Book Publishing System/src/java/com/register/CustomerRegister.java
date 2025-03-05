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
import java.util.Random;

@WebServlet("/CustomerRegister")
@MultipartConfig(maxFileSize = 16177215)
public class CustomerRegister extends HttpServlet {

    private String dbURL = "jdbc:mysql://localhost:3306/onlinebook";
    private String dbUser = "root";
    private String dbPass = "";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
Random rand = new Random();
    
    String id ="c"+String.valueOf(rand.nextInt(10))+String.valueOf(rand.nextInt(10))+String.valueOf(rand.nextInt(10)
            +String.valueOf(rand.nextInt(10))+String.valueOf(rand.nextInt(10))+String.valueOf(rand.nextInt(10))+String.valueOf(rand.nextInt(10)));
        
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
      
    
        String address=request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String utype = request.getParameter("utype");
        
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

            String sql = "INSERT INTO customer (id, fname, lname,email, mobile,address,username,password,utype,image) values (?,?, ?, ?, ?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            statement.setString(2, fname);
            statement.setString(3, lname); 
      statement.setString(4, email);
        statement.setString(5, mobile);
   
            statement.setString(6,address);
              statement.setString(7, username);
                statement.setString(8, password);
            statement.setString(9, utype);
            

            if (inputStream != null) {
                statement.setBlob(10, inputStream);
            }

            int row = statement.executeUpdate();
            if (row > 0) {

                System.out.println("image upload sucess");
                response.sendRedirect("index.html?reg= Customer Registration success");
            } else {
                response.sendRedirect("index.html?reg= Customer Registration Failed");

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CustomerRegister.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}