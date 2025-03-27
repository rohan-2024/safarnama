<%@include file="Common Components/navbar.jsp" %>
<%
    BookingDao bd=new BookingDao(FactoryProduct.getFactory());
    List<Booking> bookingList=bd.getBookingByVendor();
%>
                <h2 class="mb-4">Manage Bookings</h2>
                
                <!-- Safarnama Logo in Main Content -->
                <div class="text-center mb-4">
                    <img src="../images/Safarnama.jpg" alt="Safarnama Logo" class="img-fluid" style="max-width: 180px;">
                </div>

                <!-- Booking Table -->
                <div class="table-responsive">
                    <table class="table table-dark table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Customer Name</th>
                                <th>Vehicle</th>
                                <th>Booking Date</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                              
                                for(Booking b:bookingList){
                                Vehicle v=vd.getVehicleById(b.getVehicleId());
                            %>
                            
                            <tr>
                                <td><%= b.getBookingId() %></td>
                                <td><%= b.getCustomerName() %></td>
                                <td><%= v.getVehicleName() %></td>
                                <td><%= b.getBookingDate() %></td>
                                <%
                                    if(b.getBookingstatus().equals("Booked")){
                                %>
                                <td><span class="badge bg-success">Booked</span></td>
                               
                                <%
                                    }else if(b.getBookingstatus().equals("cancel")){
                                 %>
                                 <td><span class="badge bg-danger">Cancelled</span></td>
                                 <%
                                     }
                                 %>
                                <td>
                                    <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#viewBookingModal<%= b.getId() %>" data-id="1001" data-customer="Mark Smith" data-contact="9876543210" data-vehicle="Honda Civic" data-model="2022" data-plate="AB123CD" data-booking-time="2025-03-01 10:00 AM" data-pickup-location="123 Main St" data-dropoff-location="456 Elm St" data-pickup-time="2025-03-01 11:00 AM" data-total-price="50" data-status="Pending">View</button>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            <!-- Booking Row 1 -->
                            <tr>
                                <td>1</td>
                                <td>Mark Smith</td>
                                <td>Honda Civic</td>
                                <td>2025-03-01</td>
                                <td><span class="badge bg-warning">Pending</span></td>
                                <td>
                                    <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#viewBookingModal" data-id="1001" data-customer="Mark Smith" data-contact="9876543210" data-vehicle="Honda Civic" data-model="2022" data-plate="AB123CD" data-booking-time="2025-03-01 10:00 AM" data-pickup-location="123 Main St" data-dropoff-location="456 Elm St" data-pickup-time="2025-03-01 11:00 AM" data-total-price="50" data-status="Pending">View</button>
                                </td>
                            </tr>
                            <!-- Booking Row 2 -->
                            <tr>
                                <td>2</td>
                                <td>Alice Johnson</td>
                                <td>BMW X5</td>
                                <td>2025-03-02</td>
                                <td><span class="badge bg-danger">Rejected</span></td>
                                <td>
                                    <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#viewBookingModal" data-id="1002" data-customer="Alice Johnson" data-contact="9876543211" data-vehicle="BMW X5" data-model="2021" data-plate="XY456Z" data-booking-time="2025-03-02 09:30 AM" data-pickup-location="789 Oak St" data-dropoff-location="123 Pine St" data-pickup-time="2025-03-02 10:30 AM" data-total-price="70" data-status="Rejected">View</button>
                                </td>
                            </tr>
                            <!-- Booking Row 3 -->
                            <tr>
                                <td>3</td>
                                <td>David Lee</td>
                                <td>Mercedes-Benz A-Class</td>
                                <td>2025-03-03</td>
                                <td><span class="badge bg-success">Approved</span></td>
                                <td>
                                    <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#viewBookingModal" data-id="1003" data-customer="David Lee" data-contact="9876543212" data-vehicle="Mercedes-Benz A-Class" data-model="2020" data-plate="ZZ789XY" data-booking-time="2025-03-03 12:00 PM" data-pickup-location="123 Maple St" data-dropoff-location="789 Birch St" data-pickup-time="2025-03-03 01:00 PM" data-total-price="120" data-status="Approved">View</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <%
         for(Booking b:bookingList){
            Vehicle v=vd.getVehicleById(b.getVehicleId());
    %>
    <!-- View Booking Modal -->
    <div class="modal fade" id="viewBookingModal<%= b.getId() %>" tabindex="-1" aria-labelledby="viewBookingModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content bg-dark text-light">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewBookingModalLabel">Booking Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Safarnama Logo in Modal -->
                    <div class="text-center mb-3">
                        <img src="../images/Safarnama.jpg" alt="Safarnama Logo" class="img-fluid" style="max-width: 180px;">
                    </div>
           
                    <p><strong>Booking ID:</strong> <span id="bookingId"><%= b.getBookingId() %></span></p>
                    <p><strong>Customer Name:</strong> <span id="customerName"><%= b.getCustomerName() %></span></p>
                    <p><strong>Contact Number:</strong> <span id="customerContact"><%= b.getCutomerContact() %></span></p>
                    <p><strong>Vehicle:</strong> <span id="vehicleName"><%= v.getVehicleName() %></span> (Plate: <span id="vehiclePlate"><%= v.getVehiclePlate() %></span>)</p>
                    <p><strong>Booking Date</strong> <span id="bookingTime"><%= b.getBookingDate() %></span></p>
                    <p><strong>Pickup Location:</strong> <span id="pickupLocation"><%= b.getPickupDate() %></span></p>
                    <p><strong>Dropoff Location:</strong> <span id="dropoffLocation"><%= b.getDropOff() %></span></p>
                    <p><strong>Total Price:</strong> $<span id="totalPrice"><%= b.getAmount() %></span></p>
                    <p><strong>Status:</strong> <span id="bookingStatus"><%= b.getBookingstatus() %></span></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
<%
    }
%>
    <!-- Bootstrap JS and Custom JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Function to manage sidebar visibility based on screen size
        function manageSidebarVisibility() {
            if (window.innerWidth >= 992) { // If screen size is large or bigger
                document.getElementById('sidebar').classList.remove('d-none'); // Show sidebar
            } else {
                if (!document.getElementById('sidebar').classList.contains('d-none')) {
                    document.getElementById('sidebar').classList.add('d-none'); // Hide sidebar
                }
            }
        }

        // Call the function initially to set the correct state
        manageSidebarVisibility();

        // Add event listener for resizing the window
        window.addEventListener('resize', manageSidebarVisibility);

        // Toggle Sidebar for Mobile Devices
        document.getElementById('toggleSidebarBtn').addEventListener('click', function () {
            var sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('d-none'); // Toggle visibility of the sidebar
        });

       
    </script>
</body>

</html>
