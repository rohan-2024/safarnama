<%@include file="Common Components/navbar.jsp" %>

                <h2 class="mb-4">Settings</h2>
                
                <!-- Safarnama Logo in Settings Page -->
                <div class="text-center mb-4">
                    <img src="../images/Safarnama.jpg" alt="Safarnama Logo" class="img-fluid" style="max-width: 180px;">
                </div>

                <!-- Settings Form -->
                <form action="../UserServlet" method="post">
                    <input type="text" name="action" value="editUser" hidden>
                    <input type="text" name="vendorId" value="<%= vendor.getId() %>" hidden>
                    
                    <!-- Account Settings -->
                    <div class="mb-4">
                        <h4>Account Settings</h4>
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" value="<%= vendor.getName() %>">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" readonly class="form-control" id="email" value="<%= vendor.getEmail() %>">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Enter new Password</label>
                            <input type="password" name="password" class="form-control" id="password">
                        </div>
                        <div class="mb-3">
                            <button type="submit" class="btn btn-warning">Update Account</button>
                        </div>
                    </div>

                    <!-- Notification Settings -->
                    <div class="mb-4">
                        <h4>Notification Settings</h4>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="emailNotifications" checked>
                            <label class="form-check-label" for="emailNotifications">
                                Receive Email Notifications
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="smsNotifications" checked>
                            <label class="form-check-label" for="smsNotifications">
                                Receive SMS Notifications
                            </label>
                        </div>
                    </div>

                    <!-- Privacy Settings -->
                    <div class="mb-4">
                        <h4>Privacy Settings</h4>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="twoFactor" checked>
                            <label class="form-check-label" for="twoFactor">
                                Enable Two-Factor Authentication
                            </label>
                        </div>
                    </div>

                    <!-- Save Settings Button -->
                    <div class="mb-3">
                        <button type="submit" class="btn btn-success">Save Settings</button>
                    </div>
                </form>
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
    </script>
</body>

</html>
