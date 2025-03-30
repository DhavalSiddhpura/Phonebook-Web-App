<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phonebook</title>
    <%@include file="component/allcss.jsp"%>
    <style>
        .back-img{
            background: url('images/phonebook.jpg');
            width: 100%;
            height: 80vh;
            background-position: center;
            background-repeat: no-repeat;
            background-size:100% 120%;
            background-position:center;
        }
    </style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>
    <%@ page import="com.entity.User" %>

    <div class="container-fluid back-img">
    
    </div>
    <%@include file="component/footer.jsp"%>
</body>
</html>