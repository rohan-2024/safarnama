
<!-- Footer Section -->
<div class="footer">
    <p>&copy; 2025 Safarnama. All rights reserved.</p>
    <div class="social-icons">
        <a href="#" class="text-white mx-2" target="_blank">
            <i class="fab fa-facebook-f"></i>
        </a>
        <a href="#" class="text-white mx-2" target="_blank">
            <i class="fab fa-twitter"></i>
        </a>
        <a href="#" class="text-white mx-2" target="_blank">
            <i class="fab fa-instagram"></i>
        </a>
        <a href="#" class="text-white mx-2" target="_blank">
            <i class="fab fa-linkedin-in"></i>
        </a>
        <a href="#" class="text-white mx-2" target="_blank">
            <i class="fab fa-youtube"></i>
        </a>
    </div>
</div>

    <!-- Booking Status Modal -->
    <div class="modal fade" id="bookingStatusModal" tabindex="-1" aria-labelledby="bookingStatusModalLabel" aria-hidden="true">
      <div class="modal-dialog">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title" id="bookingStatusModalLabel">Check Booking Status</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                  <!-- Logo inside the modal -->
                  <div class="logo-container">
                      <img src="images/Safarnama.jpg" alt="Safarnama Logo">
                  </div>
                  <form action="bookingStatus.jsp" method="post">
                      <div class="mb-3">
                          <label for="bookingId" class="form-label">Enter Booking ID</label>
                          <input type="text" class="form-control" name="id" id="bookingId" placeholder="Enter your booking ID">
                      </div>
                      <div class="mb-3">
                          <button type="submit" class="btn btn-primary w-100">Check Status</button>
                      </div>
                  </form>
              </div>
              <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              </div>
          </div>
      </div>
  </div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
