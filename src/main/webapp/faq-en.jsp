<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FAQ - EN</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .navbar {
            background-color: #007bff;
        }

        .navbar-nav .nav-link {
            color: white;
            font-size: 1.1em;
            margin-right: 20px;
            transition: color 0.3s ease, border-bottom 0.3s ease; 
        }

        .navbar-nav .nav-link:hover {
            color: #ffc107;
        }

        .container {
            margin-top: 30px;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
            color: black;
        }

        .faq-section {
            margin-bottom: 30px;
        }

        .faq-question {
            font-weight: bold;
            margin-bottom: 10px;
        }

        .faq-answer {
            margin-bottom: 20px;
        }

        .link-list {
            list-style-type: none;
            padding: 0;
        }

        .link-list li {
            margin-bottom: 10px;
        }

        .link-list a {
            color: #0073e6;
            text-decoration: none;
        }

        .link-list a:hover {
            text-decoration: underline;
        }

        /* Responsive nav that stacks the items vertically for smaller screens */
        @media (max-width: 768px) {
            .navbar-nav {
                flex-direction: column;
                text-align: center;
            }
        }

        .language-selector {
            margin: 20px 0;
        }
    </style>
</head>
<body>

    <!-- Header Navigation -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand text-white" href="#">Opal Management</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="main.jsp">Profile Settings</a></li>
                    <li class="nav-item"><a class="nav-link" href="ListOpalCardsServlet?userID=${user.ID}">Manage Cards</a></li>
                    <li class="nav-item"><a class="nav-link" href="viewandTopUpBalance.jsp">Top-up</a></li>
                    <li class="nav-item"><a class="nav-link" href="UserEventController">Events</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Travel History</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Trip Planner</a></li>
                    <li class="nav-item"><a class="nav-link" href="ViewSavedTripsServlet">Saved Trips</a></li>
                    <li class="nav-item"><a class="nav-link" href="faq-en.jsp">F.A.Q</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="logOut.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- FAQ Content -->
    <div class="container mt-5">
        <div class="language-selector">
            <p>Select Language: 
                <a href="faq-en.jsp">English</a> | 
                <a href="faq-zh.jsp">中文</a> | 
                <a href="faq-vn.jsp">Tiếng Việt</a>
            </p>
        </div>

        <div class="faq-section">
            <h2>Ways to Pay for Your Travel</h2>
            <img src="media/b165efcb906522f7ff0b59decf59a4b5-2724197678.jpg" alt="description" class="img-fluid mb-3">
            <ul class="link-list">
                <li><a href="https://transportnsw.info/tickets-opal/opal/best-ways-for-visitors-to-pay" target="_blank">Best ways to pay for travel</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/get-opal-card" target="_blank">Get an Opal card</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/opal-card-types" target="_blank">Opal card types</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/contactless-payments" target="_blank">Contactless payments</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/fares-payments/opal-single-tickets" target="_blank">Opal single tickets</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/opalpay" target="_blank">OpalPay on private services</a></li>
                <li><a href="https://transportnsw.info/transport-connect" target="_blank">Transport Connect on select services</a></li>
            </ul>
        </div>

        <div class="faq-section">
            <h2>Manage Your Opal Card</h2>
            <img src="media/hd_opal_cards_four-1777658371.png" alt="description" class="img-fluid mb-3">
            <ul class="link-list">
                <li><a href="https://transportnsw.info/tickets-opal/opal/manage-your-opal-card/unregistered-opal-cards" target="_blank">I have an unregistered Opal card</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/manage-your-opal-card/activate-opal-card" target="_blank">Activate an Opal card</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/check-opal-card-balance-view-activity-statements" target="_blank">Check your balance and activity</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/manage-your-opal-card/protect-your-personal-information" target="_blank">Protect your personal information</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/manage-your-opal-card/transfer-balance-block-card" target="_blank">Block Opal card and transfer balance</a></li>
                <li><a href="https://transportnsw.info/apps/opal-travel" target="_blank">Manage your account with the Opal Travel app</a></li>
            </ul>
        </div>

        <div class="faq-section">
            <h2>Opal Fares</h2>
            <img src="media/opal-adult-card-3752804518.jpg" alt="description" class="img-fluid mb-3">
            <ul class="link-list">
                <li><a href="https://transportnsw.info/tickets-opal/opal/fares-payments/adult-fares" target="_blank">Adult Opal or contactless fares</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/fares-payments/child-fares" target="_blank">Child Opal fares</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/fares-payments/senior-pensioner-fares" target="_blank">Senior and pensioner Opal fares</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/fares-payments/concession-fares" target="_blank">Concession Opal fares</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/fares-payments/how-opal-fares-work" target="_blank">How Opal fares are calculated</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/tapping-on-tapping-off#accordion-default-fare-content" target="_blank">Default fares</a></li>
            </ul>
        </div>

        <div class="faq-section">
            <h2>Eligibility and Concessions</h2>
            <img src="media/opal-digital-transport-nsw-1024x618-1057285650.jpg" alt="description" class="img-fluid mb-3">
            <ul class="link-list">
                <li><a href="https://transportnsw.info/tickets-opal/ticket-eligibility-concessions/adult-16" target="_blank">Adults</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/ticket-eligibility-concessions/school-student-travel" target="_blank">School students</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/ticket-eligibility-concessions/child-youth" target="_blank">Children</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/ticket-eligibility-concessions/tertiary-or-tafe-students" target="_blank">Tertiary or TAFE students</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/ticket-eligibility-concessions/apprentice-or-trainee" target="_blank">Apprentice and trainees</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/ticket-eligibility-concessions/seniors" target="_blank">Seniors</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/ticket-eligibility-concessions/pensioners" target="_blank">Pensioners</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/ticket-eligibility-concessions/centrelink-customers" target="_blank">Centrelink customers</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/ticket-eligibility-concessions/asylum-seeker" target="_blank">Asylum seekers</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/ticket-eligibility-concessions/people-with-disabilities" target="_blank">People with disabilities</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/ticket-eligibility-concessions/veteran" target="_blank">Veterans and War Widow/ers</a></li>
            </ul>
        </div>

        <div class="faq-section">
            <h2>Opal Support and Customer Care</h2>
            <ul class="link-list">
                <li><a href="https://transportnsw.info/tickets-opal/opal/manage-your-opal-card/lost-stolen-opal-cards" target="_blank">Report your card lost or stolen</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/manage-your-opal-card/opal-refunds-fare-adjustments" target="_blank">Opal refunds and fare adjustments</a></li>
                <li><a href="https://transportnsw.info/plan/help/help-in-other-languages" target="_blank">Help in other languages</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/opal-terms-of-use" target="_blank">Opal terms of use</a></li>
                <li><a href="https://transportnsw.info/tickets-opal/opal/opal-privacy-policy" target="_blank">Opal privacy policy</a></li>
            </ul>
        </div>

        <div class="faq-section">
            <h2>Tapping On and Off</h2>
            <ul class="link-list">
                <li><a href="https://transportnsw.info/tickets-opal/opal/tapping-on-tapping-off" target="_blank">Tapping on and tapping off</a></li>
            </ul>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
