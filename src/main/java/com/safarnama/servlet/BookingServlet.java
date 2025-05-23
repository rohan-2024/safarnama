/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.safarnama.servlet;

import com.safarnama.dao.BookingDao;
import com.safarnama.entity.Booking;
import com.safarnama.helper.FactoryProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 *
 * @author snghr
 */
@WebServlet(name = "BookingServlet", urlPatterns = {"/BookingServlet"})
public class BookingServlet extends HttpServlet {

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
            String pickupDate=request.getParameter("pickupDate");
            
            HttpSession h=request.getSession();
            BookingDao bd=new BookingDao(FactoryProduct.getFactory());
            Booking b=new Booking();
            
            LocalDate currentDate=LocalDate.now();
            DateTimeFormatter format=DateTimeFormatter.ofPattern("dd-MM-yyyy");
                        
            if(action.equals("addBooking")){
                
            int vehicleId=Integer.parseInt(request.getParameter("vehicleId"));
            String customerName=request.getParameter("customerName");
            String customerContact=request.getParameter("customerContact");
            String pickUp=request.getParameter("pickUp");
            String dropOff=request.getParameter("dropOff");
            String customerEmail=request.getParameter("customerEmail");
            int bookingDays=Integer.parseInt(request.getParameter("bookingDays"));
            double amount=Double.parseDouble(request.getParameter("amount"));
            String requests=request.getParameter("requests");
           
            String bookingId="SAF"+bd.getLastId();
           
           String bookingDate=currentDate.format(format);
     
            b.setAmount(amount);
            b.setBookingDate(bookingDate);
            b.setBookingDays(bookingDays);
            b.setBookingId(bookingId);
            b.setBookingstatus("Booked");
            b.setCustomerName(customerName);
            b.setCutomerContact(customerContact);
            b.setCustomerEmail(customerEmail);
            b.setDropOff(dropOff);
            b.setPaymentStatus("Paid");
            b.setPickUp(pickUp);
            b.setPickupDate(pickupDate);
            b.setRequests(requests);
            b.setVehicleId(vehicleId);
            
            bd.saveBooking(b);
            h.setAttribute( "message","Booking done successfully, Booking id: "+bookingId);
            response.sendRedirect("explore.jsp");
            }else if(action.equals("editBooking")){
                
                int bookingId=Integer.parseInt(request.getParameter("bookingId"));
                bd.updateBooking(bookingId, "date", pickupDate);
             h.setAttribute( "message","Booking Postponed successfully, Booking id: "+bookingId);
            response.sendRedirect("index.jsp");
            }else if(action.equals("cancelBooking")){
            
                int bookingId=Integer.parseInt(request.getParameter("bookingId"));
                bd.updateBooking(bookingId, "status","cancel");
                 h.setAttribute( "message","Booking cancelled");
                 response.sendRedirect("index.jsp");
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
