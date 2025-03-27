<%@include file="Common Components/navbar.jsp" %>
<%
    List<Vehicle> vehicleList=vd.getAllVehicleByVendorID(vendor.getId());
%>
                <h2 class="mb-4">Manage Vehicles</h2>
                <%@include file="../Common Components/message.jsp" %>
                <!-- Safarnama Logo in Main Content -->
                <div class="text-center mb-4">
                    <img src="../images/Safarnama.jpg" alt="Safarnama Logo" class="img-fluid" style="max-width: 180px;">
                </div>

                <!-- Add Vehicle Button -->
                <div class="mb-4">
                    <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#addVehicleModal">
                        <i class="fas fa-plus-circle"></i> Add Vehicle
                    </button>
                </div>

                <!-- Vehicle Table -->
                <div class="table-responsive">
                    <table class="table table-dark table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Vehicle</th>
                                <th>Type</th>
                                <th>Plate Number</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                     
                                        <%
                        for(Vehicle v:vehicleList){
                    %>
                             <!-- Vehicle Row -->
                            <tr>
                                <td style="text-align: center; vertical-align: middle;"><img src="../img/Vehicles/<%= v.getPhoto() %>" class="img-fluid" style="max-width: 100px; height: auto; object-fit: contain;" alt="vehiclephoto"></td>
                                <td><%= v.getVehicleName() %></td>
                                <%
                                    if(v.isAC()){
                                %>
                                <td>AC</td>
                                <%
                                    }else{
                                %>
                                <td>NON AC</td>
                                <%
                                    }
                                %>
                                <td><%= v.getVehiclePlate() %></td>
                                <%
                                    if(v.getStatus().equals("Active")){
                                %>
                                  <td><span class="badge bg-success"><%= v.getStatus() %></span></td>
                                  <%
                                      }else{
                                  %>
                                <td><span class="badge bg-warning"><%= v.getStatus() %></span></td>
                                <%
                                    }
                                %>
                                <td>
                                    <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editVehicleModal<%= v.getId() %>" >Edit</button>
                                </td>
                            </tr>
                            
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

<!-- Add Vehicle Modal -->
<div class="modal fade" id="addVehicleModal" tabindex="-1" aria-labelledby="addVehicleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content bg-dark text-light">
            <div class="modal-header">
                <h5 class="modal-title" id="addVehicleModalLabel">Add New Vehicle</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Safarnama Logo in Modal -->
                <div class="text-center mb-3">
                    <img src="../images/Safarnama.jpg" alt="Safarnama Logo" class="img-fluid" style="max-width: 180px;">
                </div>

                <form action="../VehicleServlet" method="post" enctype="multipart/form-data">
                    <input type="text" hidden name="action" value="addVehicle">
                    <input type="text" hidden name="vendorId" value="<%= vendor.getId() %>">
                    <!-- Vehicle Name -->
                     <div class="row mb-3">
                    <div class="col-sm-6">
                        <label for="vehicleName" class="form-label">Vehicle Name</label>
                        <input type="text" class="form-control" name="vehicleName" id="vehicleName" required>
                    </div>
                    
                    <div class="col-sm-6">
                            <label for="vehicleCategory" class="form-label">Category</label>
                            <select class="form-select" name="vehicleCategory" id="vehicleCategory" required>
                                <option value="Van">Van</option>
                                <option value="Bike">Bike</option>
                                <option value="Caravan">Caravan</option>
                                <option value="Car">Car</option>
                            </select>
                        </div>
                     </div>
                    <!-- Vehicle Category and Plate Number -->
                    <div class="row mb-3">
                          <div class="col-sm-6">
                              <br>
                              <label class="form-label">Type</label><br>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" value="true" id="AC" name="AC" required>
                                <label class="form-check-label" for="AC">AC</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" value="false" id="nonAC" name="AC" required>
                                <label class="form-check-label" for="nonAC">Non-AC</label>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <label for="vehiclePlate" class="form-label">Plate Number</label>
                            <input type="text" name="vehiclePlate" class="form-control" id="vehiclePlate" required>
                        </div>
                    </div>

                    <!-- Description -->
                    <div class="row mb-3">
                      <div class="col-sm-6">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" name="description" id="description" required></textarea>
                    </div>
                        
                         <div class="col-sm-6">
                            <label for="facilities" class="form-label">Other Facilities</label>
                            <textarea class="form-control" name="facilities" id="facilities" required></textarea>
                        </div>
                    </div>

                    <!-- AC Options and Seats -->
                    <div class="row mb-3">
                       <div class="col-sm-6">
                            <label for="seats" class="form-label">Seats</label>
                            <input type="text" name="seats" class="form-control" id="seats" required>
                        </div>
                         <div class="col-sm-6">
                            <label for="price" class="form-label">Price Per Day</label>
                            <input type="text" name="price" class="form-control" id="price" required>
                        </div>
                    </div>

                  <!-- Status and Photo Upload -->
                    <div class="row mb-3">
                        <div class="col-sm-6">
                            <label for="vehicleStatus" class="form-label">Status</label>
                            <select name="status" class="form-select" id="vehicleStatus" required>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label for="photo" class="form-label">Upload a Photo</label>
                            <input type="file" class="form-control" id="photo" required name="photo">
                        </div>
                    </div>

                    <button type="submit" class="btn btn-success">Add Vehicle</button>
                </form>
            </div>
        </div>
    </div>
</div>

                    <%
                        for(Vehicle v:vehicleList){
                    %>
<!-- Edit Vehicle Modal -->
<div class="modal fade" id="editVehicleModal<%= v.getId() %>" tabindex="-1" aria-labelledby="editVehicleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content bg-dark text-light">
            <div class="modal-header">
                <h5 class="modal-title" id="editVehicleModalLabel">Edit Vehicle</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
             <div class="modal-body">
                <!-- Safarnama Logo in Modal -->
                <div class="text-center mb-3">
                    <img src="../images/Safarnama.jpg" alt="Safarnama Logo" class="img-fluid" style="max-width: 180px;">
                </div>

                <form action="../VehicleServlet" method="post" enctype="multipart/form-data">
                    <input type="text" hidden name="action" value="editVehicle">
                    <input type="text" hidden name="vehicleId" value="<%= v.getId() %>">
                    
                    <!-- Vehicle Name -->
                     <div class="row mb-3">
                    <div class="col-sm-6">
                        <label for="vehicleName" class="form-label">Vehicle Name</label>
                        <input readonly value="<%= v.getVehicleName() %>" type="text" class="form-control" name="vehicleName" id="vehicleName" required>
                    </div>
                    
                    <div class="col-sm-6">
                            <label for="vehicleCategory" class="form-label">Category</label>
                            <input readonly value="<%= v.getVehicleCategory() %>" type="text" class="form-control" name="vehicleCategory" id="vehicleName" required>
                        </div>
                     </div>
                    <!-- Vehicle Category and Plate Number -->
                    <div class="row mb-3">
                          <div class="col-sm-6">
                              <br>
                              <label class="form-label">Type</label><br>
                            <div class="form-check form-check-inline">
                                <%
                                    if(v.isAC()){
                                %>
                                <label class="form-check-label" for="AC">AC</label>
                                <%
                                    }else{
                                %>
                                <label class="form-check-label" for="AC">NON AC</label>
                                <%
                                    }
                                %>
                            </div>
                          
                        </div>
                        <div class="col-sm-6">
                            <label for="vehiclePlate" class="form-label">Plate Number</label>
                            <input readonly value="<%= v.getVehiclePlate() %>" type="text" name="vehiclePlate" class="form-control" id="vehiclePlate" required>
                        </div>
                    </div>

                    <!-- Description -->
                    <div class="row mb-3">
                      <div class="col-sm-6">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" value="<%= v.getDescription() %>" name="description" id="description" required><%= v.getDescription() %></textarea>
                    </div>
                        
                         <div class="col-sm-6">
                            <label for="facilities" class="form-label">Other Facilities</label>
                            <textarea value="<%= v.getFacilities() %>" class="form-control" name="facilities" id="facilities" required><%= v.getFacilities() %></textarea>
                        </div>
                    </div>

                    <!-- AC Options and Seats -->
                    <div class="row mb-3">
                       <div class="col-sm-6">
                            <label for="seats" class="form-label">Seats</label>
                            <input readonly value="<%= v.getSeats() %>" type="text" name="seats" class="form-control" id="seats" required>
                        </div>
                         <div class="col-sm-6">
                            <label for="price" class="form-label">Price Per Day</label>
                            <input type="text" value="<%= v.getPrice() %>" name="price" class="form-control" id="price" required>
                        </div>
                    </div>

                  <!-- Status and Photo Upload -->
                    <div class="row mb-3">
                        <div class="col-sm-6">
                            <label for="vehicleStatus" class="form-label">Status</label>
                            <select name="status" class="form-select" id="vehicleStatus" required>
                                <option  value="<%= v.getStatus() %>"><%= v.getStatus() %></option>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                      
                    </div>

                    <button type="submit" class="btn btn-success">Edit Vehicle</button>
                </form>
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
