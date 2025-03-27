<%@page import="com.safarnama.dao.VendorDao"%>
<%@page import="com.safarnama.dao.VehicleDao"%>
<%@page import="com.safarnama.dao.BookingDao"%>
<%@page import="com.safarnama.entity.Vendor"%>
<%@page import="com.safarnama.entity.Vehicle"%>
<%@page import="com.safarnama.entity.Booking"%>
<%@page import="java.util.List"%>
<%@page import="com.safarnama.helper.FactoryProduct"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vendor Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body class="bg-dark text-light">
 <%
                    Vendor vendor=(Vendor)session.getAttribute("current-user");
                    if(vendor==null){
                     session.setAttribute("message", "Session out ! Please Login");
    response.sendRedirect("../login.jsp");
    return;
     }
              %>
    <div class="d-flex">
        <!-- Sidebar -->
        <div class="sidebar bg-dark text-light d-flex flex-column p-3 vh-100" id="sidebar" style="width: 250px;">
            <!-- Logo -->
            <div class="text-center mb-4">
                <img src="../images/rohanaxis.jpg" alt="Rohan Axis Logo" class="img-fluid" style="max-width: 180px;">
            </div>
            <!-- Profile -->
            <div class="text-center mb-0">
                <img src="../img/Vendors/<%= vendor.getPhoto() %>" alt="Profile Picture" class="rounded-circle mb-2" style="width: 50px; height: 50px;">
                <p class="font-weight-bold text-warning"><%= vendor.getName() %></p>
            </div>
            <!-- Sidebar Links -->
            <div class="d-flex flex-column">
                <a href="index.jsp" class="text-light py-2 px-3 mb-2 rounded hover-bg-primary"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
                <a href="booking.jsp" class="text-light py-2 px-3 mb-2 rounded hover-bg-primary"><i class="fas fa-calendar-check"></i> Manage Bookings</a>
                <a href="vehicle.jsp" class="text-light py-2 px-3 mb-2 rounded hover-bg-primary"><i class="fas fa-car"></i> Manage Vehicles</a>
                <a href="settings.jsp" class="text-light py-2 px-3 mb-2 rounded hover-bg-primary"><i class="fas fa-cogs"></i> Settings</a>
                <a href="../LogoutServlet" class="text-light py-2 px-3 mb-2 rounded hover-bg-primary"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="flex-grow-1 p-4" id="mainContent">
            <!-- Toggle Button for Mobile Devices -->
            <button class="btn btn-outline-warning d-lg-none" id="toggleSidebarBtn">
                <i class="fas fa-bars"></i> Menu
            </button>

            <div class="container">
               <%
                       VehicleDao vd=new VehicleDao(FactoryProduct.getFactory());

               %>