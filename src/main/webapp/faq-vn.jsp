<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html>
    <head>
        <title>FAQ - VN</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <style>
            .container {
                width: 70%;
                margin: 0 auto;
                padding: 20px;
            }
            h2 {
                font-size: 24px;
                margin-bottom: 10px;
            }
            .faq-section {
                margin-bottom: 30px;
            }
            .faq-question {
                font-weight: bold;
                margin-bottom: 5px;
            }
            .faq-answer {
                margin-bottom: 15px;
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
        </style>
    </head>
    
    <body>
        <div class="header">
            <p class="headerText">Opal Management System - FAQ</p>
        </div>
        
        <div class="language-selector">
            <p>Select Language: 
                <a href="faq-en.jsp">English</a> | 
                <a href="faq-zh.jsp">中文</a> | 
                <a href="faq-vn.jsp">Tiếng Việt</a>
            </p>
        </div>

        <div class="container">
            <!-- Copied from the actual opal system. Source: https://transportnsw.info/tickets-opal/opal#/login -->
            
            <a href="main.jsp" class="formbutton">Return to Main Page</a>

            <div class="faq-section">
                <h2>Trả tiền chuyên chở không phải mua vé bằng những cách nào?</h2>
                <img src="media/b165efcb906522f7ff0b59decf59a4b5-2724197678.jpg" alt="description">
                <ul class="link-list">
                    <li><a>Trả tiền chuyên chở không phải mua vé là một cách khác để trả tiền cho tất cả các phương tiện giao
                        thông công cộng trong mạng lưới Opal. Đơn giản là chỉ cần chạm hoặc thẻ tín dụng, thẻ tiết kiệm
                        ngân hàng hay một thiết bị đã được liên kết, mỗi khi lên hay xuống một phương tiện giao thông
                        công cộng để trả cùng tiền vé cũng như nhận được cùng các lợi ích chuyên chở như đối với một
                        thẻ Opal dành cho người lớn. Quý vị có thể dùng hoặc thẻ tín dụng, thẻ tiết kiệm ngân hàng của
                        American Express, Mastercard hay Visa hay một thiết bị đã được liên kết với một trong những thẻ này.</a></li>
                </ul>
            </div>

            <div class="faq-section">
                <h2>Tôi có thể dùng những thẻ nào cho việc trả tiền bằng cách không phải mua vé?</h2>
                <img src="media/hd_opal_cards_four-1777658371.png" alt="description">
                <ul class="link-list">
                    <li><a>Quý vị có thể dùng hầu hết các thẻ tín dụng và thẻ tiết kiệm ngân hàng của American Express,
                        Mastercard hay Visa mà trên thẻ có dấu hiệu trả tiền này . Thẻ trả tiền trước không dùng được.
                        Nếu không biết rõ là thẻ của mình có trả tiền như vậy được hay không, quý vị hãy hỏi cơ quan phát
                        hành thẻ của quý vị</a></li>
                </ul>
            </div>

            <div class="faq-section">
                <h2>Tiền vé là bao nhiêu nếu trả bằng các cách không phải mua vé này?</h2>
                <img src="media/opal-adult-card-3752804518.jpg" alt="description">
                <ul class="link-list">
                    <li><a>Quý vị sẽ nhận được cùng các lợi ích khi di chuyển của một thẻ Opal dành cho người lớn và trả tiền vé cho
                        một người lớn khi quý vị luôn luôn dùng cùng một thẻ tín dụng, thẻ tiết kiệm ngân hàng hay một thiết bị
                        đã được liên kết, để chạm mỗi khi lên hay xuống một phương tiện giao thông công cộng. Quý vị vào trang
                        mạng transportnsw.info để biết các giá vé cụ thể. Nếu quý vị dùng một thẻ tín dụng được phát hành ở
                        một nước ngoài, cơ quan phát hành thẻ của quý vị có thể sẽ tính phí giao dịch khi dùng ở ngoài nước đó.</a></li>
                </ul>
            </div>

            <div class="faq-section">
                <h2>Tôi có thể chạm thẻ hay thiết bị đã liên kết của mình cho cả gia đình được không?</h2>
                <img src="media/opal-digital-transport-nsw-1024x618-1057285650.jpg" alt="description">
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
Phà F1 từ Manly tới Circular Quay, quý vị chỉ cần chạm thẻ khi lên phà mà thôi</a></li>
                </ul>
            </div>
        </div>
    </body>
</html>
