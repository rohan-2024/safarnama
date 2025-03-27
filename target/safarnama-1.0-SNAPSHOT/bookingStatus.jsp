<%@page import="com.safarnama.dao.BookingDao"%>
<%@page import="com.safarnama.dao.VehicleDao"%>
<%@page import="com.safarnama.entity.Vehicle"%>
<%@page import="com.safarnama.entity.Booking"%>
<%@page import="java.util.List"%>
<%@page import="com.safarnama.helper.FactoryProduct"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Status</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: #121212;
            color: #f1f1f1;
        }

        /* Navbar Style */
        .navbar {
            background-color: #1a1a1a;
        }
        .navbar .navbar-brand img {
            max-width: 120px;
        }
        .navbar-nav a {
            color: #f1f1f1;
            font-weight: 600;
        }
        .navbar-nav a:hover {
            color: #ff6f61;
            text-decoration: none;
        }

        /* Logo and Tagline */
        .logo-overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #ff6f61;
            text-align: center;
            z-index: 10;
        }

        /* Card Section */
        .card {
            background-color: #2a2a2a;
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: translateY(-10px);
        }
        .card img {
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
        }
        .card-body {
            background-color: #333333;
        }
        .card-title {
            color: #ff6f61;
            font-weight: bold;
        }
        .btn-primary {
            background-color: #ff6f61;
            border-color: #ff6f61;
        }
        .btn-primary:hover {
            background-color: #ff4c3b;
            border-color: #ff4c3b;
        }

        /* Footer Section */
        .footer {
            background-color: #1a1a1a;
            color: #f1f1f1;
            text-align: center;
            padding: 20px;
        }

        .footer a {
            color: #ff6f61;
            margin: 0 10px;
        }

        .footer a:hover {
            color: #ff4c3b;
        }

        /* Modal Styling */
        .modal-content {
            background-color: #333333;
            color: #f1f1f1;
            border-radius: 10px;
        }

        .modal-header {
            border-bottom: 1px solid #444;
        }

        .modal-footer {
            border-top: 1px solid #444;
        }
   
   </style>
</head>
<body>
 <%
     String id=request.getParameter("id");
     BookingDao bd=new BookingDao(FactoryProduct.getFactory());
     VehicleDao vd=new VehicleDao(FactoryProduct.getFactory());
     
     Booking b=bd.getBookingById(id);
     Vehicle v=vd.getVehicleById(b.getVehicleId());
     
 %>
<!-- Safarnama Logo Section -->
<div class="container my-5 text-center">
    <div class="logo-container">
        <img src="images/Safarnama.jpg" alt="Safarnama Logo" class="img-fluid" style="max-width: 250px;">
    </div>
</div>

<!-- Booking Details Card (after submitting form) -->
<div class="container my-5">
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Booking ID: <span id="bookingIdDisplay"><%= b.getBookingId() %></span></h5>
            <p><i class="fas fa-check-circle"></i> <strong>Status:</strong> <span id="bookingStatus"><%= b.getBookingstatus() %></span></p>
            <p><i class="fas fa-car"></i> <strong>Vehicle:</strong> <span id="vehicleType<%= v.getVehicleName() %></span></p>
            <p><i class="fas fa-calendar-day"></i> <strong>Pickup Date:</strong> <span id="pickupDate"><%= b.getPickupDate() %></span></p>
            <p><i class="fas fa-map-marker-alt"></i> <strong>Pickup Location:</strong> <span id="pickupLocation"><%= b.getPickUp() %></span></p>
            <p><i class="fas fa-map-marker-alt"></i> <strong>Drop-off Location:</strong> <span id="dropOffLocation"><%= b.getDropOff() %></span></p>
            <p><i class="fas fa-user"></i> <strong>Customer Name:</strong> <span id="customerName"><%= b.getCustomerName() %></span></p>
            <p><i class="fas fa-phone-alt"></i> <strong>Contact Number:</strong> <span id="contactNumber"><%= b.getCutomerContact() %></span></p>
            <p><i class="fas fa-envelope"></i> <strong>Email:</strong> <span id="email"><%= b.getCustomerEmail() %></span></p>
            <p><i class="fas fa-credit-card"></i> <strong>Payment Status:</strong> <span id="paymentStatus"><%= b.getPaymentStatus() %></span></p>
            <p><i class="fas fa-cogs"></i> <strong>Special Requests:</strong> <span id="specialRequests"><%= b.getRequests() %></span></p>
            <div class="mt-4">
                <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#postponeModal"><i class="fas fa-clock"></i> Postpone Booking</button>
                <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#cancelModal"><i class="fas fa-times"></i> Cancel Booking</button>
            </div>
        </div>
    </div>
</div>

<!-- Postpone Modal -->
<div class="modal fade" id="postponeModal" tabindex="-1" aria-labelledby="postponeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="postponeModalLabel">Postpone Your Booking</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="logo-container text-center">
                    <img src="images/Safarnama.jpg" alt="Safarnama Logo" style="max-width: 150px;">
                </div>
                <form action="BookingServlet" method="post">
                    <input type="text" hidden name="bookingId" value="<%= b.getId() %>">
                    <input type="text" hidden name="action" value="editBooking">
                    
                    <div class="mb-3">
                        <label for="newPickupDate" class="form-label">Select New Pickup Date</label>
                        <input type="date" name="pickupDate" class="form-control" id="newPickupDate" required>
                    </div>
                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary w-100">Postpone Booking</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Cancel Modal -->
<div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="cancelModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="cancelModalLabel">Cancel Your Booking</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="logo-container text-center">
                    <img src="images/Safarnama.jpg" alt="Safarnama Logo" style="max-width: 150px;">
                </div>
                <p>Are you sure you want to cancel your booking?</p>
                 <form action="BookingServlet" method="post">
                    <input type="text" hidden name="bookingId" value="<%= b.getId() %>">
                    <input type="text" hidden name="action" value="cancelBooking">
                    
                    <div class="mb-3">
                        <button type="submit" class="btn btn-danger w-100">Confirm Cancellation</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="Common Components/footer.jsp" %>