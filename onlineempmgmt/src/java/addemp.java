/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 *
 * @author chetan
 */
public class addemp extends HttpServlet {
   
   
    
    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();



        try{

    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con =DriverManager.getConnection("jdbc:odbc:acc2");

Statement stmt=con.createStatement();

String empid=req.getParameter("empid");
int m=Integer.parseInt(empid);
String empname=req.getParameter("empname");
String emp_desig=req.getParameter("emp_desig");
String emp_j_date=req.getParameter("emp_j_date");
String emp_salary=req.getParameter("emp_salary");




String q="insert into employee values('"+empid+"','"+empname+"','"+emp_desig+"','"+emp_j_date+"','"+emp_salary+"')";
int k=stmt.executeUpdate(q);

if(k>0)
out.println("Empoyee Successfully inserted");
else
    out.println("Employee not successfully inserted");
con.close();
}catch(Exception e){
    out.println("duplicate employee id");

}
    
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
