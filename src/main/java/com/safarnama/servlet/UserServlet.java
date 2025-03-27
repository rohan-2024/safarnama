/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.safarnama.servlet;

import com.safarnama.dao.VendorDao;
import com.safarnama.entity.Vendor;
import com.safarnama.helper.FactoryProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author snghr
 */
@WebServlet(name="UserServlet", urlPatterns = {"/UserServlet"})
public class UserServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
                String action=request.getParameter("action");
                VendorDao vd=new VendorDao(FactoryProduct.getFactory());
                Vendor v=new Vendor();
                HttpSession h=request.getSession();
                
            if(action.equals("addUser")){
           String name=request.getParameter("name");
           String email=request.getParameter("email");
           String password=request.getParameter("password");
           String phone=request.getParameter("phone");
           Part photo=request.getPart("photo");
String path=request.getServletContext().getRealPath("img") + File.separator +"Vendors"+File.separator+photo.getSubmittedFileName();
       try{
           FileOutputStream fos1=new FileOutputStream(path);
           InputStream is1= photo.getInputStream();
          byte[] data1= new byte[is1.available()];
          is1.read(data1);
          fos1.write(data1);
          fos1.close();
       }
      catch(Exception e){
          e.printStackTrace();
      }
                v.setEmail(email);
                v.setName(name);
                v.setPassword(password);
                v.setPhone(phone);
                
                vd.saveVendor(v);
                
                
                h.setAttribute("message", "User registered successfully");
                response.sendRedirect("login.jsp");
            }else if(action.equals("editUser")){
                int vendorId=Integer.parseInt(request.getParameter("vendorId"));
                 String password=request.getParameter("password");
                 vd.updateVendor(vendorId, password);
                 h.setAttribute("message", "Password changed successfully");
                response.sendRedirect("login.jsp");
            }
           
        }catch(Exception e){
            e.printStackTrace();
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
