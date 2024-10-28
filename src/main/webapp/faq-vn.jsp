<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FAQ - VN</title>
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
            <h2>Trả tiền chuyên chở không phải mua vé bằng những cách nào?</h2>
            <img src="media/b165efcb906522f7ff0b59decf59a4b5-2724197678.jpg" alt="description" class="img-fluid mb-3">
            <ul class="link-list">
                <li><a>Trả tiền chuyên chở không phải mua vé là một cách khác để trả tiền cho tất cả các phương tiện giao
                    thông công cộng trong mạng lưới Opal. Đơn giản là chỉ cần chạm hoặc thẻ tín dụng, thẻ tiết kiệm
                    ngân hàng hay một thiết bị đã được liên kết, mỗi khi lên hay xuống một phương tiện giao thông
                    công cộng để trả cùng tiền vé cũng như nhận được cùng các lợi ích chuyên chở như đối với một
                    thẻ Opal dành cho người lớn.</a></li>
            </ul>
        </div>

        <div class="faq-section">
            <h2>Tôi có thể dùng những thẻ nào cho việc trả tiền bằng cách không phải mua vé?</h2>
            <img src="media/hd_opal_cards_four-1777658371.png" alt="description" class="img-fluid mb-3">
            <ul class="link-list">
                <li><a>Quý vị có thể dùng hầu hết các thẻ tín dụng và thẻ tiết kiệm ngân hàng của American Express,
                    Mastercard hay Visa mà trên thẻ có dấu hiệu trả tiền này. Thẻ trả tiền trước không dùng được.</a></li>
            </ul>
        </div>

        <div class="faq-section">
            <h2>Tiền vé là bao nhiêu nếu trả bằng các cách không phải mua vé này?</h2>
            <img src="media/opal-adult-card-3752804518.jpg" alt="description" class="img-fluid mb-3">
            <ul class="link-list">
                <li><a>Quý vị sẽ nhận được cùng các lợi ích khi di chuyển của một thẻ Opal dành cho người lớn và trả tiền vé cho
                    một người lớn khi quý vị luôn luôn dùng cùng một thẻ tín dụng, thẻ tiết kiệm ngân hàng hay một thiết bị
                    đã được liên kết, để chạm mỗi khi lên hay xuống một phương tiện giao thông công cộng.</a></li>
            </ul>
        </div>

        <div class="faq-section">
            <h2>Tôi có thể chạm thẻ hay thiết bị đã liên kết của mình cho cả gia đình được không?</h2>
            <img src="media/opal-digital-transport-nsw-1024x618-1057285650.jpg" alt="description" class="img-fluid mb-3">
            <ul class="link-list">
                <li><a>Không. Quý vị chỉ có thể trả tiền vé như một thẻ Opal dành cho người lớn bằng một thẻ hay một thiết
                    bị đã được liên kết.</a></li>
            </ul>
        </div>

        <div class="faq-section">
            <h2>Tôi có thể trả tiền cho dịch vụ đậu xe và đi Park&Ride của bộ Giao Thông bằng các cách
                trả tiền không phải mua vé này không?</h2>
            <ul class="link-list">
                <li><a>Không. Park&Ride hiện chỉ chấp nhận thẻ Opal. Điều này có nghĩa là quý vị sẽ cần phải dùng thẻ Opal
                    của quý vị khi vào và ra khỏi các khu này.</a></li>
            </ul>
        </div>

        <div class="faq-section">
            <h2>Tôi dùng thẻ tín dụng hay thẻ tiết kiệm ngân hàng để trả tiền vé như thế nào?</h2>
            <ul class="link-list">
                <li><a>
                    Lấy chiếc thẻ mà quý vị muốn dùng ra khỏi bóp của mình để bảo đảm tiền vé được tính vào
                    đúng thẻ này. <br>
                    Chạm thẻ này trên máy đọc Opal. <br>
                    Chạm cùng chiếc thẻ này khi quý vị tới nơi mình muốn tới. Ngoại lệ duy nhất là với chuyến
                    Phà F1 từ Manly tới Circular Quay, quý vị chỉ cần chạm thẻ khi lên phà mà thôi.</a></li>
            </ul>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
