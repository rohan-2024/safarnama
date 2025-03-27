<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Safarnama</title>
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

        /* Login Form Section */
        .login-section {
            padding: 80px 0;
        }
        .login-form {
            background-color: #2a2a2a;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            margin: 0 auto;
        }
        .login-form h2 {
            color: #ff6f61;
            margin-bottom: 20px;
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

        .social-login {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }
        .social-login a {
            color: #f1f1f1;
            font-size: 18px;
        }
        .social-login a:hover {
            color: #ff6f61;
        }

        /* Footer Section */
        .footer {
            background-color: #1a1a1a;
            color: #f1f1f1;
            text-align: center;
            padding: 20px;
            margin-top: 50px;
        }

        .footer a {
            color: #ff6f61;
            margin: 0 10px;
        }

        .footer a:hover {
            color: #ff4c3b;
        }

        /* Logo Section */
        .logo-section {
            text-align: center;
            margin-bottom: 30px;
        }
        .logo-section img {
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
<!-- Login Section -->
<div class="login-section">
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="login-form">
                    <div class="logo-section">
                        <img src="images/Safarnama.jpg" alt="Safarnama Logo"> <!-- Safarnama Logo -->
                    </div>
                    <h2>Login to Safarnama</h2>
                    <%@include file="Common Components/message.jsp" %>
                    <form action="LoginServlet" method="POST">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" name="email" class="form-control" id="email" placeholder="Enter your email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" id="password" placeholder="Enter your password" required>
                        </div>
                        <div class="d-flex justify-content-between">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="rememberMe">
                                <label class="form-check-label" for="rememberMe">Remember Me</label>
                            </div>
                            <a href="#" class="text-decoration-none" style="color: #ff6f61;">Forgot Password?</a>
                        </div>
                        <button type="submit" class="btn btn-primary w-100 mt-3">Login</button>
                    </form>

                    <div class="social-login">
                        <a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-google"></i></a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="Common Components/footer.jsp" %>