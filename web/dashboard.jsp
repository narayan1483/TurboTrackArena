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

<title>TurboTrack Arena - Dashboard</title>

<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap" rel="stylesheet">

<style>

body{
margin:0;
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:black;
font-family:'Orbitron',sans-serif;
color:white;
overflow:hidden;
}

/* moving road background */

body::before{
content:"";
position:absolute;
width:100%;
height:200%;
background: repeating-linear-gradient(
0deg,
#111 0px,
#111 40px,
#000 40px,
#000 80px
);
animation:roadMove 5s linear infinite;
opacity:0.35;
}

@keyframes roadMove{
0%{transform:translateY(0);}
100%{transform:translateY(80px);}
}

/* menu container */

.menu{
text-align:center;
z-index:2;
}

/* title */

.title{
font-size:40px;
color:#00f7ff;
text-shadow:0 0 20px cyan;
margin-bottom:20px;
}

/* welcome text */

.welcome{
font-size:20px;
margin-bottom:40px;
}

/* buttons */

.menuBtn{

display:block;
width:220px;
margin:20px auto;
padding:16px;
background:#00f7ff;
color:black;
text-decoration:none;
border-radius:10px;
font-size:18px;
font-weight:bold;
transition:0.3s;
box-shadow:0 0 20px cyan;

}

.menuBtn:hover{

transform:scale(1.1);
box-shadow:0 0 40px cyan;

}

/* car animation */

/*.car{
position:absolute;
bottom:-150px;
left:50%;
transform:translateX(-50%);
width:120px;
animation:carMove 4s linear infinite;
}

@keyframes carMove{
0%{bottom:-150px;}
100%{bottom:110%;}
}*/

</style>

</head>

<body>

<div class="menu">

<div class="title">TurboTrack Arena</div>

<div class="welcome">
Welcome, <%= user.getUsername() %>
</div>

<a href="game" class="menuBtn">Start Game</a>

<a href="leaderboard" class="menuBtn">Leaderboard</a>

<a href="profile.jsp" class="menuBtn">Profile</a>

<a href="logout" class="menuBtn">Logout</a>
<a href="index.jsp" class="menuBtn">Back To Home</a>

</div>

<!--<img src="images/player_red.png" class="car">-->

</body>
</html>