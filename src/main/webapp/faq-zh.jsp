<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html>
    <head>
        <title>FAQ - ZH</title>
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
                <h2>什么是非接触式交通支付?</h2>
                <img src="media/b165efcb906522f7ff0b59decf59a4b5-2724197678.jpg" alt="description">
                <ul class="link-list">
                    <li><a>非接触式交通支付是用Opal网路支付公共交通费的另一种方式。上下车时只需点一下信用卡、
                        借记卡或一个相连的设备, 就能获得与成人Opal卡一样的票价和出行优惠。您可以使用 American
                        Express (美国运通)、Mastercard(万事达)和Visa(维萨)信用卡、借记卡，或和这些卡相连的设备</a></li>
                </ul>
            </div>

            <div class="faq-section">
                <h2>哪些卡可以用于非接触式支付?</h2>
                <img src="media/hd_opal_cards_four-1777658371.png" alt="description">
                <ul class="link-list">
                    <li><a>您可以使用大部分带有非接触式支付标志 的 American Express、Mastercard或Visa信用卡和
                        各种借记卡。这种支付方式不接受预付卡。如果您不确定您所用的卡是否能用于非接触式支付，
                        请向您的发卡机构查詢</a></li>
                </ul>
            </div>

            <div class="faq-section">
                <h2>使用非接触式支付的票价是多少</h2>
                <img src="media/opal-adult-card-3752804518.jpg" alt="description">
                <ul class="link-list">
                    <li><a>始终使用同一张信用卡、借记卡或设备点卡支付交通费，您就能获得和Opal成人卡一样的出行
                        优惠，并支付成人票价。请在 transportnsw.info 查看具体票价。如果您使用海外签发的信用卡，
                        您的发卡机构可能会向您收取国外交易费。</a></li>
                </ul>
            </div>

            <div class="faq-section">
                <h2>我能用我的卡或设备为全家人上车点卡吗?</h2>
                <img src="media/opal-digital-transport-nsw-1024x618-1057285650.jpg" alt="description">
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
                        到站下车时用同一张卡再点一次。唯一的例外是从 F1 Manly 到 Circular Quay 的渡轮
                        服务，该服务仅需上船时点一次卡。</a></li>
                </ul>
            </div>
        </div>
    </body>
</html>
