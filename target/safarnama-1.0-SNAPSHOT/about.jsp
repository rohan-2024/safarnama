<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Rohan Axis</title>
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

        /* About Section */
        .about-section {
            background-color: #222222;
            padding: 50px 0;
        }

        .about-section .about-header {
            text-align: center;
            color: #ff6f61;
            margin-bottom: 40px;
        }

        .about-section .about-text {
            color: #bbb;
            text-align: center;
            font-size: 1.1rem;
        }

        .about-section .founder-info {
            text-align: center;
            margin-top: 40px;
        }

        .founder-info img {
            border-radius: 50%;
            width: 180px;
            height: 180px;
            object-fit: cover;
            margin-bottom: 20px;
        }

        .founder-info h3 {
            color: #ff6f61;
            font-weight: bold;
        }

        .founder-info p {
            color: #bbb;
            font-size: 1.2rem;
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
   </style>
</head>
<body>

    <%@include file="Common Components/navbar.jsp" %>
    
<!-- About Section -->
<div class="about-section">
    <div class="container">
      
        <div class="founder-info">
            <img src="images/rohan.jpg" alt="Rohan Singh">
            <h3>Rohan Singh</h3>
            <p>Founder & CEO</p>
            <p>Rohan Singh is the visionary behind Rohan Axis. With a deep understanding of the travel industry and a passion for innovation, he strives to bring the best vehicle rental experience to all users. Under his leadership, Rohan Axis is growing rapidly and expanding to serve customers across the country.</p>
        </div>
        
        <!-- Safarnama Logo -->
        <div class="text-center mt-5">
            <img src="images/Safarnama.jpg" alt="Safarnama Logo" style="max-width: 180px;">
            <p>Let the journey begin with Safarnama!</p>
        </div>
    </div>
</div>
<%@include file="Common Components/footer.jsp" %>