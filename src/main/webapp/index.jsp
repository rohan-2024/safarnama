<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Safarnama</title>
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

        /* Logo and Tagline */
        .logo-overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #ff6f61;
            text-align: center;
            z-index: 10;
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
        .btn-primary {
            background-color: #ff6f61;
            border-color: #ff6f61;
        }
        .btn-primary:hover {
            background-color: #ff4c3b;
            border-color: #ff4c3b;
        }

        /* Carousel */
        .carousel-item img {
            object-fit: cover;
            height: 60vh;
            width: 100%;
        }

        /* Testimonial Section */
        .testimonial-card {
            text-align: center;
            padding: 20px;
            border: 1px solid #444444;
            border-radius: 10px;
            background-color: #222222;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .testimonial-img {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 15px;
        }

        .testimonial-name {
            font-weight: 600;
            color: #ff6f61;
            margin-bottom: 10px;
        }

        .testimonial-feedback {
            font-style: italic;
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

        /* FAQ Section */
        .faq-card {
            background-color: #2a2a2a;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .faq-question {
            color: #ff6f61;
            font-weight: bold;
        }

        .faq-answer {
            color: #bbb;
        }

        /* Featured Services */
        .service-card {
            background-color: #333333;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .service-card h5 {
            color: #ff6f61;
        }

        .service-card p {
            color: #bbb;
        }

        .service-card i {
            font-size: 40px;
            color: #ff6f61;
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
    <%@include file="Common Components/message.jsp" %>

<!-- Slider Section using Bootstrap Carousel -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="images/slider/bike.jpg" class="d-block w-100" alt="Image 1">
        </div>
        <div class="carousel-item">
            <img src="images/slider/car.jpg" class="d-block w-100" alt="Image 2">
        </div>
        <div class="carousel-item">
            <img src="images/slider/van.jpg" class="d-block w-100" alt="Image 3">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
    <div class="logo-overlay">
        <img src="images/Safarnama.jpg" alt="Logo" style="max-width: 180px;">
        <p>Let the journey begin</p>
    </div>
</div>

<!-- Vehicle Categories Introduction -->
<div id="vehicle-cards">
    <div  class="container my-5 text-center">
        <h2 class="mb-4">Choose Your Ride</h2>
        <p class="lead">
            Whether you're planning a quick city trip, a long road journey, or just need something for the weekend, we've got you covered. 
            Explore our diverse selection of vehicles tailored to your needs.
        </p>
        <p class="lead">
            From speedy bikes to spacious vans and luxurious cars, find the right vehicle that fits your journey.
        </p>
        <a href="#vehicle-cards" class="btn btn-primary">Start Exploring</a>
    </div>
</div>

<!-- Card Section -->
<div class="container my-5">
    <div class="row">
        <div class="col-md-3">
            <div class="card">
                <img src="images/slider/van.jpg" class="card-img-top" alt="Card Image 1">
                <div class="card-body">
                    <h5 class="card-title">Van</h5>
                    <a href="explore.jsp?vehicleCategory=Van" class="btn btn-primary">Explore</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <img src="images/slider/bike.jpg" class="card-img-top" alt="Card Image 2">
                <div class="card-body">
                    <h5 class="card-title">Bike</h5>
                    <a href="explore.jsp?vehicleCategory=Bike" class="btn btn-primary">Explore</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <img src="images/slider/car.jpg" class="card-img-top" alt="Card Image 3">
                <div class="card-body">
                    <h5 class="card-title">Car</h5>
                    <a href="explore.jsp?vehicleCategory=Car" class="btn btn-primary">Explore</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <img src="images/slider/caravan.jpg" class="card-img-top" alt="Card Image 4">
                <div class="card-body">
                    <h5 class="card-title">Caravan</h5>
                    <a href="explore.jsp?vehicleCategory=Caravan" class="btn btn-primary">Explore</a>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Featured Services Section -->
<div class="featured-services">
    <div class="container text-center">
        <h2 class="mb-5">Featured Services</h2>
        <div class="row">
            <!-- Service 1: Car Rentals -->
            <div class="col-md-3">
                <div class="service-card">
                    <i class="fas fa-car"></i>
                    <h5>Car Rentals</h5>
                    <p>Find a wide range of cars for your journey ? from compact cars to luxury rides.</p>
                </div>
            </div>
            <!-- Service 2: Bike Rentals -->
            <div class="col-md-3">
                <div class="service-card">
                    <i class="fas fa-bicycle"></i>
                    <h5>Bike Rentals</h5>
                    <p>Explore the city or countryside on two wheels with our diverse bike options.</p>
                </div>
            </div>
            <!-- Service 3: Van Rentals -->
            <div class="col-md-3">
                <div class="service-card">
                    <i class="fas fa-bus"></i> <!-- You can also use fa-van if needed -->
                    <h5>Van Rentals</h5>
                    <p>Perfect for family trips or transporting large groups comfortably.</p>
                </div>
            </div>
            <!-- Service 4: Caravan Rentals -->
            <div class="col-md-3">
                <div class="service-card">
                    <i class="fas fa-campground"></i>
                    <h5>Caravan Rentals</h5>
                    <p>Hit the road and experience the freedom of travel with our comfortable caravans.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Testimonial Section -->
<div class="container my-5">
    <h2 class="text-center mb-4">What Our Users Say</h2>
    <div class="row">
        <!-- Testimonial 1 -->
        <div class="col-md-4">
            <div class="testimonial-card">
                <img src="images/alex.jpg" class="testimonial-img" alt="User 1">
                <h5 class="testimonial-name">John Doe</h5>
                <p class="testimonial-feedback">"This service is amazing! I had the best experience ever on my road trip."</p>
            </div>
        </div>
        <!-- Testimonial 2 -->
        <div class="col-md-4">
            <div class="testimonial-card">
                <img src="images/priya.jpg" class="testimonial-img" alt="User 2">
                <h5 class="testimonial-name">Jane Smith</h5>
                <p class="testimonial-feedback">"A wonderful platform with fantastic options for all types of journeys. Highly recommend!"</p>
            </div>
        </div>
        <!-- Testimonial 3 -->
        <div class="col-md-4">
            <div class="testimonial-card">
                <img src="images/rohan.jpg" class="testimonial-img" alt="User 3">
                <h5 class="testimonial-name">Rohan Singh</h5>
                <p class="testimonial-feedback">"Great customer service and an easy-to-use platform. The trips were unforgettable!"</p>
            </div>
        </div>
    </div>
</div>


<!-- FAQ Section -->
<div class="container my-5 faq-section">
    <h2 class="text-center mb-4">Frequently Asked Questions (FAQ)</h2>
    <div class="row">
        <div class="col-md-6">
            <div class="faq-card">
                <h3 class="faq-question">What types of vehicles are available for rent?</h3>
                <p class="faq-answer">We offer a wide variety of vehicles, including cars, bikes, vans, and caravans, to suit all kinds of trips and preferences.</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="faq-card">
                <h3 class="faq-question">How do I book a vehicle?</h3>
                <p class="faq-answer">Booking a vehicle is simple! You can browse our categories, choose a vehicle, and proceed to the booking page to confirm your reservation.</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="faq-card">
                <h3 class="faq-question">Is insurance included with my rental?</h3>
                <p class="faq-answer">Yes, insurance is included with all rentals for your safety and peace of mind during your trip.</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="faq-card">
                <h3 class="faq-question">Can I modify my booking?</h3>
                <p class="faq-answer">Yes, you can modify your booking up to 24 hours before your scheduled rental pick-up time. Please contact our customer service team for assistance.</p>
            </div>
        </div>
    </div>
</div>
<%@include file="Common Components/footer.jsp" %>