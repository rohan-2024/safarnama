<%@page import="com.safarnama.dao.VehicleDao"%>
<%@page import="com.safarnama.entity.Vehicle"%>
<%@page import="java.util.List"%>
<%@page import="com.safarnama.helper.FactoryProduct"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Explore Buses - Safarnama</title>
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
        .card-text {
            color: #bbb;
        }
        .btn-primary {
            background-color: #ff6f61;
            border-color: #ff6f61;
        }
        .btn-primary:hover {
            background-color: #ff4c3b;
            border-color: #ff4c3b;
        }

        /* Safarnama logo overlay */
        .logo-overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #ff6f61;
            text-align: center;
            z-index: 10;
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
        .logo-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .logo-container img {
            max-width: 150px;
            height: auto;
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

        .form-label {
            color: #f1f1f1;
        }

        .form-control {
            background-color: #444;
            color: #f1f1f1;
            border: 1px solid #555;
        }

        .form-control:focus {
            border-color: #ff6f61;
            box-shadow: 0 0 5px #ff6f61;
        }

        .btn-primary {
            background-color: #ff6f61;
            border-color: #ff6f61;
        }

        .btn-primary:hover {
            background-color: #ff4c3b;
            border-color: #ff4c3b;
        }
    </style>
</head>
<body>

    <%@include file="Common Components/navbar.jsp" %>
<%
    String vehicleCategory=(String)request.getParameter("vehicleCategory");
    VehicleDao vd=new VehicleDao(FactoryProduct.getFactory());
    List<Vehicle> vehicleList=vd.getAllVehicles();
%>
<!-- Logo Overlay -->
<div class="logo-overlay">
    <img src="images/Safarnama.jpg" alt="Safarnama Logo" style="margin-top: -400px; max-width: 150px;">
</div>
<!-- Bus Listing Section -->
<div class="container my-5">
    <h2 class="text-center mb-4">Explore Our <%= vehicleCategory %> Fleet</h2>
   
    <div class="row">
        <!-- Bus 1 -->
        <%
            for(Vehicle v:vehicleList){
                if(v.getVehicleCategory().equals(vehicleCategory)){
            %>
            
             <div class="col-md-4">
            <div class="card">
                <img src="img/Vehicles/<%= v.getPhoto() %>" class="card-img-top" alt="Bus Image">
                <div class="card-body">
                    <h5 class="card-title"><%= v.getVehicleName() %></h5>
                    <p class="card-text"><%= v.getDescription() %></p>
                    <ul>
                        <li><strong>Price:</strong> <%= v.getPrice() %> per day</li>
                        <li><strong>Seating Capacity:</strong> <%= v.getSeats() %> seats</li>
                        <%
                            if(v.isAC()){
                        %>
                        <li><strong>Air Conditioning:</strong> Yes</li>
                        <%
                            }else{
                        %>
                        <li><strong>Air Conditioning:</strong>No</li>
                        <%
                            }
                        %>
                        <li><strong>Facilities:</strong> <%= v.getFacilities() %></li>
                    </ul>
                    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#bookingModal<%= v.getId() %>" >Book Now</a>
                </div>
            </div>
        </div>

            
            <%
                }
}
            %>
        <div class="col-md-4">
            <div class="card">
                <img src="images/booking/caravan1.jpg" class="card-img-top" alt="Bus Image">
                <div class="card-body">
                    <h5 class="card-title">Luxury Coach</h5>
                    <p class="card-text">Comfortable and spacious bus with premium amenities.</p>
                    <ul>
                        <li><strong>Price:</strong> ?5000 per day</li>
                        <li><strong>Seating Capacity:</strong> 40 seats</li>
                        <li><strong>Air Conditioning:</strong> Yes</li>
                        <li><strong>Facilities:</strong> Wi-Fi, LED TV, Recliner Seats</li>
                    </ul>
                    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#bookingModal" data-price="5000">Book Now</a>
                </div>
            </div>
        </div>

        <!-- Bus 2 -->
        <div class="col-md-4">
            <div class="card">
                <img src="images/booking/caravan2.jpg" class="card-img-top" alt="Bus Image">
                <div class="card-body">
                    <h5 class="card-title">Semi-Luxury Bus</h5>
                    <p class="card-text">A balance between comfort and affordability for long trips.</p>
                    <ul>
                        <li><strong>Price:</strong> ?3000 per day</li>
                        <li><strong>Seating Capacity:</strong> 35 seats</li>
                        <li><strong>Air Conditioning:</strong> Yes</li>
                        <li><strong>Facilities:</strong> Recliner Seats, Charging Ports</li>
                    </ul>
                    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#bookingModal" data-price="3000">Book Now</a>
                </div>
            </div>
        </div>

        <!-- Bus 3 -->
        <div class="col-md-4">
            <div class="card">
                <img src="images/booking/caravan3.jpg" class="card-img-top" alt="Bus Image">
                <div class="card-body">
                    <h5 class="card-title">Standard Bus</h5>
                    <p class="card-text">Affordable and practical for short trips and city tours.</p>
                    <ul>
                        <li><strong>Price:</strong> ?1500 per day</li>
                        <li><strong>Seating Capacity:</strong> 30 seats</li>
                        <li><strong>Air Conditioning:</strong> No</li>
                        <li><strong>Facilities:</strong> Basic Seats</li>
                    </ul>
                    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#bookingModal" data-price="1500">Book Now</a>
                </div>
            </div>
        </div>
    </div>
</div>

        <%
               for(Vehicle v:vehicleList){
                if(v.getVehicleCategory().equals(vehicleCategory)){
        %>
<!-- Modal for Booking -->
<div class="modal fade" id="bookingModal<%= v.getId() %>" tabindex="-1" aria-labelledby="bookingModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="bookingModalLabel">Book Your Ride</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Safarnama Logo Inside Modal -->
                <div class="logo-container mb-3">
                    <img src="images/Safarnama.jpg" alt="Safarnama Logo" class="img-fluid" style="max-width: 120px;">
                </div>
                <!-- Vehicle Info Section -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h5 class="card-title text-uppercase"><%= v.getVehicleName() %></h5>
                    <div class="d-flex align-items-center">
                        <i class="fas fa-rupee-sign me-2"></i><span class="fs-4"><%= v.getPrice() %></span><small>/day</small>
                    </div>
                </div>
                
                <!-- Form to Input Details -->
                <form action="BookingServlet" method="post">
                    <input type="text" hidden name="action" value="addBooking">
                    <input type="text" hidden name="vehicleId" value="<%= v.getId() %>">
                    
                    <input type="number" hidden value="<%= v.getPrice() %>" id="price">
                    <!-- Customer Name -->
                    <div class="mb-3">
                        <label for="customerName" class="form-label">Customer Name</label>
                        <input type="text" class="form-control" id="customerName" name="customerName" placeholder="Enter your name" required>
                    </div>

                    <!-- Contact Number -->
                    <div class="mb-3">
                        <label for="contact" class="form-label">Contact</label>
                        <input type="tel" class="form-control" id="contact" name="customerContact" placeholder="Enter your contact number" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="customerEmail" class="form-label">Email</label>
                        <input type="text" class="form-control" id="customerEmail" name="customerEmail" placeholder="Enter your email" required>
                    </div>

                    <!-- Pickup Location -->
                    <div class="mb-3">
                        <label for="pickupLocation" class="form-label">Pickup Location</label>
                        <input type="text" class="form-control" name="pickUp" id="pickupLocation" placeholder="Enter pickup location" required>
                    </div>

                    <!-- Dropoff Location -->
                    <div class="mb-3">
                        <label for="dropoffLocation" class="form-label">Dropoff Location</label>
                        <input type="text" class="form-control" name="dropOff" id="dropoffLocation" placeholder="Enter dropoff location" required>
                    </div>

                    <!-- Pickup Date -->
                    <div class="mb-3">
                        <label for="pickupDate" class="form-label">Pickup Date</label>
                        <input type="date" class="form-control" name="pickupDate" id="pickupDate" required>
                    </div>

                    <!-- Number of Booking Days -->
                    <div class="mb-3">
                        <label for="bookingDays" class="form-label">Booking Days</label>
                        <input type="number" class="form-control" name="bookingDays" oninput="calculate()" id="bookingDays" placeholder="Enter number of days" required>
                    </div>

                    <!-- Amount Calculation -->
                    <div class="mb-3">
                        <label for="amount" class="form-label">Total Amount</label>
                        <div class="d-flex align-items-center">
                            <i class="fas fa-rupee-sign me-2"></i>
                            <input type="text" name="amount" readonly id="calamount">
                          
                        </div>
                    </div>

                    <!-- Special Requests -->
                    <div class="mb-3">
                        <label for="specialRequests" class="form-label">Special Requests</label>
                        <textarea class="form-control" name="requests" id="specialRequests" rows="3" placeholder="Enter any special requests"></textarea>
                    </div>

                    <!-- Submit Button -->
                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary w-100">Book Now</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<%
    }
}
%>
<!-- Include this script to calculate the amount based on booking days -->
<script>
    function calculate(){
         const days = document.getElementById('bookingDays').value;
         const pricePerDay = document.getElementById('price').value;  // Price per day for the Luxury Coach
        const totalAmount = pricePerDay * days;
       document.getElementById('calamount').value=totalAmount;
    }
   
</script>
<%@include file="Common Components/footer.jsp" %>