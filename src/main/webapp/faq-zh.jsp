<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>FAQ - ZH</title>
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
            <h2>什么是非接触式交通支付?</h2>
            <img src="media/b165efcb906522f7ff0b59decf59a4b5-2724197678.jpg" alt="description" class="img-fluid mb-3">
            <ul class="link-list">
                <li><a>非接触式交通支付是用Opal网路支付公共交通费的另一种方式。上下车时只需点一下信用卡、借记卡或一个相连的设备, 就能获得与成人Opal卡一样的票价和出行优惠。</a></li>
            </ul>
        </div>

        <div class="faq-section">
            <h2>哪些卡可以用于非接触式支付?</h2>
            <img src="media/hd_opal_cards_four-1777658371.png" alt="description" class="img-fluid mb-3">
            <ul class="link-list">
                <li><a>您可以使用大部分带有非接触式支付标志 的 American Express、Mastercard或Visa信用卡和各种借记卡。</a></li>
            </ul>
        </div>

        <div class="faq-section">
            <h2>使用非接触式支付的票价是多少</h2>
            <img src="media/opal-adult-card-3752804518.jpg" alt="description" class="img-fluid mb-3">
            <ul class="link-list">
                <li><a>始终使用同一张信用卡、借记卡或设备点卡支付交通费，您就能获得和Opal成人卡一样的出行优惠，并支付成人票价。</a></li>
            </ul>
        </div>

        <div class="faq-section">
            <h2>我能用我的卡或设备为全家人上车点卡吗?</h2>
            <img src="media/opal-digital-transport-nsw-1024x618-1057285650.jpg" alt="description" class="img-fluid mb-3">
            <ul class="link-list">
                <li><a>不能。一张非接触式卡或一个设备只能用于支付一张Opal成人票价。</a></li>
            </ul>
        </div>

        <div class="faq-section">
            <h2>我能用非接触式支付方法来支付 Park&Ride (停车换乘)的费用吗?</h2>
            <ul class="link-list">
                <li><a>不能。Park&Ride现在只接受Opal卡付款。也就是说您在上下公共交通工具时需要点Opal卡。</a></li>
            </ul>
        </div>

        <div class="faq-section">
            <h2>我怎样使用信用卡或借记卡支付交通费?</h2>
            <ul class="link-list">
                <li><a>
                    取出您想用的卡，确保从适当的卡上扣费。<br>
                    在Opal读卡器上点一下。<br>
                    到站下车时用同一张卡再点一次。唯一的例外是从 F1 Manly 到 Circular Quay 的渡轮服务，该服务仅需上船时点一次卡。</a></li>
            </ul>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
