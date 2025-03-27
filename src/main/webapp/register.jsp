<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Safarnama</title>
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

        /* Register Form Section */
        .form-container {
            background-color: #2a2a2a;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
        }

        .form-title {
            color: #ff6f61;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-control {
            background-color: #333333;
            color: #fff;
            border: 1px solid #444;
        }

        .form-control:focus {
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

        .social-icons a {
            color: #ff6f61;
            margin: 0 10px;
        }

        .social-icons a:hover {
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
    </style>
</head>

<body>

    <%@include file="Common Components/navbar.jsp" %>
    <!-- Register Form Section -->
    <div class="container">
        <div class="form-container">
            <!-- Safarnama Logo inside the form -->
            <div class="logo-container">
                <img src="images/Safarnama.jpg" alt="Safarnama Logo">
            </div>
            <h2 class="form-title">Create Your Account</h2>
            <form action="UserServlet" method="post" enctype="multipart/form-data">
                <input type="text" hidden name="action" value="addUser">
                <!--  Fields for Users -->
                <div class="mb-3">
                    <label for="name" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="name" name="name" required placeholder="Enter your full name">
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" class="form-control" id="email" name="email" required placeholder="Enter your email address">
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Phone Number</label>
                    <input type="tel" class="form-control" id="phone" name="phone" required placeholder="Enter your phone number">
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required placeholder="Enter your password">
                </div>

                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required placeholder="Confirm your password">
                </div>
               
                <div class="mb-3">
                    <label for="photo" class="form-label">Upload Photo</label>
                    <input type="file" class="form-control" id="photo" name="photo" required>
                </div>
                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Register</button>
                </div>
            </form>
        </div>
    </div>
    <%@include file="Common Components/footer.jsp" %>