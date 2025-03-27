<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Safarnama</title>
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
            max-width: 150px;
        }
        .navbar-nav a {
            color: #f1f1f1;
            font-weight: 600;
        }
        .navbar-nav a:hover {
            color: #ff6f61;
            text-decoration: none;
        }

        /* Contact Form Section */
        .contact-section {
            padding: 50px 0;
        }
        .contact-form {
            background-color: #2a2a2a;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .contact-form h2 {
            color: #ff6f61;
        }
        .form-control {
            background-color: #333333;
            border: none;
            border-radius: 5px;
            color: #fff;
        }
        .form-control:focus {
            background-color: #444444;
            color: #fff;
            border-color: #ff6f61;
        }
        .btn-primary {
            background-color: #ff6f61;
            border-color: #ff6f61;
        }
        .btn-primary:hover {
            background-color: #ff4c3b;
            border-color: #ff4c3b;
        }
        .contact-info {
            background-color: #333333;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
        }
        .contact-info h3 {
            color: #ff6f61;
        }
        .contact-info p {
            color: #bbb;
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

        /* Safarnama Logo */
        .safarnama-logo {
            width: 150px;
            margin-top: 20px;
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
    </style>
</head>
<body>
    <%@include file="Common Components/navbar.jsp" %>
<!-- Contact Section -->
<div class="contact-section">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="contact-form">
                    <h2>Get in Touch</h2>
                    <form action="#" method="POST">
                        <div class="mb-3">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="name" placeholder="Enter your name" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="email" placeholder="Enter your email" required>
                        </div>
                        <div class="mb-3">
                            <label for="message" class="form-label">Message</label>
                            <textarea class="form-control" id="message" rows="4" placeholder="Write your message" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Send Message</button>
                    </form>
                </div>
            </div>
            <div class="col-md-6">
                <div class="contact-info">
                    <h3>Our Location</h3>
                    <p>Dehri, Rohtas, Bihar</p>
                    <p><i class="fas fa-phone-alt"></i> +91 123456789</p>
                    <p><i class="fas fa-envelope"></i> snghrohan000@gmail.com</p>
                    <h3>Follow Us</h3>
                    <div class="social-icons">
                        <a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-youtube"></i></a>
                    </div>
                    <!-- Safarnama Logo -->
                    <img src="images/Safarnama.jpg" alt="Safarnama Logo" class="safarnama-logo"> <!-- Safarnama Logo -->
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="Common Components/footer.jsp" %>