<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html>
    <head>
        <title>Contact Us</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <style>
            .container {
                width: 60%;
                margin: 0 auto;
                padding: 20px;
                box-sizing: border-box;
            }
            .contact-info {
                font-size: 18px;
                margin-bottom: 20px;
                line-height: 1.6;
            }
        </style>
    </head>
    
    <div class="header">
        <p class="headerText">Opal Management System - Contact Us</p>
    </div>
    
    <body>
        <div class="container">
            <div class="contact-info">
                <h2>Our contact information</h2>
                <p>Email: International@uts.edu.au</p>
                <p>Phone: +61 2 8806 0230</p>
                <p>Address: 15 Broadway Ultimo, NSW 2007, Sydney, Australia</p>
            </div>

            <form action="ContactServlet" method="post">
                <label for="name">Name:</label>
                <input type="text" name="name" id="name" required>
                <br><br>
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" required>
                <br><br>
                <label for="message">Message:</label>
                <textarea name="message" id="message" required></textarea>
                <br><br>
                <input type="submit" value="Send Message" class="formButton">

                <a href="main.jsp" class="formbutton">Return to Main Page</a>
            </form>

            

        </div>
    </body>
</html>
