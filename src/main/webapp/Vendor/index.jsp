<%@include file="Common Components/navbar.jsp" %>
      <%
            BookingDao bd=new BookingDao(FactoryProduct.getFactory());
   List<Vehicle> vehicleList=vd.getAllVehicleByVendorID(vendor.getId());
   List<Booking> bookingList=bd.getBookingByVendor();
   double amount=0;
   for(Booking b:bookingList){
        amount=amount+b.getAmount();
          }
    
    int active=0,inactive=0;
    for(Vehicle v:vehicleList){
        if(v.getStatus().equals("Active")){
        active++;
          }else{
          inactive++;
          }
    }
%>        
<!-- Dashboard Title -->

<h2 class="mb-4">Welcome to your Dashboard, John Doe</h2>
                <!-- Safarnama Logo in Main Content -->
                <div class="text-center mb-4">
                    <img src="../images/Safarnama.jpg" alt="Rohan Axis Logo" class="img-fluid" style="max-width: 180px;">
                </div>

   <!-- Dashboard Cards -->
<div class="row">
    <!-- Card 1: Number of Bookings -->
    <div class="col-md-6 mb-4">
        <div class="card bg-secondary text-light">
            <div class="card-body d-flex align-items-center">
                <i class="fas fa-calendar-check fa-3x text-warning"></i>
                <div class="ms-3">
                    <h5 class="card-title text-warning">Bookings</h5>
                    <p class="h4 mb-0"><%= bookingList.size() %></p>
                </div>
            </div>
        </div>
    </div>

    <!-- Card 2: Approved Vehicles -->
    <div class="col-md-6 mb-4">
        <div class="card bg-secondary text-light">
            <div class="card-body d-flex align-items-center">
                <i class="fas fa-check-circle fa-3x text-warning"></i>
                <div class="ms-3">
                    <h5 class="card-title text-warning">Active Vehicles</h5>
                    <p class="h4 mb-0"><%= active %></p>
                </div>
            </div>
        </div>
    </div>

    <!-- Card 3: Earnings -->
    <div class="col-md-6 mb-4">
        <div class="card bg-secondary text-light">
            <div class="card-body d-flex align-items-center">
                <i class="fas fa-dollar-sign fa-3x text-warning"></i>
                <div class="ms-3">
                    <h5 class="card-title text-warning">Earnings</h5>
                    <p class="h4 mb-0">Rs. <%= amount %></p>
                </div>
            </div>
        </div>
    </div>

    <!-- Card 4: Vehicles in Service -->
    <div class="col-md-6 mb-4">
        <div class="card bg-secondary text-light">
            <div class="card-body d-flex align-items-center">
                <i class="fas fa-cogs fa-3x text-warning"></i>
                <div class="ms-3">
                    <h5 class="card-title text-warning">Inactive Vehicles</h5>
                    <p class="h4 mb-0"><%= inactive %></p>
                </div>
            </div>
        </div>
    </div>
</div>
            </div>
        </div>
    </div>

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

        // Handle vehicle form submission
        document.getElementById('vehicleForm').addEventListener('submit', function (event) {
            event.preventDefault();
            alert('Vehicle submitted for approval.');
            document.getElementById('vehicleForm').reset();
        });
    </script>
</body>

</html>
