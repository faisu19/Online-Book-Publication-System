/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package upload;

import com.database.DbConnection;
import com.database.Queries;
import com.oreilly.servlet.MultipartRequest;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Acer
 */
@MultipartConfig(maxFileSize=19*1024*1024*1024)
public class UploadAction extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        try{
            
   MultipartRequest mr=new MultipartRequest(request,"E://",98867564);
         
         String author=mr.getParameter("author");
           String bookname=mr.getParameter("bookname");
             String papername=mr.getParameter("paper");
             String year =mr.getParameter("year");
             String accesstype=mr.getParameter("accesstype");
             String cost=mr.getParameter("cost");
            File p=mr.getFile("file");
            
            InputStream in = new FileInputStream(p);
           int l=(int)p.length();
        
        String query="select count(*) from file where bookname='"+bookname+"'and year='"+year+"'";
         int c=0;
        ResultSet r=Queries.getExecuteQuery(query);
         while(r.next()){
           c=r.getInt(1);
         }
         if(c==0){
    Connection con=DbConnection.getConnection();
  
    PreparedStatement pst=con.prepareStatement("insert into file values(null,'"+author+"','"+bookname+"','"+papername+"''"+accesstype+"','"+cost+"')");
    pst.setBinaryStream(1, in,l); 
    int i=pst.executeUpdate();
               if(i>0){
               response.sendRedirect("UploadBooks.jsp?msg=success");  
             }else{
              response.sendRedirect("UploadBooks.jsp?msg=failed");   
             }
         }else{
           response.sendRedirect("UploadBooks.jsp?msg=Paper Already Exist");  
         }
            }catch(Exception e){
           out.println(e); 
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
