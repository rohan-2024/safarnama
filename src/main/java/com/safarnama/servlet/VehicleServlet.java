/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.safarnama.servlet;

import com.safarnama.dao.VehicleDao;
import com.safarnama.dao.VendorDao;
import com.safarnama.entity.Vehicle;
import com.safarnama.entity.Vendor;
import com.safarnama.helper.FactoryProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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
@MultipartConfig
@WebServlet(name = "VehicleServlet", urlPatterns = {"/VehicleServlet"})
public class VehicleServlet extends HttpServlet {

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
            
            String description=request.getParameter("description");
            String facilities=request.getParameter("facilities");
            double price=Double.parseDouble(request.getParameter("price"));
            String status=request.getParameter("status");
           
            HttpSession h=request.getSession();
            VehicleDao vehicledao=new VehicleDao(FactoryProduct.getFactory());
            Vehicle vehicle=new Vehicle();
            
            if(action.equals("addVehicle")){
             int vendorId=Integer.parseInt(request.getParameter("vendorId"));
            String vehicleName=request.getParameter("vehicleName");
            String vehicleCategory=request.getParameter("vehicleCategory");
            String vehiclePlate=request.getParameter("vehiclePlate");
            boolean AC=Boolean.parseBoolean(request.getParameter("AC"));
            int seats=Integer.parseInt(request.getParameter("seats"));
            Part photo=request.getPart("photo");
            
       String path=request.getServletContext().getRealPath("img") + File.separator +"Vehicles"+File.separator+photo.getSubmittedFileName();
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
            
            vehicle.setAC(AC);
            vehicle.setDescription(description);
            vehicle.setFacilities(facilities);
            vehicle.setPhoto(photo.getSubmittedFileName());
            vehicle.setPrice(price);
            vehicle.setSeats(seats);
            vehicle.setStatus(status);
            vehicle.setVehicleCategory(vehicleCategory);
            vehicle.setVehicleName(vehicleName);
            vehicle.setVehiclePlate(vehiclePlate);
            vehicle.setVendorId(vendorId);
            vehicledao.saveVehicle(vehicle);
            
            h.setAttribute("message", "Vehicle registered successfully");
            response.sendRedirect("Vendor/vehicle.jsp");
            
            }else if(action.equals("editVehicle")){
                int vehicleId=Integer.parseInt(request.getParameter("vehicleId"));
                vehicledao.updateVehicle(vehicleId,description,facilities,price,status);
                h.setAttribute("message", "Vehicle updated successfully");
                response.sendRedirect("Vendor/vehicle.jsp");
            
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
