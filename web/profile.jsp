<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

<title>User Profile</title>

<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap" rel="stylesheet">

<style>

body{
margin:0;
font-family:'Orbitron',sans-serif;
background:#0b1d2a;
color:white;
display:flex;
justify-content:center;
align-items:center;
height:100vh;
}

/* profile card */

.profile{

background:#112e44;
padding:40px;
border-radius:12px;
text-align:center;
width:320px;
box-shadow:0 0 20px rgba(0,255,255,0.5);

}

/* title */

.profile h2{
color:#00f7ff;
margin-bottom:25px;
}

/* info */

.info{
margin:15px 0;
font-size:16px;
}

/* button */

.back{

display:inline-block;
margin-top:25px;
padding:10px 20px;
background:#00f7ff;
color:black;
text-decoration:none;
border-radius:8px;
font-weight:bold;
}

.back:hover{
background:#00d9e0;
}

</style>

</head>

<body>

<div class="profile">

<h2>User Profile</h2>

<div class="info">
Username: <%= user.getUsername() %>
</div>

<div class="info">
Email: <%= user.getEmail() %>
</div>

<a href="dashboard.jsp" class="back">Back</a>

</div>

</body>
</html>